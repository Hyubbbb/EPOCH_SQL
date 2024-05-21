SELECT 
    mp.MEMBER_NAME, 
    rr.REVIEW_TEXT, 
    DATE_FORMAT(rr.REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM 
    MEMBER_PROFILE mp
JOIN 
    REST_REVIEW rr ON mp.MEMBER_ID = rr.MEMBER_ID
WHERE 
    rr.MEMBER_ID = (
        SELECT MEMBER_ID
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        ORDER BY COUNT(*) DESC
        LIMIT 1  -- LIMIT 1에 의해 맨 위(정렬했으니까 가장 많은) 하나의 결과만 반환
    )
ORDER BY 
    rr.REVIEW_DATE ASC, 
    rr.REVIEW_TEXT ASC;
