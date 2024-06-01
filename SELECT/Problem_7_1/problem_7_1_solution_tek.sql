-- 프로그래머스 멸종위기의 대장균 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/301651


-- SELECT COUNT(RANKED.ID) AS COUNT, RANKED.GEN AS GENERATION
-- FROM (
--     SELECT *, DENSE_RANK() OVER (ORDER BY PARENT_ID) AS GEN
--     FROM ECOLI_DATA
--     ) AS RANKED
-- -- 자식이 없는 개체 필터링
-- WHERE NOT EXISTS (
--     SELECT *
--     FROM ECOLI_DATA AS E1 
--     WHERE E1.PARENT_ID = RANKED.ID
--     )
-- GROUP BY RANKED.GEN
-- ORDER BY GENERATION ASC


-- 재귀 쿼리 사용 (WITH RECURSIVE)
WITH RECURSIVE cte
AS (
    -- Non-Recursive 문장 (첫 번째 루프에서만 실행됨)
    SELECT E1.ID, E1.PARENT_ID, 1 AS GEN
    FROM ECOLI_DATA AS E1
    WHERE E1.PARENT_ID IS NULL
    
    UNION ALL
    
    -- Recursive 문장 (읽어올 때마다 행의 위치가 기억되어 다음번에 읽어올 때 다음 행으로 이동)
    SELECT E2.ID, E2.PARENT_ID, GEN+1
    FROM ECOLI_DATA AS E2
    INNER JOIN cte
        on E2.PARENT_ID = cte.ID
)

SELECT COUNT(cte.ID) AS COUNT, cte.GEN AS GENERATION
FROM cte
-- 자식이 없는 개체 필터링
WHERE NOT EXISTS (
    SELECT *
    FROM ECOLI_DATA AS E3 
    WHERE E3.PARENT_ID = cte.ID
    )
GROUP BY cte.GEN
ORDER BY GENERATION