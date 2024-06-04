-- 아래처럼 작성했다가 한 카테고리에 해당하는 모든 기술에 대한 합일 수도, 일부의 합일 수도, 하나일 수도, 여러 카테고리에 해당하는 기술들 간의 합일 수도 있다는 것을 깨닫고 뇌정지옴

SELECT ID, EMAIL, FIRST_NAME, LAST_NAME
FROM DEVELOPERS
WHERE SKILL_CODE = (SELECT SUM(CODE)
                    FROM SKILLCODES
                    WHERE CATEGORY = 'Front End')
ORDER BY ID;
