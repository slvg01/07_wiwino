--  1 - Propose 10 wines selection to increase sales. The selection is based on the following criteria:
--      - theresholds on price (not too expensive), rating_avg (good quality) and rating_counts (high volume), 
--        chosen through separate distribution analysis of those parameters
--      - presence of the wine on a a toplist as it helps to sell
--      - intent was to select wines with a discount as well but those did not make it to the  list (two few of them/below thresholds)



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





