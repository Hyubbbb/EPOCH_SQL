SELECT COUNT(*) AS 'COUNT', RANK() OVER (ORDER BY PARENT_ID) AS GENERATION
    FROM ECOLI_DATA
    WHERE ID NOT IN (SELECT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL) 
    GROUP BY PARENT_ID
    ORDER BY GENERATION
-- 이것도 답이 똑같이 나오고 테스트 결과 성공이라고 뜨는데 제출 후 채점을 하면 틀렸대요.... 시무룩.. 


-- 두번째 답
WITH RECURSIVE GENERATION_TABLE AS(
    SELECT ID, PARENT_ID, 1 AS GENERATION
        FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
UNION ALL
    SELECT E.ID, E.PARENT_ID, G.GENERATION + 1 AS GENERATION
        FROM ECOLI_DATA E
    JOIN GENERATION_TABLE G ON E.PARENT_ID = G.ID 
    )
    
SELECT COUNT(*) AS 'COUNT', GENERATION
    FROM GENERATION_TABLE
    WHERE ID NOT IN (SELECT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL)
    GROUP BY GENERATION
