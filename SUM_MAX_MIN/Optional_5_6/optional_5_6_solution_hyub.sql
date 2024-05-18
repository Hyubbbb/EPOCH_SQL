-- # Table 1: ECOLI_DATA
--     # 최초의 대장균 개체의 PARENT_ID 는 NULL
-- # 분화된 연도(YEAR), 분화된 연도별 대장균 크기의 편차(YEAR_DEV), 대장균 개체의 ID(ID) 를 출력
--     # 분화된 연도별 대장균 크기의 편차는 분화된 연도별 가장 큰 대장균의 크기 - 각 대장균의 크기
--     # 결과는 연도에 대해 오름차순으로 정렬하고 같은 연도에 대해서는 대장균 크기의 편차에 대해 오름차순으로 정렬

-- # DIFFERENTIATION_DATE가 1월 1일만 있다고 풀면 틀리네

SELECT YEAR, (SIZE_MAX - SIZE_OF_COLONY) as YEAR_DEV, ID
FROM ECOLI_DATA d
JOIN (
    SELECT YEAR(DIFFERENTIATION_DATE) as YEAR, MAX(SIZE_OF_COLONY) as SIZE_MAX
    FROM ECOLI_DATA
    GROUP BY YEAR(DIFFERENTIATION_DATE)  
    ) as tmp on YEAR(d.DIFFERENTIATION_DATE) = YEAR

ORDER BY YEAR ASC, YEAR_DEV ASC
