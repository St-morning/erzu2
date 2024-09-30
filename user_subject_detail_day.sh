#!/bin/bash
#today固定格式yyyyMMdd,且无法直接用${system.biz.date}
startday=$1

dt="$( date -d "${startday}" +%Y-%m-%d )"
echo "执行日期$dt"
sudo -u hdfs hive  --hivevar dayValue=$dt  --hiveconf hive.exec.dynamic.partition.mode=nonstrict  -f user_subject_detail_day.sql
