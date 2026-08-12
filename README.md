\# Bluestock Fintech — Mutual Fund Analytics Platform



!\[Python](https://img.shields.io/badge/Python-3.10+-blue)

!\[PowerBI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)

!\[SQLite](https://img.shields.io/badge/Database-SQLite-green)



\## 📌Project Overview

End-to-end Mutual Fund Analytics Platform built for Bluestock Fintech Pvt. Ltd.

The platform ingests live NAV data from AMFI India REST API, processes 87K+ rows

across 10 datasets, stores in a normalised SQLite database and presents insights

via an interactive Power BI dashboard.



\## 🎯Key Results

\- \*\*Top Fund:\*\* ICICI Pru Midcap — Score 100/100 on composite scorecard

\- \*\*Best Sharpe Ratio:\*\* Mirae Asset Large Cap — 1.45

\- \*\*Best 3yr CAGR:\*\* Axis Midcap — 35.11%

\- \*\*Highest Alpha:\*\* SBI Small Cap — 0.30 vs Nifty 100

\- \*\*Highest Risk (VaR):\*\* SBI Small Cap Direct — -2.69% daily VaR

\- \*\*Worst Drawdown:\*\* SBI Small Cap Direct — -52.57%

\- \*\*SIP Growth:\*\* Rs.14,000 Cr (2023) → Rs.31,002 Cr (Dec 2025 all-time high)

\- \*\*Folio Growth:\*\* 13.26 Cr → 26.12 Cr in 4 years

\- \*\*At-Risk Investors:\*\* 97.8% of active SIP investors have gaps > 35 days



\## 🛠️Tech Stack

| Category | Tools |

|---|---|

| Language | Python 3.10+ |

| Data Processing | Pandas, NumPy, SciPy |

| Visualisation | Matplotlib, Seaborn, Plotly |

| Database | SQLite, SQLAlchemy |

| Dashboard | Power BI Desktop |

| Version Control | Git, GitHub |

| API | mfapi.in REST API |



\## ⛓️Project Structure

```text

bluestock\_mf\_capstone/

├── data/

│ ├── raw/ ← 16 CSV files (10 provided + 6 API fetched)

│ ├── processed/ ← 10 cleaned CSVs + computed metrics

│ └── db/ ← bluestock\_mf.db (SQLite, 8 tables)

├── notebooks/

│ ├── 01\_data\_ingestion.ipynb

│ ├── 02\_data\_cleaning.ipynb

│ ├── 03\_eda\_analysis.ipynb

│ ├── 04\_performance\_analytics.ipynb

│ └── 05\_advanced\_analytics.ipynb

├── scripts/

│ └── recommender.py

├── sql/

│ ├── schema.sql

│ └── queries.sql

├── dashboard/

│ └── bluestock\_mf\_dashboard.pbix

├── reports/

│ ├── 15 PNG charts

│ └── Dashboard.pdf

├── data\_dictionary.md

├── requirements.txt

└── README.md

```



\## 🗂️Database Schema

8-table star schema:

| Table | Type | Rows |

|---|---|---|

| dim\_fund | Dimension | 40 |

| dim\_date | Dimension | 1,612 |

| fact\_nav | Fact | 46,000 |

| fact\_transactions | Fact | 32,778 |

| fact\_performance | Fact | 40 |

| fact\_aum | Fact | 90 |

| fact\_sip\_industry | Fact | 36 |

| fact\_portfolio | Fact | 322 |



\## 🎯Performance Metrics Computed

| Metric | Top Performer | Value |

|---|---|---|

| Composite Score | ICICI Pru Midcap | 100/100 |

| Sharpe Ratio | Mirae Asset Large Cap | 1.45 |

| Sortino Ratio | Mirae Asset Large Cap | 2.39 |

| 3yr CAGR | Axis Midcap | 35.11% |

| Alpha vs Nifty 100 | SBI Small Cap | 0.30 |

| VaR 95% (Lowest Risk) | Liquid Funds | \~0.01% |

| Max Drawdown (Best) | Liquid Funds | \~-0.5% |



\## 💡Key EDA Findings

1\. All 40 fund NAVs show consistent upward trend from 2022-2026

2\. SBI Mutual Fund dominates AUM at Rs.12.50 lakh crore

3\. SIP inflows doubled from Rs.14,000 Cr to Rs.31,002 Cr in 3 years

4\. Liquid funds dominate category inflows by a massive margin

5\. 26-35 age group drives 41.1% of all MF investments

6\. Madhya Pradesh and Punjab lead SIP investments by state

7\. 66.3% transactions from T30 cities

8\. Total MF folios doubled from 13.26 Cr to 26.12 Cr in 4 years

9\. Low correlation across funds — strong diversification potential

10\. Banking (19.2%) and IT (13.4%) are top sector allocations



\## 📊Advanced Analytics

\- \*\*VaR \& CVaR:\*\* Small cap funds carry highest daily risk (-2.69% VaR)

\- \*\*Rolling Sharpe:\*\* All top 5 funds positive for majority of 2022-2026

\- \*\*Cohort Analysis:\*\* 2025 investors have higher avg SIP (Rs.1.09L) vs 2024 (Rs.1.07L)

\- \*\*SIP Continuity:\*\* 97.8% investors at-risk with gaps > 35 days

\- \*\*Sector HHI:\*\* Axis Bluechip most concentrated (HHI 2967)



\## ⭐Fund Recommendation Engine

```python

from scripts.recommender import recommend\_funds



recommend\_funds('Low')      # → Liquid funds (ICICI, Kotak, ABSL)

recommend\_funds('Moderate') # → Large cap funds (HDFC, Mirae, ICICI)

recommend\_funds('High')     # → Mid/Small cap funds (Kotak, ICICI, SBI)

```



\## 📘How to Run

1\. Clone the repository

```bash

git clone https://github.com/rajnistane/mutual-fund-analytics-platform.git

```

2\. Install dependencies

```bash

pip install -r requirements.txt

```

3\. Run notebooks in order 01 → 02 → 03 → 04 → 05

4\. Open dashboard: `dashboard/bluestock\_mf\_dashboard.pbix`



\## 🗂️Data Sources

| Source | URL | Data |

|---|---|---|

| AMFI India | www.amfiindia.com | NAV, AUM, SIP |

| mfapi.in | api.mfapi.in/mf/{code} | Live NAV |

| NSE/BSE | nseindia.com | Benchmark indices |



\## ℹ️Disclaimer

This project is for educational purposes only and does not constitute

financial advice. Mutual Fund investments are subject to market risks.



