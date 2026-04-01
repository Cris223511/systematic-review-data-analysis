# Systematic Review: Facial Emotion Recognition through Machine Learning for Therapeutic Monitoring in Children with Autism Spectrum Disorder

## Overview

This repository contains all data, scripts, and analysis files for the systematic literature review on machine learning applications for facial emotion recognition in children with Autism Spectrum Disorder (ASD) for therapeutic monitoring purposes. The research follows PRISMA 2020 methodology and analyzes machine learning architectures, performance metrics, datasets, input features, and methodological limitations for ASD emotion recognition in pediatric populations (ages 0–18 years).

## Research Questions

- **RQ1**: What machine learning architectures and models have been employed for facial emotion recognition in children with ASD in the context of therapeutic monitoring?
- **RQ2**: What metrics are used to evaluate the performance of emotion recognition algorithms, methods, or models?
- **RQ3**: What are the accuracy, precision, recall, F1-score, and AUC values of these models?
- **RQ4**: What datasets are used for model training and validation, and what are their representativeness limitations?
- **RQ5**: What input variables or features do emotion monitoring systems employ during therapeutic interventions with children with ASD?
- **RQ6**: What technical and methodological limitations impede ML system implementation in resource-limited contexts?

## Repository Structure
```
├── data/           # CSV exports from academic databases and merged datasets
├── scripts/        # R and Python scripts for processing, analysis and visualization
├── results/        # Generated figures, tables and statistical outputs
└── README.md
```

## Data Sources

- **IEEE Xplore Digital Library**: Technical publications
- **Scopus**: Primary academic database
- **Web of Science Core Collection**: Secondary academic database

**Search period**: 2018–2025
**Total records identified**: 1,915
**Studies included after PRISMA filtering**: 34

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

Search strings for IEEE Xplore and Web of Science are provided in the supplementary materials within this repository.

## Methodology

PRISMA 2020 systematic review protocol with the following inclusion criteria:

- Studies on facial emotion recognition via ML in children with ASD, with primary focus on therapeutic monitoring
- Use of mobile applications, smartphone-based systems, or mobile-adaptable technologies
- Quantitative evaluation metrics reported (ACC, F1, AUC, effect sizes, or usability metrics)
- Published in peer-reviewed journals or conference proceedings indexed in Scimago Journal Rank (SJR) Q1–Q4
- Open access full-text available
- Written in English

**Exclusion criteria**: Review articles and meta-analyses; studies without any quantitative empirical validation; studies focused exclusively on non-facial modalities; duplicate publications of the same dataset or methodology.

**Inter-rater reliability**: Cohen's kappa κ = 0.82 (Phase 1 — title/abstract screening); κ = 0.89 (Phase 2 — full-text review).

**Quality assessment**: Mixed Methods Appraisal Tool (MMAT) version 2018, applied independently by two reviewers.

## Key Findings

### Model Architectures (N = 19 studies with identifiable ML component)

- **Most prevalent family**: CNN / Deep Learning (57.9%)
- **Ensemble models**: 26.3% of implementations
- **Non-ensemble models**: 73.7% of implementations
- **Temporal trend**: Peak productivity 2024–2025

### Performance Metrics (N = 13 studies with extractable supervised classification metrics)

- **Most reported**: Accuracy — 12/13 studies (92%)
- **F1-score**: 9/13 studies (69%)
- **Precision**: 6/13 studies (46%)
- **Recall**: 4/13 studies (31%)
- **AUC**: 3/13 studies (23%)
- **Accuracy range in genuine clinical data**: 67.8%–88.0%
- **Accuracy range in Kaggle datasets (compromised clinical validity)**: 96.5%–99.0%

### Datasets

- **Public datasets**: 50.0% of studies (FER-2013, FERAC, DREAM, CAFE, ABIDE, CK+, Kaggle ASD)
- **Private / semi-restricted datasets**: 50.0% (clinical proprietary data, robot therapy data, eye-tracking)
- **Critical gap**: No validated datasets representing Latin American pediatric populations with ASD

### Input Features

- **Facial Features**: 44.1% (landmarks, action units, microexpressions, gaze patterns)
- **CNN Architectures**: 23.5%
- **Input Modalities**: 11.8% (video frames, smartphone images, clinical session video)
- **Physiological Signals**: 8.8% (EDA, GSR, EEG, skeleton 3D)

### Methodological Limitations

1. Limited ecological representativeness — 11/34 studies (32.4%)
2. Class imbalance and sampling biases — 9/34 studies (26.5%)
3. Inconsistency in data recording and annotation — 6/34 studies (17.6%)
4. Limited clinical interpretability of models — 5/34 studies (14.7%)
5. Data availability and centralized processing — 2/34 studies (5.9%)

### Preprocessing Techniques

- **Balancing**: Data Augmentation (17.6%), Class Weighting (8.8%), SMOTE (5.9%), Stratified Sampling (8.8%), RUS (2.9%)
- **Hyperparameter optimization**: K-Fold Cross-Validation (23.5%), Manual Tuning (11.8%), Hold-out Validation (11.8%), Grid Search (8.8%), GWO Metaheuristic (2.9%)

## Data Availability

All data, scripts, and supplementary materials (PRISMA checklist, platform-specific search strings, quality assessment forms) are publicly available in this repository.

**Protocol registration**: PROSPERO CRD420251248821

## Technical Requirements

### R Environment
```r
library(dplyr)
library(ggplot2)
library(caret)   # K-Fold CV, Grid Search
library(ROSE)    # Data balancing
```

### Python Environment
```python
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from imblearn.over_sampling import SMOTE
```

## Authors

- **Jorge Eduardo Castañeda Alban** — Universidad San Ignacio de Loyola / Universidad Complutense de Madrid (jorge.castaneda@usil.edu.pe)
- **Christopher Antonio Pillihuamán Santiago** — Universidad San Ignacio de Loyola
- **Jhafet Martín Cánepa Maceda** — Universidad San Ignacio de Loyola
- **Jomark Pablo Noriega Zapata** — Universidad Nacional Mayor de San Marcos
- **Juan Orlando Salazar Campos** — Universidad Nacional Mayor de San Marcos
- **Kenny Disney Neira Neira** — Universidad Tecnológica del Perú

## Institution

Universidad San Ignacio de Loyola (USIL)
Faculty of Engineering — Lima, Peru

## Funding

This research was funded by Universidad San Ignacio de Loyola (USIL), Lima, Peru.

## Citation
```
Castañeda Alban, J.E., Pillihuamán Santiago, C.A., Cánepa Maceda, J.M.,
Noriega Zapata, J.P., Salazar Campos, J.O., & Neira Neira, K.D. (2026).
Facial Emotion Recognition through Machine Learning for Therapeutic Monitoring
in Children with Autism Spectrum Disorder: A Systematic Review.
[Submitted for publication]
```

## License

Academic use only. All extracted data are available in this repository upon publication.
