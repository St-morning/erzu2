#!/bin/bash
#today固定格式yyyyMMdd,且无法直接用${system.biz.date}
startday=$1
dt="$( date -d "${startday}" +%Y-%m-%d )"
echo "执行日期$dt 学校学科产品每日汇总表  dws.school_subject_detail_day"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f  school_subject_detail_day.sql

echo "执行日期$dt 区县学科产品每日汇总表 dws.county_subject_detail_day"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f  county_subject_detail_day.sql

echo "执行日期$dt 地市学科产品每日汇总表  dws.city_subject_detail_day"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f  city_subject_detail_day.sql

echo "执行日期$dt 省学科产品每日汇总表 dws.province_subject_detail_day"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f  province_subject_detail_day.sql

echo "执行日期$dt 学科产品每日汇总表  subject_detail_day"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f  subject_detail_day.sql
