-- 자동차 종류 별 대여 기간 종류 별 할인 정책 정보가 뭔 말이야 대체

-- 1. 자동차 종류가 '세단' 또는 'SUV' 인 자동차 중
-- 2. 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능하고
-- 3. 30일간의 대여 금액 = DAILY_FEE*30*(할인율) -> 50만원 이상 200만원 미만인 자동차
-- 자동차 ID, 자동차 종류, 대여 금액(컬럼명: FEE) 리스트를 출력
-- c, h, p라 하자 이름이 길어서 소문자로 구분하는게 편한

SELECT c.CAR_ID, c.CAR_TYPE, FLOOR(c.DAILY_FEE * 30 * (1 - p.DISCOUNT_RATE / 100.0)) AS FEE
FROM CAR_RENTAL_COMPANY_CAR c
JOIN CAR_RENTAL_COMPANY_DISCOUNT_PLAN p ON c.CAR_TYPE = p.CAR_TYPE

WHERE
    c.CAR_TYPE IN ('세단', 'SUV') AND p.DURATION_TYPE = '30일 이상' AND NOT EXISTS (
        SELECT 1
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY h
        WHERE h.CAR_ID = c.CAR_ID AND
              (h.START_DATE <= '2022-11-30' AND h.END_DATE >= '2022-11-01') -- 대여 시작일은 최대 11/30일 전이어야하고, 대여 종료일은 최소 11월1일 이후여야 대여 기한 안에 포함되니까
    )

GROUP BY c.CAR_ID, c.CAR_TYPE, c.DAILY_FEE, p.DISCOUNT_RATE
HAVING FLOOR(c.DAILY_FEE * 30 * (1 - p.DISCOUNT_RATE / 100.0)) >= 500000 AND FLOOR(c.DAILY_FEE * 30 * (1 - p.DISCOUNT_RATE / 100.0)) < 2000000
ORDER BY
    FEE DESC, c.CAR_TYPE ASC, c.CAR_ID DESC; -- 걍 순서대로
