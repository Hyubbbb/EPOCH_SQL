-- 프로그래머스 보호소에서 중성화한 동물
-- https://school.programmers.co.kr/learn/courses/30/lessons/59045

SELECT I.ANIMAL_ID, I.ANIMAL_TYPE, I.NAME
FROM ANIMAL_INS AS I
JOIN ANIMAL_OUTS AS O
    ON I.ANIMAL_ID = O.ANIMAL_ID
-- 보호소를 들어올 때와 나올 때, 중성화 여부 상태가 변화해야 한다 
WHERE I.SEX_UPON_INTAKE != O.SEX_UPON_OUTCOME