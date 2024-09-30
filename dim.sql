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
