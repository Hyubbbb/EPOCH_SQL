-- 코드를 작성해주세요
-- 1. & 비트 연산자 -> 대응되는 비트 연산자가 같은 놈을 찾음
-- 2. 그 중에서도 카테고리가 프론트엔드인 것만 필터링

SELECT DISTINCT d.ID, d.EMAIL, d.FIRST_NAME, d.LAST_NAME
FROM DEVELOPERS d
JOIN SKILLCODES s ON d.SKILL_CODE & s.CODE != 0  -- 결과가 0이 아니라면, 해당 코드가 SKILL_CODE 내에 존재함을 의미합니다
WHERE s.CATEGORY = 'Front End'  -- 'Front End'
ORDER BY d.ID;
