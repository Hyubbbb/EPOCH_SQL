-- # Table 1: USER_INFO

-- # Table 2: ONLINE_SALE

-- # 2021년에 가입한 전체 회원들 중 상품을 구매한 회원수와 상품을 구매한 회원의 비율(=2021년에 가입한 회원 중 상품을 구매한 회원수 / 2021년에 가입한 전체 회원 수)을 년, 월 별로 출력
--     # 상품을 구매한 회원의 비율은 소수점 두번째자리에서 반올림하고, 
--     # 전체 결과는 년을 기준으로 오름차순 정렬
--     # 년이 같다면 월을 기준으로 오름차순 정렬

SELECT YEAR(SALES_DATE) as YEAR, MONTH(SALES_DATE) as MONTH, 
        COUNT(DISTINCT(USER_ID)) as PUCHASED_USERS,
        ROUND(COUNT(DISTINCT(USER_ID)) / (SELECT COUNT(USER_ID) FROM USER_INFO WHERE YEAR(JOINED) = 2021), 1) as PUCHASED_RATIO
FROM ONLINE_SALE
WHERE USER_ID in
                (SELECT USER_ID
                 FROM USER_INFO
                 WHERE YEAR(JOINED) = 2021)
GROUP BY YEAR(SALES_DATE), MONTH(SALES_DATE)
ORDER BY YEAR, MONTH
