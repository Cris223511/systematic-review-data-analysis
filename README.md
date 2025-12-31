# Systematic Review - Machine Learning and Mobile Applications for Emotion Recognition in Children with Autism Spectrum Disorder

## Overview
This repository contains all data, scripts, and analysis files for the systematic literature review on machine learning applications and mobile technologies for emotion recognition in children with Autism Spectrum Disorder. The research follows PRISMA 2020 methodology and analyzes machine learning algorithms, performance metrics, datasets, and mobile applications for ASD emotion recognition in pediatric populations (ages 0-18 years).

## Research Questions
- **RQ1**: Which machine learning architectures and models demonstrate the highest effectiveness in emotion recognition and ASD detection?
- **RQ2**: What metrics are used to evaluate the performance of emotion recognition algorithms, methods, or models?
- **RQ3**: What are the accuracy, precision, recall, F1-score, and AUC values of these models?
- **RQ4**: What datasets are used for model training and validation, and what are their representativeness limitations?
- **RQ5**: What input variables or features do ML systems employ for ASD detection and evaluation?
- **RQ6**: What technical and methodological limitations impede ML system implementation in resource-limited contexts?

## Repository Structure
```
├── data/           # CSV exports from academic databases and merged datasets
├── scripts/        # R and Python scripts for processing, analysis and visualization
├── results/        # Generated figures, tables and statistical outputs
└── supplementary/  # PRISMA checklist, search strings, quality assessment
```

## Data Sources
- **IEEE Xplore Digital Library**: Technical publications
- **Scopus**: Primary academic database  
- **Web of Science Core Collection**: Secondary academic database

**Search period**: January 2018 - October 2025  
**Total records identified**: 188 studies  
**Studies included after PRISMA filtering**: 42 studies

## Search String
```
TITLE-ABS-KEY ( ( "autism spectrum disorder" OR "ASD" OR "autism" ) 
OR ( "emotion recognition" OR "facial expression" OR "emotional recognition" ) 
AND ( "machine learning" OR "deep learning" OR "CNN" 
OR "convolutional neural network" OR "artificial intelligence" ) 
AND ( "mobile application" OR "smartphone" OR "serious game" 
OR "digital intervention" ) ) AND ( LIMIT-TO ( OA , "all" ) ) 
AND ( LIMIT-TO ( DOCTYPE , "re" ) OR LIMIT-TO ( DOCTYPE , "cp" ) 
OR LIMIT-TO ( DOCTYPE , "ar" ) )
```

## Methodology
PRISMA 2020 systematic review methodology with rigorous inclusion criteria:
- Focus on emotion recognition/ASD detection using ML approaches
- Mobile applications or smartphone-based technologies
- Quantitative performance metrics reported
- Published in peer-reviewed journals/conference proceedings **indexed in Scimago Journal Rank (SJR) Q1-Q4**
- Open access full-text available
- Written in English

**Exclusion criteria**: Review articles, studies without empirical validation, non-facial modality only studies, duplicate publications.

**Quality assessment**: Inter-rater reliability monitored using Cohen's kappa coefficient (κ = 0.82 for Phase 1; κ = 0.89 for Phase 2).

## Key Findings

### Model Architectures
- **Most prevalent families**: Wearable/Mobile (26.19%) and Traditional ML (26.19%)
- **Best performance**: Hybrid architectures combining CNN with temporal analysis and multimodal fusion (>95% accuracy in controlled datasets)
- **Temporal trend**: Peak productivity 2022-2024 (13 studies/year)

### Performance Metrics
- **Most reported**: Accuracy (62.50%), Recall (43.75%), F1-score (37.50%), Precision (37.50%)
- **Underutilized**: AUC (18.75%) despite methodological superiority in imbalanced datasets

### Datasets
- **Public datasets**: CAFE (7.1%), FER-2013 (4.8%)
- **Private datasets**: 38.1% (clinical proprietary data)
- **Critical gap**: No datasets representing Latin American pediatric populations with ASD

### Input Features
- **Most prevalent**: Facial Features (40.48%), CNN Architectures (23.81%), Input Modalities (14.29%)
- **Underexplored**: Physiological signals (7.14%), contextual features

### Limitations
1. Reality representativeness (28.57%)
2. Imbalanced data (23.81%)
3. Inconsistent information recording (19.05%)
4. Limited clinical interpretability (14.29%)

### Preprocessing Techniques
- **Balancing**: Data Augmentation (14.29%), SMOTE (7.14%), Class Weighting (9.52%)
- **Optimization**: K-Fold Cross-Validation (26.19%), Grid Search (11.90%)

## Registration and Data Availability
- **PROSPERO Registration**: CRD420251248821
- **Zenodo Repository**: DOI 10.5281/zenodo.17900467
- **Supplementary Materials**: Search strings (S1), Selection process (S2), Quality assessment (S3)

## Technical Requirements
### R Environment
```r
# Data processing and statistical analysis
library(dplyr)
library(ggplot2)
library(caret)      # K-Fold CV, Grid Search
library(ROSE)       # Data balancing techniques
```

### Python Environment
```python
# Visualization and metrics
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
from imblearn.over_sampling import SMOTE  # Class balancing
```

## Execution Instructions
1. **Data Processing**: Merge database exports and remove duplicates
2. **Statistical Analysis**: Apply balancing techniques and calculate metrics
3. **Visualization**: Generate figures for PRISMA flow, temporal trends, and performance distributions

## Authors
- Jorge Eduardo Castañeda Alban (jcastanedaa@usil.edu.pe)
- Jhafet Martín Cánepa Maceda (jhafet.canepa@usil.pe)
- Christopher Antonio Pillihuamán Santiago (c.pillihuaman@usil.pe)

## Institution
Universidad San Ignacio de Loyola  
Faculty of Engineering  
Information Systems Engineering Program  
Lima, Peru

## Funding
This research was funded by Universidad San Ignacio de Loyola (USIL), Lima, Peru.

## Citation
If you use this data or methodology, please cite:
```
Castañeda Alban, J.E., Cánepa Maceda, J.M., Pillihuamán Santiago, C.A. (2025). 
Machine Learning and Mobile Applications for Emotion Recognition in Children 
with Autism Spectrum Disorder: A Systematic Literature Review. 
IEEE Access. [Submitted]
```

## License
Academic use only. All data extracted will be available in supplementary materials upon publication.
