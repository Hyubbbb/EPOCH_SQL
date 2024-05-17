-- 프로그래머스 물고기 종류 별 대어 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/293261

SELECT DISTINCT I.ID, G.FISH_NAME, I.LENGTH
FROM (
    -- GROUP BY 통해 타입, 이름별 최대 길이 구한 Inline View 활용
    SELECT I.FISH_TYPE, N.FISH_NAME, MAX(I.LENGTH) AS MAX_LENGTH
    FROM FISH_INFO AS I
    JOIN FISH_NAME_INFO AS N
        ON I.FISH_TYPE = N.FISH_TYPE
    GROUP BY I.FISH_TYPE, N.FISH_NAME
    ) AS G, 
    FISH_INFO AS I
-- 최대 길이 및 FISH_TYPE 같은 것으로 조건 걸어준다
WHERE G.MAX_LENGTH = I.LENGTH
    AND G.FISH_TYPE = I.FISH_TYPE
ORDER BY I.ID