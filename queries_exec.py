import sqlite3
import pandas as pd
#import plotly.express as px
#import nbformat
#import statsmodels
#import plotly.graph_objects as go

# Connect to the SQLite database
connexion = sqlite3.connect('db/vivino.db')
cursor = connexion.cursor()


#List of SQL files
sql_files = ['queries1.sql', 'queries2.sql', 'queries3.sql', 'queries4a.sql','queries4b.sql', 'queries5.sql', 'queries6.sql','queries7.sql']  


for sql_file_name in sql_files:
    
# Read .sql query and print comments in it 
    sql_queries = ""
    with open(sql_file_name, 'r') as sql_file:
        for line in sql_file:
            sql_queries += line
            if line.strip().startswith('--'):
                print(line)
        print()

    # Execute the SQL queries
    cursor.execute(sql_queries)

    #Display results
    df = pd.read_sql_query(sql_queries, connexion)
    print(df)

    # Wait for the user to press a key before executing the next file
    input("Press Enter to execute the next SQL file...")
    print(), print(), print(), print()


# Close the database connection
connexion.close()