# Table 1: ITEM_INFO

# Table 2: ITEM_TREE

# 아이템 ID(ITEM_ID), 아이템 명(ITEM_NAME)을 출력
    # 아이템 ID를 기준으로 오름차순 정렬

SELECT i.ITEM_ID, i.ITEM_NAME
FROM ITEM_INFO as i
    JOIN ITEM_TREE as t on i.ITEM_ID = t.ITEM_ID
    WHERE PARENT_ITEM_ID IS NULL
ORDER BY i.ITEM_ID ASC
