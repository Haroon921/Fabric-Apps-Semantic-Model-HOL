# Validation Baseline

Use these results to verify that the sample data, semantic model, filters, and completed app are working correctly.

## Dataset profile

| Check | Expected value |
|---|---:|
| Opportunity rows | 240 |
| Unique opportunities | 240 |
| Earliest date | January 2, 2026 |
| Latest date | October 6, 2026 |
| Regions | 5 |
| Partners | 5 |
| Solutions | 4 |
| Stages | 5 |
| Health values | 3 |

## Unfiltered KPIs

| Measure | Expected value |
|---|---:|
| Total ACR | $27,705,000 |
| Opportunity Count | 240 |
| Won ACR | $6,021,000 |
| Won Opportunities | 52 |
| Win Rate | 21.67% |
| Average ACR | $115,437.50 |

The expected values correspond to these measures:

```dax
Total ACR =
SUM ( FactOpportunities[ACR_USD] )

Opportunity Count =
DISTINCTCOUNT ( FactOpportunities[OpportunityID] )

Won ACR =
CALCULATE (
    [Total ACR],
    FactOpportunities[Stage] = "Won"
)

Won Opportunities =
CALCULATE (
    [Opportunity Count],
    FactOpportunities[Stage] = "Won"
)

Win Rate =
DIVIDE ( [Won Opportunities], [Opportunity Count] )

Average ACR =
DIVIDE ( [Total ACR], [Opportunity Count] )
```

## Stage breakdown

| Stage | Opportunities | Total ACR |
|---|---:|---:|
| Commit | 35 | $4,341,000 |
| Pilot | 49 | $5,561,000 |
| Qualified | 42 | $4,864,000 |
| Solutioning | 62 | $6,918,000 |
| Won | 52 | $6,021,000 |
| **Total** | **240** | **$27,705,000** |

## Region breakdown

| Region | Opportunities | Total ACR |
|---|---:|---:|
| Germany | 51 | $5,973,000 |
| Norway | 51 | $6,086,000 |
| Saudi Arabia | 57 | $6,804,000 |
| UAE | 44 | $4,291,000 |
| UK | 37 | $4,551,000 |
| **Total** | **240** | **$27,705,000** |

## Partner breakdown

| Partner | Opportunities | Total ACR |
|---|---:|---:|
| Adventure Works Digital | 58 | $6,781,000 |
| Contoso Consulting | 51 | $5,939,000 |
| Fabrikam Data | 45 | $5,380,000 |
| Northwind Cloud | 47 | $4,780,000 |
| Tailspin Analytics | 39 | $4,825,000 |
| **Total** | **240** | **$27,705,000** |

## Solution breakdown

| Solution | Opportunities | Total ACR |
|---|---:|---:|
| AI-Ready Data Estate | 59 | $6,999,000 |
| OneLake Governance | 62 | $7,547,000 |
| SQL Modernization | 61 | $6,513,000 |
| Synapse to Fabric | 58 | $6,646,000 |
| **Total** | **240** | **$27,705,000** |

## Health breakdown

| Health | Opportunities | Total ACR |
|---|---:|---:|
| Green | 149 | $16,810,000 |
| Amber | 41 | $4,205,000 |
| Red | 50 | $6,690,000 |
| **Total** | **240** | **$27,705,000** |

## Validation procedure

1. Confirm that the imported fact table contains 240 rows.
2. Confirm that all relationships are active and filter from dimensions to the fact table.
3. Compare the six unfiltered KPI values.
4. Compare stage and region totals.
5. Apply one partner filter and compare the corresponding row above.
6. Apply one solution or health filter and compare the corresponding row above.
7. Repeat the same comparisons in the completed app.

If a result differs, check:

- Duplicate or missing imported rows
- Column data types
- Relationship cardinality and filter direction
- DAX definitions
- Active filters
- Currency and percentage formatting

The app should not be published until the semantic model and app both match this baseline.
