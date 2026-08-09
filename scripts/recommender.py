
import pandas as pd
from sqlalchemy import create_engine

engine = create_engine(r"sqlite:///C:\Users\ASUS\Desktop\Bluestock_MF_Capstone_Project\data\db\bluestock_mf.db")
performance = pd.read_sql("SELECT * FROM fact_performance", engine)

def recommend_funds(risk_appetite):
    risk_map = {
        "Low": ["Low"],
        "Moderate": ["Moderate", "Moderately High"],
        "High": ["High", "Very High"]
    }
    grades = risk_map.get(risk_appetite, [])
    filtered = performance[performance["risk_grade"].isin(grades)]
    top3 = filtered.nlargest(3, "sharpe_ratio")[
        ["scheme_name", "fund_house", "sharpe_ratio", "return_3yr_pct", "risk_grade"]
    ]
    print(f"\nTop 3 Recommended Funds for {risk_appetite} Risk Appetite:")
    print(top3.to_string(index=False))
    return top3

recommend_funds("Low")
recommend_funds("Moderate")
recommend_funds("High")
