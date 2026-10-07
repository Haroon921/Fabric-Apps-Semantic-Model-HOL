# Instructor Guide

Use this guide to deliver the Partner Opportunity Command Center hands-on lab as a structured, instructor-led workshop.

## Session profile

| Item | Recommendation |
|---|---|
| Audience | Microsoft partners, solution architects, data professionals, and app makers |
| Technical level | Intermediate |
| Core lab duration | 90 minutes |
| Recommended session duration | 105 minutes |
| Delivery model | One instructor plus one proctor for every 20-25 participants |
| Participant outcome | A working Fabric data app connected to a governed semantic model |

## Instructor preparation

Complete these tasks at least one business day before delivery:

1. Work through the complete [participant lab guide](LAB_GUIDE.md).
2. Complete the [setup readiness checklist](SETUP_CHECKLIST.md).
3. Confirm the expected results in [the validation baseline](VALIDATION_BASELINE.md).
4. Stage a working semantic model and completed app for demonstrations.
5. Test the participant identity and permission model.
6. Confirm the presentation opens correctly and speaker notes are available.
7. Prepare a fallback workspace or recorded demonstration in case the preview service is unavailable.

> [!IMPORTANT]
> Fabric Apps is in preview. Explain that preview behavior, availability, and interfaces can change before general availability.

## Delivery timeline

| Time | Activity | Instructor focus | Participant checkpoint |
|---:|---|---|---|
| 0-10 min | Welcome and architecture | Scenario, learning outcomes, preview notice, and governed design | Participants understand the end-to-end flow |
| 10-25 min | Load sample data | Data options, workspace capacity, and schema | Opportunity data is visible in Fabric |
| 25-45 min | Build semantic model | Relationships, DAX measures, formatting, and baseline | KPI cards match the published baseline |
| 45-55 min | Scaffold app | CLI flow, placeholders, and connector configuration | App starts and connector is available |
| 55-80 min | Build experience | Copilot prompts, semantic queries, UX states, and interactions | KPIs, filters, visuals, and grid are functional |
| 80-95 min | Validate and publish | Accuracy, access, accessibility, and deployment | Deployed app matches the baseline |
| 95-105 min | Challenge and close | Partner Action Plan extension and next steps | Participants can describe production considerations |

## Speaker cues

### Opening

- This lab demonstrates how a governed semantic model can power an interactive application.
- Business logic remains centralized in the semantic model rather than being recreated in client code.
- The sample data is synthetic and safe for training.
- The experience is a preview sample, not a supported Microsoft product.

### Architecture

- The Lakehouse or Warehouse is the data foundation.
- The semantic model is the trusted business layer.
- The connector executes authenticated model queries.
- The app presents results and handles interaction and workflow.
- Identity, permissions, capacity, and monitoring span every layer.

### Semantic model

- Emphasize relationship direction and filter context.
- Explain why measures are preferred over JavaScript calculations.
- Ask participants to validate the unfiltered baseline before continuing.
- Demonstrate one filter in Power BI and compare the same result in the app.

### Application build

- Remind participants to inspect generated code before accepting it.
- Do not allow query errors to be hidden behind mock data.
- Keep environment-specific identifiers out of committed source.
- Build loading, empty, permission-denied, and error states as first-class experiences.

### Validation and close

- Accuracy is the primary release gate.
- Authorized and unauthorized user paths must both be tested.
- Capacity usage should be measured rather than estimated from a fixed per-app price.
- Production ownership, monitoring, and support must be assigned before deployment.

## Demonstration checkpoints

### Checkpoint 1 — Data loaded

Show:

- 240 opportunity rows
- Dates from January 2, 2026 through October 6, 2026
- Region, partner, solution, stage, ACR, workload, and health fields

### Checkpoint 2 — Semantic model validated

Show these unfiltered results:

| Measure | Expected value |
|---|---:|
| Total ACR | $27,705,000 |
| Opportunity Count | 240 |
| Won ACR | $6,021,000 |
| Won Opportunities | 52 |
| Win Rate | 21.67% |
| Average ACR | $115,437.50 |

### Checkpoint 3 — Connector working

Show:

- `opportunityModel` in the app configuration
- A successful authenticated query
- A visible permission error for a user without the required access

### Checkpoint 4 — Experience complete

Use the [completed-app reference](visual-semantic-app.png) and confirm:

- Five executive KPIs
- Five required filters
- Stage, region, partner, and solution visuals
- Searchable and sortable detail grid
- Selected-opportunity panel
- Loading, empty, and error states

### Checkpoint 5 — Published and governed

Show:

- The deployed Fabric item
- An authorized user opening the app
- The validation baseline matching after deployment
- Capacity Metrics for the workshop workspace

## Common issues and responses

| Issue | Instructor response |
|---|---|
| Semantic model does not appear | Confirm workspace, model location, user access, and tenant settings |
| Connector query is denied | Confirm Build and Read permissions and Execute Queries configuration |
| KPI differs from baseline | Check row count, active relationships, measure definitions, and filters |
| CLI package version conflict | Use the exact version-matched installation command printed by the CLI |
| Empty app after a successful query | Inspect filter state and the mapping between query output and components |
| Preview service is unavailable | Use the staged demonstration and continue with design and validation exercises |
| Participant is running behind | Pair with a proctor and use the completed semantic model as a recovery point |

## Facilitation options

### 60-minute executive version

- Demonstrate data loading instead of having participants perform it.
- Provide a prepared semantic model.
- Focus participant work on connector setup, app construction, and validation.

### 90-minute standard version

- Use the complete participant guide.
- Keep the challenge extension optional.

### 120-minute deep-dive version

- Add detailed semantic-model discussion.
- Complete the Partner Action Plan challenge.
- Review capacity metrics and production-readiness considerations.

## End-of-session checklist

- Participants can explain the architecture.
- Participant KPIs match the validation baseline.
- No secrets or environment-specific values were committed.
- Temporary workshop permissions are identified for removal.
- Participants know where to find the lab, deck, sample data, and pricing guidance.
- Questions and preview feedback are captured for the next lab revision.
