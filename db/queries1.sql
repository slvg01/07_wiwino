-- QUERY 1 OBJECTIVES: Propose 10 wines selection to increase sales.
-- 
-- QUERY LOGIC :
-- The selection is based on the following criteria: 
--      a) theresholds on price (<425 EUR - acceptable price), rating_avg (>4.6 - high quality) and rating_counts (>200 - high volume), 
--          We choose those through a distribution analysis of each parameter ensuring we were within 70% of the total value (see all_queries.ipynb) 
--      b) presence of the wine on a a toplist as it helps to sell
--      c) we choose only 750 ml bottles as this this is the standard volume by far 
--      d) intent was to select wines with a discount as well but none satsified the other criterias (two few of them/below thresholds)
--
-- MAIN CONCLUSIONS : 
-- The above query returns 10 wines exactly and they are the one we propose to push to increase sales (see table just above). 
--   
SELECT  DISTINCT
        vintages.id AS wine_id,
        vintages.name AS wine_name,
        toplists.name AS toplist_name,
        vintage_toplists_rankings.rank AS toplist_rank,
        vintages.price_euros,
        vintages.ratings_average,
        vintages.ratings_count,
        vintages.price_discount_percentage AS discount_rate
       
           
FROM    vintages
        JOIN vintage_toplists_rankings ON vintages.id = vintage_toplists_rankings.vintage_id
        JOIN toplists ON vintage_toplists_rankings.top_list_id = toplists.id
               
WHERE   
        vintages.ratings_count > 200
        AND vintages.ratings_average >= 4.6
        AND vintages.price_euros < 425
        AND vintages.bottle_volume_ml = 750
           
GROUP BY vintages.id

