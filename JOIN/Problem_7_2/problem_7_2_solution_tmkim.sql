SELECT DISTINCT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM SKILLCODES
JOIN DEVELOPERS 
ON CODE & SKILL_CODE -- 해당 값이 0이 아니면 실행 되는 조건  (즉 자리별로 같은 값이 있을 때)
WHERE CATEGORY = 'Front End'
ORDER BY ID;
