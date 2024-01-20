-- Bài 1
select distinct city from station
where ID%2 = 0
--Bài 2
select count(city) - count(distinct city) from station
--Bài 4
--Bước 1: Phân tích yêu cầu
--1 output(gốc/phát sinh): mean = tổng items/số đơn hàng
--2 input
--3 điều kiện lọc theo trường nào (gốc/phát sinh)
SELECT 
round(CAST(sum(item_count*order_occurrences)/sum(order_occurrences) as decimal),1) as mean
FROM items_per_order;
--Bài 5
--Bước 1: Phân tích yêu cầu
--1 output(gốc/phát sinh): candidate_id
--2 input
--3 điều kiện lọc theo trường nào (gốc/phát sinh)
SELECT candidate_id
FROM candidates
WHERE skill in ('Python','Tableau','PostgreSQL')
GROUP BY(candidate_id)
having COUNT(skill) =3
-- Bài 6
--Bước 1: Phân tích yêu cầu
--1 output(gốc/phát sinh): user_id, days_between = max(day)-min(day)
--2 input
--3 điều kiện lọc theo trường nào (gốc/phát sinh)
SELECT user_id, 
date(max(post_date))-date(min(post_date)) as days_between
FROM posts
where post_date >= '2021-01-01' and post_date < '2022-01-01'
group by user_id
having count(post_id)>=2
--Bài 7
--1 output(gốc/phát sinh): card_name, difference
--2 input
--3 điều kiện lọc theo trường nào (gốc/phát sinh)
SELECT card_name,
max(issued_amount) - min(issued_amount) as difference
FROM monthly_cards_issued
GROUP BY card_name
order by difference DESC
--Bài 8
--1 output(gốc/phát sinh): manufacturer, drug_count, total_loss
--2 input
--3 điều kiện lọc theo trường nào (gốc/phát sinh): total_sales<cogs
SELECT manufacturer,
count(drug) as drug_count,
sum(cogs-total_sales) as total_loss
FROM pharmacy_sales
where total_sales<cogs
GROUP BY manufacturer
ORDER BY total_loss DESC
--Bài 9
select*from cinema
where id%2=1 and description <> 'boring'
order by rating desc
--Bài 10
select teacher_id,
count(distinct subject_id) as cnt
from teacher
group by teacher_id
--Bài 11
select user_id ,
count(follower_id) as followers_count
from Followers
group by user_id
order by user_id
--Bài 12
select class from Courses
group by class
having count(student)>=5

