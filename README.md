# Systematic Review: Facial Emotion Recognition through Machine Learning in Children with Autism Spectrum Disorder

## A Systematic Scoping Review of Open-Access Computational Evidence and of the Gaps Toward Therapeutic Monitoring

## Overview

This repository contains all data, scripts, supplementary materials, and analysis files for the systematic scoping review on machine learning applications for facial emotion recognition in children with Autism Spectrum Disorder (ASD), with potential relevance to therapeutic monitoring.

The research follows PRISMA-ScR and PRISMA 2020 methodology and analyzes machine learning architectures, performance metrics, datasets, input features, and methodological limitations for ASD emotion recognition in pediatric populations (ages 0 to 18 years). The search was restricted to open-access publications, framing this work as a systematic synthesis of open-access evidence available in the field.

**Target journal:** Cognitive Systems Research (Elsevier).

## Research Questions

| RQ | Question | Analysis base |
|----|----------|---------------|
| RQ1 | What ML architectures and models have been employed for facial emotion recognition in children with ASD in the context of therapeutic monitoring? | 28 eligible studies with identifiable ML architecture |
| RQ2 | What metrics are used to evaluate the performance of emotion recognition algorithms, methods, or models? | 25 eligible studies with extractable supervised metrics |
| RQ3 | What are the accuracy, precision, recall, F1-score, and AUC values of these models? | 24 eligible studies with numeric values for those metrics |
| RQ4 | What datasets are used for model training and validation, and what are their representativeness limitations? | 36 eligible corpus |
| RQ5 | What input variables or features do emotion recognition systems employ, and to what extent do they correspond to the dimensions required by therapeutic monitoring? | 36 eligible corpus |
| RQ6 | What technical and methodological limitations impede ML system implementation in resource-limited contexts? | 36 eligible corpus |

## Repository Structure

```
systematic-review-data-analysis/
│
├── data/
│   ├── ACM-data.csv                     # Raw export from ACM Digital Library (5 records) with V3.6 decisions
│   ├── extraction_master.csv            # Study-level extraction matrix (36 eligible studies)
│   ├── records_deduplicated.csv         # All 1,920 records with duplicate flags (generated)
│   ├── screening_log.csv                # Decision, criterion and reason for each of the 1,396 unique records
│   ├── IEEE-data.csv                    # Raw export from IEEE Xplore (38 records)
│   ├── scopus-data.csv                  # Raw export from Scopus (935 records)
│   └── web-of-science-data.csv          # Raw export from Web of Science (942 records)
│
├── prisma/
│   ├── PRISMA.xlsx                      # Selection tracking spreadsheet
│   ├── PRISMA_2020.docx                 # PRISMA 2020 flow diagram (editable source)
│   ├── PRISMA_2020.jpg                  # PRISMA flow diagram image
│   └── reverse-engineering.xlsm         # Data extraction and reverse-engineering workbook
│
├── results/
│   ├── fig_2_mmat.png                   # MMAT judgement distribution (n = 36 appraised)
│   ├── fig_3_challenges.png             # Methodological challenges (n = 36 eligible)
│   ├── fig_4_architectures.png          # Architectural families by configuration (n = 28)
│   ├── fig_5_metrics.png                # Metric reporting frequency (n = 25)
│   ├── fig_6_datasets.png               # Dataset treemap by provenance (n = 36 eligible)
│   ├── fig_7_input.png                  # Input representation approach (n = 36 eligible)
│   └── fig_8_temporal.png               # Annual distribution by model family (n = 36 eligible)
│
├── scripts/
│   ├── deduplicate_records.py           # Reproducible DOI and title-year deduplication of the four exports
│   ├── compute_frequencies.py           # Computes all figure frequencies and checks denominators
│   ├── figure_data.js                   # Frequencies generated for the HTML figures
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
│   ├── S4_stratified_synthesis.pdf      # Stratified synthesis of the 36 eligible studies
│   └── S5_screening_reconstruction.pdf  # Deduplication, screening log and extraction of the 17 added studies
│
├── CHANGELOG.md
├── LICENSE                              # MIT license for the code
├── LICENSE-DATA.md                      # CC BY 4.0 license for data and documentation
└── README.md
```

## Data Sources

| Database | Records | Role |
|----------|---------|------|
| Scopus | 935 | Primary academic database (2019-2025) |
| Web of Science Core Collection | 942 | Secondary academic database (2018-2026) |
| IEEE Xplore Digital Library | 38 | Technical publications (2018-2026) |
| ACM Digital Library | 5 | Complementary search (2018-2026); screened by content in V3.6 |
| **Total identified** | **1,920** | |

All three main searches and the complementary ACM search were executed on February 15, 2026. The three main searches were updated on September 12, 2026; no additional eligible studies were identified. The Scopus string covered 2019-2025, and Web of Science and IEEE Xplore covered 2018-2026; their aggregate coverage spans the full 2018-2026 window.

ACM records were excluded before screening in V3.5 for lack of open access (CI(4)). This was not valid: the ACM Digital Library has been fully open access since January 1, 2026, before the search date. In V3.6 the five records were screened by content: three fail CI(1) and two fail CI(3) (`data/ACM-data.csv`).

## Selection Flow (PRISMA 2020)

| Stage | N |
|-------|---|
| Records identified | 1,920 |
| Duplicates removed (DOI 524, title and year 0) | 524 |
| Records screened | 1,396 |
| Excluded at title/abstract | 1,297 |
| Reports assessed in full text | 99 |
| Excluded in full text: CI(1) scope 16, CI(1) no automated facial or gaze analysis 8, CE(3) 9, CI(3) 8, retracted 8, CE(2) 2, CI(4) 2, CE(1) 1 | 54 |
| Contextual evidence (no denominators) | 9 |
| **Studies included** | **36** |

Deduplication is reproducible with `python3 scripts/deduplicate_records.py` (DOI first, then normalized title and year; precedence Scopus, Web of Science, IEEE Xplore, ACM). The V3.5 flow reported 1,002 duplicates and 913 screened records; the reconstruction found 524 duplicates and 1,396 unique records, so 479 unique records had been removed without a documented reason. In V3.6 these 479 records were screened, the 51 full-text exclusions of V3.5 were re-assessed with recorded reasons, and the former criterion of fewer than 10 participants was removed (sample size is charted as a variable). The scope criterion was made explicit (the study must use or evaluate an automated analysis of the face or gaze) and applied to every study, including the V3.5 corpus; it removed eight studies without automated facial or gaze analysis, two of them from the V3.5 corpus (Reed et al. 2021, Almeida et al. 2019). The eligible corpus changes from 21 to 36 studies: 19 from V3.5 and 17 added. Every decision is listed in `data/screening_log.csv`; title/abstract exclusions of the original screening (n = 827) keep their original decision, whose reason was not recorded at the time.

The V3.6 re-screening and the extraction of the 17 added studies were performed by one reviewer and are pending confirmation by a second reviewer.

Final corpus publication range: 2018 to 2026 (year of first online publication).

## Corpus Composition

| Group | N | Role in manuscript |
|-------|---|-------------------|
| Eligible corpus | 36 | Main synthesis, all denominators |
| Contextual evidence (outside eligible set) | 9 | Supplementary Material S4 only, no denominators |
| Retracted or withdrawn studies | 8 | Ethical documentation only |

The 9 contextual studies infringe CE(3) by employing exclusively non-facial data (EDA, EEG, VBM, speech diarization, tabular screening, text and clinical records), the age criterion by including exclusively adult participants, or CI(3) because the journal was not indexed in SJR in the year of publication. They do not participate in any denominator of the manuscript.

Eight retrieved records were retracted or withdrawn and are listed in `data/screening_log.csv`. Among them, three (Güngör et al. 2025, Mahmood et al. 2025, Kumar et al. 2024) were identified in the pre-synthesis integrity check (December 2025, retracted due to use of minor images without documented consent or verified diagnosis). A fourth retraction, Ahmad et al. (2024), was identified after corpus finalisation and confirmed on 17 August 2026 (Healthcare Technology Letters, DOI: 10.1049/htl2.70095), under the same causes as the prior three.

## Clinical Domain Taxonomy

Each eligible study is assigned to exactly one domain (mutually exclusive, sum = 36):

| Domain | Description | N | Role |
|--------|-------------|---|------|
| D1 | Automated facial expression | 12 | Primary evidence |
| D2 | Affect and therapeutic engagement | 6 | Primary evidence |
| D3 | Emotion recognition by the child (clinical or behavioural reference) | 6 | Clinical reference |
| D4 | Screening or diagnosis of ASD | 12 | Comparative context |

Domains D1 and D2 (18 studies) constitute the primary evidence base closest to the review's objective.

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

**Inclusion criteria:** (1) Studies on facial emotion recognition via ML in children with ASD, with primary focus on therapeutic monitoring; as secondary comparative context, studies on ASD detection or classification were also included; the study must use or evaluate an automated analysis of the face or gaze (made explicit in V3.6); (2) quantitative evaluation metrics reported (ACC, F1, AUC, effect sizes, or usability metrics); (3) published in peer-reviewed journals or conference proceedings with an SJR quartile (Q1-Q4) in the year of online publication, or in the latest available edition when that year has no edition; (4) open-access full-text available; (5) written in English.

**Exclusion criteria:** (1) Review articles and meta-analyses; (2) studies without any quantitative empirical validation; (3) studies focused exclusively on non-facial modalities; (4) duplicate publications; (5) studies that do not report the dataset used for training or validation.

**Inter-rater reliability:** Cohen's kappa = 0.82 (Phase 1, title/abstract screening), 0.89 (Phase 2, full-text review), computed on the V3.5 screening. Agreement for the V3.6 re-screening will be reported after the second review.

**Age criterion:** studies whose sample is predominantly adult (mean age 18 or above) are outside scope.

**Quality assessment:** Mixed Methods Appraisal Tool (MMAT) version 2018, applied to all 36 eligible studies. No aggregate scores computed. A supplementary dataset quality instrument with 8 domains (provenance, consent, diagnosis, representativeness, license, re-identification, subject-level partitioning, clinical applicability) was constructed and applied independently.

## Key Findings

### Model Architectures (n = 28 eligible with identifiable ML architecture)

| Family | Ensemble | Non-ensemble | Total | % |
|--------|----------|-------------|-------|---|
| CNN / Deep Learning | 5 | 14 | 19 | 67.9% |
| Traditional ML | 1 | 4 | 5 | 17.9% |
| Computer Vision / Eye-tracking | 0 | 4 | 4 | 14.3% |
| **Total** | **6** | **22** | **28** | **100%** |

### Performance Metrics (n = 25 eligible with extractable supervised metrics)

| Metric | Studies | % |
|--------|---------|---|
| Accuracy (ACC) | 22 | 88% |
| F1-score | 13 | 52% |
| Recall | 7 | 28% |
| AUC | 6 | 24% |
| Precision | 5 | 20% |

Values are reported stratified by clinical domain and do not admit comparison across distinct tasks. Studies on clinically sourced datasets report values that vary substantially by domain (79.1% balanced accuracy in D1, 88.0% in D4 screening); the 67.8% of Johnson et al. (2025) corresponds to seven-class classification on AffectNet. Studies on web-sourced datasets without clinical traceability report 84.0% to 99.01%, and four of the five highest accuracy values in the corpus (99.01%, 97.2%, 96.5% and 96.0%) come from these datasets; these values are not transferable to therapeutic context.

### Datasets (n = 36 eligible corpus)

| Category | Studies | % |
|----------|---------|---|
| Own clinical data | 13 | 36.1% |
| Clinical eye-tracking | 5 | 13.9% |
| Kaggle ASD collections | 5 | 13.9% |
| Robot therapy data | 4 | 11.1% |
| FER-2013 | 2 | 5.6% |
| Semi-public on request | 2 | 5.6% |
| CAFE | 1 | 2.8% |
| DREAM | 1 | 2.8% |
| FERAC | 1 | 2.8% |
| Web videos (SSBD and YouTube) | 1 | 2.8% |
| Own non-ASD training data | 1 | 2.8% |

Five studies use Kaggle ASD image collections and one uses web videos. In December 2025, Scientific Reports and PLOS One retracted three articles that used such collections because the images of minors lacked verified diagnosis and documented consent. These six studies are not retracted and remain in the corpus, with this risk of bias stated in the synthesis.

Critical gap: no validated datasets representing Latin American pediatric populations with ASD have been identified.

### Input Features (n = 36 eligible corpus)

| Group | Studies | % |
|-------|---------|---|
| Facial descriptor extraction | 19 | 52.8% |
| End-to-end learning (CNN) | 12 | 33.3% |
| Capture format definition | 2 | 5.6% |
| Physiological signal derivation | 2 | 5.6% |
| Algorithmic descriptor selection | 1 | 2.8% |

### Methodological Challenges Stated by the Authors (n = 36 eligible corpus)

| Challenge | Studies | % |
|-----------|---------|---|
| Poor generalization in small samples | 13 | 36.1% |
| Class imbalance and sampling biases | 6 | 16.7% |
| Classification uncertainty and low predictive robustness | 5 | 13.9% |
| Multicollinearity in multimodal data | 2 | 5.6% |
| Limited interpretability of black-box models | 2 | 5.6% |

21 studies state at least one challenge; a study may state more than one.

### Technological Readiness (n = 36 eligible corpus)

| Level | Description | Studies | % |
|-------|-------------|---------|---|
| 1 | Conceptual model, no implementation | 8 | 22.2% |
| 2 | Offline evaluation on workstation | 18 | 50.0% |
| 3 | Deployed prototype, no deployment metrics | 5 | 13.9% |
| 4 | Measured inference on target device | 0 | 0.0% |
| 5 | End-user evaluation | 5 | 13.9% |
| 6 | Longitudinal clinical validation | 0 | 0.0% |

The 19 studies kept from V3.5 retain their V3.5 level; Reed et al. (2021, level 1) and Almeida et al. (2019, level 5) left the corpus. The levels of the 17 added studies are listed in Supplementary Material S5 (Section G). Voss et al. (2019), a randomised clinical evaluation of a deployed system with two time points, is the study closest to level 6.

### Principal Finding

No study in the eligible corpus reports session-to-session longitudinal tracking variables. Shi et al. (2022) record 19 in-home sessions per child but predict affect within each session without quantifying change across sessions, and the pre-post designs (Lecciso et al. 2021, Voss et al. 2019, Fan et al. 2025, Wall et al. 2025) compare two time points at group level. The available evidence is confined to cross-sectional classification, diagnostic screening, emotion recognition under largely controlled conditions and two-point comparisons. Longitudinal therapeutic monitoring remains an open gap rather than a consolidated result.

## Supplementary Materials

All supplementary materials describe the V3.6 corpus of 36 eligible studies. Rows added in V3.6 are first-reviewer coding pending a second reviewer.

| File | Content |
|------|---------|
| S1 | Platform-specific search strings with syntax, temporal ranges and record counts; distribution by platform at each stage, deduplication method and ACM decision |
| S2 | MMAT appraisal by study and domain: Section A (36 eligible), Section B (9 contextual) |
| S3 | Documentary sources for the 8-domain dataset quality evaluation (SSBD and web videos added, ALSPAC removed) |
| S4 | Stratified synthesis: Section A (36 eligible by D1-D4), Section B (9 contextual), Section C (longitudinal tracking audit and coding matrix) |
| S5 | Screening reconstruction: deduplication, screening counts, the 99 full-text decisions, extraction and MMAT of the 17 added studies, the explicit scope criterion, data provenance risk and technological readiness of the added studies |

## Reproducing the Figures

All figure frequencies are computed from `data/extraction_master.csv`, which holds one row per eligible study with its domain, MMAT judgements, model family, ensemble configuration, reported metrics, dataset category, input representation and methodological challenges. No script contains precomputed frequencies.

```bash
cd scripts
python3 deduplicate_records.py   # rebuilds data/records_deduplicated.csv (1,920 records, 524 duplicates)
python3 compute_frequencies.py   # checks denominators (36, 36, 28, 25, 24, 18, 21, 21) and writes figure_data.js
Rscript fig_4_architectures.R
Rscript fig_6_datasets.R
Rscript fig_7_input.R
python3 fig_5_metrics.py
```

Figures 2, 3 and 8 are rendered by opening their HTML files in a browser; they read `figure_data.js`. The denominator check stops with an error if any total in the extraction matrix departs from the manuscript.

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
import openpyxl  # optional, used by deduplicate_records.py to flag records of the original screening
```

### HTML Figures

Figures 2 and 3 use Chart.js 4.4.0 with the chartjs-plugin-datalabels 2.2.0. Figure 8 uses Chart.js 4.4.0 without additional plugins. Open the HTML files in any modern browser to render.

## Data Availability

The extraction matrix, scripts, figures and supplementary materials are available in this repository:
https://github.com/Cris223511/systematic-review-data-analysis

The raw exports from Scopus, Web of Science, IEEE Xplore and ACM Digital Library are included only to document the selection process and remain subject to the terms of use of their providers.

## Authors

| Author | Affiliation | Email |
|--------|------------|-------|
| Jorge Eduardo Castañeda Alban | USIL / UCM | jorge.castanedaa@usil.pe |
| Christopher Antonio Pillihuamán Santiago | USIL | c.pillihuaman@usil.pe |
| Jhafet Martín Cánepa Maceda | USIL | jhafet.canepa@usil.pe |
| Jomark Pablo Noriega Zapata | UNMSM | jnoriegaz@usil.edu.pe |
| Juan Orlando Salazar Campos | UNMSM | jsalazarc@usil.edu.pe |
| Kenny Disney Neira Neira | UTP | kneira@usil.edu.pe |

## Institution

Universidad San Ignacio de Loyola (USIL), Faculty of Engineering, Lima, Peru. Universidad Complutense de Madrid (UCM), Doctoral Programme in Computer Science, Madrid, Spain (J.E.C.A.).

## Funding

This research was funded by Universidad San Ignacio de Loyola (USIL), Lima, Peru.

## Citation

```
Castañeda Alban, J.E., Pillihuamán Santiago, C.A., Cánepa Maceda, J.M.,
Noriega Zapata, J.P., Salazar Campos, J.O., & Neira Neira, K.D. (2026).
Facial Emotion Recognition through Machine Learning in Children with Autism
Spectrum Disorder: A Systematic Scoping Review of Open-Access Computational
Evidence and of the Gaps Toward Therapeutic Monitoring.
Manuscript in preparation.
```

## License

| Object | License |
|--------|---------|
| Code (`scripts/`) | MIT, see [LICENSE](LICENSE) |
| Extraction matrix, figures, supplementary materials, PRISMA diagram and documentation | CC BY 4.0, see [LICENSE-DATA.md](LICENSE-DATA.md) |
| Raw exports from Scopus, Web of Science, IEEE Xplore and ACM Digital Library, and the workbooks that contain them | Not licensed by the authors; subject to the terms of use of Elsevier, Clarivate, IEEE and ACM |
