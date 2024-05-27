-- 코드를 입력하세요
-- {날짜, 회원ID, 상품ID} -> 조합은 하나만 존재 
-- 출력: 연도, 월, 회원 수, 회원 비율 -> 정의

SELECT 
    YEAR(o.SALES_DATE) AS `YEAR`,
    MONTH(o.SALES_DATE) AS `MONTH`, -- 연, 월별로 묶임 -> (count정보, round비율 정보)
    COUNT(DISTINCT o.USER_ID) AS PURCHASED_USERS, -- 구매 정보 테이블에서 중복을 제거한 USER ID가 필요
    ROUND(COUNT(DISTINCT o.USER_ID) / total_users.total_count, 1) AS PURCHASED_RATIO
FROM USER_INFO u

JOIN ONLINE_SALE o ON u.USER_ID = o.USER_ID -- 회원ID로 조인
JOIN -- 서브쿼리로 USER_INFO에서 구매 내역이 없더라도 2021년 가입일인 구매 회원 "전체" 뽑고 위에서 비율 계산에 활용
    (SELECT COUNT(*) as total_count
     FROM USER_INFO
     WHERE YEAR(JOINED) = 2021) AS total_users
  
WHERE YEAR(u.JOINED) = 2021
GROUP BY YEAR, MONTH --  각 연월 별로 구매한 회원 수와 비율을 계산
ORDER BY YEAR, MONTH;
