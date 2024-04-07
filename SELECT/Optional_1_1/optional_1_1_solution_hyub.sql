# 진료과가 흉부외과(CS)이거나 일반외과(GS)인 의사의 
# 이름, 의사ID, 진료과, 고용일자를 조회
# 결과는 고용일자 (내림차순) & 이름 (오름차순) 정렬
# 날짜 포매팅

SELECT DR_NAME, DR_ID, MCDP_CD, DATE_FORMAT(HIRE_YMD,'%Y-%m-%d') as HIRE_YMD
    FROM DOCTOR
    WHERE MCDP_CD IN ('CS', 'GS')
    ORDER BY HIRE_YMD DESC, DR_NAME ASC
    ;
