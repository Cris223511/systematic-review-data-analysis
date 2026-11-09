import csv
import os
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import matplotlib as mpl
from matplotlib.font_manager import FontProperties

mpl.rcParams['font.family'] = 'sans-serif'
mpl.rcParams['font.sans-serif'] = [
    'Arial', 'Liberation Sans', 'Helvetica', 'DejaVu Sans'
]
mpl.rcParams['axes.unicode_minus'] = False

print("Font in use:",
      FontProperties(family=mpl.rcParams['font.sans-serif']).get_name())

OUTDIR = '../results'
os.makedirs(OUTDIR, exist_ok=True)

MASTER = os.path.join(os.path.dirname(os.path.abspath(__file__)), '..', 'data', 'extraction_master.csv')
with open(MASTER, encoding='utf-8', newline='') as handle:
    supervised = [r for r in csv.DictReader(handle) if r['supervised_metrics'] == '1']

columns = [('acc', 'ACC'), ('f1', 'F1-score'), ('precision', 'Precision'), ('recall', 'Recall'), ('auc', 'AUC')]
metrics = [label for _, label in columns]
counts  = [sum(r[key] == '1' for r in supervised) for key, _ in columns]
pcts    = [round(100 * c / len(supervised)) for c in counts]
n_supervised = len(supervised)

BAR_COLOR  = '#2F4858'
EDGE_COLOR = '#1B2C36'

fig, ax = plt.subplots(figsize=(9, 4.6))

y = list(range(len(metrics)))[::-1]

ax.barh(
    y, counts,
    height=0.62,
    color=BAR_COLOR,
    edgecolor=EDGE_COLOR,
    linewidth=1.6
)

for yi, c, p in zip(y, counts, pcts):
    ax.text(
        c + 0.25, yi,
        f'{c}  ({p}%)',
        va='center',
        ha='left',
        fontsize=13,
        fontweight='bold',
        color='black'
    )

ax.set_yticks(y)
ax.set_yticklabels(metrics, fontsize=13, fontweight='bold', color='black')

x_upper = -(-int(max(counts) * 1.3) // 3) * 3
ax.set_xlim(0, x_upper)
ax.set_xticks(range(0, x_upper + 1, 3))
ax.tick_params(axis='x', labelsize=12, colors='black')

ax.set_xlabel(
    f'Number of studies (n = {n_supervised} eligible with extractable supervised metrics)',
    fontsize=13,
    fontweight='bold',
    color='black',
    labelpad=10
)

ax.xaxis.grid(True, color='0.90', linewidth=0.8)
ax.set_axisbelow(True)

for side in ['top', 'right', 'left']:
    ax.spines[side].set_visible(False)
ax.spines['bottom'].set_color('black')

plt.tight_layout()

plt.savefig(
    os.path.join(OUTDIR, 'fig_5_metrics.png'),
    dpi=300,
    bbox_inches='tight',
    facecolor='white'
)

plt.savefig(
    os.path.join(OUTDIR, 'fig_5_metrics.pdf'),
    bbox_inches='tight',
    facecolor='white'
)

plt.close()
print("Guardado en:", os.path.abspath(OUTDIR))
