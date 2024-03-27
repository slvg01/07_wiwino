--  O - Just a small Market facts analysis that you gonna get through jupyter notebook

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

-- VISUALIZATION