-- # Table 1: MEMBER_PROFILE

-- # Table 2: REST_REVIEW

-- # 리뷰를 가장 많이 작성한 회원의 리뷰들을 조회
--     # 결과는 리뷰 작성일을 기준으로 오름차순, 리뷰 작성일이 같다면 리뷰 텍스트를 기준으로 오름차순 정렬
    
-- # 리뷰를 가장 많이 작성한 회원 1명? 여러 명?

SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') as REVIEW_DATE
FROM MEMBER_PROFILE mm
    JOIN REST_REVIEW rr on mm.MEMBER_ID = rr.MEMBER_ID
    WHERE mm.MEMBER_ID in (
                        SELECT MEMBER_ID
                        FROM REST_REVIEW
                        GROUP BY MEMBER_ID
                        HAVING COUNT(*) = (
                            SELECT MAX(review_count_tmp)
                            FROM (
                                SELECT COUNT(r.REVIEW_TEXT) AS review_count_tmp
                                FROM REST_REVIEW r
                                GROUP BY r.MEMBER_ID
                            ) AS max_counts
                        ))
ORDER BY REVIEW_DATE ASC, REVIEW_TEXT ASC
