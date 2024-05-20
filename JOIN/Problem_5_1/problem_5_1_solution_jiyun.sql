SELECT m.MEMBER_NAME, r.REVIEW_TEXT, DATE_FORMAT(r.review_date, '%Y-%m-%d') AS REVIEW_DATE
    FROM member_profile m
    JOIN rest_review r
    ON m.member_id = r.member_id
    -- 가장 많이 리뷰 작성한 회원만 조회한다는 조건
    WHERE r.member_id = (SELECT a.member_id
                                FROM (SELECT b.member_id
                 -- 회원별 리뷰 작성 횟수를 세는 서브쿼리
                                        FROM (SELECT member_id, COUNT(*) AS review_count
                                                FROM rest_review
                                                GROUP BY member_id) AS B
                                        ORDER BY review_count DESC
                                         LIMIT 1) -- 리뷰 작성 횟수 내림차순 정리, limit 1로 한 명만 조회
                                AS A)
    ORDER BY review_date, review_text
