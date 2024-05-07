SELECT 
    f.FLAVOR
FROM 
    FIRST_HALF f
JOIN 
    (
        SELECT 
            FLAVOR, 
            SUM(TOTAL_ORDER) AS SUM_JULY_ORDER
        FROM 
            JULY
        GROUP BY 
            FLAVOR
    ) j ON f.FLAVOR = j.FLAVOR
ORDER BY 
    (f.TOTAL_ORDER + j.SUM_JULY_ORDER) DESC
LIMIT 3;
