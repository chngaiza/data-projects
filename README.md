# Data Analytics Projects
A compilation of completed data analytics projects/exercises

### Built with

+ SQL Languages
	+ SQL
	+ PostgreSQL
	+ SQLite

+ Tools
	+ pgAdmin
	+ SQLiteStudio
	+ Visual Studio Code  	

# Projects & Exercises

## [Student Instruction Database & Analytics Project](Student%20Instruction%20Database%20%26%20Analysis%20Project)
PostgreSQL project with real-world implications, which developed a student database, and analyzed the efficacy of instruction techniques.
It was created to perform data analysis for instruction-related questions and scenarios. The goal of this database was to aid in the iterative improvement of instruction practices, through understanding of the relevant data, notably student assignment grades.
+ Design database schema visualization and key relationships.
+ Understand connection between tables.
+ Potentially identify and subsequently clean any data anomalies.
+ Analyze processed student data.
+ Find actionable insights for optimized session output.
+ Alter sessions based on data trends.

**Process**: Following the distinction of data types, column names and constraints, entity integrity was established through the assignment of a primary key column. This column denoted the unique instances of student data in each row. Referential integrity was maintained through foreign keys, which linked tables together by a commonality. These keys aided in the further understanding of the relationships between the students, their grades, and other internally contributing variables like session length. After the initial insertion of data, the tables in this database were continually updated over time and queries would be used to scan, gain insights, and maintain the overall integrity of the data. 

**Conclusion**: Postgres queries were used to filter information and draw conclusions on what should be altered in instruction methods, including session length, and length of time spent as a student. Through comparative processes and analysis, analysis was ultimately able to determine that a combination of shorter, more focused sessions were more conducive to higher grade averages for the students’ essay assignments, observable after only a short period of time. 

## [Case Study #1](Case%20Study%20%231)
SQLite case study featuring healthcare risk adjustment data analysis using fake data.

**Conclusion**: 
+ There is a positive correlation between risk scores and condition capture.
+ As the rates of condition capture increase over time, risk scores increase parallel to them. Condition capture, and especially recapture, increases risk score accuracy and allows us to have a better sense of 
  member level health status. 
+ Inpatient encounters, when compared to outpatient, do not perform well in condition recapture, due to their being less of them overall, and due to the acute nature of the encounters themselves. 
+ Revenue estimates can give providers a good sense of opportunity, especially when the base rate used accurately reflects service cost, but high-level overviews based on a static volume of members that doesn’t 
  take into consideration factors like churn, ultimately do not adequately reflect actualized financial values. 
+ Some suggestions to improve the analysis in a way that would provide vital member level granularity:
+ A larger claims data set would allow for a broader lookback at condition capture performance. 
+ Further member details like age, region, and PCP would allow for deeper insights into the population, with the potential for enlightening results that could be used to anchor outreach strategy on. 
+ Although still precursory in risk adjustment, Z-codes, or social determinants of health, would allow for even greater looks into this particular set of data, and build out far more accurate predictive 	 
  analytics. 

## [Car Dealership Analysis Exercise](Car%20Dealership%20Analysis%20Exercise)
PostgreSQL data analysis exercise observing a pseudo-car dealership database.
+ Realize the structure/schema of the database.
+ Generate transferrable mock data.
+ Run queries based on the provided questions.
+ Foster SQL abilities, including joining tables, creating views, and stored procedures.
