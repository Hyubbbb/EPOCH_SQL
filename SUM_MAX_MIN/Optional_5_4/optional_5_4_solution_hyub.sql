-- # Table 1: FISH_INFO
-- # Table 2: FISH_NAME_INFO

-- # 물고기 종류 별로 가장 큰 물고기의 ID, 물고기 이름, 길이를 출력하는 SQL 문을 작성
--     # 물고기의 ID에 대해 오름차순 정렬
SELECT ID, FISH_NAME, LENGTH
FROM FISH_NAME_INFO n
JOIN
    (SELECT ID, i.FISH_TYPE, LENGTH
    FROM FISH_INFO i
    JOIN (
        SELECT FISH_TYPE, MAX(LENGTH) as LENGTH_MAX
        FROM FISH_INFO
        WHERE LENGTH IS NOT NULL
        GROUP BY FISH_TYPE) as tmp on i.FISH_TYPE=tmp.FISH_TYPE AND LENGTH = LENGTH_MAX) as tmp2 on n.FISH_TYPE = tmp2.FISH_TYPE
ORDER BY ID ASC


