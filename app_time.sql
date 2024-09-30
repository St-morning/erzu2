with q1_data as

(select

a.username ,

a.event_id,

a.device_info,

a.operating_system,

a.system_version,

a.resolution,

a.client_type,

a.data_type,

a.start_time,

b.code,

a.name,

b.type,

a.rformat,

a.bytes_count,

b.play_duration,

a.catalogue_id,

a.book_id,

a.local_type,

a.scene_type,

a.scope,

a.course_type,

a.live_type,

a.source,

b.extend_info,

a.plat_id,

ol.dt

FROM ods.ods_log ol

LATERAL VIEW json_tuple(ol.original_data, 'common','content') item AS common,content

LATERAL VIEW json_tuple(item.common,  'username','event_id', 'device_info', 'operating_system', 'system_version', 'resolution', 'client_type', 'data_type', 'start_time', 'name', 'rformat', 'bytes_count', 'catalogue_id', 'book_id', 'local_type', 'scene_type', 'scope', 'course_type', 'live_type','source','plat_id') a as username, event_id, device_info, operating_system, system_version, resolution, client_type, data_type, start_time, name, rformat, bytes_count, catalogue_id, book_id, local_type, scene_type, scope, course_type, live_type,source,plat_id

LATERAL VIEW json_tuple(item.content,  'code','type','play_duration','extend_info') b as  code,type,play_duration,extend_info

where ol.dt ='${hiveconf:dayValue}' and a.data_type='subject_app_time')

INSERT OVERWRITE TABLE ods.ods_log_subject_app_time PARTITION(server_node, dt)

select  a.username,

a.event_id,

a.device_info,

a.operating_system,

a.system_version,

a.resolution,

a.client_type,

a.data_type,

a.start_time,

a.code,

a.name,

a.type,

a.rformat,

a.bytes_count,

a.play_duration,

a.catalogue_id,

a.book_id,

a.local_type,

a.scene_type,

a.scope,

a.course_type,

a.live_type,

a.source,

a.extend_info,

tpp.area_node as server_node,

a.dt

from q1_data a inner join ods.t_protal_platform tpp on a.plat_id=tpp.domain_name
