SELECT m.MEMBER_NAME, r.REVIEW_TEXT, DATE_FORMAT(r.REVIEW_DATE, '%Y-%m-%d') REVIEW_DATE
FROM MEMBER_PROFILE m, REST_REVIEW r
WHERE m.MEMBER_ID = r.MEMBER_ID
      AND m.MEMBER_ID
          = (SELECT MEMBER_ID
             FROM REST_REVIEW
             GROUP BY MEMBER_ID
             ORDER BY COUNT(*) DESC
             LIMIT 1)
ORDER BY REVIEW_DATE, REVIEW_TEXT;
