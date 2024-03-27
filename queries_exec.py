import sqlite3
import pandas as pd
import os
import subprocess



# Connect to the SQLite database
connexion = sqlite3.connect('db/vivino.db')
cursor = connexion.cursor()


#List of SQL files
sql_files = ['db/queries0.sql','db/queries1.sql', 'db/queries2.sql', 'db/queries3.sql', 'db/queries4a.sql','db/queries4b.sql', 'db/queries5a.sql','db/queries5b.sql', 'db/queries5c.sql', 'db/queries6.sql','db/queries7.sql']  


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

    # check if vizualisation is needed and launch it 
    with open(sql_file_name, 'r') as sql_file:
        for line in sql_file:
            sql_queries += line
            if line.strip().startswith('-- VISUALIZATION'):
                
                # Get the base name of the SQL file (without the extension)
                base_name = os.path.splitext(sql_file_name)[0]
                
                # Add the .py extension to get the jupiter notebook name
                csv_name = base_name + '.csv'

                # Save the results to a CSV file
                df.to_csv(csv_name, index=False)
                
                # Add the .py extension to get the jupiter notebook name
                notebook_name = base_name + '.ipynb'
        
                # Open the Jupyter notebook
                subprocess.Popen(["code", "--goto" , notebook_name])


    # Wait for the user to press a key before executing the next file
    input("Press Enter to execute the next query...")
    print(), print(), print(), print(),print()

    

# Close the database connection
connexion.close()