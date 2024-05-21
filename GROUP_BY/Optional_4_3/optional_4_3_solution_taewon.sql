-- 대여 시작일을 기준으로 2022년 8월~2022년 10월까지 총 대여 횟수가 5회 이상인 자동차들 / 에 대해서 해당 기간 동안의 월별 자동차 ID 별 총 대여 횟수(컬럼명: RECORDS) 리스트를 출력
-- 특정 월의 총 대여 횟수가 0인 경우에는 결과에서 제외


SELECT 
    MONTH(START_DATE) AS MONTH, -- 날짜 중 월만 출력
    CAR_ID, 
    COUNT(*) AS RECORDS
FROM 
    CAR_RENTAL_COMPANY_RENTAL_HISTORY
WHERE 
    CAR_ID IN ( 
        -- 내부 쿼리에서 필터링된 자동차 ID만을 대상으로 함
        -- 여기서 대여 횟수가 5회 이상인 자동차 ID 선택
        SELECT CAR_ID
        FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY
        WHERE START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
        GROUP BY CAR_ID
        HAVING COUNT(*) >= 5 
    )
    AND START_DATE BETWEEN '2022-08-01' AND '2022-10-31'
GROUP BY 
    MONTH(START_DATE), CAR_ID
ORDER BY 
    MONTH(START_DATE), CAR_ID DESC;
