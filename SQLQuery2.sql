Select i.CATEGORY1, SUM(O.LINETOTAL) LineTotal
from ITEMS i
join ORDERDETAILS o on o.ITEMID = i.ID
GROUP BY i.CATEGORY1
