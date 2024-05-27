SELECT b.ANIMAL_ID, b.ANIMAL_TYPE, b.NAME
FROM ANIMAL_INS AS a
JOIN ANIMAL_OUTS AS b
ON a.ANIMAL_ID = b.ANIMAL_ID
WHERE a.SEX_UPON_INTAKE != b.SEX_UPON_OUTCOME
ORDER BY b.ANIMAL_ID;