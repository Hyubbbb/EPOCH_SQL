SELECT YEAR(s.SALES_DATE) YEAR, MONTH(s.SALES_DATE) MONTH, COUNT(DISTINCT s.USER_ID) PURCHASED_USERS, ROUND(COUNT(DISTINCT s.USER_ID)/(SELECT COUNT(*)
                                FROM USER_INFO
                                WHERE YEAR(JOINED) = 2021), 1) PURCHASED_RATIO
FROM USER_INFO u JOIN ONLINE_SALE s
     ON u.USER_ID = s.USER_ID
WHERE YEAR(u.JOINED) = 2021
GROUP BY 1, 2
ORDER BY 1, 2;
