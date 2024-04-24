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
