#!/bin/bash
#today固定格式yyyyMMdd,且无法直接用${system.biz.date}
startday=$1
dt="$( date -d "${startday}" +%Y-%m-%d )"
echo "执行日期$dt"
sudo -u hdfs hive  --hivevar dayValue=$dt    -f  dws_to_dwa_subject_detail_day.sql
