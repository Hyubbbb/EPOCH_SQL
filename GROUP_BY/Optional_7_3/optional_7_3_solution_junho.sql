SELECT a.CATEGORY, SUM(b.SALES) AS TOTAL_SALES
FROM BOOK AS a
JOIN BOOK_SALES AS b
ON a.BOOK_ID = b.BOOK_ID
WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 1
GROUP BY CATEGORY
ORDER BY CATEGORY;
