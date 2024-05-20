SELECT MEMBER_NAME, REVIEW_TEXT, DATE_FORMAT(REVIEW_DATE, '%Y-%m-%d') AS REVIEW_DATE
FROM REST_REVIEW AS R -- 3. 해당 회원과 리뷰들을 또 JOIN 시켜서 해당 회원이 쓴 리뷰정보들을 (JOIN을 통해) 합친다.
INNER JOIN (
    SELECT M.MEMBER_ID, M.MEMBER_NAME -- 2. 가장 리뷰수가 많은 회원의 회원ID, 회원이름을 1개 뽑아서 매칭
    FROM MEMBER_PROFILE AS M
    INNER JOIN (
        SELECT MEMBER_ID, COUNT(REVIEW_ID) AS NUM_REVIEW --  1. 먼저 가장 리뷰수가 많은 회원의 회원이름, 리뷰수를 1개뽑는다.
        FROM REST_REVIEW
        GROUP BY MEMBER_ID
        ORDER BY NUM_REVIEW DESC
        LIMIT 1 -- 여기서 먼저 하나만 추출해야 나중에 ORDER BY 를 또 쓸 수 있음
    ) AS R
    ON M.MEMBER_ID = R.MEMBER_ID
) AS X ON R.MEMBER_ID = X.MEMBER_ID
ORDER BY REVIEW_DATE, REVIEW_TEXT
