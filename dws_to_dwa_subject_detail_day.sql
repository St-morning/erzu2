insert overwrite table dwa.school_subject_detail_day SELECT school_id, school_name, school_flag, area_id, province_code, province_name, city_code, city_name, county_code, county_name, code, name, sections, subjects, learner_num, play_duration, learn_num, server_node, dt
FROM dws.school_subject_detail_day where dt='${hivevar:dayValue}';
insert overwrite table dwa.county_subject_detail_day SELECT province_code, province_name, city_code, city_name, county_code, county_name, code, name, sections, subjects, learner_num, play_duration, learn_num, server_node, dt
FROM dws.county_subject_detail_day where dt='${hivevar:dayValue}';
insert overwrite table dwa.city_subject_detail_day  SELECT province_code, province_name, city_code, city_name, code, name, sections, subjects, learner_num, play_duration, learn_num, server_node, dt
FROM dws.city_subject_detail_day where dt='${hivevar:dayValue}';
insert overwrite table dwa.province_subject_detail_day SELECT province_code, province_name, code, name, sections, subjects, learner_num, play_duration, learn_num, server_node, dt
FROM dws.province_subject_detail_day where dt='${hivevar:dayValue}';
insert overwrite table dwa.subject_detail_day SELECT code, name, sections, subjects, learner_num, play_duration, learn_num, server_node, dt
FROM dws.subject_detail_day where dt='${hivevar:dayValue}';
