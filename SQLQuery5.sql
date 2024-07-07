Select 
C.CITY, avg(DATEDIFF(HOUR,o.DATE_,i.DATE_)) zaman
from ORDERS o
join INVOICES i on O.ID = İ.ORDERID 
join ADDRESS a on a.ID = o.ADDRESSID
join CITIES c on c.ID = a.CITYID
group by C.CITY
ORDER BY zaman asc