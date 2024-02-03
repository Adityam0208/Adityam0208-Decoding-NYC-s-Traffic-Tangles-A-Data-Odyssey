# NYC MOTOR VEHICLE COLLISION
# Dive into the heart of New York City's traffic landscape with this analysis of motor vehicle collisions! This project delves into police-reported crashes from April 2016 onwards, offering insights into collision trends, safety concerns, and key factors contributing to accidents.

# Data model design:
![dim_model](https://github.com/Adityam0208/Adityam0208-Decoding-NYC-s-Traffic-Tangles-A-Data-Odyssey/blob/main/Dimensional%20model/DM.jpg)

# Important tables:

1. Crashes:
- The Motor Vehicle Collisions crash table contains details on the crash event. Each row
represents a crash event. The Motor Vehicle Collisions data tables contain information
from all police reported motor vehicle collisions in NYC. The police report (MV104-AN) is
required to be filled out for collisions where someone is injured or killed, or where there is
at least $1000 worth of damage
2. Vehicles:
- The Motor Vehicle Collisions vehicle table contains details on each vehicle involved in the crash. Each row represents a motor vehicle involved in a crash. The data in this table goes back to April 2016 when crash reporting switched to an electronic system.
3. Persons:
- The Motor Vehicle Collisions person table contains details for people involved in the crash. Each row represents a person (driver, occupant, pedestrian, bicyclist,..) involved in a crash. The data in this table goes back to April 2016 when crash reporting switched to an electronic system.

# Data Exploration & Preparation:

- Talend for Staging: Efficiently loaded data from source systems into three staging tables using Talend's robust data integration capabilities.
- Preliminary Dimensional Model: A foundational dimensional model was crafted, outlining:
- Facts: Representing collision events with details like date, location, and severity.
- Dimensions: Providing context through tables for vehicles, people involved, time periods, and more.
- Mapping: Each element meticulously mapped from staging tables to their corresponding dimensional counterparts.

# Data Quality & Consistency:
- Source System Analysis: Documentation, data profiling, and ingestion into staging tables enabled comprehensive understanding of data sources.
- Data Consistency & Quality Checks: Scrutinized data for inconsistent column usage, invalid values, and structural issues like normalization, redundancy, pre-summarization, and repeating groups.
- Mapping & Integration: Source tables and columns were meticulously mapped to integration tables, ensuring clarity and accuracy.
  
# Dimensional Table Best Practices:

- SCD Types: Implemented appropriate Slowly Changing Dimension (SCD) types to handle changes in dimension attributes over time, guaranteeing data integrity and historical analysis.
- No Value Placeholders: Each dimension included a designated "No Value Provided" flag with consistent negative value (e.g., -99) for surrogate keys, ensuring proper handling of missing data.
  
# Data Loading & Cleansing:
- Talend for Loading & Cleansing: Leveraged Talend's capabilities to load data from staging tables into the dimensional model, applying necessary cleansing steps during the process.
- Error Table Creation: Established error tables to capture and manage invalid data like model years or person ages, ensuring data integrity within the model.

# Visualization Powerhouse:
- Tableau & Power BI Insights: Crafted interactive dashboards in both Tableau and Power BI, enabling users to explore the data through:
- Collision Analysis: Identify top causes of collisions and fatalities, revealing safety concerns.
- Time Series Analysis: Uncover peak collision times across day, week, and weekdays/weekends for informed strategies.
- Fatality Analysis: Explore trends and demographics of individuals involved in fatal crashes, highlighting vulnerable road users.

# Answering NYC's Traffic Concerns:
- Accident Frequency: Delve into annual collision trends across the city.
- Borough Hotspots: Discover which boroughs experience the most accidents.
- Injury Patterns: Analyze the prevalence of injuries from collisions.
- Fatal Collisions: Identify boroughs with the highest number of fatal accidents.
- Time of Day Analysis: Pinpoint peak collision times for targeted interventions.
- Bicycle & Pedestrian Safety: Evaluate the frequency and risks associated with these vulnerable road users.
- Motorcycle Involvement: Assess the role of motorcycles in crashes.
- Truck Impact: Determine the extent of truck involvement in accidents.
  
# Check my repository to:
- Access code samples demonstrating data integration and transformation with Talend.
- Review the dimensional model structure and SQL DDL script for implementation.
- Get a glimpse of interactive dashboards in Tableau and Power BI, sparking further exploration.
