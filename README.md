Logistics & Financial Performance Optimization
Banking & Finance | Logistics & Supply Chain Analytics
An end-to-end Logistics & Financial Performance Analytics project built to identify where transportation spending is increasing, which routes and carriers are driving logistics costs, and where delivery performance can be improved without compromising cost efficiency.

The project uses MySQL for data analysis and business querying and Power BI for interactive dashboarding and executive reporting.

🎯 Business Problem
Logistics costs can increase due to inefficient routes, expensive carriers, shipment-level cost variations, warehouse operations, fuel-related factors, and delivery delays.

The business needs to answer:

Where are we spending too much on logistics, and how can we control transportation costs without negatively affecting delivery performance?

This analysis focuses on identifying major cost drivers and operational inefficiencies to support data-driven logistics cost optimization.

🔍 Key Business Questions
The project investigates:

Which routes generate the highest logistics costs?
Which carriers are associated with higher transportation spending?
Which warehouses contribute the most to logistics costs?
What is the average logistics cost per shipment?
Which shipments have unusually high logistics costs?
How does logistics cost vary over time?
How does actual logistics spending compare with the allocated budget?
Which months experience budget overruns?
Are higher logistics costs associated with longer delivery times?
Which routes and carriers combine high cost with delivery delays?
How does shipment volume relate to logistics spending?
Where should management focus cost-control efforts?
📊 Dataset
The project uses a synthetic logistics and financial dataset containing 50,000 shipments and supporting operational, customer, carrier, route, warehouse and financial information.

Main Tables
Table	Purpose
shipments	Shipment-level cost, delivery and operational information
orders	Order and customer-level information
customers	Customer information
carriers	Carrier master data
routes	Route information
warehouses	Warehouse information
monthly_budgets	Monthly logistics budget
fuel_price_index	Fuel price and surcharge information
data_dictionary	Data definitions and reference information
🛠️ Tools & Technologies
MySQL — data querying, aggregation and business analysis
Power BI — dashboard development and data visualization
DAX — KPI and financial performance measures
Data Modelling — relationships between operational and financial tables
Business Intelligence — logistics cost and performance analysis
🔎 Analysis Performed
1. Logistics Cost Analysis
Analyzed total actual logistics spending and calculated:

Total Logistics Cost
Total Shipments
Cost per Shipment
Route-level logistics cost
Warehouse-level logistics cost
Shipment-level logistics cost
2. Route Performance
Compared routes using:

Total logistics cost
Shipment volume
Cost per shipment
Delivery performance
Delivery delays
This helps identify routes where transportation spending and operational performance require attention.

3. Carrier Performance
Analyzed carriers based on:

Total logistics cost
Shipment volume
Average delivery performance
Delivery delays
This provides a basis for comparing transportation partners from both cost and operational perspectives.

4. Warehouse Cost Analysis
Analyzed logistics spending across warehouses to identify locations associated with higher transportation costs.

5. Budget vs Actual Analysis
Compared:

Actual Logistics Cost vs Allocated Logistics Budget

Key metrics include:

Total Budget
Total Actual Logistics Cost
Budget Variance
Budget Variance %
Budget Variance = Actual Logistics Cost − Budget Amount

A positive variance indicates spending above the allocated budget, while a negative variance indicates spending below budget.

6. Time-Based Analysis
Analyzed monthly logistics spending to identify:

Changes in transportation costs
Monthly budget performance
Periods of higher spending
Overall cost trends
7. Delivery Performance Analysis
Examined the relationship between:

Logistics cost
Delivery days
Delivery delays
Shipment volume
The objective is to determine whether higher transportation spending corresponds with improved delivery performance or whether certain areas show both higher cost and weaker delivery performance.

📈 Power BI Dashboard
The Power BI dashboard provides an executive-level view of logistics and financial performance.

KPI Cards
The dashboard includes:

Total Logistics Cost
Total Shipments
Cost per Shipment
Average Delivery Days
Average Delay Days
Key Visuals
The dashboard analyzes:

Budget Variance by Budget Month
Logistics Cost by Shipment Date
Logistics Cost vs Budget by Month
Logistics Cost by Shipment
Route Delay vs Logistics Cost
Carrier Cost vs Delivery Performance
Logistics Cost by Warehouse
Logistics Cost by Route
💡 Business Value
The analysis helps management identify:

Cost concentration
→ Which routes, carriers and warehouses account for higher logistics spending?

Budget pressure
→ When and where is actual logistics spending exceeding planned budgets?

Operational inefficiency
→ Which areas combine higher costs with delivery delays?

Cost-control opportunities
→ Where should logistics teams investigate route, carrier or operational efficiency?

The dashboard converts shipment-level operational data into a management-oriented view of logistics cost and performance.

🧠 Key Analytical Approach
The project follows a practical analytics workflow:

Raw Logistics Data
        ↓
MySQL Data Analysis
        ↓
Business Problem Analysis
        ↓
KPI & Metric Development
        ↓
Power BI Data Model
        ↓
Interactive Dashboard
        ↓
Business Insights
        ↓
Cost Optimization Opportunities
📂 Project Structure
Logistics-Financial-Performance-Optimization/
│
├── README.md
│
├── SQL/
│   └── logistics_analysis.sql
│
├── PowerBI/
│   └── Logistics_Financial_Performance_Optimization.pbix
│
└── Data/
    ├── shipments
    ├── orders
    ├── customers
    ├── carriers
    ├── routes
    ├── warehouses
    ├── monthly_budgets
    ├── fuel_price_index
    └── data_dictionary
🎓 Skills Demonstrated
Technical Skills
MySQL · SQL · Power BI · DAX · Data Modelling · Data Visualization

Analytics Skills
Business Analysis · KPI Development · Trend Analysis · Variance Analysis · Cost Analysis · Operational Performance Analysis

Domain Skills
Logistics Analytics · Supply Chain Analytics · Transportation Cost Analysis · Budget Monitoring · Carrier Performance · Route Performance

👩‍💻 Project Objective
The objective was not simply to create charts, but to build a business-oriented analytics solution that connects transportation spending with operational performance.

The final dashboard enables decision-makers to move from:

“How much are we spending?”

to:

“Where are we spending it, what is driving the cost, and where should we investigate for optimization?”

📌 Project Type
Portfolio Project | Business Intelligence | Logistics & Financial Analytics

Tools: MySQL + Power BI
Dataset: Synthetic logistics and financial dataset
Focus: Transportation Cost Optimization & Operational Performance



