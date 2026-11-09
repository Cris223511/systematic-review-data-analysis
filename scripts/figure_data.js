window.FIGURE_DATA = {
  "n_eligible": 36,
  "n_appraised": 36,
  "n_ml": 28,
  "n_supervised": 25,
  "mmat": {
    "Outcome data completeness": {
      "yes": 25,
      "cannot_tell": 10,
      "no": 1
    },
    "Appropriateness of measurements": {
      "yes": 33,
      "cannot_tell": 3,
      "no": 0
    },
    "Intervention as intended and sampling strategy": {
      "yes": 28,
      "cannot_tell": 5,
      "no": 3
    },
    "Sample representativeness": {
      "yes": 18,
      "cannot_tell": 9,
      "no": 9
    },
    "Confounding control and analysis": {
      "yes": 17,
      "cannot_tell": 11,
      "no": 8
    }
  },
  "challenges": [
    {
      "label": "Poor generalization in small samples",
      "n": 13,
      "pct": 36.1
    },
    {
      "label": "Class imbalance and sampling biases",
      "n": 6,
      "pct": 16.7
    },
    {
      "label": "Classification uncertainty and low predictive robustness",
      "n": 5,
      "pct": 13.9
    },
    {
      "label": "Multicollinearity in multimodal data",
      "n": 2,
      "pct": 5.6
    },
    {
      "label": "Limited interpretability of black-box models",
      "n": 2,
      "pct": 5.6
    }
  ],
  "families": {
    "CNN / Deep Learning": {
      "non_ensemble": 14,
      "ensemble": 5
    },
    "Traditional ML": {
      "non_ensemble": 4,
      "ensemble": 1
    },
    "Computer Vision / Eye-tracking": {
      "non_ensemble": 4,
      "ensemble": 0
    }
  },
  "metrics": [
    {
      "label": "ACC",
      "n": 22,
      "pct": 88
    },
    {
      "label": "F1-score",
      "n": 13,
      "pct": 52
    },
    {
      "label": "Precision",
      "n": 5,
      "pct": 20
    },
    {
      "label": "Recall",
      "n": 7,
      "pct": 28
    },
    {
      "label": "AUC",
      "n": 6,
      "pct": 24
    }
  ],
  "datasets": {
    "Own clinical data": 13,
    "Clinical eye-tracking": 5,
    "Kaggle ASD collections": 5,
    "FERAC": 1,
    "CAFE": 1,
    "FER-2013": 2,
    "Semi-public on request": 2,
    "DREAM": 1,
    "Robot therapy data": 4,
    "Web videos (SSBD and YouTube)": 1,
    "Own non-ASD training data": 1
  },
  "inputs": {
    "Facial descriptor extraction": {
      "n": 19,
      "pct": 52.8
    },
    "End-to-end learning (CNN)": {
      "n": 12,
      "pct": 33.3
    },
    "Capture format definition": {
      "n": 2,
      "pct": 5.6
    },
    "Physiological signal derivation": {
      "n": 2,
      "pct": 5.6
    },
    "Algorithmic descriptor selection": {
      "n": 1,
      "pct": 2.8
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
      2,
      0,
      5,
      9,
      1
    ],
    "Traditional ML": [
      0,
      1,
      0,
      1,
      1,
      0,
      0,
      2,
      0
    ],
    "Computer Vision / Eye-tracking": [
      1,
      1,
      1,
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
    "D1": 12,
    "D3": 6,
    "D2": 6,
    "D4": 12
  },
  "primary_evidence": 18,
  "translational": 21,
  "metrics_numeric": 24,
  "challenge_any": 21
};
