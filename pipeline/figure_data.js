window.FIGURE_DATA = {
  "n_eligible": 30,
  "n_appraised": 30,
  "n_ml": 22,
  "n_supervised": 22,
  "mmat": {
    "Outcome data completeness": {
      "yes": 19,
      "cannot_tell": 10,
      "no": 1
    },
    "Appropriateness of measurements": {
      "yes": 27,
      "cannot_tell": 3,
      "no": 0
    },
    "Intervention as intended and sampling strategy": {
      "yes": 23,
      "cannot_tell": 4,
      "no": 3
    },
    "Sample representativeness": {
      "yes": 13,
      "cannot_tell": 8,
      "no": 9
    },
    "Confounding control and analysis": {
      "yes": 13,
      "cannot_tell": 10,
      "no": 7
    }
  },
  "challenges": [
    {
      "label": "Poor generalization in small samples",
      "n": 13,
      "pct": 43.3
    },
    {
      "label": "Class imbalance and sampling biases",
      "n": 6,
      "pct": 20.0
    },
    {
      "label": "Classification uncertainty and low predictive robustness",
      "n": 3,
      "pct": 10.0
    },
    {
      "label": "Multicollinearity in multimodal data",
      "n": 1,
      "pct": 3.3
    },
    {
      "label": "Limited interpretability of black-box models",
      "n": 1,
      "pct": 3.3
    }
  ],
  "families": {
    "CNN / Deep Learning": {
      "non_ensemble": 11,
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
      "n": 12,
      "pct": 55
    },
    {
      "label": "Precision",
      "n": 9,
      "pct": 41
    },
    {
      "label": "Recall",
      "n": 14,
      "pct": 64
    },
    {
      "label": "AUC",
      "n": 9,
      "pct": 41
    }
  ],
  "datasets": {
    "Own clinical data": 12,
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
      "pct": 53.3
    },
    "End-to-end learning (CNN)": {
      "n": 12,
      "pct": 40.0
    },
    "Physiological signal derivation": {
      "n": 1,
      "pct": 3.3
    },
    "Capture format definition": {
      "n": 1,
      "pct": 3.3
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
      0
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
    "D2": 3,
    "D4": 11
  },
  "primary_evidence": 13,
  "translational": 17,
  "metrics_numeric": 22,
  "challenge_any": 18
};
