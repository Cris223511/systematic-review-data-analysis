# Systematic Review: Facial Emotion Recognition through Machine Learning in Children with Autism Spectrum Disorder

## A Systematic Scoping Review of Open-Access Computational Evidence and of the Gaps Toward Therapeutic Monitoring

## Overview

This repository contains all data, scripts, supplementary materials, and analysis files for the systematic scoping review on machine learning applications for facial emotion recognition in children with Autism Spectrum Disorder (ASD), with potential relevance to therapeutic monitoring.

The research follows PRISMA-ScR and PRISMA 2020 methodology and analyzes machine learning architectures, performance metrics, datasets, input features, and methodological limitations for ASD emotion recognition in pediatric populations (ages 0 to 18 years). The search was restricted to open-access publications, framing this work as a systematic synthesis of open-access evidence available in the field.

**Target journal:** Cognitive Systems Research (Wiley, ASNA format).

## Research Questions

| RQ | Question | Analysis base |
|----|----------|---------------|
| RQ1 | What ML architectures and models have been employed for facial emotion recognition in children with ASD in the context of therapeutic monitoring? | 19 eligible studies with identifiable ML architecture |
| RQ2 | What metrics are used to evaluate the performance of emotion recognition algorithms, methods, or models? | 12 eligible studies with extractable supervised metrics |
| RQ3 | What are the accuracy, precision, recall, F1-score, and AUC values of these models? | 12 eligible studies with extractable supervised metrics |
| RQ4 | What datasets are used for model training and validation, and what are their representativeness limitations? | 24 eligible corpus |
| RQ5 | What input variables or features do emotion recognition systems employ, and to what extent do they correspond to the dimensions required by therapeutic monitoring? | 24 eligible corpus |
| RQ6 | What technical and methodological limitations impede ML system implementation in resource-limited contexts? | 24 eligible corpus |

## Repository Structure

```
systematic-review-data-analysis/
│
├── data/
│   ├── IEEE-data.csv                    # Raw export from IEEE Xplore (38 records)
│   ├── scopus-data.csv                  # Raw export from Scopus (935 records)
│   └── web-of-science-data.csv          # Raw export from Web of Science (942 records)
│
├── prisma/
│   ├── PRISMA.xlsx                      # Selection tracking spreadsheet
│   ├── PRISMA_2020.docx                 # PRISMA 2020 checklist (completed)
│   ├── PRISMA_2020.jpeg                 # PRISMA flow diagram image
│   └── reverse-engineering.xlsm         # Data extraction and reverse-engineering workbook
│
├── results/
│   ├── fig_2_mmat.png                   # MMAT judgement distribution (n = 23 appraised)
│   ├── fig_3_challenges.png             # Methodological challenges (n = 24 eligible)
│   ├── fig_4_architectures.png          # Architectural families by configuration (n = 19)
│   ├── fig_5_metrics.png                # Metric reporting frequency (n = 12)
│   ├── fig_6_datasets.png               # Dataset treemap by provenance (n = 24)
│   ├── fig_7_input.png                  # Input representation approach (n = 24)
│   └── fig_8_temporal.png               # Annual distribution by model family (n = 24)
│
├── scripts/
│   ├── fig_2_mmat.html                  # Chart.js: MMAT stacked bar chart
│   ├── fig_3_challenges.html            # Chart.js: challenges horizontal bar chart
│   ├── fig_4_architectures.R            # ggplot2: architectural families stacked bar
│   ├── fig_5_metrics.py                 # matplotlib: metric frequency bar chart
│   ├── fig_6_datasets.R                 # treemap: dataset provenance treemap
│   ├── fig_7_input.R                    # ggplot2: input features bar chart
│   └── fig_8_temporal.html              # Chart.js: temporal trends stacked bar chart
│
├── supplementary/
│   ├── S1_search_strings.pdf            # Platform-specific search strings with syntax
│   ├── S2_mmat_appraisal.pdf            # MMAT appraisal by study and domain
│   ├── S3_dataset_sources.pdf           # Documentary sources for dataset evaluation
│   └── S4_stratified_synthesis.pdf      # Complete stratified synthesis of the corpus
│
└── README.md
```

## Data Sources

| Database | Records | Role |
|----------|---------|------|
| Scopus | 935 | Primary academic database (2019-2025) |
| Web of Science Core Collection | 942 | Secondary academic database (2018-2026) |
| IEEE Xplore Digital Library | 38 | Technical publications (2018-2026) |
| **Total identified** | **1,915** | |

All three searches were executed on February 15, 2026.

Final corpus publication range: 2018 to 2026.

## Corpus Composition

| Group | N | Role in manuscript |
|-------|---|-------------------|
| Eligible corpus | 24 | Main synthesis, all denominators |
| Contextual evidence (outside eligible set) | 7 | Supplementary Material S4 only, no denominators |
| Retracted studies | 3 | Ethical documentation only (Section 2.7) |
| **Total meeting formal criteria** | **34** | |

The 7 contextual studies infringe CE(3) by employing exclusively non-facial modalities (EDA, EEG, VBM, speech diarization) or the age criterion by including exclusively adult participants. They do not participate in any denominator of the manuscript.

The 3 retracted studies were excluded following post-search integrity verification (December 2025 retractions due to use of minor images without documented consent or verified diagnosis).

## Clinical Domain Taxonomy

Each eligible study is assigned to exactly one domain (mutually exclusive, sum = 24):

| Domain | Description | N | Role |
|--------|-------------|---|------|
| D1 | Automated facial expression | 8 | Primary evidence |
| D2 | Affect and therapeutic engagement | 5 | Primary evidence |
| D3 | Emotion recognition intervention | 3 | Clinical reference |
| D4 | Screening or diagnosis of ASD | 8 | Comparative context |

Domains D1 and D2 (13 studies) constitute the primary evidence base closest to the review's objective.

## Search String (Scopus)

```
TITLE-ABS-KEY(("autism" OR "ASD" OR "autism spectrum" OR "autistic")
AND ("emotion" OR "facial expression" OR "affective" OR "social communication")
AND ("machine learning" OR "deep learning" OR "artificial intelligence"
OR "computer vision" OR "neural network" OR "classification" OR "recognition"))
AND PUBYEAR > 2018 AND PUBYEAR < 2026
AND (LIMIT-TO(DOCTYPE,"ar") OR LIMIT-TO(DOCTYPE,"cp"))
AND (LIMIT-TO(OA,"all"))
AND (LIMIT-TO(LANGUAGE,"English"))
```

Search strings for IEEE Xplore and Web of Science, with platform-specific syntax, temporal ranges, execution dates, and record counts, are provided in Supplementary Material S1.

## Methodology

**Design:** Systematic scoping review following PRISMA-ScR and PRISMA 2020.

**Framework:** Population, Concept and Context (PCC): population (children with ASD, 0-18 years), concept (ML systems for facial emotional expressiveness recognition), context (therapeutic monitoring in clinical and mobile settings with limited resources).

**Inclusion criteria:** (1) Studies on facial emotion recognition via ML in children with ASD, with primary focus on therapeutic monitoring; as secondary comparative context, studies on ASD detection or classification were also included; (2) quantitative evaluation metrics reported (ACC, F1, AUC, effect sizes, or usability metrics); (3) published in peer-reviewed journals or conference proceedings indexed in SJR Q1-Q4; (4) open-access full-text available; (5) written in English.

**Exclusion criteria:** (1) Review articles and meta-analyses; (2) studies without any quantitative empirical validation; (3) studies focused exclusively on non-facial modalities; (4) duplicate publications.

**Inter-rater reliability:** Cohen's kappa = 0.82 (Phase 1, title/abstract screening), 0.89 (Phase 2, full-text review).

**Quality assessment:** Mixed Methods Appraisal Tool (MMAT) version 2018, applied to 23 of 24 eligible studies (1 systems design study falls outside MMAT scope). No aggregate scores computed. A supplementary dataset quality instrument with 8 domains (provenance, consent, diagnosis, representativeness, license, re-identification, subject-level partitioning, clinical applicability) was constructed and applied independently.

## Key Findings

### Model Architectures (n = 19 eligible with identifiable ML architecture)

| Family | Ensemble | Non-ensemble | Total | % |
|--------|----------|-------------|-------|---|
| CNN / Deep Learning | 3 | 8 | 11 | 57.9% |
| Traditional ML | 1 | 2 | 3 | 15.8% |
| Multimodal / Wearable | 1 | 2 | 3 | 15.8% |
| Computer Vision / Eye-tracking | 0 | 2 | 2 | 10.5% |
| **Total** | **5** | **14** | **19** | **100%** |

### Performance Metrics (n = 12 eligible with extractable supervised metrics)

| Metric | Studies | % |
|--------|---------|---|
| Accuracy (ACC) | 10 | 83% |
| F1-score | 9 | 75% |
| Precision | 4 | 33% |
| Recall | 4 | 33% |
| AUC | 3 | 25% |

Values are reported stratified by clinical domain and do not admit comparison across distinct tasks. Studies on clinically sourced datasets report values that vary substantially by domain (67.8% in D1 emotion recognition, 79.1% balanced accuracy in D1, 88.0% in D4 screening). Studies on web-sourced datasets without clinical traceability report 96.5% to 99.82%, values not transferable to therapeutic context.

### Datasets (n = 24 eligible corpus)

| Category | Studies | % |
|----------|---------|---|
| Public datasets | 11 | 45.8% |
| Private / semi-restricted | 13 | 54.2% |

Critical gap: no validated datasets representing Latin American pediatric populations with ASD have been identified.

### Input Features (n = 24 eligible corpus)

| Group | Studies | % |
|-------|---------|---|
| Facial Features | 14 | 58.3% |
| CNN Architectures | 4 | 16.7% |
| Input Modalities | 2 | 8.3% |
| Optimization Methods | 2 | 8.3% |
| Physiological Signals | 1 | 4.2% |
| Others | 1 | 4.2% |

### Methodological Limitations (n = 24 eligible corpus)

| Limitation | Studies | % |
|-----------|---------|---|
| Limited ecological representativeness | 6 | 25.0% |
| Class imbalance and sampling biases | 5 | 20.8% |
| Inconsistency in data recording and annotation | 4 | 16.7% |
| Limited clinical interpretability | 3 | 12.5% |

### Technological Readiness (n = 24 eligible corpus)

| Level | Description | Studies | % |
|-------|-------------|---------|---|
| 1 | Conceptual model, no implementation | 6 | 25.0% |
| 2 | Offline evaluation on workstation | 13 | 54.2% |
| 3 | Mobile prototype, no deployment metrics | 3 | 12.5% |
| 4 | Measured inference on target device | 0 | 0.0% |
| 5 | End-user evaluation | 2 | 8.3% |
| 6 | Longitudinal clinical validation | 0 | 0.0% |

### Principal Finding

No study in the eligible corpus reports session-to-session longitudinal tracking variables. The available evidence is confined to cross-sectional classification, diagnostic screening, or emotion recognition under largely controlled conditions. Longitudinal therapeutic monitoring remains an open gap rather than a consolidated result.

## Supplementary Materials

| File | Content |
|------|---------|
| S1 | Platform-specific search strings with syntax, temporal ranges, and record counts |
| S2 | MMAT appraisal by study and domain: Section A (24 eligible), Section B (7 contextual) |
| S3 | Documentary sources for the 8-domain dataset quality evaluation |
| S4 | Complete stratified synthesis: Section A (24 eligible by D1-D4), Section B (7 contextual) |

## Technical Requirements

### R Environment

```r
library(dplyr)
library(ggplot2)
library(treemap)
```

### Python Environment

```python
import matplotlib
import matplotlib.pyplot as plt
```

### HTML Figures

Figures 2, 3, and 8 use Chart.js 4.4.0 with the datalabels plugin. Open the HTML files in any modern browser to render.

## Data Availability

All data, scripts, and supplementary materials are publicly available in this repository:
https://github.com/Cris223511/systematic-review-data-analysis

## Authors

| Author | Affiliation | Email |
|--------|------------|-------|
| Jorge Eduardo Castañeda Alban | USIL / Universidad Complutense de Madrid | jorge.castanedaa@usil.pe |
| Christopher Antonio Pillihuamán Santiago | USIL | c.pillihuaman@usil.pe |
| Jhafet Martín Cánepa Maceda | USIL | jhafet.canepa@usil.pe |
| Jomark Pablo Noriega Zapata | UNMSM | jnoriegaz@usil.edu.pe |
| Juan Orlando Salazar Campos | UNMSM | jsalazarc@usil.edu.pe |
| Kenny Disney Neira Neira | UTP | kneira@usil.edu.pe |

## Institution

Universidad San Ignacio de Loyola (USIL), Faculty of Engineering, Lima, Peru.

## Funding

This research was funded by Universidad San Ignacio de Loyola (USIL), Lima, Peru.

## Citation

```
Castañeda Alban, J.E., Pillihuamán Santiago, C.A., Cánepa Maceda, J.M.,
Noriega Zapata, J.P., Salazar Campos, J.O., & Neira Neira, K.D. (2026).
Facial Emotion Recognition through Machine Learning in Children with Autism
Spectrum Disorder: A Systematic Scoping Review of Open-Access Computational
Evidence and of the Gaps Toward Therapeutic Monitoring.
Cognitive Systems Research. [Submitted for publication]
```

## License

Academic use only. All extracted data are available in this repository.
