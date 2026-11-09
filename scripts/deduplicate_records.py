import csv
import re
import sys
import unicodedata
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
DATA = ROOT / "data"
WORKBOOK = ROOT / "prisma" / "reverse-engineering.xlsm"
OUTPUT = DATA / "records_deduplicated.csv"

SOURCES = [
    ("Scopus", "scopus-data.csv", {"id": "EID", "doi": "DOI", "title": "Title", "year": "Year", "type": "Document Type"}),
    ("Web of Science", "web-of-science-data.csv", {"id": "UT (Unique WOS ID)", "doi": "DOI", "title": "Article Title", "year": "Publication Year", "type": "Document Type"}),
    ("IEEE Xplore", "IEEE-data.csv", {"id": "PDF Link", "doi": "DOI", "title": "Document Title", "year": "Publication Year", "type": "Document Identifier"}),
    ("ACM Digital Library", "ACM-data.csv", {"id": "DOI", "doi": "DOI", "title": "Title", "year": "Year", "type": "Source"}),
]
PREFIX = {"Scopus": "SCO", "Web of Science": "WOS", "IEEE Xplore": "IEEE", "ACM Digital Library": "ACM"}
DOI_PATTERN = re.compile(r"10\.\d{4,9}/[^\s\",;|]+", re.IGNORECASE)


def normalize_doi(value):
    match = DOI_PATTERN.search(value or "")
    return match.group(0).lower().rstrip(".") if match else ""


def normalize_title(value):
    text = unicodedata.normalize("NFKD", value or "")
    text = "".join(c for c in text if not unicodedata.combining(c)).lower()
    return re.sub(r"[^a-z0-9]", "", text)


def source_id(database, raw):
    if database == "IEEE Xplore":
        match = re.search(r"arnumber=(\d+)", raw or "")
        return f"arnumber:{match.group(1)}" if match else ""
    return (raw or "").strip()


def load_records():
    records = []
    for database, filename, cols in SOURCES:
        path = DATA / filename
        with open(path, encoding="utf-8-sig", newline="") as handle:
            for index, row in enumerate(csv.DictReader(handle), start=1):
                records.append({
                    "record_id": f"{PREFIX[database]}-{index:04d}",
                    "database": database,
                    "source_id": source_id(database, row.get(cols["id"], "")),
                    "doi": normalize_doi(row.get(cols["doi"], "")),
                    "title": (row.get(cols["title"]) or "").strip(),
                    "year": (row.get(cols["year"]) or "").strip(),
                    "document_type": (row.get(cols["type"]) or "").strip(),
                })
    return records


def deduplicate(records):
    by_doi, by_title = {}, {}
    for record in records:
        title_key = (normalize_title(record["title"]), record["year"])
        master = None
        if record["doi"] and record["doi"] in by_doi:
            master, rule = by_doi[record["doi"]], "DOI"
        elif title_key[0] and title_key in by_title:
            master, rule = by_title[title_key], "Title and year"
        if master:
            record["duplicate_of"], record["match_rule"] = master["record_id"], rule
            continue
        record["duplicate_of"], record["match_rule"] = "", ""
        if record["doi"]:
            by_doi[record["doi"]] = record
        if title_key[0]:
            by_title[title_key] = record
    return records


def original_screening_dois():
    try:
        import openpyxl
    except ImportError:
        return None
    workbook = openpyxl.load_workbook(WORKBOOK, read_only=True, data_only=True)
    dois = set()
    for row in workbook["IDENTIFICATION"].iter_rows(values_only=True):
        doi = normalize_doi(" ".join(str(c) for c in row if c is not None))
        if doi:
            dois.add(doi)
    return dois


def main():
    records = deduplicate(load_records())
    screened = original_screening_dois()
    for record in records:
        if record["duplicate_of"] or record["database"] == "ACM Digital Library":
            record["in_original_screening"] = "No" if record["duplicate_of"] else "Excluded before screening"
        elif screened is None:
            record["in_original_screening"] = "Unknown"
        else:
            record["in_original_screening"] = "Yes" if record["doi"] in screened else "No"

    fields = ["record_id", "database", "source_id", "doi", "title", "year", "document_type", "duplicate_of", "match_rule", "in_original_screening"]
    with open(OUTPUT, "w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=fields, lineterminator="\n")
        writer.writeheader()
        writer.writerows({k: r[k] for k in fields} for r in records)

    unique = [r for r in records if not r["duplicate_of"]]
    database_unique = [r for r in unique if r["database"] != "ACM Digital Library"]
    summary = {
        "Records identified": len(records),
        "Duplicates by DOI": sum(r["match_rule"] == "DOI" for r in records),
        "Duplicates by title and year": sum(r["match_rule"] == "Title and year" for r in records),
        "Unique records": len(unique),
        "Unique records from the three main databases": len(database_unique),
        "Unique records retained in the original screening": sum(r["in_original_screening"] == "Yes" for r in unique),
        "Unique records missing from the original screening": sum(r["in_original_screening"] == "No" for r in unique),
    }
    width = max(map(len, summary))
    for label, value in summary.items():
        print(f"{label:<{width}}  {value:>5}")
    print(f"Written: {OUTPUT.relative_to(ROOT)}")
    return 0


if __name__ == "__main__":
    sys.exit(main())
