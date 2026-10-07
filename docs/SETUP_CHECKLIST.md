# Workshop Setup Readiness Checklist

Complete this checklist before beginning the lab. For instructor-led delivery, validate every item at least one business day before the session.

## Tenant and preview readiness

- [ ] Microsoft Fabric is available in the tenant.
- [ ] Fabric Apps is enabled for the participating users or security group.
- [ ] The Semantic Model Execute Queries REST API tenant setting is enabled.
- [ ] Preview terms and limitations have been reviewed with the delivery team.
- [ ] A fallback demonstration is available in case the preview service is unavailable.

## Capacity and workspace

- [ ] The workshop workspace exists.
- [ ] The workspace is assigned to active Fabric capacity.
- [ ] Participants have Contributor, Member, or Admin workspace access.
- [ ] The capacity has sufficient headroom for the expected participant count.
- [ ] The Microsoft Fabric Capacity Metrics app is available to the instructor or administrator.
- [ ] A cleanup owner has been assigned for temporary workshop resources.

## Semantic-model access

- [ ] Participants have Build permission on the semantic model.
- [ ] Participants have Read permission on the semantic model.
- [ ] The instructor has tested an authorized participant account.
- [ ] The instructor has tested an account without the required permissions.
- [ ] Row-level or object-level security behavior has been reviewed if used.

## Local tools

Run these commands in a terminal:

```bash
node --version
npm --version
git --version
code --version
```

- [ ] Node.js 20 or later is installed.
- [ ] npm is available.
- [ ] Git is installed.
- [ ] Visual Studio Code is installed.
- [ ] GitHub Copilot is available if using the guided prompt flow.
- [ ] The terminal can reach the npm registry and required Microsoft endpoints.

## Lab package

- [ ] The repository can be cloned or downloaded.
- [ ] `Fabric-Apps-Semantic-Model-HOL.pptx` opens with all 12 slides and speaker notes.
- [ ] `partner-opportunity-sample.xlsx` opens and contains five worksheets.
- [ ] `fact-opportunities.csv` contains 240 data rows.
- [ ] The participant can open the [lab guide](LAB_GUIDE.md).
- [ ] The participant can open the [Copilot prompts](../prompts/copilot-prompts.md).
- [ ] The instructor has reviewed the [validation baseline](VALIDATION_BASELINE.md).

## Workshop network

- [ ] Participants can sign in to Microsoft Fabric.
- [ ] Participants can access the target workspace.
- [ ] The network permits npm package downloads.
- [ ] The network permits GitHub access if participants will clone the private repository.
- [ ] VPN, proxy, and firewall behavior has been tested.
- [ ] Partner GitHub accounts have been granted repository access.

## Data and privacy

- [ ] Only the included synthetic data will be used.
- [ ] No customer or personal data will be introduced during the lab.
- [ ] Participants understand that secrets must not be pasted into source files or prompts.
- [ ] Local `.env` files are excluded from Git.
- [ ] Workspace IDs and item IDs will be stored only where required for local configuration.

## Go/no-go check

The lab is ready when:

1. A participant account can load the sample data.
2. The semantic model can be queried successfully.
3. The same account can scaffold and start the app.
4. An unauthorized account receives the expected permission response.
5. The instructor can compare results with the published baseline.
6. A fallback demonstration is available.

If any of these checks fail, resolve the issue before starting the hands-on portion of the workshop.
