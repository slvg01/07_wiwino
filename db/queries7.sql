-- 7 - Top 5  recommendations in cabernet sauvignon for a VIP client. Crietria chosen are : 
        -- price (exclusivity)
        -- rating (quality)
        -- rating_count (popularity)
        -- region variety (diversity)
 -- the 5 wines chosen with the top 20 price according to that are : 
        -- 1. Dominio de Pingus 2004  (Spain, Ribera del Duero)
        -- 2. Harlan Estate Harlan Estate Red 1998 (USA, Napa Valley)
        -- 3. Opus One 2015 (USA, Napa Valley)
        -- 4. Scarecrow Cabernet Sauvignon 2015 (USA, Rutherford)
        -- 5. Penfolds Grange 2016 ()



        
WITH countries_most_common_grapes AS (
    SELECT   
            most_used_grapes_per_country.grape_id AS grape_id,
            most_used_grapes_per_country.country_code as country_code
                    
    FROM    most_used_grapes_per_country
    WHERE   grape_id = 2 
    
),

ranked_vintage AS ( 
        SELECT
                
                grapes.name AS grape_name,
                vintages.name as vintage_name,
                vintages.ratings_average AS vintages_ratings,
                vintages.ratings_count as vintages_ratings_count,
                vintages.price_euros AS price,
                regions.name AS region_name,
                regions.country_code AS region_country_code
                
                   
                
        FROM    regions
                JOIN vintages ON wines.id = vintages.wine_id
                JOIN wines ON regions.id = wines.region_id
                --JOIN countries  ON regions.country_code = countries.code
                JOIN countries_most_common_grapes ON regions.country_code = countries_most_common_grapes.country_code
                JOIN grapes ON countries_most_common_grapes.grape_id = grapes.id
)
           
SELECT * FROM ranked_vintage 
ORDER BY price DESC
LIMIT 20