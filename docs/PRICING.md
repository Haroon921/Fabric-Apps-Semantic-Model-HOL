# Pricing and capacity guidance

Fabric Apps run on Fabric capacity. Operations performed by child services consume Capacity Units (CUs). For apps that use the Fabric Apps platform services, Microsoft documents capacity consumption for SQL Database, GraphQL API, User Data Functions, and OneLake operations. Usage can be monitored in the Microsoft Fabric Capacity Metrics app.

For a semantic-model-connected lab, the practical cost method is:
1. Use a workspace already assigned to Fabric capacity.
2. Run a controlled workshop with a known number of participants and interactions.
3. Review the Capacity Metrics app by item and operation after the session.
4. Use the Azure pricing calculator to translate the selected capacity and region into commercial cost.
5. Apply reservations only after observing steady-state usage. Microsoft states that 1-year or 3-year Fabric capacity reservations can save approximately 41% compared with pay-as-you-go.

Do not publish a fixed “per app” price. Actual pricing varies by agreement, date, region, currency, capacity size, storage, and consumption pattern.

Official sources:
- https://learn.microsoft.com/en-us/fabric/apps/pricing
- https://azure.microsoft.com/en-us/pricing/details/microsoft-fabric/
