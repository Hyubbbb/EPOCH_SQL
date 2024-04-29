# '통풍시트', '열선시트', '가죽시트' 중 하나 이상의 옵션이 포함된 자동차 -> car_type별로 몇 대인지
SELECT CAR_TYPE, COUNT(*) as CARS
FROM CAR_RENTAL_COMPANY_CAR
WHERE OPTIONS REGEXP ('통풍시트|열선시트|가죽시트')

GROUP BY car_type

ORDER BY car_type;
