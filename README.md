# Data-Analytics-Project
This repository contains an end-to-end data warehousing pipeline and BI dashboard for analyzing cancelled flights of an airline comapny. It ncludes OLTP database creation, ETL processes to transform data into a star schema OLAP database, and Power BI visualization including trend comparison.
## Project overview: 
This project involves the creation of a comprehensive end-to-end data warehousing pipeline and a business intelligence (BI) dashboard for analyzing cancelled flights of an airline company. The project begins with designing and implementing an Online Transaction Processing (OLTP) database for the airline, where dummy data is generated to simulate real-world scenarios. The OLTP database serves as the primary data source for the data warehousing pipeline.

The pipeline is developed using Python, which performs various Extract, Transform, Load (ETL) processes. These processes include connecting to the data source, ingesting data into a staging area, cleaning the data to handle missing values, and creating new attributes necessary for the star schema in the Online Analytical Processing (OLAP) database. The OLAP database is designed with a star schema, including dimension tables and a fact table that captures key attributes for analysis.

Once the OLAP database is populated, the project generates a fact table snapshot by joining the fact table with relevant dimension tables. This snapshot is then imported into Power BI, where an interactive dashboard is created to visualize key insights related to flight cancellations. The dashboard provides a comprehensive view of trends and patterns, allowing users to explore reasons behind cancellations across different regions and time periods.

The project also incorporates automation features, including the use of a data gateway to refresh the dashboard every hour with new data. This ensures that the BI dashboard remains up-to-date and reflects the latest information. Additionally, a secondary dashboard is created to monitor changes in key metrics, providing a dynamic and real-time view of the data.

The repository contains all the necessary components, including the MySQL OLTP database, Python scripts for the ETL processes, the Excel template detailing the data warehouse design, and the Power BI dashboard hosted on the web. This project demonstrates the practical application of data warehousing and BI techniques to provide actionable insights for strategic and tactical decision-making in the airline industry.

## Project Structure 
- `Scripts/`: Contains Python scripts for the ETL process and pipeline automation.
- `Database/`: Contains MySQL scripts for creating the OLTP and OLAP databases.
- `Template/`: Contains the Excel template used for DWH design.
- `Dashboards/`: Contains Power BI dashboard files.
- `Project Report/`: Includes a detailed and comprehensive project report and business process explanation.
- `Video/`: Contains a video demo.
