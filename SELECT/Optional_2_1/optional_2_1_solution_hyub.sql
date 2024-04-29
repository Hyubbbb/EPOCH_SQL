# car_type = SUV
# AVERAGE_FEE를 구하자 (소수 첫 번째 자리에서 반올림)
SELECT ROUND(AVG(daily_fee)) as AVERAGE_FEE
FROM CAR_RENTAL_COMPANY_CAR
    GROUP BY car_type
    HAVING car_type = 'SUV'
