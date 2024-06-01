-- # Table 1: SKILLCODES
-- # Table 2: DEVELOPERS

-- # DEVELOPERS 테이블에서 Front End 스킬을 가진 개발자의 정보를 조회하려 합니다. 
-- # 조건에 맞는 개발자의 ID, 이메일, 이름, 성을 조회
--     # 결과는 ID를 기준으로 오름차순 정렬

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE & (
    SELECT BIT_OR(CODE)
    FROM SKILLCODES
    WHERE CATEGORY = 'Front End') > 0
ORDER BY ID ASC
