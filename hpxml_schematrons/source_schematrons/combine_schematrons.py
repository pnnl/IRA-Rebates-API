import pathlib
from copy import deepcopy

from lxml import etree, objectify


def main():
    here = pathlib.Path(__file__).resolve().parent

    # Recommended for Modeled
    hescore_sch = objectify.parse(str(here / "hescore.sch")).getroot()
    modeled_recommended_extras_sch = objectify.parse(
        str(here / "modeled_recommended_extras.sch")
    ).getroot()

    modeled_recommended_sch = deepcopy(modeled_recommended_extras_sch)

    # Copy all the HEScore patterns into the modeled_recommended.sch
    el = modeled_recommended_sch.pattern[0]
    for pattern in hescore_sch.pattern:
        el.addprevious(deepcopy(pattern))

    etree.ElementTree(modeled_recommended_sch).write(
        str(here.parent / "modeled_recommended.sch"), pretty_print=True
    )

    file_tagnames = [
        ("modeled_required", "remove-req-modeled"),
        ("measured_required", "remove-measured")
    ]
    for filename, tagname in file_tagnames:
        # Remove any flagged elements for modeled_required.sch
        sch = deepcopy(modeled_recommended_sch)
        for el in sch.xpath(
            f'//sch:*[@ira:{tagname}="true"]', namespaces=sch.nsmap
        ):
            el.getparent().remove(el)
        etree.ElementTree(sch).write(
            str(here.parent / f"{filename}.sch"), pretty_print=True
        )


if __name__ == "__main__":
    main()
