import sqlite3
import pandas as pd
import os
import subprocess
from PIL import Image


# Connect to the SQLite database
connexion = sqlite3.connect("db/vivino.db")
cursor = connexion.cursor()


# List of SQL files
sql_files = [
    "db/queries0.sql",
    "db/queries1.sql",
    "db/queries2.sql",
    "db/queries3.sql",
    "db/queries4a.sql",
    "db/queries4b.sql",
    "db/queries5a.sql",
    "db/queries5b.sql",
    "db/queries6.sql",
    "db/queries7.sql",
]


for sql_file_name in sql_files:
    # Read .sql query and print comments in it
    sql_queries = ""
    comments = ""
    with open(sql_file_name, "r") as sql_file:
        for line in sql_file:
            sql_queries += line
            if line.strip().startswith("--"):
                comments += line.strip()[2:].strip() + "\n"

    # Execute the SQL queries
    cursor.execute(sql_queries)

    # Display results
    df = pd.read_sql_query(sql_queries, connexion)
    print(
        "--------------------------------------------------------------------------------"
    )
    print("QUERY OUTPUT:")
    print()
    print(df)
    print(), print()
    print(comments + "You may have a look.")
    print(), print()
    print("Proceed with the next query")

    # check if vizualisation is needed and launch it
    with open(sql_file_name, "r") as sql_file:
        for line in sql_file:
            sql_queries += line
            if line.strip().startswith(
                "-- VISUALIZATION image is opening in a new window"
            ):
                # Get the base name of the SQL file (without the extension)
                base_name = os.path.splitext(sql_file_name)[0]
                # Add the .png extension to the image
                image_name = base_name + ".png"
                # Open an image file
                subprocess.call(["code", image_name])
                # img = Image.open(image_name)
                # Display the image
                # img.show()
            else:
                continue

    # Wait for the user to press a key before executing the next file
    input("Please press Enter...")
    print(), print(), print(), print(), print()


# Close the database connection
connexion.close()
