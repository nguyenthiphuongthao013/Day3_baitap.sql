Bai1
ALTER TABLE public.sales_dataset_rfm_prj
ALTER COLUMN priceeach TYPE numeric USING (trim(priceeach)::numeric),
ALTER COLUMN ordernumber TYPE numeric USING (trim(ordernumber)::numeric),
ALTER COLUMN quantityordered TYPE numeric USING (trim(quantityordered)::numeric),
ALTER COLUMN orderlinenumber TYPE numeric USING (trim(orderlinenumber)::numeric),
ALTER COLUMN sales TYPE numeric USING (trim(sales)::numeric),
ALTER COLUMN msrp TYPE numeric USING (trim(msrp)::numeric),
ALTER COLUMN orderdate TYPE TIMESTAMP USING (trim(orderdate)::TIMESTAMP);
Bai2
select * from public.sales_dataset_rfm_prj
where ORDERNUMBER is null and QUANTITYORDERED is null 
and PRICEEACH is null and ORDERLINENUMBER is null and SALES is null and ORDERDATE is null;
Bai3

