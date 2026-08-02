
# Data Dictionary — Bluestock MF Capstone

## 1. dim_fund
| Column | Type | Description |
|--------|------|-------------|
| amfi_code | TEXT (PK) | AMFI unique scheme code |
| fund_house | TEXT | AMC name |
| scheme_name | TEXT | Full official scheme name |
| category | TEXT | Equity / Debt / Hybrid |
| sub_category | TEXT | Large Cap / Mid Cap / Small Cap etc |
| plan | TEXT | Regular or Direct |
| launch_date | DATE | Fund launch date |
| benchmark | TEXT | Official benchmark index |
| expense_ratio_pct | REAL | Annual expense ratio % |
| exit_load_pct | REAL | Exit load % |
| fund_manager | TEXT | Primary fund manager name |
| risk_category | TEXT | Low / Moderate / High / Very High |
| sebi_category_code | TEXT | SEBI internal category code |

## 2. dim_date
| Column | Type | Description |
|--------|------|-------------|
| date_id | INTEGER (PK) | Unique date identifier |
| date | DATE | Calendar date |
| year | INTEGER | Year extracted from date |
| month | INTEGER | Month extracted from date |
| quarter | INTEGER | Quarter (1-4) |
| is_weekday | INTEGER | 1 if weekday, 0 if weekend |

## 3. fact_nav
| Column | Type | Description |
|--------|------|-------------|
| amfi_code | TEXT (FK) | Foreign key to dim_fund |
| date | DATE | NAV date (business days only) |
| nav | REAL | NAV value in Rs. |
| daily_return_pct | REAL | Daily return percentage |

## 4. fact_transactions
| Column | Type | Description |
|--------|------|-------------|
| tx_id | INTEGER (PK) | Unique transaction ID |
| investor_id | TEXT | Unique investor identifier |
| amfi_code | TEXT (FK) | Foreign key to dim_fund |
| transaction_date | DATE | Date of transaction |
| transaction_type | TEXT | SIP / Lumpsum / Redemption |
| amount_inr | INTEGER | Transaction amount in Rs. |
| state | TEXT | Investor state |
| city | TEXT | Investor city |
| city_tier | TEXT | T30 or B30 |
| age_group | TEXT | 18-25 / 26-35 / 36-45 / 46-55 / 56+ |
| gender | TEXT | Male / Female |
| annual_income_lakh | REAL | Annual income in Rs. lakh |
| payment_mode | TEXT | UPI / Net Banking / Mandate / Cheque |
| kyc_status | TEXT | Verified / Pending |

## 5. fact_performance
| Column | Type | Description |
|--------|------|-------------|
| amfi_code | TEXT (FK) | Foreign key to dim_fund |
| return_1yr_pct | REAL | 1 year absolute return % |
| return_3yr_pct | REAL | 3 year CAGR % |
| return_5yr_pct | REAL | 5 year CAGR % |
| benchmark_3yr_pct | REAL | Benchmark 3yr CAGR % |
| alpha | REAL | Return above benchmark |
| beta | REAL | Market sensitivity |
| sharpe_ratio | REAL | Risk adjusted return |
| sortino_ratio | REAL | Downside risk adjusted return |
| std_dev_ann_pct | REAL | Annualised standard deviation % |
| max_drawdown_pct | REAL | Worst peak to trough decline |
| morningstar_rating | INTEGER | 1-5 star rating |
| risk_grade | TEXT | Low / Moderate / High / Very High |

## 6. fact_aum
| Column | Type | Description |
|--------|------|-------------|
| fund_house | TEXT | AMC name |
| date | DATE | Quarter end date |
| aum_lakh_crore | REAL | AUM in Rs. lakh crore |
| aum_crore | INTEGER | AUM in Rs. crore |
| num_schemes | INTEGER | Number of schemes |

## 7. fact_sip_industry
| Column | Type | Description |
|--------|------|-------------|
| month | DATE | Month of SIP data |
| sip_inflow_crore | INTEGER | Total SIP inflows in Rs. crore |
| active_sip_accounts_crore | REAL | Active SIP accounts in crore |
| new_sip_accounts_lakh | REAL | New SIP registrations in lakh |
| sip_aum_lakh_crore | REAL | SIP AUM in Rs. lakh crore |
| yoy_growth_pct | REAL | YoY growth % in SIP inflows |

## 8. fact_portfolio
| Column | Type | Description |
|--------|------|-------------|
| amfi_code | TEXT (FK) | Foreign key to dim_fund |
| stock_symbol | TEXT | Stock ticker symbol |
| stock_name | TEXT | Full stock name |
| sector | TEXT | Industry sector |
| weight_pct | REAL | Portfolio weight % |
| market_value_cr | REAL | Market value in Rs. crore |
| current_price_inr | REAL | Current stock price in Rs. |
| portfolio_date | DATE | Portfolio date |
