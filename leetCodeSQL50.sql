--leetcode sql 50

--q1
SELECT product_id FROM Products
where low_fats = 'Y' and recyclable = 'Y'

--q2
select Customer.name from Customer
where referee_id <> 2 or referee_id is NULL

--q3
select w.name,w.population,w.area from World w
where area >= 3000000 or w.population >= 25000000

--q4
SELECT DISTINCT author_id id from Views
where author_id = viewer_id
order by author_id asc

--q5
SELECT tweet_id
FROM Tweets
WHERE LENGTH(content) > 15;

--q6
Select eu.unique_id, e.name from Employees e
LEFT join EmployeeUNI eu on e.id = eu.id

--q7
Select p.product_name, s.year, s.price from Sales s
join Product p on s.product_id = p.product_id

--q8
SELECT v.customer_id, COUNT(*) AS count_no_trans FROM Visits v
LEFT join Transactions t on v.visit_id = t.visit_id
WHERE t.transaction_id is null
GROUP BY customer_id;

--q9
SELECT 
    w2.id
FROM 
    Weather w1, Weather w2
WHERE 
    DATEDIFF(w2.recordDate, w1.recordDate) = 1 
AND 
    w2.temperature > w1.temperature;

--q10
SELECT 
    machine_id, 
    ROUND(SUM(
        CASE 
            WHEN activity_type = 'end' THEN timestamp - prev_timestamp
            ELSE 0
        END) / COUNT(DISTINCT process_id), 3) AS processing_time
FROM (
    SELECT 
        machine_id, 
        process_id,
        activity_type, 
        timestamp,
        LAG(timestamp) OVER (PARTITION BY machine_id, process_id ORDER BY timestamp) AS prev_timestamp
    FROM Activity
) subquery
WHERE activity_type = 'end'
GROUP BY machine_id;

--q11
SELECT e.name, b.bonus FROM Employee e
left join Bonus b on e.empID = b.empID
where b.bonus < 1000 or b.bonus is null

--q12
SELECT 
    s.student_id, 
    s.student_name, 
    sb.subject_name,
    COUNT(e.subject_name) AS attended_exams
FROM 
    Students s
CROSS JOIN 
    Subjects sb
LEFT JOIN 
    Examinations e 
ON 
    e.student_id = s.student_id 
    AND e.subject_name = sb.subject_name
GROUP BY 
    s.student_id, 
    s.student_name, 
    sb.subject_name
ORDER BY 
    s.student_id, 
    sb.subject_name;


