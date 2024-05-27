-- 프로그래머스 업그레이드 할 수 없는 아이템 구하기
-- https://school.programmers.co.kr/learn/courses/30/lessons/273712

SELECT I.ITEM_ID, I.ITEM_NAME, I.RARITY
FROM ITEM_INFO AS I
-- 더 이상 업그레이드할 수 없는 아이템 : PARENT_ITEM_ID에 없는 ITEM_ID를 찾는다
WHERE NOT EXISTS (
                    SELECT *
                    FROM ITEM_TREE AS T
                    WHERE I.ITEM_ID = T.PARENT_ITEM_ID
)
ORDER BY I.ITEM_ID DESC