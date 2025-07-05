
# Consumer Goods Ad hoc analysis for Computer hardware brand

## Brief introduction and situation

**A.M Computer Solutions** is one of India's leading computer hardware producers and well expanded in other countries too.
With cutting-edge technology, they manufacture all sorts of computer-related hardware that are reliable, durable, and of top-notch quality.

The management of the company wants to know about their business, customer, and product-related queries to take proper data-driven business decisions.



## Description of Datasets given by the company

*\*Company has given sql databases.
This description will give us the idea about the initial structure of the data*


- **dim_customer :** contains customer-related data
- **dim_product :** contains product-related data
- **fact_gross_price :** contains gross price information for each product
- **fact_manufacturing_cost :** contains the cost incurred in the production of each product
- **fact_pre_invoice_deductions :** contains pre-invoice deductions information for each product
- **fact_sales_monthly :** contains monthly sales data for each product.

**Description for dim_customer table :**
- **customer_code :** The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

- **customer :** The 'customer' column lists the names of customers, for example 'Atliq Exclusive', 'Flipkart', and 'Surface Stores' etc.

- **platform :** The 'platform' column identifies the means by which a company's products or services are sold. "Brick & Mortar" represents the physical store/location, and 			"E-Commerce" represents online platforms.

- **channel :** The 'channel' column reflects the distribution methods used to sell a product. These methods include "Retailers", "Direct", and "Distributors". Retailers refer to physical or online stores that sell products to consumers. Direct sales refer to sales made directly to consumers through a company's website or other direct means, and distributors refer to intermediaries or middlemen between the manufacturer and retailer or end consumers.

- **market :** The 'market' column lists the countries in which the customer is located.

- **region :** The 'region' column categorizes countries according to their geographic location, including "APAC" (Asia Pacific), "EU" (Europe), "NA" (North America), and "LATAM" (Latin America).

- **sub_zone :** "The 'sub_zone' column further breaks down the regions into sub-regions, such as "India", "ROA" (Rest of Asia), "ANZ" (Australia and New Zealand), "SE" Southeast Asia), "NE" (Northeast Asia), "NA" (North America), and "LATAM" (Latin America)."

**Column Description for dim_product table :**
- **product_code :** The 'product_code' column features unique identification codes for each product, serving as a means to track and distinguish individual products within a database or system.

- **division :** The 'division' column categorizes products into groups such as "P & A" (Peripherals and Accessories), "N & S" (Network and Storage) and "PC" (Personal Computer).

- **segment :** The 'segment' column categorizes products further within the division, such as "Peripherals" (keyboard, mouse, monitor, etc.), "Accessories" (cases, cooling solutions, power supplies), "Notebook" (laptops), "Desktop" (desktops, all-in-one PCs, etc), "Storage" (hard disks, SSDs, external storage), and "Networking" (routers, switches, modems, etc.).

- **category :** The 'category' column classifies products into specific subcategories within the segment.

- **product :** The 'product' column lists the names of individual products, corresponding to the unique identification codes found in the 'product_code' column.

- **variant :** The "variant" column classifies products according to their features, prices, and other characteristics. The column includes variants such as "Standard", "Plus", "Premium" that represent different versions of the same product.

**Column Description for fact_gross_price table:**
- **product_code :** The 'product_code' column features unique identification codes for each product.

- **fiscal_year :** The 'fiscal_year' column contains the fiscal period in which the product sale was recorded. A fiscal year is a 12-month period that is used for accounting purposes and often differs from the calendar year. For Atliq Hardware, the fiscal year starts in September. The data available in this column covers the fiscal years 2020 and 2021.

- **gross_price :** The 'gross_price' column holds the initial price of a product, prior to any reductions or taxes. It is the original selling price of the product.

**Column Description for fact_manufacturing_cost :**
- **product_code :** The 'product_code' column features unique identification codes for each product

- **cost_year :** The "cost_year" column contains the fiscal year in which the product was manufactured.

- **manufacturing_cost :** The "manufacturing_cost" column contains the total cost incurred for the production of a product. This cost includes direct costs like
raw materials, labor, and overhead expenses that are directly associated with the production process.

**Column Description for fact_pre_invoice_deductions :**
- **customer_code :** The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

- **fiscal_year :** The "fiscal_year" column holds the fiscal period when the sale of a product occurred.

- **pre_invoice_discount_pct :** The "pre_invoice_discount_pct" column contains the percentage of pre-invoice deductions for each product. Pre-invoice deductions are 
discounts that are applied to the gross price of a product before the invoice is generated, and typically applied to large orders or long-term contracts.

**Column Description for fact_sales_monthly :**
- **date :** The "date" column contains the date when the sale of a product was made, in a monthly format for 2020 and 2021 fiscal years. This information can be used
to understand the sales performance of products over time.

- **product_code :** The "product_code" column contains a unique identification code for each product. This code is used to track and differentiate individual 
products within a database or system.

- **customer_code :** The 'customer_code' column features unique identification codes for every customer in the dataset. These codes can be used to track a customer's sales history, demographic information, and other relevant details. For example, the codes could look like '70002017', '90005160', and '80007195' respectively.

- **sold_quantity :** The "sold_quantity" column contains the number of units of a product that were sold. This information can be used to understand the sales volume ofproducts and to compare the sales volume of different products or variants.

- **fiscal_year :** The "fiscal_year" column holds the fiscal period when the sale of a product occurred.

## Our Objective

- Process the given data and find answers for ad hoc requests.
- Generate insights from the data after analysing for reporting.
- Provide few recommendations for improvements.

## Methodology used / Workflow

- Sql queries are written to get answers of ad hoc requests from the given sql databases by the company. We have leveraged "Joins", "CTE", "Group By", "Sub-queries" etc. to write the queries.
- The data is imported to power bi for the visualization of the tabular data we got as the answers of the ad hoc requests. We have used Bar Charts, Column Charts, Pie Chart, Line Charts etc.
- After the analysis we have documented our analysis, insights and recommendations as pdf to deliver as the final result.

## Files

**Ad_hoc.sql :** This contains the sql queries written to answer the ad hoc requests.

**Consumer Goods Ad hoc insights.pdf :** This is the documentation of analysis, insights and recommendations as final result.

## Creator

This project is created by **Avirup Mitra**

**LinkedIn :** www.linkedin.com/in/avirupmitra06

Please feel free to DM for any suggestions and improvements or any other queries. Thank you for your time.

**This is an overview of the project. Please refer to the main project files for detailed result**