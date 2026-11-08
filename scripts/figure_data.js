window.FIGURE_DATA = {
  "n_eligible": 21,
  "n_appraised": 20,
  "n_ml": 17,
  "n_supervised": 14,
  "mmat": {
    "Outcome data completeness": {
      "yes": 20,
      "cannot_tell": 0,
      "no": 0
    },
    "Appropriateness of measurements": {
      "yes": 20,
      "cannot_tell": 0,
      "no": 0
    },
    "Intervention as intended and sampling strategy": {
      "yes": 14,
      "cannot_tell": 4,
      "no": 2
    },
    "Sample representativeness": {
      "yes": 14,
      "cannot_tell": 3,
      "no": 3
    },
    "Confounding control and analysis": {
      "yes": 11,
      "cannot_tell": 3,
      "no": 6
    }
  },
  "challenges": [
    {
      "label": "Classification uncertainty and low predictive robustness",
      "n": 5,
      "pct": 23.8
    },
    {
      "label": "Poor generalization in small samples",
      "n": 3,
      "pct": 14.3
    },
    {
      "label": "Multicollinearity in multimodal data",
      "n": 3,
      "pct": 14.3
    },
    {
      "label": "Class imbalance and sampling biases",
      "n": 3,
      "pct": 14.3
    },
    {
      "label": "Limited interpretability of black-box models",
      "n": 2,
      "pct": 9.5
    }
  ],
  "families": {
    "CNN / Deep Learning": {
      "non_ensemble": 9,
      "ensemble": 4
    },
    "Traditional ML": {
      "non_ensemble": 1,
      "ensemble": 1
    },
    "Computer Vision / Eye-tracking": {
      "non_ensemble": 2,
      "ensemble": 0
    }
  },
  "metrics": [
    {
      "label": "ACC",
      "n": 13,
      "pct": 93
    },
    {
      "label": "F1-score",
      "n": 11,
      "pct": 79
    },
    {
      "label": "Precision",
      "n": 5,
      "pct": 36
    },
    {
      "label": "Recall",
      "n": 5,
      "pct": 36
    },
    {
      "label": "AUC",
      "n": 4,
      "pct": 29
    }
  ],
  "datasets": {
    "Own clinical data": 5,
    "Clinical eye-tracking": 1,
    "Semi-public on request": 3,
    "Kaggle ASD collections": 5,
    "FERAC": 1,
    "CAFE": 1,
    "FER-2013": 1,
    "DREAM": 1,
    "Robot therapy data": 2,
    "No ML dataset": 1
  },
  "inputs": {
    "End-to-end learning (CNN)": {
      "n": 8,
      "pct": 38.1
    },
    "Facial descriptor extraction": {
      "n": 7,
      "pct": 33.3
    },
    "No computational facial input": {
      "n": 2,
      "pct": 9.5
    },
    "Physiological signal derivation": {
      "n": 2,
      "pct": 9.5
    },
    "Capture format definition": {
      "n": 1,
      "pct": 4.8
    },
    "Algorithmic descriptor selection": {
      "n": 1,
      "pct": 4.8
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
      1,
      1,
      0,
      0,
      1,
      0,
      3,
      6,
      1
    ],
    "Traditional ML": [
      0,
      1,
      0,
      0,
      0,
      0,
      0,
      1,
      0
    ],
    "Computer Vision / Eye-tracking": [
      1,
      0,
      0,
      0,
      0,
      0,
      0,
      1,
      0
    ],
    "Other designs (clinical / conceptual)": [
      0,
      2,
      0,
      2,
      0,
      0,
      0,
      0,
      0
    ]
  },
  "domains": {
    "D1": 7,
    "D3": 3,
    "D2": 4,
    "D4": 7
  },
  "primary_evidence": 11,
  "translational": 11,
  "metrics_numeric": 13,
  "challenge_any": 11
};
