-- QUERY 5a OBJECTIVES: Identify 5 best wines for he 3 most famost grapes in the world 
-- 
-- QUERY LOGIC 
--      - First identify the 3 most common grapes in the world (CTE)
--      - link those grapes to countries, region, wines then vintages
--      - sort the vintages by rating average to identify the 5 best ones for each grape (using partition)
--
-- MAIN CONCLUSIONS : 
--      - the route to link grapes and wine : grapes -> countries -> regions -> wines -> vintages is too weak to get precise results.
--      - indeed too many countries, regions have the grapes  and lack or direct connection between grape and wine induce false positive
--      - one solution could have been to search the grape name in the wine name to refine the query 
--      - but as you can see in next query (5b) occurences of that facts are too low to be relevant.
--      - only way would be to check manually and sequencially the wines in the list to find the 5 first that do have the grapes 
--      - Not done as manual intervenion is not the purpose of this exercice. Better data are necessary




WITH countries_most_common_grapes AS (
    WITH most_common_grapes_WW AS (
            SELECT  DISTINCT 
                    grapes.name,
                    most_used_grapes_per_country.grape_id,
                    most_used_grapes_per_country.wines_count AS grapes_count
                
            FROM    most_used_grapes_per_country
                    JOIN grapes ON most_used_grapes_per_country.grape_id = grapes.id
            ORDER BY grapes_count DESC
            LIMIT 3
    )          
    SELECT   
            most_used_grapes_per_country.grape_id AS grape_id,
            most_used_grapes_per_country.country_code as country_code
                    
    FROM    most_used_grapes_per_country
    WHERE   grape_id IN (SELECT grape_id FROM most_common_grapes_WW)
    GROUP BY grape_id, country_code
),

ranked_wines AS ( 
        SELECT                  
                ROW_NUMBER() OVER(
                        PARTITION BY countries_most_common_grapes.grape_id 
                        ORDER BY vintages.ratings_average DESC, 
                        vintages.ratings_count DESC
                        ) as row_nb,
                grapes.name AS grape_name,
                vintages.name as vintage_name,
                vintages.ratings_average AS vintages_ratings,
                vintages.ratings_count as vintages_ratings_count,
                regions.name AS region_name,
                regions.country_code AS region_country_code
                              
                   
                
        FROM    regions
                JOIN vintages ON wines.id = vintages.wine_id
                JOIN wines ON regions.id = wines.region_id
                JOIN countries  ON regions.country_code = countries.code
                --JOIN countries_most_common_grapes ON regions.country_code = countries_most_common_grapes.country_code
                JOIN countries_most_common_grapes ON countries.code = countries_most_common_grapes.country_code
                JOIN grapes ON countries_most_common_grapes.grape_id = grapes.id
                
)
           
SELECT * FROM ranked_wines WHERE row_nb <= 5