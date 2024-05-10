-- 프로그래머스 대여 횟수가 많은 자동차들의 월별 대여 횟수 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/151139

SELECT MONTH(H.START_DATE) AS MONTH, H.CAR_ID, COUNT(*) AS RECORDS
FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
-- Subquery를 통해, CAR_ID 필터링 (대여 기간, 대여 횟수)
WHERE H.CAR_ID IN (
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        -- 대여 기간 8월 ~ 10월인 데이터 필터링
        WHERE MONTH(START_DATE) BETWEEN 8 AND 10
        GROUP BY CAR_ID
        -- Group by를 통해, 자동차별 총 대여 횟수 5회 이상인 것들만 필터링
        HAVING COUNT(*) >= 5)
    -- Subquery에서 CAR_ID만 가져왔기 때문에, 다시 한번 대여 기간 필터링
    AND MONTH(H.START_DATE) BETWEEN 8 AND 10
GROUP BY MONTH(H.START_DATE), H.CAR_ID
ORDER BY MONTH, H.CAR_ID DESC