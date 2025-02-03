from mdutils import MdUtils
import json
from rich import print
from pathlib import Path


json_schema_file = Path('../../../IRA-Rebates-API/resolved_json_schemas/electricBulkReportingPayload.schema.json')

with open(json_schema_file, "r") as file_pointer:
    contents = json.load(file_pointer)

md_file = MdUtils(file_name=f"{json_schema_file.stem}.md", title=contents.get('title', 'Untitled'))
md_file.new_line('Defined in: ' + md_file.new_inline_link(link=contents.get('$id', '#'), text=json_schema_file.name))


def get_enum_const_text(key: str, value: dict, not_: bool=False) -> str:
    if len(value) != 1:
        raise Exception(f"Unsupported {key=}, {value=}")
    if 'const' in value: 
        middle_text = 'is not' if not_ else 'is'
        return f"`{key}` {middle_text} `{value['const']}`"
    elif 'enum' in value:
        middle_text = 'is not' if not_ else 'is'
        enum_text = ', '.join([f"`{el}`" for el in value['enum']])
        return f"`{key}` {middle_text} one of [{enum_text}]"
    elif 'contains' in value:
        middle_text = 'does not' if not_ else ''
        return f"`{key}` {middle_text} contains " + md_file.new_inline_link(link="#", text='object')
    else:
        raise Exception(f"{key=}, {value=}")


md_file.new_line()
md_file.new_line()
if contents.get('type') == 'array':
    contents = contents['items']
    md_file.new_line(f"Type: `{contents.get('type')}[]` " + '(' + md_file.new_inline_link(link=f"#{contents.get('title').lower().replace(' ', '-')}", text=contents.get('title')) + ')')
    md_file.new_line(f"Additional Properties Allowed: `{contents.get('additionalProperties', True)}`")

if contents.get('type') == 'object':
    md_file.new_line()
    md_file.new_header(level=1, title=contents.get('title'), style='setext')

    list_of_strings = ['Property', 'Type', "Required", "Nullable", "Format", "Title"]
    for ppty, ppty_dict in contents['properties'].items():
        format = ppty_dict.get('format', '')
        list_of_strings.extend(
            [
                md_file.new_inline_link(link=f"#{ppty}", text=ppty), 
                f"`{ppty_dict.get('type', 'enum' if 'enum' in ppty_dict else 'unknown')}`",
                ':white_check_mark:' if ppty in contents['required'] else '',
                True if 'null' in ppty_dict.get('type', '') or ppty_dict.get('nullable') else False, 
                f"`{format}`" if format else '',
                ppty_dict.get('title') or '',
            ]
        )
    
    md_file.new_line()
    md_file.new_table(columns=6, rows=len(contents['properties'])+1, text=list_of_strings, text_align='center')


    if 'oneOf' in contents:
        required_not_oneofs = [item for item in contents['oneOf'] if set(item)=={'required', 'not'}]
        md_file.new_line()
        md_file.new_header(level=1, title='OneOf Requirement', style='setext')

        if required_not_oneofs:
            md_file.new_line()
            md_file.new_header(level=1, title='Mutual Exclusivity Requirement', style='setext')
            list_of_strings = ['`if` present', 'should `not` be present']
            for item in required_not_oneofs:
                list_of_strings.extend(
                    [
                        ' '.join([f"`{el}`" for el in item['required']]),
                        ' '.join([f"`{el}`" for el in item['not']['required']])
                    ]
                )
            md_file.new_line()
            md_file.new_table(columns=2, rows=len(required_not_oneofs)+1, text=list_of_strings, text_align='center')

    
    if 'allOf' in contents:
        allof_contents = [item for item in contents['allOf'] if {'if', 'then'}.issubset(item)]
        md_file.new_line()
        md_file.new_header(level=1, title='allOf Requirement', style='setext')
        if allof_contents:
            md_file.new_line()
            md_file.new_header(level=1, title='Conditional Validation', style='setext')
            list_of_strings = ['`if`', '`then` should be present', 'should `not` be present', 'comment']
            num_rows = 1
            for item in allof_contents:
                try:
                    if_present_text = ''
                    if 'properties' in item['if']:
                        for key, value in item['if']['properties'].items():
                            if_present_text += get_enum_const_text(key, value)
                    elif 'oneOf' in item['if']:
                        for subitem in item['if']['oneOf']:
                            if if_present_text:
                                if_present_text += '<br><br> OR <br><br>'

                            if 'properties' in subitem:
                                for key, val in subitem['properties'].items():
                                    if 'properties' in val:
                                        for k, v in val['properties'].items():
                                            if_present_text += get_enum_const_text(k, v)
                                    else:
                                        if_present_text += get_enum_const_text(key, val)
                                    
                                    if_present_text += ' ;'

                    elif 'not' in item['if']:
                        for key, val in item['if']['not']['properties'].items():
                            if_present_text += get_enum_const_text(key, value, not_=True)
      

                    then_not_text = ''
                    if 'not' in item['then'] and 'anyOf' in item['then']['not']:
                        all_req_items = [ppt for subitem in item['then']['not']['anyOf'] for ppt in subitem['required']]
                        then_not_text += '<br>'.join([f"`{el}`" for el in all_req_items])

                    elif 'not' in item['then'] and 'required' in item['then']['not']:
                        then_not_text += '<br>'.join([f"`{el}`" for el in item['then']['not']['required']])
                        # raise Exception('')
                    list_of_strings.extend(
                        [
                            if_present_text,
                            '<br>'.join([f"`{el}`" for el in item['then'].get('required', [])]),
                            then_not_text,
                            item.get('$comment') or ''
                        ]
                    )
                    num_rows +=1
                except Exception as e:
                    print(item)
                    raise Exception(e)
            md_file.new_line()
            md_file.new_table(columns=4, rows=num_rows, text=list_of_strings, text_align='center')
    for ppty, ppty_dict in contents['properties'].items():
        md_file.new_header(level=2, title=ppty, style='setext')
        md_file.new_line()
        md_file.write(ppty_dict.get('description', ''))
        md_file.new_line()
        md_file.new_line()
        md_file.new_list([
            'is required' if ppty in contents['required'] else 'is not required',
            f'Type: `{ppty_dict['type'] if 'type' in ppty_dict else 'enum'}`',
            'can be null' if 'null' in ppty_dict.get('type', '') or ppty_dict.get('nullable') else 'can not be null'
        ])
        if 'enum' in ppty_dict:
            list_of_texts = ['Value'] + [f"`{el}`" for el in ppty_dict['enum']]
            md_file.new_line()
            md_file.new_table(columns=1, rows=len(list_of_texts), text=list_of_texts, text_align='left')
        md_file.new_line()
md_file.create_md_file()