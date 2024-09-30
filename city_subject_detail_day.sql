with city_data as (
select
school.city_code,
code,
count(DISTINCT username) as learner_num,
sum(play_duration) as play_duration,
sum(learn_num) as learn_num,
usdd.server_node,
usdd.dt
   dt
from
dwd.user_subject_detail_day usdd
join ods.sch_student ss on
usdd.username = ss.student_number
and usdd.server_node = ss.platform_code
join dim.area_school school on
ss.school_id = school.school_id
and ss.platform_code = school.server_node
where
usdd.dt = '${hivevar:dayValue}'
GROUP by
usdd.server_node,
usdd.dt ,
usdd.code,
school.city_code),
   county_dim as (
select
DISTINCT 
    city_code,
city_name,
    province_code,
province_name,
server_node
from
dim.area_school)
insert overwrite table dws.city_subject_detail_day partition(server_node,dt)
select 
    county_dim.province_code, 
    county_dim.province_name, 
    county_dim.city_code, 
    county_dim.city_name, 
    data.code, 
    sst.name, 
     sst.sections, 
     sst.subjects, 
    data.learner_num, 
    data.play_duration, 
    data.learn_num,
    county_dim.server_node,
    data.dt
    from county_dim  join city_data data on county_dim.server_node=data.server_node and county_dim.city_code=data.city_code
    left join dim.section_subject_template sst on data.code=sst.code;
