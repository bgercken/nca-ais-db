select count(*) from rawData;


select s_type, count(*) from rawData group by s_type;

select count(*) from rawData where hasError=1;


select distinct s_type, count(*), t.name from rawData r, aisMessageTypes t
where t.message_id=r.s_type
group by s_type;

select distinct mmsi from classBPositionReport;


select mmsi, count(*) from classAPositionReport group by mmsi
order by count(*) desc ;

select mmsi, count(*) from classBPositionReport group by mmsi
order by count(*) desc ;

select field1, field2 from rawFields r, classAPositionReport a
where a.sentence_id = r.sentence_id
and r.field2 != '1';


