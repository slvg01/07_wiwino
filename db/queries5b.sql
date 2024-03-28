-- QUERY 5b OBJECTIVES: Check if searching the grapes name in the vintage names could help refine the query 5a
-- 
-- QUERY LOGIC 
--      - count the % of vintage that do have the grape names in their name 
--
-- MAIN CONCLUSIONS : 
--      - percentage of occurence of grape name presence is very low (see tabe) 
--      - approach cannot be used 
--      - better data linking wine/vintage and grapes are needed 




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