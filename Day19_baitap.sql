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

