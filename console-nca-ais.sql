select count(*) from rawData;

-- Figure out the message types in this database.
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

select F.sentence_id, field5,  s_data from rawFields F, rawData D where F.sentence_id = D.sentence_id and field5='C';

select mmsi from classAPositionReport where sentence_id=79;

select field5 from rawFields where sentence_id in (select sentence_id from classAPositionReport where mmsi=273398890);


select mmsi from classAPositionReport where sentence_id=2902;
select field5 from rawFields where sentence_id in
    (select sentence_id from classAPositionReport where mmsi in (select mmsi from classAPositionReport where sentence_id=2902));

select field5 from rawFields where sentence_id in
    (select sentence_id from classAPositionReport where mmsi = 273457870);

select * from classAPositionReport where mmsi=273457870;

select * from rawFields f, classAPositionReport a where mmsi=273457870 and f.sentence_id=a.sentence_id;
select * from rawData where sentence_id in( 47369, 58242);

select s_data from rawData where sentence_id in (
select A.sentence_id from classAPositionReport A where mmsi=273457870);

select * from classAPositionReport where slotTimeout != 0;

select * from rawData where s_type=1;

select * from classAPositionReport;





