SELECT 
    ins.ANIMAL_ID,
    ins.ANIMAL_TYPE,
    ins.NAME
FROM ANIMAL_INS ins
JOIN ANIMAL_OUTS outs ON ins.ANIMAL_ID = outs.ANIMAL_ID
WHERE (ins.SEX_UPON_INTAKE LIKE 'Intact%' AND 
    (outs.SEX_UPON_OUTCOME LIKE 'Neutered%' OR outs.SEX_UPON_OUTCOME LIKE 'Spayed%')) -- OR 사용 시, 괄호 묶어주기만 하면 됨
ORDER BY 
    ins.ANIMAL_ID ASC; -- 아이디 순으로 조회하는
