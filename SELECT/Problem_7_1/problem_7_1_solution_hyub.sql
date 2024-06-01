-- # Table 1: ECOLI_DATA

-- # 각 세대별 자식이 없는 개체의 수(COUNT)와 세대(GENERATION)를 출력하는 SQL문을 작성해주세요. 
--     # 세대에 대해 오름차순 정렬
--     # 단, 모든 세대에는 자식이 없는 개체가 적어도 1개체는 존재

-- # SELECT COUNT(*) as COUNT, GENERATION
-- # FROM (
-- #     SELECT a.ID, 
-- #         a.PARENT_ID as parent_1, 
-- #         b.PARENT_ID as parent_2, 
-- #         c.PARENT_ID as parent_3, 
-- #         d.PARENT_ID as parent_4, 
-- #         (IF(a.PARENT_ID IS NOT NULL, 1, 0) + 
-- #          IF(b.PARENT_ID IS NOT NULL, 1, 0) + 
-- #          IF(c.PARENT_ID IS NOT NULL, 1, 0) + 
-- #          IF(d.PARENT_ID IS NOT NULL, 1, 0)) + 1 AS GENERATION
-- #     FROM ECOLI_DATA a
-- #     LEFT JOIN ECOLI_DATA b on a.PARENT_ID = b.ID
-- #     LEFT JOIN ECOLI_DATA c on b.PARENT_ID = c.ID
-- #     LEFT JOIN ECOLI_DATA d on c.PARENT_ID = d.ID) as tmp
-- # WHERE ID NOT IN (SELECT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL) # NOT NULL!!!!
-- # GROUP BY GENERATION
-- # ORDER BY GENERATION

-- 위는 4세대까지만 포함할 수 있는 코드
-- 이를 일반적으로 확장하기 위해 WITH RECURSIVE 공부
-- NOT EZ

WITH RECURSIVE GenerationCTE AS (
    -- 초기 CTE: 루트 노드(최상위 부모)의 레벨을 1로 설정
        -- 초기 CTE는 한 번만 실행된다
    SELECT ID, PARENT_ID, 1 AS GENERATION
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL
    UNION ALL
    
    -- 재귀 CTE: 부모 노드의 레벨에 1을 더하여 자식 노드의 레벨을 설정
        -- 여기부터는 재귀 반복
    SELECT child.ID, child.PARENT_ID, parent.GENERATION + 1
    FROM ECOLI_DATA child
    INNER JOIN GenerationCTE parent ON child.PARENT_ID = parent.ID)
        -- `GenerationCTE parent`는 따로 지정해준 테이블이 아님 
        -- CTE 내부에서 재귀적으로 참조 
        -- parent는 GenerationCTE에서 가져온 부모 노드의 데이터를 참조하는 별칭
    
SELECT COUNT(*) as COUNT, GENERATION
FROM GenerationCTE
    WHERE ID NOT IN (SELECT PARENT_ID FROM ECOLI_DATA WHERE PARENT_ID IS NOT NULL)
GROUP BY GENERATION
ORDER BY GENERATION;
