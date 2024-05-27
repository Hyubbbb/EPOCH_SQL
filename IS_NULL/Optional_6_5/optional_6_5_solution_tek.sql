-- 프로그래머스 잡은 물고기의 평균 길이 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/293259

-- SELECT 
--     ROUND(
--         AVG
--             (CASE 
--                 WHEN LENGTH IS NULL THEN 10
--                 ELSE LENGTH
--             END)
--         , 2) AS AVERAGE_LENGTH
-- FROM FISH_INFO

-- Subquery 대신, IFNULL 사용해서 NULL 값을 10으로 대체
SELECT ROUND(AVG(IFNULL(LENGTH, 10)), 2) AS AVERAGE_LENGTH
FROM FISH_INFO