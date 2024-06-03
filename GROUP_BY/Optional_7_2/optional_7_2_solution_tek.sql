-- 프로그래머스 즐겨찾기가 가장 많은 식당 정보 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131123

SELECT FOOD_TYPE, REST_ID, REST_NAME, FAVORITES
FROM REST_INFO
WHERE (FOOD_TYPE, FAVORITES) IN (
    -- 음식 종류별로 즐겨찾기 가장 많은 것 찾는 Subquery
    SELECT FOOD_TYPE, MAX(FAVORITES)
    FROM REST_INFO
    GROUP BY FOOD_TYPE
    )
ORDER BY FOOD_TYPE DESC