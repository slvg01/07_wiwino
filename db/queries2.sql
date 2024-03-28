-- QUERY 2 OBJECTIVES: Propose priority countries for marketing push
-- 
-- QUERY LOGIC :
-- The selection is based on the following criteria: 
--   - number of users : because bigger market tends to allow for better absolute ROI on the long term (mar)
--   - the average rating per user as it shows the interest and knowledge from the users for the field (usaage/engagement)
-- Based on that, the first 4 proposed countries are US, FRANCE, ITALY
--   - note that it would have been great to get saturation data here to really make a choice safely
--   - to mitigate that blind side risk, we included as well GERMANY & SWITZERLAND as they have a development potential (big market/low usage) 
--
-- MAIN CONCLUSIONS : 
-- US, FRANCE, ITALY, GERMANY and SWITERLAND as priority countries. 


SELECT  
        countries.name AS country, 
        countries.users_count AS number_of_users,
        sum(wines.ratings_count) AS ratings_counts_tot,
        ROUND((SUM(wines.ratings_count)*1.0/countries.users_count), 2) AS ratings_counts_per_user,
        AVG(wines.ratings_average) AS ratings, 
        AVG(vintages.price_euros) AS price_EUR
        
        
FROM    wines
        JOIN regions ON wines.region_id = regions.id
        JOIN countries ON regions.country_code = countries.code
        JOIN vintages ON wines.id = vintages.wine_id
GROUP BY countries.name  
ORDER BY countries.users_count DESC, AVG(wines.ratings_average) DESC, AVG(wines.ratings_count) DESC
LIMIT 8




