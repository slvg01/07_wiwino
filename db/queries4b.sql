-- 4b - Secondary query for question 4 - verify 4a out put : all 19 wines do have the 5 flavors with sufficient counts (10)


        
WITH taste_in_wine AS (
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
)
           
SELECT DISTINCT
        taste_in_wine.wine_id,
        taste_in_wine.wine_name,
        keywords.id,
        keywords.name,
        keywords_wine.keyword_id,
        keywords_wine.count
           
FROM   taste_in_wine
        JOIN keywords_wine ON taste_in_wine.wine_id = keywords_wine.wine_id
        JOIN keywords ON keywords.id = keywords_wine.keyword_id
WHERE keywords.name IN ('coffee', 'toast', 'green apple', 'cream', 'citrus') 
ORDER BY taste_in_wine.wine_id

