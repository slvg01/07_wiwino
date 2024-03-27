-- 5c - Identify 5 best rated  wines for the 3 most famous grape in the world 
-- in front of imprecsie results from previous query we wanted to check if searching the grapes name in the wine name could give better results
-- reults here show that it is not the case as the occurence of the grapes presence is far too low to be relevant.

SELECT 
        grapes.name AS grape_name,
        COUNT(wines.name) AS wine_name_count,
        COUNT(wines.name)*100.0/(SELECT(COUNT(wines.name)) from wines) AS "ratio_(%)"

FROM  grapes
      JOIN wines ON wines.name LIKE '%' || grapes.name || '%'
        
WHERE grapes.name IN ('Chardonnay', 'Cabernet Sauvignon', 'Pinot Noir')
           
GROUP BY grapes.name
           
UNION ALL 

SELECT 
           'Total_nb_wines' AS grape_name,
            COUNT(wines.name) AS wine_name_count,
            100.0 as "ratio_(%)"
FROM wines