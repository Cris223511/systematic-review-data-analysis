import csv
import json
import sys
from collections import Counter
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
MASTER = ROOT / "data" / "extraction_master.csv"
OUTPUT = Path(__file__).resolve().parent / "figure_data.js"

FAMILIES = [
    "CNN / Deep Learning",
    "Traditional ML",
    "Computer Vision / Eye-tracking",
    "Other designs (clinical / conceptual)",
]
MMAT_DOMAINS = [
    ("mmat_outcome_completeness", "Outcome data completeness"),
    ("mmat_measurements", "Appropriateness of measurements"),
    ("mmat_intervention_sampling", "Intervention as intended and sampling strategy"),
    ("mmat_representativeness", "Sample representativeness"),
    ("mmat_confounding", "Confounding control and analysis"),
]
CHALLENGES = [
    ("ch_uncertainty", "Classification uncertainty and low predictive robustness"),
    ("ch_generalization", "Poor generalization in small samples"),
    ("ch_multicollinearity", "Multicollinearity in multimodal data"),
    ("ch_imbalance", "Class imbalance and sampling biases"),
    ("ch_interpretability", "Limited interpretability of black-box models"),
]
METRICS = [("acc", "ACC"), ("f1", "F1-score"), ("precision", "Precision"), ("recall", "Recall"), ("auc", "AUC")]

EXPECTED = {
    "eligible": 36,
    "domains": {"D1": 12, "D2": 6, "D3": 6, "D4": 12},
    "mmat_appraised": 36,
    "ml_architecture": 28,
    "supervised_metrics": 26,
    "metrics_numeric": 25,
    "primary_evidence": 18,
    "translational": 21,
    "challenge_any": 21,
}
CURRENT_PARTIAL_YEAR = 2026


def load(path=MASTER):
    with open(path, encoding="utf-8", newline="") as handle:
        return list(csv.DictReader(handle))


def flag(row, key):
    return row[key].strip() == "1"


def pct(n, d):
    return round(100 * n / d, 1) if d else 0.0


def compute(rows):
    n = len(rows)
    appraised = [r for r in rows if r["mmat_category"] != "outside"]
    ml = [r for r in rows if flag(r, "ml_architecture")]
    supervised = [r for r in rows if flag(r, "supervised_metrics")]

    mmat = {
        label: {v: sum(r[key] == code for r in appraised) for v, code in (("yes", "Y"), ("cannot_tell", "ND"), ("no", "N"))}
        for key, label in MMAT_DOMAINS
    }
    challenges = [
        {"label": label, "n": sum(flag(r, key) for r in rows), "pct": pct(sum(flag(r, key) for r in rows), n)}
        for key, label in CHALLENGES
    ]
    challenges.sort(key=lambda c: -c["n"])

    families = {
        fam: {
            "non_ensemble": sum(r["model_family"] == fam and r["ensemble"] == "0" for r in ml),
            "ensemble": sum(r["model_family"] == fam and r["ensemble"] == "1" for r in ml),
        }
        for fam in FAMILIES[:3]
    }
    metrics = [
        {"label": label, "n": sum(flag(r, key) for r in supervised), "pct": round(100 * sum(flag(r, key) for r in supervised) / len(supervised))}
        for key, label in METRICS
    ]
    years = list(range(min(int(r["year"]) for r in rows), max(int(r["year"]) for r in rows) + 1))
    datasets = Counter(r["dataset_category"] for r in rows)
    inputs = Counter(r["input_group"] for r in rows)
    temporal = {fam: [sum(r["model_family"] == fam and int(r["year"]) == y for r in rows) for y in years] for fam in FAMILIES}

    return {
        "n_eligible": n,
        "n_appraised": len(appraised),
        "n_ml": len(ml),
        "n_supervised": len(supervised),
        "mmat": mmat,
        "challenges": challenges,
        "families": families,
        "metrics": metrics,
        "datasets": dict(datasets),
        "inputs": {k: {"n": v, "pct": pct(v, n)} for k, v in inputs.most_common()},
        "years": [f"{y}*" if y == CURRENT_PARTIAL_YEAR else str(y) for y in years],
        "temporal": temporal,
        "domains": dict(Counter(r["domain"] for r in rows)),
        "primary_evidence": sum(flag(r, "primary_evidence") for r in rows),
        "translational": sum(flag(r, "translational") for r in rows),
        "metrics_numeric": sum(flag(r, "metrics_numeric") for r in rows),
        "challenge_any": sum(any(flag(r, k) for k, _ in CHALLENGES) for r in rows),
    }


def check(data):
    errors = []
    observed = {
        "eligible": data["n_eligible"],
        "domains": data["domains"],
        "mmat_appraised": data["n_appraised"],
        "ml_architecture": data["n_ml"],
        "supervised_metrics": data["n_supervised"],
        "metrics_numeric": data["metrics_numeric"],
        "primary_evidence": data["primary_evidence"],
        "translational": data["translational"],
        "challenge_any": data["challenge_any"],
    }
    for key, expected in EXPECTED.items():
        if observed[key] != expected:
            errors.append(f"{key}: expected {expected}, observed {observed[key]}")
    for label, counts in data["mmat"].items():
        if sum(counts.values()) != data["n_appraised"]:
            errors.append(f"MMAT '{label}' does not sum to {data['n_appraised']}")
    if sum(sum(v.values()) for v in data["families"].values()) != data["n_ml"]:
        errors.append("Families do not sum to the ML base")
    for name, total in (("datasets", sum(data["datasets"].values())), ("inputs", sum(v["n"] for v in data["inputs"].values())), ("temporal", sum(map(sum, data["temporal"].values())))):
        if total != data["n_eligible"]:
            errors.append(f"{name} do not sum to {data['n_eligible']}")
    return errors


def main():
    data = compute(load())
    errors = check(data)
    if errors:
        print("Denominator check FAILED:")
        print("\n".join(f"  - {e}" for e in errors))
        sys.exit(1)
    OUTPUT.write_text("window.FIGURE_DATA = " + json.dumps(data, ensure_ascii=False, indent=2) + ";\n", encoding="utf-8")
    print(f"Denominator check passed. Written: {OUTPUT.name}")


if __name__ == "__main__":
    main()
