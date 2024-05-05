# Table 1: REST_INFO
# SELECT *
# FROM REST_INFO

# Table 2: REST_REVIEW
# SELECT *
# FROM REST_REVIEW

# 서울에 위치한 식당들의 1.REST_ID, 1.REST_NAME, 1.FOOD_TYPE, 1.FAVORITES, 1.ADDRESS, 2.avg(REVIEW_SCORE)를 조회하는 SQL문을 작성
# REST_ID로 LEFT JOIN하면 될 듯
    # 리뷰 평균점수는 소수점 세 번째 자리에서 반올림
    # 결과는 평균점수를 기준으로 내림차순 정렬
    # 평균점수가 같다면 즐겨찾기수를 기준으로 내림차순 정렬

# '서울에 위치한'이었따!!!!!!

SELECT info.REST_ID, info.REST_NAME, info.FOOD_TYPE, info.FAVORITES, info.ADDRESS
        , ROUND(AVG(REVIEW_SCORE), 2) as SCORE
FROM REST_INFO as info
    RIGHT JOIN REST_REVIEW as review on info.REST_ID = review.REST_ID
    WHERE ADDRESS LIKE '서울%'
GROUP BY REST_ID
ORDER BY SCORE DESC, FAVORITES DESC
