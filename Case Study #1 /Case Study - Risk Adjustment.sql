-- select * from eligibility 
-- select * from ip limit 10 
-- select * from lookup_diagnosis limit 10 
-- select * from lookup_drg limit 10 
-- select * from lookup_hcc limit 10 
 



-- admitting diagnoses 

drop table if exists admit_diag;
create temp table admit_diag as 
select distinct  
i.person_id, 
claim_id,
discharge_dt as lastdos, 
admit_days, 
admitting_diag as admit_dx,
case when h.hcc is not null then h.hcc else h.rxhcc end as hcc,
e.year,
round(e.riskscore,3) as riskscore 
from ip i
left join (select distinct trim(icd) as icd, hcc, rxhcc from lookup_hcc) h on i.admitting_diag = h.icd 
left join (select distinct person_id, year, riskscore from eligibility) e on i.person_id = e.person_id and substr(discharge_dt, 1, 4) = e.year
order by 1
;


select 
a.*,
case when y8.person_id <> '' and y8.person_id = y9.person_id and y8.hcc <> '' and y8.hcc = y9.hcc then 'Recapture'
     when y9.person_id <> '' and y9.person_id = y10.person_id and y9.hcc <> '' and y9.hcc = y10.hcc then 'Recapture'
     when a.hcc is null then 'No HCC'
     when a.hcc = '' then 'No HCC' 
     else 'New Condition' 
     end as condition_status,
case when a.hcc is null then 'No HCC'
     when a.hcc = '' then 'No HCC'  
     else a.person_id||'-'||a.hcc
     end as unique_hcc 
from admit_diag a
left join (select distinct person_id, hcc, year from admit_diag where year in ('2008') and hcc is not null) y8 on a.person_id = y8.person_id and a.hcc = y8.hcc 
left join (select distinct person_id, hcc, year from admit_diag where year in ('2009') and hcc is not null) y9 on a.person_id = y9.person_id and a.hcc = y9.hcc
left join (select distinct person_id, hcc, year from admit_diag where year in ('2010') and hcc is not null) y10 on a.person_id = y10.person_id and a.hcc = y10.hcc
;

-- inpatient diagnoses 

drop table if exists inp_diag;
create temp table inp_diag as 
select i.person_id, claim_id, discharge_dt as lastdos, admit_days, trim(diag1) as dx from ip i
union all  
select i.person_id, claim_id, discharge_dt as lastdos, admit_days, trim(diag2) as dx from ip i
union all 
select i.person_id, claim_id, discharge_dt as lastdos, admit_days, trim(diag3) as dx from ip i 
;


drop table if exists inp_diag2;
create temp table inp_diag2 as 
select distinct 
i.person_id, 
claim_id,
lastdos, 
admit_days, 
dx,
case when h.hcc is not null then h.hcc else h.rxhcc end as hcc,
e.year,
round(e.riskscore,3) as riskscore
from inp_diag i
left join (select trim(icd) as icd, hcc, rxhcc from lookup_hcc) h on i.dx = h.icd 
left join (select person_id, year, riskscore from eligibility) e on i.person_id = e.person_id and substr(lastdos, 1, 4) = e.year
order by 1
;


select distinct 
i.*,
case when y8.person_id <> '' and y8.person_id = y9.person_id and y8.hcc <> '' and y8.hcc = y9.hcc then 'Recapture'
     when y9.person_id <> '' and y9.person_id = y10.person_id and y9.hcc <> '' and y9.hcc = y10.hcc then 'Recapture' 
     when i.hcc is null then 'No HCC'
     when (i.hcc <> '') is not true then 'No HCC'
     else 'New Condition' 
     end as condition_status,
case when i.hcc is null then 'No HCC'
     when (i.hcc <> '') is not true then 'No HCC'
     else i.person_id||'-'||i.hcc
     end as unique_hcc 
from inp_diag2 i
left join (select distinct person_id, hcc, year from inp_diag2 where year in ('2008') and hcc is not null) y8 on i.person_id = y8.person_id and i.hcc = y8.hcc 
left join (select distinct person_id, hcc, year from inp_diag2 where year in ('2009') and hcc is not null) y9 on i.person_id = y9.person_id and i.hcc = y9.hcc
left join (select distinct person_id, hcc, year from inp_diag2 where year in ('2010') and hcc is not null) y10 on i.person_id = y10.person_id and i.hcc = y10.hcc
;





-- Revenue

select 
year,
person_id,
sum(months_in_yr) as member_months,
(sum(months_in_yr)*1000) as revenue,
round(avg(riskscore),3) as avg_riskscore,
'Estimated Revenue' as classification
from eligibility
group by 1,2
union all 
select distinct  
e.year,
i.person_id,
e.months_in_yr as member_months,
(sum(i.ip_paid)*1000) as revenue,
round(avg(e.riskscore),3) as avg_riskscore,
'Actual Revenue' as classification
from ip i
left join (select distinct year, person_id, months_in_yr, riskscore from eligibility) e 
on i.person_id = e.person_id and substr(i.discharge_dt, 1, 4) = e.year 
group by 1,2
order by 2 desc 
;
