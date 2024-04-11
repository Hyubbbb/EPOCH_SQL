-- 흉부외과 또는 일반외과 의사 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/132203

SELECT D.DR_NAME, D.DR_ID, D.MCDP_CD, DATE_FORMAT(D.HIRE_YMD, "%Y-%m-%d")
FROM DOCTOR D
WHERE D.MCDP_CD IN ("CS", "GS")
ORDER BY D.HIRE_YMD DESC, D.DR_NAME