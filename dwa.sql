create database IF NOT EXISTS dwa;
use dws;
drop table IF EXISTS dwa.school_subject_detail_day;
create table IF NOT EXISTS dwa.school_subject_detail_day (
   school_id            string comment '学校ID',
   school_name          string comment '学校名称',
   school_flag          string comment '学校分类：1 正式  0 测试 2虚拟',
   area_id              string comment '区域ID',
   province_code        string comment '省ID',
   province_name        string comment '省名称',
   city_code            string comment '市ID',
   city_name            string comment '市名称',
   county_code          string comment '区县ID',
   county_name          string comment '区县名称',
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数',
   server_node 	string comment '区域平台标识', 
   dt string comment '按天分区'   
)
comment '学校学科产品每日汇总表';




drop table IF EXISTS dwa.county_subject_detail_day;
create table IF NOT EXISTS dwa.county_subject_detail_day (
   province_code        string comment '省ID',
   province_name        string comment '省名称',
   city_code            string comment '市ID',
   city_name            string comment '市名称',
   county_code          string comment '区县ID',
   county_name          string comment '区县名称',
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数', 
   server_node 	string comment '区域平台标识', 
   dt string comment '按天分区'   
)
comment '区县学科产品每日汇总表';


drop table IF EXISTS dwa.city_subject_detail_day;
create table IF NOT EXISTS dwa.city_subject_detail_day (
   province_code        string comment '省ID',
   province_name        string comment '省名称',
   city_code            string comment '市ID',
   city_name            string comment '市名称',
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数',
   server_node 	string comment '区域平台标识',
   dt string comment '按天分区'   
)
comment '地市学科产品每日汇总表';


drop table IF EXISTS dwa.province_subject_detail_day;
create table IF NOT EXISTS dwa.province_subject_detail_day (
   province_code        string comment '省ID',
   province_name        string comment '省名称',
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数', 
  server_node 	string comment '区域平台标识',
  dt string comment '按天分区'   
)
comment '省州学科产品每日汇总表';


drop table IF EXISTS dwa.subject_detail_day;
create table IF NOT EXISTS dwa.subject_detail_day (
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数',
  server_node	string comment '区域平台标识',
 dt string comment '按天分区'   
)
comment '学科产品每日汇总表';

