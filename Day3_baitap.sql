---baitap1
select Name FROM City
where population>120000 and countrycode = 'USA'
---baitap2
select Name FROM City
where population>120000 and countrycode = 'USA'
---baitap3
select CITY, STATE FROM station
---baitap4
select distinct  city from station
where city like 'a%' or city like 'e%' or city like 'i%' or city like 'o%' or city like 'u%' 
---baitap5
select distinct city from station
where city like '%a' or city like '%e' or city like '%i' or city like '%o' or city like '%u'
---baitap6
select distinct city from station
where city not like 'a%' and city not like 'e%' and city not like 'i%' and city not like 'o%' and city not like 'u%' 
---baitap7
select name from employee
order by name
---baitap8
select name from employee
where salary>2000 AND months <10
order by employee_id
---baitap9
select product_id from Products
where low_fats = 'Y' AND recyclable = 'Y'
---baitap10
select name from customer
where referee_id !='2'
---baitap11
select product_id from Products
where low_fats = 'Y' AND recyclable = 'Y'
---baitap12
select distinct author_id as id from views
where article_id>1
order by author_id ASC
---baitap13
select part from parts_assembly
where finish_date is NULL
---BAITAP14
select advertising_channel From uber_advertising
where money_spent > 100000 and YEAR IN (2019)
---baitap15
select advertising_channel From uber_advertising
where money_spent > 100000 and YEAR IN (2019)
