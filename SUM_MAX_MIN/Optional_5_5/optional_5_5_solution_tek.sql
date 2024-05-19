-- 프로그래머스 잡은 물고기 중 가장 큰 물고기의 길이 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/298515

-- CONVERT 통해 숫자를 문자로 변환하고, CONCAT 통해 문자열을 합쳐준다
SELECT CONCAT(CONVERT(MAX(LENGTH), CHAR), "cm") as MAX_LENGTH
FROM FISH_INFO