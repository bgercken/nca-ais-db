select count(*) from rawData;


select s_type, count(*) from rawData group by s_type;

select count(*) from rawData where hasError=1;

-- Summary of messages/reports in the rawData table.
select distinct s_type, count(*), t.name from rawData r, aisMessageTypes t
where t.message_id=r.s_type
group by s_type;

select distinct mmsi from classBPositionReport;

select * from aisMessageTypes;


select mmsi, count(*) from classAPositionReport group by mmsi
order by count(*) desc ;

select mmsi, count(*) from classBPositionReport group by mmsi
order by count(*) desc ;

select * from rawFields;

-- Test Table 4
--  Field2 - Has value of 1 if message is of type 1, 2, 3,  or 18
--

select field1, field2, field5, d.s_type
from rawFields r, rawData d
where d.sentence_id = r.sentence_id
and d.s_type in (1, 2, 3, 18);

-- Same as last specifically checking field2 != 1

select field1, field2, field5, d.s_type
from rawFields r, rawData d
where d.sentence_id = r.sentence_id
and d.s_type in (1, 2, 3, 18)
and r.field2 not in ('1');

-- Field3 - Has value of 1 if message is of type 1, 2, 3, 4, 18 or 24

select field1, field3, field5, d.s_type
from rawFields r, rawData d
where d.sentence_id = r.sentence_id
and d.s_type in (1, 2, 3, 18, 24);

select field1, field3, field5, d.s_type
from rawFields r, rawData d
where d.sentence_id = r.sentence_id
and d.s_type in (1, 2, 3, 18, 24)
and r.field3 not in ('1');

-- class a report field 2
select field1, field2 from rawFields r, classAPositionReport a
where a.sentence_id = r.sentence_id;

-- check class b report field 2 == 1
select field1, field2, field5, d.s_type
from rawFields r, classBPositionReport b, rawData d
where b.sentence_id = r.sentence_id
and d.s_type=18;

-- list class b report field2 != 1 (should be no results)
select field1, field2, field5, d.s_type
from rawFields r, classBPositionReport b, rawData d
where b.sentence_id = r.sentence_id
and d.s_type=18 and r.field2 != 1;

select * from rawFields;

select sentence_id, field5 from rawFields where field5 not in ('A', 'B');


select count(*) from rawData;

-- message type
select distinct field1 from rawFields;
-- repeat indicator
select distinct field2 from rawFields;
-- fragment number
select distinct field3 from rawFields;
-- sequential message id
select distinct field4 from rawFields;
-- radio channel
select distinct field5 from rawFields;


-- looking for a correlation between radio channel C and the data
select f.sentence_id, field1, field5, s_data from rawFields f, rawData d
where f.sentence_id = d.sentence_id
and field5 not in ('A', 'B');

select * from classAPositionReport;
-- check msg_type (msgID)
select distinct msg_type from classAPositionReport;

select distinct s_type, count(*) from rawData group by s_type;


-- staticDataReports
select * from staticDataReport;

select count(*) from rawData where s_type=24;

select * from staticDataReportA;

select * from staticDataReport r, staticDataReportA a
where r.sentence_id=a.sentence_id;

select * from staticDataReport where sentence_id=3600;

select * from staticDataReportA where rowid=100;

select * from staticDataReport r, staticDataReportA a where r.sentence_id=3600 and a.sentence_id=3600;
