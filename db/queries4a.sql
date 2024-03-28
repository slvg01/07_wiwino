-- QUERY 4a OBJECTIVES: 
--     - identify a group of wines with all flavors (coffee, toast, green apple, cream, and citrus) & rated by 10 users at least 
--     - Propose a name for that group of wine :
-- 
-- QUERY LOGIC :
--    - linking the relevant tables (keywords, keywords_wine and wines)
--    - allowing then to filter on the 5 flavors and ratings counts >= 10
 --
-- MAIN CONCLUSIONS : 
--   - there are only 19 wines that have all 5 flavors and that are rated by 10 users at least
--   - they are all champaign type of wine. Name proposed for the group : "Sweet !POP!"


SELECT 
    
    wines.id AS wine_id,
    wines.name AS wine_name,
    keywords_wine.count AS keyword_count,
    COUNT(DISTINCT keywords.name) as flavor_count   
                 
FROM    keywords_wine
        JOIN keywords ON keywords.id = keywords_wine.keyword_id
        JOIN wines ON wines.id = keywords_wine.wine_id

WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus') and keywords_wine.count >=10
GROUP BY wines.id
HAVING COUNT(DISTINCT keywords.name) >= 5
ORDER BY flavor_count DESC

