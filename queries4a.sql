-- 4a - identify a group of wines with all aromas (coffee, toast, green apple, cream, and citrus) identified by 10 users at least 
--      & Propose a name for that group of wine :
--           - 19 wines belongs to that group all in , all champaign type of wine. 
--           - Group name proposed : "Pshhht"   
-- The second/next query (4b) verifies that all those 19 wines do have the 5 flavors (95 lines) with more than 10 counts each


        
SELECT 
    --keywords.name,
    wines.id AS wine_id,
    wines.name AS wine_name,
    --keywords_wine.keyword_type AS keyword_type,
    keywords_wine.count AS keyword_count,
    COUNT(DISTINCT keywords.name) as flavor_count   
                 
FROM    keywords_wine
        JOIN keywords ON keywords.id = keywords_wine.keyword_id
        JOIN wines ON wines.id = keywords_wine.wine_id

WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus') and keywords_wine.count >=10
GROUP BY wines.id
HAVING COUNT(DISTINCT keywords.name) >= 5
ORDER BY flavor_count DESC

