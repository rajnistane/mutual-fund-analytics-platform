
CREATE TABLE IF NOT EXISTS dim_fund (
    amfi_code TEXT PRIMARY KEY,
    fund_house TEXT,
    scheme_name TEXT,
    category TEXT,
    sub_category TEXT,
    plan TEXT,
    launch_date DATE,
    benchmark TEXT,
    expense_ratio_pct REAL,
    exit_load_pct REAL,
    fund_manager TEXT,
    risk_category TEXT,
    sebi_category_code TEXT
);

CREATE TABLE IF NOT EXISTS dim_date (
    date_id INTEGER PRIMARY KEY,
    date DATE,
    year INTEGER,
    month INTEGER,
    quarter INTEGER,
    is_weekday INTEGER
);

CREATE TABLE IF NOT EXISTS fact_nav (
    amfi_code TEXT,
    date DATE,
    nav REAL,
    daily_return_pct REAL,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_transactions (
    tx_id INTEGER PRIMARY KEY AUTOINCREMENT,
    investor_id TEXT,
    amfi_code TEXT,
    transaction_date DATE,
    transaction_type TEXT,
    amount_inr INTEGER,
    state TEXT,
    city TEXT,
    city_tier TEXT,
    age_group TEXT,
    gender TEXT,
    annual_income_lakh REAL,
    payment_mode TEXT,
    kyc_status TEXT,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_performance (
    amfi_code TEXT,
    return_1yr_pct REAL,
    return_3yr_pct REAL,
    return_5yr_pct REAL,
    benchmark_3yr_pct REAL,
    alpha REAL,
    beta REAL,
    sharpe_ratio REAL,
    sortino_ratio REAL,
    std_dev_ann_pct REAL,
    max_drawdown_pct REAL,
    morningstar_rating INTEGER,
    risk_grade TEXT,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);

CREATE TABLE IF NOT EXISTS fact_aum (
    fund_house TEXT,
    date DATE,
    aum_lakh_crore REAL,
    aum_crore INTEGER,
    num_schemes INTEGER
);

CREATE TABLE IF NOT EXISTS fact_sip_industry (
    month DATE,
    sip_inflow_crore INTEGER,
    active_sip_accounts_crore REAL,
    new_sip_accounts_lakh REAL,
    sip_aum_lakh_crore REAL,
    yoy_growth_pct REAL
);


CREATE TABLE IF NOT EXISTS fact_portfolio (
    amfi_code TEXT,
    stock_symbol TEXT,
    stock_name TEXT,
    sector TEXT,
    weight_pct REAL,
    market_value_cr REAL,
    current_price_inr REAL,
    portfolio_date DATE,
    FOREIGN KEY (amfi_code) REFERENCES dim_fund(amfi_code)
);