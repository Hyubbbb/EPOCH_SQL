-- 프로그래머스 NULL 처리하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/59410

-- IFNULL 사용하여 Null 값을 No name으로 변경
SELECT I.ANIMAL_TYPE, IFNULL(I.NAME, "No name") as "NAME", I.SEX_UPON_INTAKE
FROM ANIMAL_INS AS I