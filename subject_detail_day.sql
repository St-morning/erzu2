with day_data as (
select
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
usdd.code)
insert overwrite table dws.subject_detail_day partition(server_node,dt)
select
data.code,
sst.name,
sst.sections,
sst.subjects,
data.learner_num,
data.play_duration,
data.learn_num,
data.server_node,
data.dt
from
 day_data data 
left join dim.section_subject_template sst on
data.code = sst.code;
