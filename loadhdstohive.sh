#!/bin/bash

#today固定格式yyyyMMdd,且无法直接用${system.biz.date}

startday=$1


dt="$( date -d "${startday}" +%Y-%m-%d )"

echo "执行日期$dt"

hive -e "alter table ods.ods_log add PARTITION(dt='$dt') location '/data/hive/warehouse/ods.db/ods_log/dt=$dt'"