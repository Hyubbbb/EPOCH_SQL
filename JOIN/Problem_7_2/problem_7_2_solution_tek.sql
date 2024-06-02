-- 프로그래머스 FrontEnd 개발자 찾기
-- https://school.programmers.co.kr/learn/courses/30/lessons/276035

SELECT DISTINCT D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
-- CROSS JOIN으로 테이블 2개 조건 없이 전부 JOIN
FROM DEVELOPERS AS D, SKILLCODES AS S
WHERE 1=1
    -- 비트연산자로 Front End 스킬 소지 여부 확인 
    AND D.SKILL_CODE & S.CODE
    -- CROSS JOIN한 결과에서 Front End 스킬들만 필터링
    AND S.CATEGORY = "Front End"
-- DISTINCT나 GROUP BY 둘 중 하나만 걸어도 통과
-- GROUP BY D.ID, D.EMAIL, D.FIRST_NAME, D.LAST_NAME
ORDER BY D.ID