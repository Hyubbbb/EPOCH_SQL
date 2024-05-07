-- 주문량이 많은 아이스크림들 조회하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/133027

SELECT H.FLAVOR
FROM FIRST_HALF AS H
-- JULY 테이블에 동일한 맛이지만 다른 출하 번호를 가진 것이 있음
INNER JOIN (
    -- GROUP BY로 맛에 따른 주문량을 각각 더해준다
    SELECT J.FLAVOR, SUM(J.TOTAL_ORDER) AS TOTAL_ORDER
    FROM JULY J
    GROUP BY FLAVOR) AS G
    ON H.FLAVOR = G.FLAVOR
ORDER BY H.TOTAL_ORDER + G.TOTAL_ORDER DESC
LIMIT 3