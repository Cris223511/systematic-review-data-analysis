# CHANGELOG

All notable changes to this project are documented in this file.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versions before V3.3 lack formal git tags; boundaries are estimated from commit messages.

---

## [V3.6] - 2026-11-07

Responds to the advisory review of 2026-11-04 (observations I-01 to I-12, N35-01 to N35-06,
N36-01 to N36-06 and the closure plan).

### Added
- `data/extraction_master.csv`: study-level extraction matrix for the 21 eligible studies
  (domain, MMAT judgements, ML architecture, model family, ensemble configuration,
  supervised metrics, dataset category, input representation, methodological challenges,
  primary evidence and translational relevance). Addresses advisory I-12, N36-02 and
  closure plan item 05.
- `scripts/compute_frequencies.py`: computes every figure frequency from the extraction
  matrix, checks the manuscript denominators (21 eligible, 20 MMAT-appraised, 17 with ML
  architecture, 14 with supervised metrics, 13 with numeric values, 11 primary evidence,
  11 translational, 11 with at least one stated challenge) and writes
  `scripts/figure_data.js`.
- `LICENSE` (MIT, code) and `LICENSE-DATA.md` (CC BY 4.0, extraction data, figures,
  supplementary materials and documentation), with the raw database exports explicitly
  excluded. Addresses advisory N36-04.

### Changed
- All seven figure scripts now read the extraction matrix instead of embedded counts:
  `fig_2_mmat.html`, `fig_3_challenges.html` and `fig_8_temporal.html` read
  `figure_data.js`; `fig_4_architectures.R`, `fig_6_datasets.R` and `fig_7_input.R` read
  the CSV in R; `fig_5_metrics.py` reads it in Python. Axis denominators are also computed.
  The regenerated figures are pixel-identical to the published ones (verified for
  Figures 2, 3, 4, 5, 7 and 8; Figure 6 verified on its data frame).
- README: repository structure, figure reproduction steps, data availability statement
  and per-object license table added; citation status changed from "[Submitted for
  publication]" to "Manuscript in preparation". Addresses advisory N36-05.

### Added (screening reconstruction, 2026-11-08)
- `scripts/deduplicate_records.py` and `data/records_deduplicated.csv`: reproducible
  deduplication of the four exports (DOI first, then normalized title and year). Result:
  1,920 records, 524 duplicates, 1,396 unique records. The V3.5 flow reported 1,002
  duplicates and 913 screened records; 479 unique records had been removed without a
  documented reason. Addresses advisory 1-B, N35-05 and closure plan item 01.
- `data/ACM-data.csv`: the five ACM records, previously only inside the workbook, with
  their V3.6 decision. CI(4) no longer applies because the ACM Digital Library has been
  fully open access since 2026-01-01. Addresses advisory 2-B and 2-C.
- `data/screening_log.csv`: stage, decision, criterion and reason for each of the 1,396
  unique records, including the 99 full-text decisions. Addresses advisory 1-C.
- `supplementary/S5_screening_reconstruction.pdf`: deduplication method, screening counts,
  full-text decision table, explicit scope criterion, extraction and MMAT of the added
  studies, data provenance risk of Kaggle and web collections and technological readiness
  of the added studies. Addresses advisory I-01, I-11 and 5.3.

### Changed (screening reconstruction, 2026-11-08)
- Eligible corpus updated from 21 to 36 studies after screening the 479 omitted records
  and re-assessing the 51 full-text exclusions of V3.5 with recorded reasons. The former
  criterion of fewer than 10 participants was removed. The scope criterion CI(1) was made
  explicit (the study must use or evaluate an automated analysis of the face or gaze) and
  applied to all studies: it removed Reed et al. (2021) and Almeida et al. (2019) from the
  V3.5 corpus and six re-screened studies without automated facial or gaze analysis.
  Domains: D1 12, D2 6, D3 6, D4 12. Denominators: 36 MMAT-appraised, 28 with ML
  architecture, 25 with supervised metrics, 24 with numeric values, 18 primary evidence,
  21 translational, 21 with at least one stated challenge. The V3.6 coding of the 17
  added studies is first-reviewer coding pending a second reviewer.
- `data/extraction_master.csv`: 17 rows added, 2 rows removed and a `coding_notes` column;
  two dataset categories added (web videos, own non-ASD training data). Row ids are kept
  as stable identifiers and are therefore not consecutive.
- `scripts/compute_frequencies.py`: expected denominators updated; year axis derived from
  the data instead of a fixed range.
- Figure scripts: axis limits computed from the data and empty categories omitted. All
  seven figures regenerated from the 36-study extraction matrix.
- `prisma/PRISMA_2020.jpg` and `prisma/PRISMA_2020.docx`: flow diagram redrawn with the
  reconstructed counts.
- Supplementary Materials S1 to S4 updated to the 36-study corpus. S1: distribution by
  platform at each stage, deduplication method, ACM decision and screening reconstruction.
  S2: MMAT table for the 36 studies, including the randomised trial category. S3: SSBD
  and web videos appraised, ALSPAC removed. S4: domain tables, longitudinal tracking audit
  and coding matrix for the 36 studies.
- README and `LICENSE-DATA.md`: selection flow, corpus, domains, results tables,
  technological readiness, principal finding, new files and license scope updated.

### Changed (coding verification, 2026-11-09)
- Pending coding of the added studies verified against the full texts. Han et al. (2022):
  accuracy of the fused model 95.56% (92.5% is its sensitivity), 10-fold subject-independent
  stratified cross-validation, ROC/AUC reported; recall and AUC flags set. Carpenter et al.
  (2020): LASSO-selected logistic regression with leave-one-out cross-validation; model
  family changed from Computer Vision / Eye-tracking to Traditional ML. Kalantarian et al.
  (2019): 8 boys with ASD, single session, 7 emotion categories, ensemble of commercial
  classifiers; ensemble flag set. Kurian and Tripathi (2024): 4 classes (happy, sad,
  neutral, meltdown), SSBD (75 children) plus YouTube videos, hold-out test set of 80
  samples. Pliska et al. (2025): no cross-validation or hold-out reported. Fan et al.
  (2025): classifier trained on the 7 FER-2013 classes, evaluated on 4 emotions.
- Figures 4, 5 and 8, README tables, `scripts/figure_data.js`, Supplementary Materials S4
  and S5 regenerated. Architecture families: CNN 19, Traditional ML 6, Computer Vision /
  Eye-tracking 3 (7 ensemble). Metrics: Recall 8, AUC 7.

### Changed (final repository audit, 2026-11-09)
- `data/extraction_master.csv`: `record_id` and `doi` columns added, linking each eligible
  study to its row in `data/screening_log.csv`; coding note added to Sariyanidi et al.
  (2025), whose supervised metrics are reported only in graphical form.
- `data/screening_log.csv`: the 19 studies kept from V3.5 now name the study in their
  inclusion reason, and the 9 contextual studies name the study and the criterion that
  places them outside the eligible set (adult sample, CE(3) or CI(3)).
- `scripts/fig_5_metrics.py`: console message translated to English.
- `.gitignore` added so that the PDF copies written by the figure scripts, Python caches
  and R session files are not committed.
- Supplementary Material S5: extraction note updated after the full-text verification.
- README: description of the extraction matrix updated; the two workbooks in `prisma/`
  are identified as V3.5 records kept for traceability.

### Changed (metric flags after manuscript update, 2026-11-10)
- `data/extraction_master.csv`: Voss et al. (2019) now counts as reporting supervised
  metrics (embedded emotion classifier with 72% accuracy; on-phone speed of 15-20 frames
  per second and recognition within 100 ms recorded in the coding note); Wang et al.
  (2025) now counts as reporting precision and recall (per-class values) and its note
  records the 95% bootstrap confidence interval of the accuracy.
- `scripts/compute_frequencies.py`: expected denominators updated to 26 studies with
  supervised metrics and 25 with numeric values; `scripts/figure_data.js` and
  `results/fig_5_metrics.png` regenerated (ACC 23, F1 13, Recall 9, AUC 7, Precision 6;
  n = 26).
- README: RQ2 and RQ3 bases, metric table and denominator check updated.

### Changed (repository layout and formats, 2026-11-10)
- `prisma/PRISMA_2020.docx` and `prisma/PRISMA_2020.jpg`: the official PRISMA 2020
  template used up to V3.5 is restored, with the V3.6 counts (1,920 identified; 524
  duplicates; 1,396 screened; 1,297 excluded; 99 assessed; 46 excluded in full text;
  8 retracted or withdrawn; 9 contextual; 36 eligible).
- `pipeline/`: new folder for the processing code (`deduplicate_records.py`,
  `compute_frequencies.py` and the generated `figure_data.js`), so that `scripts/` holds
  only the figure scripts. The HTML figures read `../pipeline/figure_data.js`.
- Figure scripts no longer write PDF copies; `results/` holds only the PNG figures.
- Supplementary Material S4: column widths of Section A fixed so the table fits the page.
- Supplementary Material S5: rebuilt in LaTeX with the same format as S1 to S4; adds the
  table of retracted or withdrawn records and the readiness table.
- README and LICENSE-DATA: paths updated; `.gitignore` excludes Office lock files.


### Fixed (repository audit, 2026-11-10)
- Supplementary Material S4: Shi et al. (2022) recorded 19 in-home sessions in total
  (4 children), not per child; setting of Wang et al. (2025) and Silva et al. (2021)
  harmonised with the manuscript (rehabilitation classroom, robot therapy); SSBD size
  stated as 75 videos; empty footnote of the former Reed et al. entry removed and the
  following footnotes relabelled.
- Supplementary Material S5: wording of the opening sentence.
- README: RQ3 base set to 26 studies (25 with numeric values), clinical performance
  values by domain updated, Fan et al. 97.6% described as feedback accuracy, the four
  retractions found in V3.6 described, and the Shi et al. session count corrected.
- CHANGELOG: the six earlier entries marked PENDING were manuscript-only changes made in
  Overleaf and are now labelled as such.

### Changed (audit of criterion CI(3), 2026-11-10)
- Criterion CI(3) audited against the SCImago edition of the year of first online
  publication of every included study, every contextual study and the records excluded
  for CI(3) (advisory I-09). New file `data/sjr_verification.csv` records source type,
  best quartile and SJR for each of them. The 31 remaining eligible studies have a
  quartile from Q1 to Q3; the 2026 study uses the 2025 edition.
- Five V3.5 studies whose venue had no SJR quartile in the year of publication moved to
  contextual evidence, as Akın-Bülbül et al. (2024) had in V3.5: Rudovic et al. (2018),
  Science Robotics (first quartile in 2019); Dapogny et al. (2019), Frontiers in Computer
  Science (first quartile in 2022); Rudovic et al. (2019), ICMI 2019 proceedings;
  Sholikah et al. (2024), Procedia Computer Science (proceedings); Sariyanidi et al.
  (2025), IEEE FG 2025 (not indexed). Eligible corpus 36 to 31 (D1 10, D2 4, D3 6, D4 11);
  contextual evidence 9 to 14; ML architecture 28 to 23; supervised metrics 26 to 22
  (numeric 25 to 22); primary evidence 18 to 14; translational relevance 21 to 18; studies
  with at least one stated challenge 21 to 18.
- IEEE-0006 reassigned from CI(3) to CE(3): the 2025 edition of IEEE Access applies to it as
  to Cicceri et al. (2026), and the study uses only health-insurance administrative
  records. Full-text exclusions: CE(3) 9 to 10, CI(3) 8 to 7; total unchanged (46).
- Model family "Computer Vision / Eye-tracking" renamed "Computer Vision pipelines" in the
  extraction matrix, `pipeline/compute_frequencies.py`, `scripts/fig_4_architectures.R`
  and `scripts/fig_8_temporal.html` (advisory I-02).
- Figures 2, 3, 4, 5, 7 and 8 regenerated from the matrix; Figure 6 is regenerated with
  `scripts/fig_6_datasets.R`.
- Supplementary Materials S1 to S5 and `prisma/PRISMA_2020.docx` updated to 31 eligible and
  14 contextual studies. S5 Section G and the README use nominal, non-cumulative categories
  of implementation and validation evidence instead of readiness levels (advisory I-10).
### Commits
- `d1fb7e6` 2026-11-07 feat: add extraction master and compute all figures from it, add licenses, update README
- `3791adb` 2026-11-08 feat: reconstruct screening flow with reproducible deduplication and explicit scope criterion
- `9c57aba` 2026-11-09 fix: verify coding of added studies against full texts
- `9e90c18` 2026-11-09 chore: link extraction matrix to screening log and finalize repository audit
- `67f2a7b` 2026-11-10 fix: count Voss and Wang metric flags and update metric denominators
- `32c5913` 2026-11-10 refactor: restore PRISMA template, move pipeline code and rebuild S4 and S5
- `4521e23` 2026-11-10 fix: correct Shi session count, harmonise S4 settings and update README values
- `a5a9b6c` 2026-11-10 fix: apply CI(3) to every venue, move five studies to contextual evidence and rename the CV family

---

## [V3.5] - 2026-10-20

V3.5 groups the advisory corrections of 2026-10-20 and two later minor revisions of the
same version (2026-10-29 and 2026-11-06). The advisory review of 2026-11-04 (manuscript
file labelled v3.6, repository up to commit `7d3c607`) corresponds to V3.5 including the
2026-10-29 minor revision and precedes the 2026-11-06 minor revision.

### Changed (minor revision, 2026-11-06)
- Eligible corpus reclassified from N=23 to N=21. Alsubai (2025) moved to contextual
  evidence for CE(3): its model consumes tweets, adult dementia records and toddler
  screening questionnaires, with no facial, video or gaze input. Akın-Bülbül et al.
  (2024) moved to contextual evidence for CI(3): Türk Psikoloji Dergisi is not indexed
  in SJR after 2019. Contextual evidence rises from 7 to 9; domain D4 falls from 7 to 5;
  the architecture base falls from 18 to 17 (Traditional ML from 3 to 2). The subsets of
  12 (supervised metrics), 13 (primary evidence) and 11 (translational relevance) are
  unchanged.
- Vedantham et al. (2025) reassigned from D1 to D4 according to its verified main task
  (autistic versus non-autistic facial images): D1 falls from 8 to 7, D4 rises from 5 to 6,
  and the primary evidence base (D1 + D2) falls from 13 to 12.
- Hassan et al. (2025) reassigned from D2 to D4: its verified outcome is the ASD level
  (classification) and the ADOS score (regression) of each child, that is, severity of the
  condition, which the manuscript defines as detection and not as therapeutic monitoring.
  D2 falls from 5 to 4, D4 rises from 6 to 7, and the primary evidence base (D1 + D2)
  falls from 12 to 11. Updated in S4 (Sections A, C.1 and C.2, note g and Section C text)
  and README.
- Supervised-metrics subset extended from 12 to 14 studies: Dapogny et al. (2019)
  (accuracy) and Alam et al. (2025) (accuracy, precision, recall, F1-score and AUC)
  report extractable metrics and meet the subset definition. Figure 5 and the README
  metrics table updated (ACC 13, F1 11, precision 5, recall 5, AUC 4), also counting the
  numeric accuracy and F1-score of Rudovic et al. (2019) (Tables 2 and 3 of the article). README no longer
  presents the 67.8% of Johnson et al. (2025) as a clinical-data value.
- Scopus temporal range documented as 2019-2025 (`PUBYEAR > 2018 AND PUBYEAR < 2026`),
  consistent with the year distribution of `data/scopus-data.csv`; Web of Science and
  IEEE Xplore remain 2018-2026. Updated in S1 and README.
- S1: three main searches plus the complementary ACM search; N=21 and 9; limitations
  cross-reference corrected to Section 2.9.
- S2: Section A reduced to 21 studies (16 Cat. 3, 3 Cat. 4, 1 Cat. 5, 1 outside MMAT);
  Section B extended to 9 studies; numbering aligned with S4; Vedantham et al. (2025)
  added to note 4; Levy et al. (2024) reason limited to adult participants; limitations
  cross-reference corrected to Section 2.9; MMAT domain for criteria 3.5/4.1 renamed
  "Intervention as intended and sampling strategy" (column Int.) to match the MMAT 2018
  wording.
- S3: "CT" replaced by "ND" throughout to match Table 18; ABIDE attributed to a
  contextual study (Xu & Ju, 2023); Kaggle withdrawal attributed to a comment by the
  dataset creator (10 May 2022); JEMImE corrected after verification against Grossard
  et al. (2018) and Dapogny et al. (2019): typically developing children only, with no ASD
  subgroup (D3 N/A, D7 157 children, D8 P), and both reported video counts stated
  (3,875 and 3,768); DREAM licence and DOI corrected to CC BY-NC-SA 4.0 and
  10.5878/17p8-6k13 (Swedish National Data Service); CK+ age range in D4 corrected from
  18-30 to 18-50 years (Lucey et al., 2010).
- S4: Sections A, B and C updated to N=21 and 9; shared numbering with S2 and removal of
  the contradictory #18 statement; internal planning language removed; verified values
  corrected: Shaik F1 84.2%; Aljbori accuracy 99.01% (table value, abstract reports
  99.82%) and 6 classes; Alam datasets (Kaggle + YTUIA, UIFID test), CNN ensemble and
  subject-independent split; Dapogny accuracy 81.9% and 4 classes; Hwang binary task
  (33 DD, 56 TD) with stratified validation; Leo without child-level partition;
  Vedantham et al. (2025) moved from D1 to D4 because its main task is autistic versus
  non-autistic classification (auxiliary emotion data relabelled into three classes);
  "CK++" typo corrected; Rudovic et al. (2019) reported with its numeric accuracy (82.3%)
  and F1-score (52.6%) for three engagement levels instead of graphical-only metrics;
  note added on Hassan et al. (2025) (95.6% corresponds to the 3D biomarker approach;
  97.36% and F1 95.56% with saliency maps); notes added on Johnson et al. (2025) (67.8% measured on
  AffectNet, seven classes) and Radočaj and Martinović (2025) (four FERAC classes;
  stated 80/20 stratified split versus inconsistent reported image counts).
- S4 Section C.2 validation column checked against the full texts: Shaik et al. (2025)
  No to Yes (stratified 5-fold cross-validation), Sariyanidi et al. (2025) N/A to Yes
  (leave-one-out by participant with nested cross-validation), Rudovic et al. (2018) N/A
  to No (per-child 40/20/40 split); Hassan et al. (2025) validation set to ND because
  the full text could not be accessed (note g); new note p. Hassan et al. (2025) later
  set to Yes after verifying the statement "a stratified cross-validation technique was
  used" in the article; folds and grouping by child remain unreported (note g).
- Figure 7 and README input features checked against the full texts: Leo et al. (2018)
  derives action unit intensities from facial landmarks and HOG (facial descriptor
  extraction, not algorithmic selection); Reed et al. (2021) uses emotion recognition test
  scores without any computational facial input and joins Almeida et al. (2019) in the
  renamed category "No computational facial input (system design or test scores)".
  Groups now 8, 7, 2, 2, 1, 1 (algorithmic descriptor selection 2 to 1).
- Figure 6: the five web-sourced studies (Shaik, Alam, Aljbori, Vedantham and Hosney)
  all train their main model on Kaggle autism collections, so "Kaggle ASD collections"
  rises from 4 to 5 and the "Kaggle FER" tile is removed; Vedantham et al. (2025) uses a
  generic Kaggle facial expression dataset only as auxiliary data. Totals unchanged
  (9 public, 12 private).
- PRISMA flow diagram (`prisma/PRISMA_2020.docx` and `.jpg`): eligible corpus 21,
  contextual evidence 9 with the CI(3) reason.
- Figures 2, 3, 4, 6, 7 and 8 regenerated for N=21 (Figure 2: n=20 appraised, domain
  label aligned with the MMAT 2018 wording;
  Figure 4: n=17; Figure 8: y-axis maximum set to 10 so the 10 and 11 tick labels no
  longer overlap). Figure 7 reflects the input-representation recoding of the 21
  eligible studies against the manuscript definitions.
- README: target journal corrected to Elsevier; `PRISMA_2020.docx` described as the
  editable flow diagram; exclusion criterion CE(5) added; technological readiness level 3
  renamed "Deployed prototype"; all tables and denominators updated to N=21; accuracy
  range of web-sourced studies corrected to 84.0% to 99.01% (five studies: Shaik, Alam,
  Vedantham, Hosney and Aljbori), four of which hold the four highest values of the corpus.

### Changed (minor revision, 2026-10-29)
- wileyNJD-Chicago.bib: cite key renamed from `Ramachandran2025` to `Vedantham2025`;
  first author of the referenced article is R. Vedantham (not Ramachandran).
  All `\cite{Ramachandran2025}` occurrences in the manuscript replaced globally
  by `\cite{Vedantham2025}`. Addresses naming note identified in the 2026-10-20 advisory (I-12).

### Changed
- abstract/transabstract (both versions): condensed to remove redundant clauses
  while preserving all advisory-required data points: counts 1,920/23/7/4/18/13/12,
  limitation percentages 6/23 26.1% and 5/23 21.7%, operational longitudinal
  finding with intraindividual change / test-retest / responsiveness,
  Section 1 reference, Datasets block and GitHub URL. Addresses advisory R34-01.
- tabrisk (Tabla 6): rows within domains D1 and D4 reordered by ascending citation
  number. D1: [2,7,8,11,18,19,30,45] (Radočaj raised before Sholikah; Aljbori and
  Vedantham raised before Leo). D4: [6,10,16,20,32,46] (Hwang second; Sariyanidi
  third; Hosney fourth; Akın-Bülbül fifth; Alam last). D2 was already in correct
  order [17,27,31,33]. Addresses advisory I-01.
- tabrisk (Tabla 6): Riesgo fuga column vocabulary corrected. Alto/Bajo removed;
  replaced by Potencial (superscript i, inferred from partition unit) and ND
  (undetermined). Demostrado reserved for audited evidence; no case qualifies in
  corpus. Addresses advisory §7.1 + §8 C2/C4.
- tabrisk note: `\cite{Collins2024,Moons2025}` added at two points: after "ND cuando
  no puede determinarse" and after "S o ND" for Calibración. Addresses advisory §8 C4.
- tabdim (Tabla Dimensiones Técnicas Complementarias): converted from `table` to
  `table*` for two-column span; `\parbox` wrappers and `[6pt]` vertical spacers
  removed; all `\cite{}` groups reordered ascending by citation number in each
  category (GPU, CPU, Móvil, Especializada, Inferida, Robot multimodal). Applied to
  both Wiley and ElsArticle versions. Addresses advisory I-01/I-12.
- fig3, fig5: converted from `figure` to `figure*` environment; `width=\columnwidth`
  replaced by `width=\textwidth` for two-column span. Applied to both versions.
  Addresses advisory I-12.
- ElsArticle D1 residual: Akın-Bülbül encoding corrected from `Ak{\i}n-Bülbül` to
  direct UTF-8 `Akın-Bülbül` in tabrisk.
- ElsArticle D3 residual: Scopus search string box header added
  (`\noindent\textbf{Cadena de búsqueda ejecutada en Scopus (rango temporal
  2018--2026)}`) before `\begin{quote}`.
- S4 Section C added: longitudinal tracking audit (N=23) and multi-label coding
  matrix for D1+D2. Addresses advisory §7.4 + I-11 + R34-05.
- tab7 note: single-criterion taxonomy for architectural families ("el origen de la
  representación que el modelo consume") verified present. Addresses advisory §8.1 C1.
- README: Scopus string bounds corrected to `PUBYEAR >= 2018 AND PUBYEAR <= 2026`;
  architectural families corrected ML Trad=2/Multimodal=4; N<10 reframed as
  post-hoc analytical note; search update note for 12 September 2026 added.
  Changelog section moved to this file. Addresses advisory I-04/R34-01.
- DOI/names audit completed from .bib: one critical key mismatch identified
  (Radocaz2025 vs Radocaj2025 in tabrisk); one naming note (Ramachandran2025 key
  with first author Vedantham). Addresses advisory I-12.
- fig_4_architectures.R: reclassified to 3-family taxonomy (CNN/Deep Learning,
  Traditional ML, Computer Vision/Eye-tracking); ggsave output paths corrected for
  fig_6_datasets.R and fig_7_input.R. fig_8 PNG regenerated. Addresses advisory I-02.
- scripts/fig_4, fig_6, fig_7: output directory paths updated; figure filenames
  unified to match results/ structure.
- fig_8_temporal.html: image extension corrected; Chart.js version details updated.
- README: authors and institution details updated; license section formatting corrected.

### Commits
- `b9b5860` 2026-11-07 docs(changelog): merge minor revisions of 2026-10-29 and 2026-11-06 into V3.5
- `083b802` 2026-11-07 fix: verify fig_7 input categories (Leo, Reed) against full texts
- `919ef7d` 2026-11-07 fix: set Hassan stratified validation in S4 after full-text check
- `2cd6ee5` 2026-11-06 fix: verify S4 validation column, merge Kaggle FER into Kaggle ASD in fig_6
- `1e75a8b` 2026-11-06 fix: move Hassan to D4 (ASD level task), correct CK+ age range in S3, web accuracy range in README, fig_8 y-axis
- `e3bd31c` 2026-11-06 fix: reclassify corpus to N=21, update S1-S4, regenerate figures 2-8, update PRISMA, README and CHANGELOG
- `manuscript (Overleaf)` 2026-10-29 fix(bib): rename cite key Ramachandran2025 to Vedantham2025; global replace in .tex
- `manuscript (Overleaf)` 2026-10-20 fix(abstract): condense RESUMEN and ABSTRACT preserving all advisory data points
- `manuscript (Overleaf)` 2026-10-20 fix(tabrisk): reorder D1 and D4 rows by ascending citation number
- `manuscript (Overleaf)` 2026-10-20 fix(tabdim): convert to table*, reorder cite groups, remove parbox spacers (Wiley + ElsArticle)
- `manuscript (Overleaf)` 2026-10-20 fix(figures): convert fig3 and fig5 to figure* with textwidth (both versions)
- `manuscript (Overleaf)` 2026-10-20 fix(elsarticle): correct Akın-Bülbül encoding D1; add Scopus box header D3
- `be918c2` 2026-10-29 Fix formatting in README license section
- `6b1c878` 2026-10-29 Update authors and institution details in README
- `d92e915` 2026-10-29 Fix image extension and update Chart.js details
- `dec9a2b` 2026-10-29 Change output directory and figure filenames
- `1f5ce31` 2026-10-29 fix(I-02): update fig_4 to 3-family arch, fix ggsave paths fig_6/fig_7, regenerate fig_8 PNG
- `486aede` 2026-10-20 Revise CHANGELOG for version 3.5 updates
- `56ea893` 2026-10-20 Revise README for clarity and accuracy
- `eaa6291` 2026-10-20 fix: apply advisory corrections I-01 to I-12, reclassify architectural families
- `8111c9e` 2026-10-19 Add files via upload
- `1398350` 2026-10-19 Remove changelog from README.md
- `8e1a78c` 2026-10-19 Revise changelog for version 3.5
- `56fa11f` 2026-10-19 Revise README for version V3.5 updates and clarifications
- `6a56285` 2026-10-19 Fix formatting issue in README.md
- `fce6fbd` 2026-10-19 Revise S4_stratified_synthesis.pdf description
- `d5c2b6f` 2026-10-19 Revise README for version 3.5 and update details
- `8c4fb8d` 2026-10-18 Correct publication year and update search details
- `f44c006` 2026-10-17 Update statistics in README.md
- `24cf135` 2026-10-16 Fix publication year range in query
- `d0edb4d` 2026-10-16 Revise data sources and methodology in README
- `495b870` 2026-10-16 Refine inclusion criteria and database descriptions

---

## [V3.4] - 2026-09-19

### Changed
- Ahmad et al. (2024) retraction confirmed (Healthc Technol Lett, 17 Aug 2026);
  eligible corpus finalized at N=23.
- Figures 1-8 regenerated; S1, S3 updated to reflect N=23.
- ACM Digital Library (n=5, all excluded CI(4)) and citation chasing (n=5, all
  excluded full-text Sep 2026) added to PRISMA flow and reverse_engineering.xlsx.
- S1 Scopus range corrected to >= / <=; CT replaced by ND throughout S2;
  Ahmad #18 excluded row added.
- Total identified updated to 1,920.

### Commits
- `a7fb297` 2026-09-19 Update ACM Digital Library exclusion details
- `ad06ea7` 2026-09-19 fix(prisma): clarify ACM exclusion label
- `84050fa` 2026-09-19 docs(S1): add ACM search (n=5), update total to 1,920, add search update section (N=23)
- `e2c8543` 2026-09-19 docs: update flow diagram to n=23, add ACM Digital Library (n=5) and citation chasing (n=5)
- `7d9968a` 2026-09-19 Update data sources and funding information in README
- `7b8ed3c` 2026-09-19 docs: add ACM Digital Library to reverse_engineering.xlsx
- `d7c9e18` 2026-09-18 fix: update S1 Scopus range; replace CT with ND; add Ahmad #18 excluded row
- `46be8bf` 2026-09-14 Merge branch main
- `fd79b85` 2026-09-14 fix: update eligible corpus to N=23 (Ahmad retracted Aug 2026), regenerate figs 1-8, S1, S3 and README
- `4602aca` 2026-09-14 Revise study counts and statistics in README
- `3b6c99f` 2026-09-05 docs(S1): update supplementary to document ACM search and citation chasing procedures

---

## [V3.3] - 2026-08-29

### Changed
- PRISMA-ScR + PRISMA 2020 methodology adopted as framework.
- Eligible corpus set at N=24 after separating 7 contextual studies from the former
  31-study corpus; reduced to N=23 in V3.4 after the retraction of Ahmad et al. (2024).
- Denomination "definitive corpus of 31" replaced by eligible corpus N=24 +
  contextual evidence N=7.
- S1-S4 translated to English; section cross-references aligned with manuscript.
- S4 full 31-study synthesis added; S2 ML-base column added; appraisal domains renamed.
- Architecture distribution updated to n=21 base.
- S3 judgements aligned with Table 18; denominators corrected in Tables 6, 15 and 19.

### Commits
- `64e0204` 2026-08-29 Merge branch main
- `dbcaa9d` 2026-08-29 fix: replace definitive corpus of 31 with eligible corpus N=24 and contextual evidence N=7
- `b8dcfc9` 2026-08-24 Revise title and overview for clarity on ASD review
- `0c9b4df` 2026-08-24 fix(v3): update figures 2-8 to N=24, regenerate S2/S4 with eligible/contextual split, recalculate all denominators
- `e7086b8` 2026-08-14 fix: add ML-base column and rename appraisal domains in S2
- `d8415e5` 2026-08-14 fix: update architecture distribution to n=21 base and regenerate outputs
- `d79c0c3` 2026-08-13 fix: align S3 judgements with Table 18 and correct denominators in Tables 6, 15 and 19
- `5761f5d` 2026-08-10 docs: translate S1-S4 to English and align section cross-references with the manuscript
- `31b4059` 2026-08-09 docs: update S1-S3 to new title and add S4 with full 31-study synthesis

---

## [V3.2] - 2026-08-03

### Added
- Supplementary materials S1 (search strings) and S2 (MMAT appraisal) added to repository.
- PRISMA materials restructured.

### Changed
- Performance metrics corrected in README.
- Funding information updated.

### Commits
- `69b7806` 2026-08-03 Add files via upload
- `656867a` 2026-08-03 docs: add supplementary materials S1 and S2
- `18e533c` 2026-07-31 Add files via upload
- `29e068a` 2026-07-31 Delete prisma/PRISMA_2020.jpeg
- `018d3c1` 2026-07-31 Delete prisma/PRISMA_2020.docx
- `3e5b6bf` 2026-06-30 Correct performance metrics in README.md
- `59682bc` 2026-06-30 Add files via upload
- `9c8914f` 2026-06-30 Delete results/sumburst.jpg
- `94392e2` 2026-06-23 Update funding information in README
- `3053869` 2026-06-23 Revise README for clarity and detail enhancement
- `22ef3d9` 2026-06-22 Add files via upload
- `b702968` 2026-06-22 Delete prisma/PRISMA_2020.jpeg
- `e490004` 2026-06-22 Delete prisma/PRISMA_2020.docx

---

## [V3.1] - 2026-04-02

### Added
- PRISMA materials and search period documented in README.
- PRISMA supplementary materials added to prisma/.

### Changed
- Author formatting corrected; email for Jorge Castañeda fixed.
- README revised to focus on facial emotion recognition in children with ASD.

### Commits
- `5c1a574` 2026-04-02 Update README with PRISMA materials and search period
- `9b4ddf4` 2026-04-02 Update data files and add PRISMA supplementary materials
- `fd6299e` 2026-03-31 Correct email address for Jorge Castañeda
- `35bb8ee` 2026-03-31 Update author formatting in README.md
- `a036bc6` 2026-03-31 Revise README with enhanced research and methodology details
- `210ac8f` 2026-03-31 Revise README for facial emotion recognition focus

---

## [V2.0] - 2025-12-30

### Changed
- README refactored for clarity and organization.
- Results and scripts directories restructured.
- Jorge Eduardo Castañeda Alban added to authors list.

### Commits
- `3130a60` 2025-12-30 Refactor README for clarity and organization
- `8a420da` 2025-12-30 Add files via upload
- `efc9ce8` 2025-12-30 Delete results directory
- `f4bb82c` 2025-12-30 Delete scripts directory
- `a3d61d9` 2025-12-26 Add files via upload
- `60a72d5` 2025-12-26 Delete results
- `c45fb42` 2025-12-26 Delete characteristics.png
- `f928f0e` 2025-12-26 Add files via upload
- `a30d52e` 2025-12-26 Add files via upload
- `f002f14` 2025-12-26 Create results
- `5f0ab21` 2025-12-26 Delete scripts directory
- `d245255` 2025-12-26 Delete results directory
- `591443e` 2025-12-26 Delete results/characteristics.jpeg
- `f3248b7` 2025-12-26 Add Jorge Eduardo Castañeda Alban to authors list

---

## [V1.0] - 2025-11-04

### Added
- Initial repository with systematic review data, scripts, and analysis for ASD
  emotion recognition research.
- Datasets.R script; results figures.
- README focused on children with ASD.

### Commits
- `a8737db` 2025-11-04 Translate features and update plot labels in R script
- `7d790df` 2025-11-04 Add files via upload
- `c0941a0` 2025-11-04 Delete results/fig_2_mmat.png
- `dc2d2a5` 2025-11-04 Delete results/characteristics.jpeg
- `3a6b7fb` 2025-11-04 Delete results/sumburst.png
- `2046305` 2025-11-04 Update dataset frequencies and categories
- `6f9dbd8` 2025-11-04 Rename output file and update save function
- `af493a9` 2025-11-04 Revise README to reflect focus on children with ASD
- `b11b1eb` 2025-10-26 Fix formatting issues in datasets.R
- `e18cea4` 2025-10-26 Remove Colab metadata and clean up code
- `1d5e1fe` 2025-10-26 Revise README for clarity on research focus
- `3c0995f` 2025-10-26 Add systematic review data, scripts and analysis for ASD emotion recognition research
- `f3d4a0a` 2025-10-26 Revise README for systematic review project
- `a6efa76` 2025-10-26 Initial commit
