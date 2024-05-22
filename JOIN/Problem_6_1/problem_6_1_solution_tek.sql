-- 프로그래머스 상품을 구매한 회원 비율 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131534

SELECT YEAR(O.SALES_DATE) AS YEAR, 
       MONTH(O.SALES_DATE) AS MONTH,
       -- 동일한 USER_ID가 여러개 잡히기 때문에 DISTINCT를 해줘야 한다
       COUNT(DISTINCT O.USER_ID) AS PURCHASED_USERS,
       ROUND(
           -- 소수점 두 번째 자리에서 반올림
               (
                   -- 2021년에 가입한 회원 중 상품을 구매한 회원 수
                   COUNT(DISTINCT U.USER_ID)
                   -- 2021년에 가입한 전체 회원 수를 Scalar Subquery를 통해 가져옴
                   / (SELECT COUNT(USER_ID)
                      FROM USER_INFO
                      WHERE YEAR(JOINED) = 2021)
               ), 1
       ) AS PUCHASED_RATIO
FROM USER_INFO AS U
-- USER_INFO, ONLINE_SALE 테이블 INNER JOIN
INNER JOIN ONLINE_SALE AS O
    ON U.USER_ID = O.USER_ID
-- 2021년에 가입한 회원들만 조회
WHERE YEAR(U.JOINED) = 2021
GROUP BY YEAR(O.SALES_DATE), MONTH(O.SALES_DATE)
ORDER BY YEAR, MONTH
