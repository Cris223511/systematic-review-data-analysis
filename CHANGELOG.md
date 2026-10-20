# CHANGELOG

All notable changes to this project are documented in this file.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versions before V3.3 lack formal git tags; boundaries are estimated from commit messages.

---

## [V3.5] - 2026-10-20

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

### Commits
- `PENDING` 2026-10-20 fix(abstract): condense RESUMEN and ABSTRACT preserving all advisory data points
- `PENDING` 2026-10-20 fix(tabrisk): reorder D1 and D4 rows by ascending citation number
- `PENDING` 2026-10-20 fix(tabdim): convert to table*, reorder cite groups, remove parbox spacers (Wiley + ElsArticle)
- `PENDING` 2026-10-20 fix(figures): convert fig3 and fig5 to figure* with textwidth (both versions)
- `PENDING` 2026-10-20 fix(elsarticle): correct Akın-Bülbül encoding D1; add Scopus box header D3
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
- Initial eligible corpus set at N=24, subsequently refined to N=23 after split
  from contextual evidence (N=7).
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
- `c0941a0` 2025-11-04 Delete results/datasets.jpeg
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
