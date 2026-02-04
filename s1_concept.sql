select * from product where brand='Samsung' or brand='Sony';
select * from product where not brand ='Samsung';
-- comparison + logical
select * from product where (brand='puma' or brand='allen solly') and price<700;
select * from product where brand ='puma' or (brand='allen solly' and price<700);
-- like operator
select * from customer where customer_name like 'a%';
select * from customer where customer_name like '__a%'; -- prints the name only with 3rd letter as a . denote with two underscore before
select * from rating where review like '%good%'; -- filtering if there is a word good in the review anywhr
-- IN operator for multiple filtering, null operator
select * from customer where city in ('Noida','Bangalore','Goa','Hyderabad'); -- not in 
select * from customer where phone_number is null;
-- string functions (upper, lower, reverse, concat, substring)
select * from customer where upper(customer_name)='KABIR IYER'; -- for case sensitive queries, lower()
select reverse('adam');
select concat(category_id,", ",category_name) as info from category;
select left(customer_name,3) from customer; -- or
select substr(customer_name,1,3) 'ABB' from customer;
select city,  substr(city,-3,2) from customer; -- column, start position, length to go on from
-- date funcitons
select order_date from retail.order;
select * from `order` where month(order_date) = month(curdate()) and year(order_date)=year(curdate());
select * from `order` where month(order_date) = 12 and year(order_date)=2024;
select curdate(); -- todays date
select now(); -- todays date and time now
select date_format(order_date,'%D %M %Y') from retail.order;

select concat(brand,", ",price) as INFO from product;
select order_id, customer_id, date_format(order_date, '%Y %M %D') as order_date, total_amount from `order` where month(order_date)=12 and year(order_date)=2024;
select upper(customer_name) as 'Customer Name' from customer;
select upper(substr(product_name,1,2)) as 'Product Code' from product;

