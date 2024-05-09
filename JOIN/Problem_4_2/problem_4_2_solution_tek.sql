-- 프로그래머스 특정 기간동안 대여 가능한 자동차들의 대여비용 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/157339

SELECT C.CAR_ID, C.CAR_TYPE, 
       -- 할인율이기 때문에 1 - (P.DISCOUNT_RATE*0.01) 곱해준다 
       FLOOR(C.DAILY_FEE * (1 - (P.DISCOUNT_RATE*0.01)) * 30) AS FEE
FROM CAR_RENTAL_COMPANY_CAR AS C
-- 대여 기록이 아예 없을 수도 있기 때문에 LEFT JOIN
LEFT JOIN CAR_RENTAL_COMPANY_RENTAL_HISTORY AS H
    ON C.CAR_ID = H.CAR_ID
LEFT JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN AS P
    ON C.CAR_TYPE = P.CAR_TYPE
WHERE C.CAR_TYPE IN ("세단", "SUV") 
    AND P.DURATION_TYPE = "30일 이상"
GROUP BY C.CAR_ID
-- 대여 종료일이 2022-11-01보다 작아야하고, 대여 시작일이 2022-11-30보다 커야 한다
HAVING (DATE_FORMAT(MAX(H.END_DATE), "%Y-%m-%d") < "2022-11-01"
    OR DATE_FORMAT(MIN(H.START_DATE), "%Y-%m-%d") > "2022-11-30"
    -- 대여 기록이 아예 없는 차량도 있음
    OR MAX(H.END_DATE) IS NULL)
    -- 금액 범위 설정
    AND (FEE >= 500000 AND FEE < 2000000)
ORDER BY FEE DESC, C.CAR_TYPE, C.CAR_ID