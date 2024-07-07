Select u.GENDER, SUM(O.TOTALPRICE) from ORDERS o
join USERS u on u.ID = o.USERID
group by u.GENDER
