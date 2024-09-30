ip="10.151.1.28"
port="4417"
servername="statistic"
username="ceshi"
password="Vcom@123456"

echo '-------------- 导出 dwa.school_subject_detail_day 表到msyql ------------------------------'
sudo -u hdfs sqoop export \
--connect "jdbc:mysql://${ip}:${port}/${servername}?useUnicode=true&characterEncoding=utf-8" \
--username ${username} \
--password ${password}  \
--fields-terminated-by '\001'  \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-update-mode allowinsert  \
--table school_subject_detail_day \
--update-key school_id,area_id,code,server_node,dt \
--export-dir /data/hive/warehouse/dwa.db/school_subject_detail_day 

echo '-------------- 导出 dwa.county_subject_detail_day表到msyql ------------------------------'
sudo -u hdfs sqoop export \
--connect "jdbc:mysql://${ip}:${port}/${servername}?useUnicode=true&characterEncoding=utf-8" \
--username ${username} \
--password ${password}  \
--fields-terminated-by '\001'  \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-update-mode allowinsert  \
--table county_subject_detail_day \
--update-key province_code,city_code,county_code,code,server_node,dt \
--export-dir /data/hive/warehouse/dwa.db/county_subject_detail_day

echo '-------------- 导出 dwa.city_subject_detail_day表到msyql ------------------------------'
sudo -u hdfs sqoop export \
--connect "jdbc:mysql://${ip}:${port}/${servername}?useUnicode=true&characterEncoding=utf-8" \
--username ${username} \
--password ${password}  \
--fields-terminated-by '\001'  \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-update-mode allowinsert  \
--table city_subject_detail_day \
--update-key province_code,city_code,code,server_node,dt \
--export-dir /data/hive/warehouse/dwa.db/city_subject_detail_day


echo '-------------- 导出 dwa.province_subject_detail_day表到msyql ------------------------------'
sudo -u hdfs sqoop export \
--connect "jdbc:mysql://${ip}:${port}/${servername}?useUnicode=true&characterEncoding=utf-8" \
--username ${username} \
--password ${password}  \
--fields-terminated-by '\001'  \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-update-mode allowinsert  \
--table province_subject_detail_day \
--update-key province_code,code,server_node,dt \
--export-dir /data/hive/warehouse/dwa.db/province_subject_detail_day

echo '-------------- 导出 dwa.subject_detail_day表到msyql ------------------------------'
sudo -u hdfs sqoop export \
--connect "jdbc:mysql://${ip}:${port}/${servername}?useUnicode=true&characterEncoding=utf-8" \
--username ${username} \
--password ${password}  \
--fields-terminated-by '\001'  \
--input-null-string '\\N' \
--input-null-non-string '\\N' \
-update-mode allowinsert  \
--table subject_detail_day \
--update-key code,server_node,dt \
--export-dir /data/hive/warehouse/dwa.db/subject_detail_day
