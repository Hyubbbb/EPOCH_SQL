-- # Table 1: CAR_RENTAL_COMPANY_CAR

-- # Table 2: CAR_RENTAL_COMPANY_RENTAL_HISTORY

-- # Table 3: CAR_RENTAL_COMPANY_DISCOUNT_PLAN

-- # 조건 1: 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중 -> T1 or T3
-- # 조건 2: 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고 -> T2
-- # 조건 3: 30일간의 대여 금액이 50만원 이상 200만원 미만인 자동차에 대해서 -> T1 X T3
-- # 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력하는 SQL문을 작성
--     # 결과는 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬

-- # SELECT *, DAILY_FEE * 30 * (1- DISCOUNT_RATE/100)
SELECT DISTINCT t1Xt3.CAR_ID, t1Xt3.CAR_TYPE, ROUND(DAILY_FEE * 30 * (1- DISCOUNT_RATE/100)) as FEE
FROM 
    (SELECT t1.CAR_ID, t1.CAR_TYPE, t1.DAILY_FEE, DISCOUNT_RATE
    FROM CAR_RENTAL_COMPANY_CAR as t1
    JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN as t3 on t1.CAR_TYPE = t3.CAR_TYPE

    WHERE t1.CAR_TYPE in ('세단', 'SUV') # 조건 1
        AND DURATION_TYPE = '30일 이상') as t1Xt3

WHERE DAILY_FEE * 30 * (1- DISCOUNT_RATE/100) >= 500000 AND DAILY_FEE * 30 * (1- DISCOUNT_RATE/100) < 2000000 # 조건 3
    AND CAR_ID NOT in (SELECT CAR_ID
                            FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
                            WHERE
                                '2022-11.01' BETWEEN START_DATE  AND END_DATE # 조건 2
                                OR '2022-11.30' BETWEEN START_DATE  AND END_DATE)

ORDER BY FEE DESC, CAR_TYPE ASC, CAR_ID DESC

-- # SELECT car.CAR_ID, CAR_TYPE, ROUND(FEE) 
-- # FROM(
-- #     SELECT CAR_ID, DAILY_FEE * 30 * (1- DISCOUNT_RATE/100) as FEE
-- #     FROM(
-- #         SELECT CAR_TYPE, DISCOUNT_RATE
-- #         FROM CAR_RENTAL_COMPANY_DISCOUNT_PLAN
-- #         WHERE DURATION_TYPE = '30일 이상'
-- #         ) as tmp1
-- #     RIGHT JOIN CAR_RENTAL_COMPANY_CAR as rent on tmp1.CAR_TYPE = rent.CAR_TYPE 
-- #     WHERE DAILY_FEE * 30 * (1- DISCOUNT_RATE/100) >= 500000 AND DAILY_FEE * 30 * (1- DISCOUNT_RATE/100) < 2000000 # 조건 3
-- #     ) as tmp_2
-- # LEFT JOIN CAR_RENTAL_COMPANY_CAR as car on tmp_2.CAR_ID = tmp_2.CAR_ID
-- # WHERE CAR_TYPE in ('SUV', '세단') # 조건 1
