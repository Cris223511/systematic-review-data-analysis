window.FIGURE_DATA = {
  "n_eligible": 31,
  "n_appraised": 31,
  "n_ml": 23,
  "n_supervised": 22,
  "mmat": {
    "Outcome data completeness": {
      "yes": 20,
      "cannot_tell": 10,
      "no": 1
    },
    "Appropriateness of measurements": {
      "yes": 28,
      "cannot_tell": 3,
      "no": 0
    },
    "Intervention as intended and sampling strategy": {
      "yes": 24,
      "cannot_tell": 4,
      "no": 3
    },
    "Sample representativeness": {
      "yes": 14,
      "cannot_tell": 8,
      "no": 9
    },
    "Confounding control and analysis": {
      "yes": 13,
      "cannot_tell": 11,
      "no": 7
    }
  },
  "challenges": [
    {
      "label": "Poor generalization in small samples",
      "n": 13,
      "pct": 41.9
    },
    {
      "label": "Class imbalance and sampling biases",
      "n": 6,
      "pct": 19.4
    },
    {
      "label": "Classification uncertainty and low predictive robustness",
      "n": 3,
      "pct": 9.7
    },
    {
      "label": "Limited interpretability of black-box models",
      "n": 2,
      "pct": 6.5
    },
    {
      "label": "Multicollinearity in multimodal data",
      "n": 1,
      "pct": 3.2
    }
  ],
  "families": {
    "CNN / Deep Learning": {
      "non_ensemble": 12,
      "ensemble": 4
    },
    "Traditional ML": {
      "non_ensemble": 4,
      "ensemble": 1
    },
    "Computer Vision pipelines": {
      "non_ensemble": 1,
      "ensemble": 1
    }
  },
  "metrics": [
    {
      "label": "ACC",
      "n": 20,
      "pct": 91
    },
    {
      "label": "F1-score",
      "n": 11,
      "pct": 50
    },
    {
      "label": "Precision",
      "n": 6,
      "pct": 27
    },
    {
      "label": "Recall",
      "n": 9,
      "pct": 41
    },
    {
      "label": "AUC",
      "n": 7,
      "pct": 32
    }
  ],
  "datasets": {
    "Own clinical data": 13,
    "Clinical eye-tracking": 5,
    "Kaggle ASD collections": 5,
    "FERAC": 1,
    "CAFE": 1,
    "DREAM": 1,
    "Robot therapy data": 2,
    "Web videos (SSBD and YouTube)": 1,
    "Own non-ASD training data": 1,
    "FER-2013": 1
  },
  "inputs": {
    "Facial descriptor extraction": {
      "n": 16,
      "pct": 51.6
    },
    "End-to-end learning (CNN)": {
      "n": 12,
      "pct": 38.7
    },
    "Physiological signal derivation": {
      "n": 2,
      "pct": 6.5
    },
    "Capture format definition": {
      "n": 1,
      "pct": 3.2
    }
  },
  "years": [
    "2018",
    "2019",
    "2020",
    "2021",
    "2022",
    "2023",
    "2024",
    "2025",
    "2026*"
  ],
  "temporal": {
    "CNN / Deep Learning": [
      0,
      0,
      0,
      0,
      2,
      0,
      4,
      9,
      1
    ],
    "Traditional ML": [
      0,
      0,
      1,
      1,
      1,
      0,
      0,
      2,
      0
    ],
    "Computer Vision pipelines": [
      1,
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      0
    ],
    "Other designs (clinical / conceptual)": [
      0,
      2,
      1,
      3,
      0,
      0,
      0,
      2,
      0
    ]
  },
  "domains": {
    "D1": 10,
    "D3": 6,
    "D2": 4,
    "D4": 11
  },
  "primary_evidence": 14,
  "translational": 18,
  "metrics_numeric": 22,
  "challenge_any": 18
};
