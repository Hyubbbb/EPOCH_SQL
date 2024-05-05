# FIRST_HALF: 아이스크림 상반기 주문 정보
    # - FLAVOR(PK)
    # - SHIPMENT_ID(FK)

# JULY: 아이스크림 7월 주문 정보
    # - SHIPMENT_ID(PK)

# 7월은 SHIPMENT_ID가 다른 동일 FLAVOR 존재

SELECT FLAVOR
FROM
    (SELECT j.SHIPMENT_ID, j.FLAVOR,
            SUM(COALESCE(j.TOTAL_ORDER, 0) + COALESCE(h.TOTAL_ORDER, 0)) as total_sum
    FROM FIRST_HALF AS h RIGHT JOIN JULY AS j on h.SHIPMENT_ID = j.SHIPMENT_ID
    GROUP BY FLAVOR
    ORDER BY total_sum DESC
    LIMIT 3) as tmp
