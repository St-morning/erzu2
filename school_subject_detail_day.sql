with school_item as (select 
   school_id,
   code,  
   count(DISTINCT username) as learner_num,
   sum(play_duration) as play_duration,
   sum(learn_num) as learn_num,
   server_node ,
   dt
  from dwd.user_subject_detail_day usdd 
  join ods.sch_student ss on usdd.username =ss.student_number  and usdd.server_node=ss.platform_code
  where usdd.dt='${hivevar:dayValue}'
  GROUP  by
  usdd.server_node ,
  usdd.dt ,
  usdd.code ,
  ss.school_id )
  insert overwrite table  dws.school_subject_detail_day partition(server_node,dt)
  select 
  school.school_id, 
  school.school_name, 
  school.school_flag, 
  school.area_id, 
  school.province_code, 
  school.province_name, 
  school.city_code, 
  school.city_name, 
  school.county_code, 
  school.county_name, 
  data.code, 
  sst.name, 
  sst.sections, 
  sst.subjects, 
  data.learner_num, 
  data.play_duration, 
  data.learn_num,
  data.server_node, 
  data.dt
  from dim.area_school school  left join school_item data   on data.school_id=school.school_id  
  left join dim.section_subject_template sst on data.code=sst.code 
  where data.server_node=school.server_node
