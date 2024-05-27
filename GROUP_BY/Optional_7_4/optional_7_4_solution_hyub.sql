-- # 1. BOOK
-- # 2. AUTHOR
-- # 3. BOOK_SALES

-- # 2022년 1월의 도서 판매 데이터를 기준으로 저자 별, 카테고리 별 매출액(TOTAL_SALES = 판매량 * 판매가) 을 구하여, 
-- # 저자 ID(AUTHOR_ID), 저자명(AUTHOR_NAME), 카테고리(CATEGORY), 매출액(SALES) 리스트를 출력
--     # 결과는 저자 ID를 오름차순으로, 저자 ID가 같다면 카테고리를 내림차순 정렬

-- # 1X2 by AUTHOR_ID
-- # 1X3 by SALES_DATE -> WHERE/SUM
SELECT b.AUTHOR_ID, a.AUTHOR_NAME, b.CATEGORY, SUM(PRICE * SALES) as TOTAL_SALES
FROM BOOK b
JOIN AUTHOR a on b.AUTHOR_ID = a.AUTHOR_ID
JOIN BOOK_SALES s on b.BOOK_ID = s.BOOK_ID
    WHERE YEAR(SALES_DATE) = 2022 AND MONTH(SALES_DATE) = 1
GROUP BY AUTHOR_ID, CATEGORY
ORDER BY AUTHOR_ID, CATEGORY DESC
