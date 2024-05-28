select year(sales_date) as YEAR,
        month(sales_Date) as MONTH,
        count(distinct user_id) as PURCHASE_USERS,
        round(count(distinct user_id)/ (select count(distinct user_id)
                                        from user_info
                                        where year(joined) = '2021'), 1) as PURCAHSE_RATIO
from online_sale
where user_id in (select distinct user_id 
                  from user_info
                  where year(joined) = '2021')
group by month(sales_Date)
order by YEAR asc, MONTH asc
