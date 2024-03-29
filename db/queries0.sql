-- QUERY 0 OBJECTIVES: Just a small Market facts analysis that you gonna get through jupyter notebook :
-- 
-- QUERY LOGIC :
-- The query was designed to present the following elements:. 
-- a) number of wineries per country
-- b) number of wines per country
-- c) average wine ratings per country
-- d) number of users per country
--
-- MAIN CONCLUSIONS : 
-- -  France, US and italy are dominant in terms of offer (number of wines, number of wineies)
-- -  Wine from Germany and Israel are top rated (but much less offer in the list > higher avg quality? )
-- -  US and Germany have the biggest potential for the app in terms of untapped engagement (high user base and low ratings count/users) 
--   

SELECT  countries.name AS Country,
        countries.users_count AS users_nb,
        AVG(wines.ratings_average) AS ratings_avg, 
        SUM(wines.ratings_count) AS 'total_ratings',
        ROUND(SUM(wines.ratings_count)*1.0/countries.users_count,2) AS 'ratings/user',
        countries.wines_count AS wines_count,
        countries.wineries_count AS wineries_nb
        
        
        
        
FROM    countries
        JOIN regions ON countries.code = regions.country_code
        JOIN wines ON regions.id = wines.region_id

GROUP BY countries.name
ORDER BY AVG(wines.ratings_average) DESC, AVG(wines.ratings_count) DESC

-- VISUALIZATION image is opening in a new window.