-- 서울에 위치한 식당 목록 출력하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/131118

SELECT I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS, ROUND(AVG(R.REVIEW_SCORE), 2) AS AVG_SCORE
FROM REST_INFO AS I
JOIN REST_REVIEW AS R
    ON I.REST_ID = R.REST_ID
-- 서울에 위치한 식당 검색 위해 LIKE "서울%"
WHERE I.ADDRESS LIKE "서울%"
-- 평균 점수 계산 위해 GROUP BY 사용
GROUP BY I.REST_ID, I.REST_NAME, I.FOOD_TYPE, I.FAVORITES, I.ADDRESS
ORDER BY AVG_SCORE DESC, FAVORITES DESC