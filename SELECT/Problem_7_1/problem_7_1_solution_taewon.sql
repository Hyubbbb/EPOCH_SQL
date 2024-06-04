-- 1. 어떤 세대인지 계산
-- 2. 부모 당 자식 수
-- 해당 부모가 어떤 세대인지 조인한 뒤, 세대별로 count/?
-- 부모 당 자식 수를 따로 뽑고, 세대 정보를 뽑아서 그 둘을 ID로 조인 한 한 뒤,  전자가 0인 놈을 조회해서 세대별로 정리하면 되는

-- 최초 세대의 대장균들(부모 세대가 NULL인)에게 '세대(=DEPTH)'를 1로 설정

WITH RECURSIVE GEN
AS (
    SELECT ID, PARENT_ID, 1 AS DEPTH 
    FROM ECOLI_DATA
    WHERE PARENT_ID IS NULL -- 부모가 없으니 1세대

    UNION ALL

    SELECT CHILD.ID, CHILD.PARENT_ID, GEN.DEPTH + 1 -- 그 다음 세대(CHILD라고 지정함)부터는 +1 하나씩 해줌
    FROM ECOLI_DATA CHILD
    JOIN GEN ON CHILD.PARENT_ID = GEN.ID -- 부모 ID가 윗 세대 ID와 동일하면 세대(DEPTH)정보 get해와서 위 SELECT문처럼 +1해주면 그 놈은 그 다음 세대가 되.
),

CHILD
AS (
    SELECT A.ID, COUNT(B.ID) NUM
    FROM ECOLI_DATA A -- 각 대장균(A.ID)과 그 대장균이 부모로서 가진 자식 대장균(B.ID)의 수(COUNT)를 계산
    LEFT JOIN ECOLI_DATA B
    ON A.ID=B.PARENT_ID -- A가 부모, B가 자식
    GROUP BY A.ID -- 부모 당 지니고 있는 자식 수를 그룹
)

-- 최종 결과 계산
-- 설
SELECT COUNT(*) AS COUNT, A.DEPTH AS GENERATION
FROM GEN A
JOIN CHILD B ON A.ID = B.ID -- 세대 정보를 계산한 GEN과, 부모 당 지니고 있는 자식 수를 계산한 CHILD를 ID로 조인
WHERE B.NUM = 0 -- 자식 수가 0 즉, 자식 세대가 없는 개체만 조회
GROUP BY A.DEPTH -- 세대별로 그룹화
ORDER BY A.DEPTH; 
