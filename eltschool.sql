with province as (
select
DISTINCT ca.area_id as province_id,
ca.fullname as province_name
from
ods.cfg_area ca
where
ca.level_flg = 1
and FLAG = 1),
  city as (
select
DISTINCT city_item.area_id as city_id,
city_item.fullname as city_name,
p.province_id as province_id,
p.province_name as province_name
from
ods.cfg_area city_item
left join province p
on
city_item.fid = p.province_id
where
city_item.level_flg = 2
and city_item.FLAG = 1),
county as (
select
DISTINCT county_item.area_id as county_id,
county_item.fullname as county_name,
c.city_id,
c.city_name,
c.province_id,
c.province_name
from
ods.cfg_area county_item
left join city c on
county_item.fid = c.city_id
where
county_item.level_flg = 3
and county_item.FLAG = 1)
INSERT OVERWRITE TABLE dim.area_school
select
DISTINCT s.school_id,
s.school_name,
s.school_flag ,
s.area_id ,
 c.province_id,
c.province_name,
c.city_id,
c.city_name,
        c.county_id,
c.county_name,
s.platform_code 
from
ods.sch_school s
left join county c on
s.area_id = c.county_id;
