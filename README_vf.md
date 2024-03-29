# Objective Wiwino market analysis

> [Wiwino](https://www.sqlite.org/index.html) is a company gathering data about wines from their app's users _Vivino_. Data are gathered in this repo in a SQL DataBase located in the `db/` folder.

> The objective of this Repository is to query the database to give insights on the wine market and on __Wiwino__ business.


## Installation
To install __Wiwino__ market analysis script , follow these steps:

- Clone the repository to your local machine using the command:
```
    git clone https://github.com/slvg01/7_wiwino.git
```
```
    cd 7_wiwino
```
- Ensure that you have the required dependencies installed by executing:
```
    pip install -r requirements.txt
```

## How to use
The Data Analysis is processed by running the `queries_exec.py` file that you will find in the root folder : `7_wiwino/` 

The script is launching successively a list of 9 queries and shows the results right in the terminal __(ensure to open it widely :)__. 
Each time, the result of the queries includes : 
 - the query result itself in a Dataframe
 - the query objectives, 
 - its logic, 
 - its conclusion, 
 - and if relevant a graphical visualization  will open in a separate window

When running the ``queries_exec.py file``, the script will initially: 
- Execute the first queries (__queries0__) automatically. This query will display the market overview
- In the terminal, it is then inviting the user to press enter to execute the second query
- and so on until the last one. 

The queries codes are located in the `db/`folder for your review. 

## Main Conclussion 

- Most common grapes in the world are Cabernet Sauvignon, Chardonnay and Pinot
- Wine Market is dominated by France, Italy and US in terms of number of wineries and number of wines
- German, Israel and US wines are the top rated one, worldwide
- Some markets have some growth potential for __Wiwino__ app with high number of customers but a low level of engagement (Germany, US, switzerland)   Those 3 countries maybe quite interesting for a marketing push.

