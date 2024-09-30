with item_tag as (select item_code,
  concat_ws(",",
  collect_list(
  CASE WHEN tag_id='section' THEN enum_name ELSE NULL END
  )) as sections ,
  concat_ws(",",collect_list(CASE WHEN tag_id='subject' THEN enum_name ELSE NULL END)) as subjects 
from ods.t_urc_item_label where tag_id in ('section','subject')  and is_delete=0 
group by item_code)
INSERT OVERWRITE TABLE dim.section_subject_template select tuc.id,tuc.name,t.sections,t.subjects from ods.t_urc_catalogue tuc left join item_tag t on tuc.id=t.item_code;
