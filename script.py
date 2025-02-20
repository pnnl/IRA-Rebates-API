from pathlib import Path
import json
import copy
import yaml
import shutil
import re

from mdutils import MdUtils


def read_json_file(json_file: Path) -> dict:
    with open(json_file, "r", encoding="utf-8") as file_pointer:
        contents = json.load(file_pointer)
    return contents


def replace_and_lowercase(text: str, replace: str = " ", repalce_with="_") -> str:
    return text.lower().replace(replace, repalce_with)


def get_md_file_from_title(title: str, export_folder: Path) -> MdUtils:
    file_name = f"{replace_and_lowercase(title)}.md"
    file_path = export_folder / file_name
    return MdUtils(file_name=str(file_path))


def add_link_to_json_schema(md_file: MdUtils, link: str):
    name = link.split("/")[-1] + ".schema.json"
    md_file.new_line("Defined in: " + md_file.new_inline_link(link=link, text=name))


def get_hyperlinked_object_text(title: str, md_file: MdUtils):
    item_type = replace_and_lowercase(title)
    return md_file.new_inline_link(link=f"{item_type}.md", text=item_type)


def get_type_for_property(ppty_content: dict) -> str:
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
    ppty_type = get_type_for_property(ppty_dict)
    if ppty_type in ["object", "array"]:
        ppty_type = get_hyperlinked_object_text(ppty_dict.get("title"), md_file)
    else:
        ppty_type = f"`{ppty_type}`"
    return ppty_type


def get_inline_link(ppty: str, md_file: MdUtils):
    return md_file.new_inline_link(link=f"#{ppty}", text=ppty)


def add_table_of_properties(contents: dict, md_file: MdUtils):
    list_of_strings = ["Property", "Type", "Required", "Format", "Title"]
    md_file.new_line()
    for ppty, ppty_dict in contents["properties"].items():
        format = ppty_dict.get("format", "")
        list_of_strings.extend(
            [
                get_inline_link(ppty, md_file),
                get_ppty_type(ppty_dict, md_file),
                ":white_check_mark:" if ppty in contents.get("required", []) else "",
                f"`{format}`" if format else "",
                ppty_dict.get("title") or "",
            ]
        )
    md_file.new_line()
    md_file.new_table(
        columns=5,
        rows=len(contents["properties"]) + 1,
        text=list_of_strings,
        text_align="center",
    )


def handle_enums(enums: list[str], md_file: MdUtils):
    list_of_texts = ["Value"] + [f"`{el}`" for el in enums]
    md_file.new_line()
    md_file.new_table(
        columns=1, rows=len(list_of_texts), text=list_of_texts, text_align="left"
    )


def handle_inline_constraints(ppty_dict: dict, md_file: MdUtils):
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
    return (
        True
        if "required" in oneof and "not" in oneof and "required" in oneof["not"]
        else False
    )


def generate_mutually_exlcusive_requirement_table(oneofs: list[dict], md_file: MdUtils):
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
    md_file.new_header(level=2, title="One Of", add_table_of_contents="n")
    md_file.new_line()
    for one_of_item in oneofs:
        if "properties" in one_of_item:
            md_file.new_line(
                get_hyperlinked_object_text(one_of_item.get("title"), md_file)
            )
            generate_markdown_for_object(
                one_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        if one_of_item.get("type") == "array":
            generate_markdown_for_object(
                one_of_item, export_folder, copy.deepcopy(breadcrums)
            )
    generate_mutually_exlcusive_requirement_table(oneofs, md_file)


def handle_anyofs(
    anyofs: list[dict], md_file: MdUtils, export_folder: Path, breadcrums: list[str]
):
    md_file.new_header(level=2, title="Any Of", add_table_of_contents="n")
    md_file.new_line()
    for any_of_item in anyofs:
        if "properties" in any_of_item:
            md_file.new_line(
                get_hyperlinked_object_text(any_of_item.get("title"), md_file)
            )
            generate_markdown_for_object(
                any_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        elif any_of_item.get("type") == "array":
            generate_markdown_for_object(
                any_of_item, export_folder, copy.deepcopy(breadcrums)
            )
        elif "required" in any_of_item:
            for req_item in any_of_item["required"]:
                md_file.new_line(get_inline_link(req_item, md_file))


def check_if_conditional_validation(content: dict) -> bool:
    return {"if", "then"}.issubset(content)


def get_if_property_text(
    key: str, value: dict, md_file: MdUtils, export_folder: Path, not_: bool = False
) -> str:
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
    md_file.new_line()
    md_file.new_header(
        level=3, title="Conditional Validation", add_table_of_contents="n"
    )
    list_of_strings = [
        "`if`",
        "`then` should be present",
        "should `not` be present",
        "comment",
    ]
    num_rows = 1
    for item in allof_contents:
        records = get_conditional_table_record(item, md_file, export_folder)
        for record in records:
            list_of_strings.extend(record)
            num_rows += 1

    md_file.new_line()
    md_file.new_table(
        columns=4, rows=num_rows, text=list_of_strings, text_align="center"
    )


def handle_allofs(allofs: list[dict], md_file: MdUtils, export_folder: Path):
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
    """Function to generate markdown file for object recursively."""

    if "properties" in contents and "type" not in contents:
        contents["type"] = "object"

    md_file = get_md_file_from_title(contents.get("title"), export_folder)
    if breadcrums:
        md_file.new_line(" / ".join(breadcrums))

    breadcrums.append(get_hyperlinked_object_text(contents.get("title"), md_file))
    md_file.new_header(level=1, title=contents.get("title"))
    if "$id" in contents:
        add_link_to_json_schema(md_file, contents.get("$id"))

    if contents.get("type") == "array":
        items = contents.get("items")
        type_text = (
            get_hyperlinked_object_text(items.get("title"), md_file)
            if "enum" not in items
            else "string"
        )
        md_file.new_line(f"Type: array[{type_text}]")
        if items.get("type") == "object":
            generate_markdown_for_object(
                items, export_folder, copy.deepcopy(breadcrums)
            )

        if "enum" in items:
            handle_enums(items["enum"], md_file)

        if "anyOf" in items:
            handle_anyofs(
                items["anyOf"], md_file, export_folder, copy.deepcopy(breadcrums)
            )

        md_file.create_md_file()

    elif contents.get("type") == "object":
        md_file.new_line("Type: `object`")
        md_file.new_line(
            f"Additional Properties Allowed: `{contents.get('additionalProperties', True)}`"
        )
        if "properties" in contents:
            add_table_of_properties(contents, md_file)
            for _, ppty_dict in contents["properties"].items():
                if ppty_dict.get("type") in ["object", "array"]:
                    generate_markdown_for_object(
                        ppty_dict, export_folder, copy.deepcopy(breadcrums)
                    )

        if "oneOf" in contents:
            handle_oneofs(
                contents.get("oneOf"), md_file, export_folder, copy.deepcopy(breadcrums)
            )

        if "allOf" in contents:
            handle_allofs(contents.get("allOf"), md_file, export_folder)

        if "if" in contents:
            handle_allofs([contents], md_file, export_folder)

        if "anyOf" in contents:
            handle_anyofs(
                contents.get("anyOf"), md_file, export_folder, copy.deepcopy(breadcrums)
            )

        if "properties" in contents:
            add_ppty_details(contents, md_file)

        md_file.create_md_file()
    else:
        raise Exception(f"Unknown type: {contents}")


def generate_markdown_files(json_schema_file: Path, export_folder: Path):
    """Function for generating markdown files associated with json schema file."""

    contents = read_json_file(json_schema_file)
    generate_markdown_for_object(contents, export_folder, copy.deepcopy([]))

def get_folder_name_from_file_path(file_path: Path) -> str:
    return re.sub(r"(?<!^)(?=[A-Z])", "_", get_file_name_from_file_path(file_path)).lower()

def get_title_from_file_path(file_path: Path) -> str:
    return re.sub(r'(?<!^)(?=[A-Z])', ' ', get_file_name_from_file_path(file_path)).title()

def get_file_name_from_file_path(file_path: Path) -> str:
    return file_path.name.split(".")[0]

def get_navs_as_dict(schema_folder: Path) -> list[dict[str, str]]:
    
    nav_items = []
    for file in schema_folder.iterdir():
        title = get_title_from_file_path(file)
        folder_name = get_folder_name_from_file_path(file)
        nav_items.append({title: f"{folder_name}/{folder_name}.md"})
    return nav_items

def generate_markdown_files_from_folder(schema_folder: Path, export_path: Path, preamble: Path = None, title: str = None ):
    """Function for generating markdown files from multiple schema files in a folder."""
    index_md = MdUtils(file_name=str(export_path/ 'index.md'))
    if title:
        index_md.new_header(level=1, title=title)
    if preamble:
        with open(preamble, "r", encoding="utf-8") as file_pointer:
            preamble_contents = file_pointer.read()
        index_md.write(preamble_contents)
        index_md.new_line()

    link_items = []
    for file in schema_folder.iterdir():
        folder_name = get_folder_name_from_file_path(file)
        title  = get_title_from_file_path(file)
        out_folder = export_path / folder_name
        out_folder.mkdir(exist_ok=True)
        generate_markdown_files(file, out_folder)
        link_items.append(index_md.new_inline_link(link=f"{folder_name}/{folder_name}.md", text=title))
    link_items.sort()
    index_md.new_list(link_items)
    index_md.create_md_file()

def create_mkdocs_config_file(root_dir: Path, 
                              navs: list[dict[str, str]],
                              config_file: Path,
                              mike_config: dict | None = None,
                              extra_css: Path | None = None,
                              base_html: Path | None = None
                              ):
    docs_dir = root_dir /  "docs"
    class PythonName(str):
        pass

    def python_name_representer(dumper, data):
        return dumper.represent_scalar("""!!python/name""", str(data), style="")

    class CustomDumper(yaml.SafeDumper):
        pass

    CustomDumper.add_representer(PythonName, python_name_representer)

    basic_config = read_json_file(config_file)
    logo_path  = Path(basic_config['logo'])
    fav_path = Path(basic_config['favicon'])
    assets_folder_name = "assets"
    assets_dir = docs_dir / assets_folder_name
    assets_dir.mkdir(exist_ok=True)
    shutil.copy(logo_path, assets_dir / logo_path.name)
    shutil.copy(fav_path, assets_dir / fav_path.name)
    
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
    if base_html:
        mkdocs_config["theme"]["custom_dir"] = "docs/overrides"
        override_folder = docs_dir / 'overrides'
        override_folder.mkdir(exist_ok=True)
        shutil.copy(base_html, override_folder / 'main.html')
    if extra_css:
        mkdocs_config['extra_css'] = [
            "stylesheets/extra.css"
        ]
        css_folder = docs_dir / "stylesheets"
        css_folder.mkdir(exist_ok=True)
        shutil.copy(extra_css, css_folder / "extra.css")
    yaml_str = yaml.dump(
        mkdocs_config, 
        Dumper=CustomDumper,
        default_flow_style=False,
        allow_unicode=True,
        sort_keys=False
    )
    yaml_str = yaml_str.replace("!%21python/name ", "!!python/name:")
    fixed_yaml = re.sub(r"!!python/name:'([^']+)'", r"!!python/name:\1", yaml_str)
    with open(root_dir / "mkdocs.yml", "w", encoding="utf-8") as file:
        file.write(fixed_yaml)

if __name__ == "__main__":

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
