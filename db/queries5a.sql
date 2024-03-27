-- 5a - Identify 5 best wines for the most famost grape in the world 
-- in that query we are identiying the 3 most common grapes in the world



SELECT  DISTINCT 
        grapes.name,
        most_used_grapes_per_country.grape_id,
        most_used_grapes_per_country.wines_count AS grapes_count

FROM    most_used_grapes_per_country
        JOIN grapes ON most_used_grapes_per_country.grape_id = grapes.id

ORDER BY grapes_count DESC

LIMIT 3
