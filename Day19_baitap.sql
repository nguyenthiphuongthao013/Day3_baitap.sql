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
CACH1
select * from public.sales_dataset_rfm_prj
where ORDERNUMBER is null and QUANTITYORDERED is null 
and PRICEEACH is null and ORDERLINENUMBER is null and SALES is null and ORDERDATE is null;
CACH2
select * from public.sales_dataset_rfm_prj_clean
WHERE TRIM(ADDRESSLINE2) LIKE ''

Bai3
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN CONTACTLASTNAME VARCHAR
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN CONTACTFIRSTNAME VARCHAR
UPDATE public.sales_dataset_rfm_prj
SET CONTACTLASTNAME = substring(contactfullname FROM 1 FOR POSITION('-' IN contactfullname)-1)
UPDATE public.sales_dataset_rfm_prj
SET CONTACTFIRSTNAME = substring(contactfullname FROM POSITION('-' IN contactfullname)+1)
UPDATE public.sales_dataset_rfm_prj_clean
SET contactlastname=UPPER(LEFT(contactlastname,1))||LOWER(SUBSTRING(contactlastname,2));
UPDATE public.sales_dataset_rfm_prj_clean
SET contactfirstname=UPPER(LEFT(contactfirstname,1))||LOWER(SUBSTRING(contactfirstname,2));

Bai4
ALTER TABLE public.sales_dataset_rfm_prj
ADD COLUMN QTR_ID DATE,
ADD COLUMN MONTH_ID DATE,
ADD COLUMN YEAR_ID DATE

Bai5
WITH CTE AS 
(SELECT Q1-1.5*IQR AS MIN_VALUE, Q3+1.5*IQR AS MAX_VALUE FROM (
SELECT 
PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY QUANTITYORDERED) AS Q1,
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY QUANTITYORDERED) AS Q3,
PERCENTILE_CONT(0.75) WITHIN GROUP (ORDER BY QUANTITYORDERED) - PERCENTILE_CONT(0.25) WITHIN GROUP (ORDER BY QUANTITYORDERED) AS IQR
FROM public.sales_dataset_rfm_prj_clean) as A)
select * from public.sales_dataset_rfm_prj_clean
where QUANTITYORDERED < (select MIN_VALUE from CTE)
or QUANTITYORDERED >(select MAX_VALUE from CTE)

Bai6
ALTER TABLE public.sales_dataset_rfm_prj
RENAME TO SALES_DATASET_RFM_PRJ_CLEAN
