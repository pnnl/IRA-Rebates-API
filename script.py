"""
Script to generate MkDocs markdown documentation from JSON schema files.
This script recursively processes JSON schema files and creates comprehensive
markdown documentation with property tables, conditional validations, and enums.
"""
from pathlib import Path
import json
import copy
import yaml
import shutil
import re

from mdutils import MdUtils


def read_json_file(json_file: Path) -> dict:
    """Read and parse a JSON file, returning its contents as a dictionary."""
    with open(json_file, "r", encoding="utf-8") as file_pointer:
        contents = json.load(file_pointer)
    return contents


def replace_and_lowercase(text: str, replace: str = " ", repalce_with="_") -> str:
    """Convert text to lowercase and replace specified characters (default: spaces to underscores)."""
    return text.lower().replace(replace, repalce_with)


def get_md_file_from_title(title: str, export_folder: Path) -> MdUtils:
    """Create a markdown file object from a title, converting title to a valid filename."""
    file_name = f"{replace_and_lowercase(title)}.md"
    file_path = export_folder / file_name
    return MdUtils(file_name=str(file_path))


def add_link_to_json_schema(md_file: MdUtils, link: str):
    """Add a markdown link to the JSON schema definition file."""
    name = link.split("/")[-1] + ".schema.json"
    md_file.new_line("Defined in: " + md_file.new_inline_link(link=link, text=name))


def get_hyperlinked_object_text(title: str, md_file: MdUtils):
    """Generate markdown inline link text for an object type reference."""
    item_type = replace_and_lowercase(title)
    return md_file.new_inline_link(link=f"{item_type}.md", text=item_type)


def get_type_for_property(ppty_content: dict) -> str:
    """Extract the type from a property schema, handling enums, constants, and composite types."""
    if "enum" in ppty_content:
        return "enum"
    if "type" in ppty_content:
        return ppty_content.get("type")
    if "const" in ppty_content:
        return ppty_content.get("const")
    if "oneOf" in ppty_content:
        return " | ".join(
            [get_type_for_property(oneof) for oneof in ppty_content.get("oneOf")]
        )
    return "unknown"


def get_ppty_type(ppty_dict: dict, md_file: MdUtils):
    """Format property type as markdown, creating links for object/array types."""
    ppty_type = get_type_for_property(ppty_dict)
    if ppty_type in ["object", "array"]:
        ppty_type = get_hyperlinked_object_text(ppty_dict.get("title"), md_file)
    else:
        ppty_type = f"`{ppty_type}`"
    return ppty_type


def get_inline_link(ppty: str, md_file: MdUtils):
    """Create a markdown anchor link to a property section."""
    return md_file.new_inline_link(link=f"#{ppty}", text=ppty)

def collect_conditional_requirements(contents: dict) -> set[str]:
    """Recursively collect all conditionally required properties from conditional schemas."""
    conditional_requirements = set()

    # Handle anyOf conditions
    if "anyOf" in contents:
        for item in contents["anyOf"]:
            if "required" in item:
                conditional_requirements.update(item["required"])
            # Recursively check nested conditions
            conditional_requirements.update(collect_conditional_requirements(item))
    
    # Handle oneOf conditions
    if "oneOf" in contents:
        for item in contents["oneOf"]:
            if "required" in item:
                conditional_requirements.update(item["required"])
            # Recursively check nested conditions
            conditional_requirements.update(collect_conditional_requirements(item))
    
    # Handle allOf conditions (includes if/then/else)
    if "allOf" in contents:
        for item in contents["allOf"]:
            # Handle if/then/else patterns
            if "if" in item and "then" in item:
                if "required" in item["then"]:
                    conditional_requirements.update(item["then"]["required"])
                # Also check nested if conditions in then
                if isinstance(item["then"], dict):
                    conditional_requirements.update(collect_conditional_requirements(item["then"]))
            
            # Handle else clause
            if "else" in item:
                if "required" in item["else"]:
                    conditional_requirements.update(item["else"]["required"])
                # Also check nested if conditions in else
                if isinstance(item["else"], dict):
                    conditional_requirements.update(collect_conditional_requirements(item["else"]))
            
            # Recursively check the item itself
            conditional_requirements.update(collect_conditional_requirements(item))
    
    # Handle direct if/then/else at root level
    if "if" in contents and "then" in contents:
        if "required" in contents["then"]:
            conditional_requirements.update(contents["then"]["required"])
        if isinstance(contents["then"], dict):
            conditional_requirements.update(collect_conditional_requirements(contents["then"]))
    
    if "else" in contents:
        if "required" in contents["else"]:
            conditional_requirements.update(contents["else"]["required"])
        if isinstance(contents["else"], dict):
            conditional_requirements.update(collect_conditional_requirements(contents["else"]))

    # Handle not conditions
    if "not" in contents:
        if "required" in contents["not"]:
            conditional_requirements.update(contents["not"]["required"])
        if isinstance(contents["not"], dict):
            conditional_requirements.update(collect_conditional_requirements(contents["not"]))

    return conditional_requirements


def add_table_of_properties(contents: dict, md_file: MdUtils, conditional_requirements: set[str] = None):
    """Create a markdown table listing all properties with their types, requirements, and formats."""
    if conditional_requirements is None:
        conditional_requirements = set()
    
    # Column names for the properties table
    list_of_strings = ["Property", "Type", "Required", "Conditional Required", "Format", "Title"]
    md_file.new_line()
    # Iterate through each property and collect its details for the table
    for ppty, ppty_dict in contents["properties"].items():        
        # Extract the format constraint if it exists
        format = ppty_dict.get("format", "")
        # Build a row with: property link, type, required status, conditional requirement status, format, and title
        list_of_strings.extend(
            [
                get_inline_link(ppty, md_file),  # Property name as anchor link
                get_ppty_type(ppty_dict, md_file),  # Property type (formatted as markdown)
                ":white_check_mark:" if ppty in contents.get("required", []) else "",  # Add Checkmark if its a 'required' property
                ":gear:" if ppty in conditional_requirements else "",  # Add Gear icon if conditionally required
                f"`{format}`" if format else "",  # Format constraint if present
                ppty_dict.get("title") or "",  # Property title/description
            ]
        )
    md_file.new_line()
    # Create a 6-column markdown table with property information
    md_file.new_table(
        columns=6,
        rows=len(contents["properties"]) + 1,
        text=list_of_strings,
        text_align="center",
    )


def handle_enums(enums: list[str], md_file: MdUtils):
    """Create a markdown table displaying enum values for a property."""
    list_of_texts = ["Value"] + [f"`{el}`" for el in enums]
    md_file.new_line()
    md_file.new_table(
        columns=1, rows=len(list_of_texts), text=list_of_texts, text_align="left"
    )


def handle_inline_constraints(ppty_dict: dict, md_file: MdUtils):
    """Format and display property constraints like length, pattern, and numeric bounds."""
    constraints = {
        "minLength": "Minimum Length",
        "maxLength": "Maximum Length",
        "multipleOf": "Must be multiple of",
        "minimum": "Minimum Number",
        "maximum": "Maximum Number",
        "exclusiveMinimum": "Exclusive Minimum",
        "pattern": "Regex Pattern",
        "$comment": "Comment",
        "uniqueItems": "Items should be unique",
        "minItems": "Minimum number of items",
        "const": "Constant",
    }

    for key, label in constraints.items():
        if key in ppty_dict:
            if key in ["$comment"]:
                md_file.new_line(f"{label}: {ppty_dict[key]}")
            else:
                md_file.new_line(f"{label}: `{ppty_dict[key]}`")


def add_ppty_details(contents: dict, md_file: MdUtils):
    """Add detailed documentation for each property including type, requirement status, enums, and constraints."""
    for ppty, ppty_dict in contents["properties"].items():
        md_file.new_header(level=2, title=ppty, add_table_of_contents="n")
        md_file.new_line()
        md_file.write(ppty_dict.get("description", ""))
        md_file.new_line()
        md_file.new_line()
        md_file.new_list(
            [
                "is required"
                if ppty in contents.get("required", [])
                else "is not required",
                f"Type: {get_ppty_type(ppty_dict, md_file)}"
            ]
        )
        if "enum" in ppty_dict:
            handle_enums(ppty_dict["enum"], md_file)
        if "oneOf" in ppty_dict:
            md_file.new_header(level=4, title="One Of", add_table_of_contents="n")
            for oneof in ppty_dict.get("oneOf"):
                if "enum" in oneof:
                    handle_enums(oneof["enum"], md_file)
                handle_inline_constraints(oneof, md_file)
                md_file.new_line()
        if "anyOf" in ppty_dict:
            md_file.new_header(level=4, title="Any Of", add_table_of_contents="n")
            for anyof in ppty_dict.get("anyOf"):
                if "enum" in anyof:
                    handle_enums(anyof["enum"], md_file)
                handle_inline_constraints(anyof, md_file)
                md_file.new_line()
        handle_inline_constraints(ppty_dict, md_file)


def check_if_mutually_exclusive_requirement_exists(oneof: dict):
    """Check if a oneOf schema has mutually exclusive required properties."""
    return (
        True
        if "required" in oneof and "not" in oneof and "required" in oneof["not"]
        else False
    )


def generate_mutually_exlcusive_requirement_table(oneofs: list[dict], md_file: MdUtils):
    """Create a markdown table showing mutually exclusive property requirements."""
    one_ofs_with_exclusive_required = [
        item for item in oneofs if check_if_mutually_exclusive_requirement_exists(item)
    ]
    if not one_ofs_with_exclusive_required:
        return

    md_file.new_line()
    md_file.new_header(
        level=3, title="Mutual Exclusivity Requirement", add_table_of_contents="n"
    )
    list_of_strings = ["`if` present", "should `not` be present"]
    for item in one_ofs_with_exclusive_required:
        list_of_strings.extend(
            [
                " ".join(
                    [f"{get_inline_link(el, md_file)}" for el in item["required"]]
                ),
                " ".join(
                    [
                        f"{get_inline_link(el, md_file)}"
                        for el in item["not"]["required"]
                    ]
                ),
            ]
        )
    md_file.new_line()
    md_file.new_table(
        columns=2,
        rows=len(one_ofs_with_exclusive_required) + 1,
        text=list_of_strings,
        text_align="left",
    )


def handle_oneofs(
    oneofs: list[dict], md_file: MdUtils, export_folder: Path, breadcrums: list[str]
):
    """Process oneOf schemas and generate markdown documentation for each variant, showing mutually exclusive options."""
    # Create a level-2 header for the "One Of" section describing mutually exclusive options
    md_file.new_header(level=2, title="One Of", add_table_of_contents="n")
    md_file.new_line()
    
    # Iterate through each oneOf variant to document its structure
    for one_of_item in oneofs:
        # If this variant has properties, add a hyperlinked reference to it and generate its documentation
        if "properties" in one_of_item:
            # Add the object title as a hyperlink for navigation
            md_file.new_line(
                get_hyperlinked_object_text(one_of_item.get("title"), md_file)
            )
            # Recursively generate markdown documentation for this object variant
            generate_markdown_for_object(
                one_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        
        # If this variant is an array type, generate documentation for the array structure
        if one_of_item.get("type") == "array":
            generate_markdown_for_object(
                one_of_item, export_folder, copy.deepcopy(breadcrums)
            )
    
    # After documenting all variants, create a table showing which properties are mutually exclusive
    # (i.e., properties that cannot appear together in different oneOf options)
    generate_mutually_exlcusive_requirement_table(oneofs, md_file)


def handle_anyofs(
    anyofs: list[dict], md_file: MdUtils, export_folder: Path, breadcrums: list[str]
):
    """Process anyOf schemas and generate markdown for each option, allowing multiple choices."""
    md_file.new_header(level=2, title="Any Of", add_table_of_contents="n")
    md_file.new_line()
    
    # Iterate through each anyOf option (unlike oneOf, multiple options can be combined)
    for any_of_item in anyofs:
        # If this option is an object with properties, add a link and generate full documentation
        if "properties" in any_of_item:
            # Add the object title as a hyperlinked reference for navigation
            md_file.new_line(
                get_hyperlinked_object_text(any_of_item.get("title"), md_file)
            )
            # Recursively generate markdown documentation for this object option
            generate_markdown_for_object(
                any_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        # If this option is an array type, generate documentation for the array structure
        elif any_of_item.get("type") == "array":
            generate_markdown_for_object(
                any_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        # If this option specifies required properties, add inline links to each required property
        elif "required" in any_of_item:
            # Create a list of inline links to each required property in this anyOf option
            for req_item in any_of_item["required"]:
                md_file.new_line(get_inline_link(req_item, md_file))


def check_if_conditional_validation(content: dict) -> bool:
    """Check if a schema contains if/then conditional validation rules."""
    return {"if", "then"}.issubset(content)


def get_if_property_text(
    key: str, value: dict, md_file: MdUtils, export_folder: Path, not_: bool = False
) -> str:
    """Generate human-readable text describing a conditional property constraint (const, enum, or contains)."""
    if len(value) != 1:
        raise Exception(f"Unsupported {key=}, {value=}")
    if "const" in value:
        middle_text = "is not" if not_ else "is"
        return f"{get_inline_link(key, md_file)} {middle_text} `{value['const']}`"
    elif "enum" in value:
        middle_text = "is not" if not_ else "is"
        enum_text = ", ".join([f"`{el}`" for el in value["enum"]])
        return f"{get_inline_link(key, md_file)} {middle_text} one of [{enum_text}]"
    elif "contains" in value:
        middle_text = "does not" if not_ else ""
        generate_markdown_for_object(value.get("contains"), export_folder)
        return (
            f"{get_inline_link(key, md_file)} {middle_text} contains "
            + get_hyperlinked_object_text(value["contains"].get("title"), md_file)
        )
    else:
        raise Exception(f"{key=}, {value=}")


def get_if_properties_text(
    if_content: dict, md_file: MdUtils, export_folder: Path, not_: bool = False
):
    """Generate text describing all properties in a conditional if clause, joined with AND logic."""
    if_present_texts = []
    for key, value in if_content["properties"].items():
        if "properties" in value:
            key_text = get_inline_link(key, md_file)
            ppty_text = get_if_condition_text(value, md_file, export_folder, not_)
            if_present_texts.append(f"{key_text}.{ppty_text}")
        else:
            if_present_texts.append(
                get_if_property_text(key, value, md_file, export_folder, not_)
            )
    return " AND ".join(if_present_texts)


def get_if_condition_text(
    if_content: dict, md_file: MdUtils, export_folder: Path, not_: bool = False
) -> str:
    """Recursively generate text describing a complex if condition, handling properties, oneOf, and negation."""
    if_present_text = ""
    if "not" in if_content:
        if_present_text += get_if_condition_text(
            if_content["not"], md_file, export_folder, not_=True
        )
    if "properties" in if_content:
        if_present_text += get_if_properties_text(
            if_content, md_file, export_folder, not_=not_
        )

    if "oneOf" in if_content:
        oneof_texts = []
        for oneof in if_content["oneOf"]:
            oneof_texts.append(get_if_condition_text(oneof, md_file, export_folder))
        if_present_text += "<br><br> OR <br><br>".join(oneof_texts)
    return if_present_text


def get_then_not_text(then_not_content: list[dict], md_file: MdUtils) -> str:
    """Extract property names from then/not clauses and format them as links."""
    then_not_text = ""
    if "required" in then_not_content:
        then_not_text += "<br>".join(
            [f"{get_inline_link(el, md_file)}" for el in then_not_content["required"]]
        )

    if "anyOf" in then_not_content:
        all_req_items = [
            ppt for subitem in then_not_content["anyOf"] for ppt in subitem["required"]
        ]
        then_not_text += "<br>".join(
            [f"{get_inline_link(el, md_file)}" for el in all_req_items]
        )
    return then_not_text


def get_conditional_table_record(
    conditional_content: dict,
    md_file: MdUtils,
    export_folder: Path,
    prev_if_text: str = "",
):
    """Convert a conditional if/then/else rule into table rows for markdown display, handling nested conditions."""
    conditional_records = []
    if_text = get_if_condition_text(conditional_content["if"], md_file, export_folder)
    if prev_if_text:
        if_text = f"{prev_if_text} AND {if_text}"
    if "then" in conditional_content and "if" in conditional_content["then"]:
        conditional_records.extend(
            get_conditional_table_record(
                conditional_content["then"],
                md_file,
                export_folder,
                prev_if_text=if_text,
            )
        )
    then_not_text = (
        get_then_not_text(conditional_content["then"]["not"], md_file)
        if "not" in conditional_content["then"]
        else ""
    )
    then_text = "<br>".join(
        [
            f"{get_inline_link(el, md_file)}"
            for el in conditional_content["then"].get("required", [])
        ]
    )

    if then_not_text or then_text:
        conditional_records.append(
            [
                if_text,
                then_text,
                then_not_text,
                conditional_content.get("$comment") or "",
            ]
        )
    if "else" in conditional_content:
        elseif_text = get_if_condition_text(
            conditional_content["if"], md_file, export_folder, not_=True
        )
        if prev_if_text:
            elseif_text = f"{prev_if_text} AND {elseif_text}"
        if "if" in conditional_content["else"]:
            conditional_records.extend(
                get_conditional_table_record(
                    conditional_content["else"],
                    md_file,
                    export_folder,
                    prev_if_text=elseif_text,
                )
            )
        should_not_text = ""
        if "not" in conditional_content["else"]:
            should_not_text = (
                get_then_not_text(conditional_content["else"]["not"], md_file)
                if "not" in conditional_content["else"]
                else ""
            )
        should_text = "<br>".join(
            [
                f"{get_inline_link(el, md_file)}"
                for el in conditional_content.get("else", {}).get("required", [])
            ]
        )
        if should_not_text or should_text:
            conditional_records.append(
                [
                    elseif_text,
                    should_text,
                    should_not_text,
                    conditional_content.get("$comment") or "",
                ]
            )
    return conditional_records


def handle_conditional_allofs(
    allof_contents: list[dict], md_file: MdUtils, export_folder: Path
):
    """Create a markdown table documenting all if/then/else conditional validation rules."""
    md_file.new_line()
    # Create a level-3 header for the "Conditional Validation" section
    md_file.new_header(
        level=3, title="Conditional Validation", add_table_of_contents="n"
    )
    
    # Initialize list with 4 column headers for the conditional validation table
    # Columns represent: if condition, then requirements, not requirements, and comment
    list_of_strings = [
        "`if`",
        "`then` should be present",
        "should `not` be present",
        "comment",
    ]

    num_rows = 1
    
    # Iterate through each conditional allOf item to extract its if/then/else rules
    for item in allof_contents:
        # Convert the conditional item into table records (may produce multiple rows for nested conditions)
        records = get_conditional_table_record(item, md_file, export_folder)
        # Add each record's data to the table strings and increment row count
        for record in records:            
            list_of_strings.extend(record)
            num_rows += 1

    md_file.new_line()
    # Create a 4-column markdown table with all collected conditional validation rules
    # Each row represents one if/then/else conditional rule with its constraints
    md_file.new_table(
        columns=4, rows=num_rows, text=list_of_strings, text_align="center"
    )


def handle_allofs(allofs: list[dict], md_file: MdUtils, export_folder: Path):
    """Process allOf schemas, extracting and documenting conditional validation rules."""
    md_file.new_line()
    md_file.new_header(level=2, title="allOf Requirement", add_table_of_contents="n")
    conditional_allofs = [
        allof for allof in allofs if check_if_conditional_validation(allof)
    ]
    if conditional_allofs:
        handle_conditional_allofs(conditional_allofs, md_file, export_folder)


def generate_markdown_for_object(
    contents: dict, export_folder: Path, breadcrums: list = []
):
    """
    Recursively generate markdown documentation for a JSON schema object.
    Handles objects, arrays, properties, enums, conditional validation, oneOf/anyOf/allOf patterns.
    Creates separate markdown files for nested objects and maintains breadcrumb navigation.
    """
    if "properties" in contents and "type" not in contents:
        contents["type"] = "object"

    md_file = get_md_file_from_title(contents.get("title"), export_folder)
    if breadcrums:
        md_file.new_line(" / ".join(breadcrums))

    breadcrums.append(get_hyperlinked_object_text(contents.get("title"), md_file))
    md_file.new_header(level=1, title=contents.get("title"))
    if "$id" in contents:
        add_link_to_json_schema(md_file, contents.get("$id"))

    # Handle array type schemas: determine item type, document array structure,
    # recursively process nested objects in the array, handle enum values, and anyOf compositions
    if contents.get("type") == "array":
        # Get the schema for items in the array
        items = contents.get("items")
        # Determine type text: use linked object name if not enum, otherwise use "string"
        type_text = (
            get_hyperlinked_object_text(items.get("title"), md_file)
            if "enum" not in items
            else "string"
        )
        # Document the array type
        md_file.new_line(f"Type: array[{type_text}]")
        # If array items are objects, generate documentation for the nested object
        if items.get("type") == "object":
            generate_markdown_for_object(
                items, export_folder, copy.deepcopy(breadcrums)
            )

        # If array items are enums, create a table of enum values
        if "enum" in items:
            handle_enums(items["enum"], md_file)

        # If array items have anyOf options, mark as object and generate documentation
        if "anyOf" in items:
            items['type'] = 'object'
            generate_markdown_for_object(
                items, export_folder, copy.deepcopy(breadcrums)
            )

        # Write the markdown file to disk
        md_file.create_md_file()

    # Handle object type schemas: document object structure and additional properties, collect conditional requirements,
    # create property summary tables, recursively process nested objects/arrays, and handle oneOf/allOf/if-then-else/anyOf
    # patterns, then generate detailed property documentation and write complete file to disk
    elif contents.get("type") == "object":
        # Document the object type and additional properties setting
        md_file.new_line("Type: `object`")
        md_file.new_line(
            f"Additional Properties Allowed: `{contents.get('additionalProperties', True)}`"
        )
        # Collect all properties that are conditionally required (via anyOf, oneOf, allOf, not, if/then/else patterns)
        conditional_requirements = collect_conditional_requirements(contents)
        # Process regular properties if they exist
        if "properties" in contents:            
            # Create a summary table of all properties with their types, requirements, and formats
            add_table_of_properties(contents, md_file, conditional_requirements)
            # Recursively generate documentation for nested objects and arrays
            for _, ppty_dict in contents["properties"].items():
                if ppty_dict.get("type") in ["object", "array"]:
                    generate_markdown_for_object(
                        ppty_dict, export_folder, copy.deepcopy(breadcrums)
                    )

        # Handle oneOf schemas (mutually exclusive options)
        if "oneOf" in contents:
            handle_oneofs(
                contents.get("oneOf"), md_file, export_folder, copy.deepcopy(breadcrums)
            )

        # Handle allOf schemas (combined constraints)
        if "allOf" in contents:
            handle_allofs(contents.get("allOf"), md_file, export_folder)

        # Handle if/then/else conditional validation patterns
        if "if" in contents:
            handle_allofs([contents], md_file, export_folder)

        # Handle anyOf schemas (multiple independent options)
        if "anyOf" in contents:
            handle_anyofs(
                contents.get("anyOf"), md_file, export_folder, copy.deepcopy(breadcrums)
            )

        # Add detailed documentation for each property (descriptions, constraints, enums)
        if "properties" in contents:
            add_ppty_details(contents, md_file)

        # Write the complete markdown file to disk
        md_file.create_md_file()
    else:
        raise Exception(f"Unknown type: {contents}")


def generate_markdown_files(json_schema_file: Path, export_folder: Path):
    """Generate markdown documentation for a single JSON schema file."""

    contents = read_json_file(json_schema_file)
    generate_markdown_for_object(contents, export_folder, copy.deepcopy(['[home](../index.md)']))

def get_folder_name_from_file_path(file_path: Path) -> str:
    """ Get the folder name for a schema file by converting the filename to snake_case."""    
    return re.sub(r"(?<!^)(?=[A-Z])", "_", get_file_name_from_file_path(file_path)).lower()

def get_title_from_file_path(file_path: Path) -> str:
    """Convert a filename to a title (Title Case with spaces)."""
    return re.sub(r'(?<!^)(?=[A-Z])', ' ', get_file_name_from_file_path(file_path)).title()

def get_file_name_from_file_path(file_path: Path) -> str:
    """Extract the filename without extension from a file path."""
    return file_path.name.split(".")[0]

def get_navs_as_dict(schema_folder: Path) -> list[dict[str, str]]:
    """Generate a sorted list of navigation items from schema files for mkdocs configuration."""
    
    nav_items = []
    for file in schema_folder.iterdir():
        title = get_title_from_file_path(file)
        folder_name = get_folder_name_from_file_path(file)
        nav_items.append({title: f"{folder_name}/{folder_name}.md"})

    nav_items.sort(key=lambda item: next(iter(item)))
    return nav_items

def generate_markdown_files_from_folder(schema_folder: Path, export_path: Path, preamble: Path = None, title: str = None ):
    """Generate markdown documentation from multiple schema files, creating an index with links to each schema's docs."""
    index_md = MdUtils(file_name=str(export_path/ 'index.md'))
    if title:
        index_md.new_header(level=1, title=title)
    if preamble:
        with open(preamble, "r", encoding="utf-8") as file_pointer:
            preamble_contents = file_pointer.read()
        index_md.write(preamble_contents)
        index_md.new_line()

    link_items = []
    # Process each JSON schema file in the folder
    for file in schema_folder.iterdir():
        # Convert filename to folder name (snake_case) and display title (Title Case)
        folder_name = get_folder_name_from_file_path(file)
        title  = get_title_from_file_path(file)        
        # Create output folder for this schema's documentation
        out_folder = export_path / folder_name
        out_folder.mkdir(exist_ok=True)
        # Generate markdown documentation files for this schema
        generate_markdown_files(file, out_folder)
        # Add a link to this schema's main documentation page in the index
        link_items.append(index_md.new_inline_link(link=f"{folder_name}/{folder_name}.md", text=title))
    # Sort links alphabetically for consistent index ordering
    link_items.sort()
    # Create the list of links in the index markdown file
    index_md.new_list(link_items)
    # Create the index markdown file
    index_md.create_md_file()

def create_mkdocs_config_file(root_dir: Path, 
                              navs: list[dict[str, str]],
                              config_file: Path,
                              mike_config: dict | None = None,
                              extra_css: Path | None = None,
                              base_html: Path | None = None
                              ):
    """
    Create and configure mkdocs.yml file with theme settings, navigation structure,
    markdown extensions, and optional custom CSS and HTML templates.
    """
    docs_dir = root_dir /  "docs"
    
    # Define a custom PythonName class to handle special YAML representation
    # This allows us to represent YAML tags like !!python/name
    class PythonName(str):
        pass

    # Define a representer function to convert PythonName instances to YAML's python/name format
    def python_name_representer(dumper, data):
        return dumper.represent_scalar("""!!python/name""", str(data), style="")

    class CustomDumper(yaml.SafeDumper):
        pass

    # Register the PythonName representer with the custom dumper
    CustomDumper.add_representer(PythonName, python_name_representer)

    # Read the basic mkdocs configuration from the JSON config file
    basic_config = read_json_file(config_file)
    logo_path  = Path(basic_config['logo'])
    fav_path = Path(basic_config['favicon'])
    
    # Set up the assets directory for storing logo and favicon images
    assets_folder_name = "assets"
    assets_dir = docs_dir / assets_folder_name
    assets_dir.mkdir(exist_ok=True)
    shutil.copy(logo_path, assets_dir / logo_path.name)
    shutil.copy(fav_path, assets_dir / fav_path.name)
    
    # Build the complete mkdocs configuration dictionary with all settings
    mkdocs_config = {
        "site_name": basic_config["site_name"],
        "site_url": basic_config["site_url"],
        "repo_url": basic_config["repo_url"],
        "theme": {
            "name": "material",
            "logo": f"{assets_folder_name}/{logo_path.name}",
            "favicon": f"{assets_folder_name}/{fav_path.name}",
            "font": {
                "text": "Merriweather Sans",
                "code": "Red Hat Mono"
            },
            "features":["toc.integrate"],
            "palette": [
                {
                    "media": "(prefers-color-scheme: light)",
                    "scheme": "default",
                    "primary": "custom",
                    "toggle": {
                        "icon": "material/brightness-7",
                        "name": "Switch to dark mode"
                    }
                },
                {
                    "media": "(prefers-color-scheme: dark)",
                    "scheme": "slate",
                    "primary": "custom",
                    "toggle": {
                        "icon": "material/brightness-7",
                        "name": "Switch to light mode"
                    }
                }
            ],
            "layout": {"width": "full"}
        },
        "extra_javascript": [
            "https://cdnjs.cloudflare.com/ajax/libs/plotly.js/1.33.1/plotly.min.js",
            "javascripts/mathjax.js",
            "https://polyfill.io/v3/polyfill.min.js?features=es6",
            "https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js"
        ],
        "markdown_extensions": [
            "pymdownx.superfences",
            {
                "pymdownx.tabbed":{"alternate_style": True}
            },
            "attr_list",
            {
                "pymdownx.emoji": {
                    "emoji_index": PythonName("material.extensions.emoji.twemoji"),
                    "emoji_generator": PythonName("material.extensions.emoji.to_svg")
                }
            },
            "admonition",
            "codehilite",
            "abbr",
            "pymdownx.details",
            {
                "pymdownx.arithmatex": {"generic": True}
            }
        ],
        "nav": navs
    }
    
    # Optionally add mike (multi-version) configuration if provided
    # mike allows maintaining multiple documentation versions
    if mike_config:
        mike_setting = {
            "extra" : {
                "version": {
                    "provider": "mike",
                    "default": mike_config['default']
                }
            }
        }
        mkdocs_config.update(mike_setting)
    
    # Optionally add custom HTML template if base_html file is provided
    if base_html:
        mkdocs_config["theme"]["custom_dir"] = "docs/overrides"
        override_folder = docs_dir / 'overrides'
        override_folder.mkdir(exist_ok=True)
        shutil.copy(base_html, override_folder / 'main.html')
    
    # Optionally add extra CSS file if extra_css path is provided
    # Custom CSS allows additional styling on top of the Material theme
    if extra_css:
        mkdocs_config['extra_css'] = [
            "stylesheets/extra.css"
        ]
        css_folder = docs_dir / "stylesheets"
        css_folder.mkdir(exist_ok=True)
        shutil.copy(extra_css, css_folder / "extra.css")
    
    # Convert the mkdocs configuration dictionary to YAML format
    yaml_str = yaml.dump(
        mkdocs_config, 
        Dumper=CustomDumper,
        default_flow_style=False,
        allow_unicode=True,
        sort_keys=False
    )
    
    # Fix YAML representation: replace escaped python/name with proper YAML tag format
    yaml_str = yaml_str.replace("!%21python/name ", "!!python/name:")
    # Further refinement: remove quotes around python/name tag values
    fixed_yaml = re.sub(r"!!python/name:'([^']+)'", r"!!python/name:\1", yaml_str)
    
    # Write the complete, properly formatted mkdocs.yml configuration to disk
    with open(root_dir / "mkdocs.yml", "w", encoding="utf-8") as file:
        file.write(fixed_yaml)

if __name__ == "__main__":
    # Main execution: Generate markdown documentation from all JSON schemas in the resolved_json_schemas folder
    # and create an mkdocs configuration for building the documentation site
    
    root_path = Path("resolved_json_schemas")
    export_path = Path("docs")
    export_path.mkdir(exist_ok=True)

    generate_markdown_files_from_folder(root_path, export_path, preamble='preamble.md')
    create_mkdocs_config_file(
        export_path / "..",
        navs = get_navs_as_dict(root_path),
        mike_config={"default": "staging"},
        config_file='config.json',
        extra_css='extra.css',
        base_html='base.html'
    )
