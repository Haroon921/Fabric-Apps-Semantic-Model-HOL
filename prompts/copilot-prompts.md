# GitHub Copilot prompt sequence

## 1. Inventory the model
Inspect the semantic-model connector schema and create `data-connections.md` describing tables, measures, dimensions, permissions assumptions, and query examples. Do not invent fields.

## 2. Create the app shell
Build a responsive Partner Opportunity Command Center using the existing Fabric data app patterns. Add navigation for Overview, Partners, Opportunities, and Data Quality. Use accessible color contrast and loading, empty, and error states.

## 3. Create the executive overview
Using `opportunityModel`, render Total ACR, Opportunity Count, Won ACR, Win Rate, and Average ACR. Add filters for Region, Partner, Solution, Stage, and Health. Every displayed value must come from a semantic-model query.

## 4. Add analytical interactions
Add a stage funnel, regional ACR comparison, partner ranking, and solution mix. Cross-filter visuals when a user selects a region or partner. Keep all aggregations in semantic-model measures rather than recalculating business logic in JavaScript.

## 5. Add opportunity details
Create a searchable and sortable detail grid with OpportunityID, Partner, Region, Solution, Stage, ACR_USD, WorkloadUnits, and Health. Add a side panel for the selected opportunity.

## 6. Validate
Create a validation checklist that compares each KPI and visual with the semantic model baseline. Flag query errors, missing permissions, empty results, and unsupported filters. Do not hide failures with mock data.
