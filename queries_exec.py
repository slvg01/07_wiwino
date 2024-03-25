import sqlite3

# Connect to the SQLite database
conn = sqlite3.connect('db/vivino.db')

# # Read SQL queries from the .sql file
# with open('queries1.sql', 'r') as sql_file:
#     sql_queries = sql_file.read()

# # Execute the SQL queries
# cursor = conn.cursor()
# cursor.executescript(sql_queries)
# conn.commit()

# # Close the database connection
# conn.close()