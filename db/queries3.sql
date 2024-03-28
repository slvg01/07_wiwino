-- QUERY 3 OBJECTIVES: Propose 3 best wineries be awarded
-- 
-- QUERY LOGIC :
-- The selection is based on the following criteria: 
--   - main criteria : total number of winery ratings above 100k  (winery quantitatie reputation)
--   - secondary criteria: average ratings for the winery above 4.6 (winery offer quality)
--
-- MAIN CONCLUSIONS : 
--   - Tenuta San Guido, Dom Perignon and Chateau d Yquem are the top 3 wineries to be awarded.
--   - I leave 10 in the output for the pleasure of the eyes :)

        
SELECT  
        wines.winery_id,
        CASE 
                WHEN INSTR(SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5), wines.name) > 0 THEN
                        SUBSTR(SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5), 1, INSTR(SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5), wines.name) - 1) || 
                        SUBSTR(SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5), INSTR(SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5), wines.name) + LENGTH(wines.name))
                ELSE SUBSTR(vintages.name,1, LENGTH(vintages.name) - 5)
        END AS winery_name,
        
        AVG(wines.ratings_average) AS ratings_avg,
        SUM(wines.ratings_count) AS ratings_cnt
        
FROM    wines
        JOIN vintages ON vintages.wine_id = wines.id
       
GROUP BY wines.winery_id  
HAVING ratings_avg > 4.5999 and ratings_cnt> 150000
ORDER BY SUM(wines.ratings_count)  DESC, AVG(wines.ratings_average) DESC
LIMIT 10

