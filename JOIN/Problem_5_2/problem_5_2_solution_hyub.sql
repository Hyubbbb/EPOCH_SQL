-- # Table 1: ANIMAL_INS

-- # Table 2: ANIMAL_OUTS

-- # 보호소에 들어올 당시에는 중성화1되지 않았지만, 보호소를 나갈 당시에는 중성화된 동물의 아이디와 생물 종, 이름을 조회하는 아이디 순으로 조회하는 SQL 문을 작성
--     # Intact: 중성화 X
--     # Neutered, Spayed: 중성화 O (각각 수, 암)

SELECT i.ANIMAL_ID,	i.ANIMAL_TYPE, i.NAME
FROM ANIMAL_INS i
JOIN ANIMAL_OUTS o on i.ANIMAL_ID = o.ANIMAL_ID
WHERE SEX_UPON_INTAKE like 'Intact%'
    AND SEX_UPON_INTAKE != SEX_UPON_OUTCOME
