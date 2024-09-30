create database IF NOT EXISTS dim;
use dim;
drop table IF EXISTS dim.area_school;
create table IF NOT EXISTS dim.area_school (
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
   server_node          string comment '渠道编码'
)
comment '学校维度表';

drop table IF EXISTS dim.section_subject_template;
CREATE TABLE IF NOT EXISTS dim.section_subject_template (
   code                   	string comment '学科产品编码',
   name                		string comment '学科产品名称',
   sections                 string comment '学科产品学段',
   subjects              	string comment '学科产品学科'
)
comment '学科产品学段学科维度表';


create database IF NOT EXISTS dwd;
use dwd;
drop table IF EXISTS dwd.user_subject_detail_day;
CREATE TABLE IF NOT EXISTS dwd.user_subject_detail_day(
	username	string comment '学生账号',
	code		string comment '学科产品编码',
	client_type string comment '终端类型',
	play_duration BIGINT comment '学习时长',
	learn_num	BIGINT comment '学习次数'
) 
comment '学生学科产品每日汇总表'
partitioned by (server_node 	string comment '区域平台标识', dt string comment '按天分区');

create database IF NOT EXISTS dws;
use dws;
drop table IF EXISTS dws.school_subject_detail_day;
create table IF NOT EXISTS dws.school_subject_detail_day (
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
   learn_num			BIGINT comment '学习次数'  
)
comment '学校学科产品每日汇总表'
partitioned by (server_node 	string comment '区域平台标识', dt string comment '按天分区');



drop table IF EXISTS dws.county_subject_detail_day;
create table IF NOT EXISTS dws.county_subject_detail_day (
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
   learn_num			BIGINT comment '学习次数'    
)
comment '区县学科产品每日汇总表'
partitioned by (server_node 	string comment '区域平台标识', dt string comment '按天分区');

drop table IF EXISTS dws.city_subject_detail_day;
create table IF NOT EXISTS dws.city_subject_detail_day (
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
   learn_num			BIGINT comment '学习次数'    
)
comment '地市学科产品每日汇总表'
partitioned by (server_node 	string comment '区域平台标识', dt string comment '按天分区');

drop table IF EXISTS dws.province_subject_detail_day;
create table IF NOT EXISTS dws.province_subject_detail_day (
   province_code        string comment '省ID',
   province_name        string comment '省名称',
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数'    
)
comment '省州学科产品每日汇总表'
partitioned by (server_node 	string comment '区域平台标识', dt string comment '按天分区');

drop table IF EXISTS dws.subject_detail_day;
create table IF NOT EXISTS dws.subject_detail_day (
   code                 string comment '学科产品编码',
   name                	string comment '学科产品名称',
   sections             string comment '学科产品学段',
   subjects             string comment '学科产品学科',
   learner_num 			BIGINT comment '学习人数',
   play_duration 		BIGINT comment '学习时长',
   learn_num			BIGINT comment '学习次数'    
)
comment '学科产品每日汇总表'
partitioned by (server_node	string comment '区域平台标识', dt string comment '按天分区');



