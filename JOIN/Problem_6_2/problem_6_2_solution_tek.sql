-- 프로그래머스 있었는데요 없었습니다
-- https://school.programmers.co.kr/learn/courses/30/lessons/59043

SELECT I.ANIMAL_ID, O.NAME
FROM ANIMAL_INS AS I
INNER JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
-- 보호시작일 (I.DATETIME) 보다 입양일 (O.DATETIME)이 더 빠른 동물 조회 조건
WHERE I.DATETIME > O.DATETIME 
ORDER BY I.DATETIME