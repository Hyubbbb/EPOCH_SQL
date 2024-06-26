-- # SELECT coalesce(LENGTH, 10)를 통해서 구할 수도 있다.
    -- # COALESCE VS IFNULL: 'NULL인지 파악할 컬럼을 몇 개나 넣을 수 있는지'
SELECT ROUND(AVG(IFNULL(LENGTH, 10)), 2) as AVERAGE_LENGTH
FROM FISH_INFO
-- # WHERE LENGTH IS NULL
