select count(*) from rawData;

-- Figure out the message types in this database.
select s_type, count(*) from rawData group by s_type;

-- Generate a list of distinct mmsi records for classA
select distinct mmsi, count(*) from classAPositionReport group by mmsi order by count(*) desc;

-- different order
select distinct mmsi, count(*) from classAPositionReport group by mmsi order by mmsi desc;

-- Try to combine the staticDataReport data with the distinct mmsi counts.
select A.mmsi, shipname
from classAPositionReport A
inner join staticDataReportA sDRA on A.mmsi = sDRA.mmsi;


select distinct mmsi from staticDataReportA order by mmsi desc;

select * from classAPositionReport where mmsi in (select mmsi from staticDataReportA);

-- group by mmsi order by count(*) desc;


-- For reference message type table
select * from aisMessageTypes;

-- Type 1, 2, 3
select * from classAPositionReport;

-- Type 4

select * from baseStationReport;

-- Type 5

select * from classAStaticVoyageData;

-- Type 9

select * from standardSARAircraftPositionReport;

-- Type 18

select * from classBPositionReport;

-- Type 19

select * from extendedClassBPositionReport;

-- Type 21

select * from aidToNavigationReport;

-- Type 24 (base)
select * from staticDataReport;

-- Type 24 A
select * from staticDataReport R, staticDataReportA A
where A.sentence_id = R.sentence_id;

-- Type 24 B
select * from staticDataReport R, staticDataReportB B
where R.sentence_id = B.sentence_id;


-- 338794000 ARS Independence - Underway

select * from classAPositionReport where mmsi=338794000 order by sentence_id;

select * from classAStaticVoyageData where mmsi=338794000;  -- None
select * from staticDataReportA where mmsi=338794000;  -- None
select * from staticDataReportB where mmsi=338794000;  -- None


-- Whats in port

-- 247405800 - GRANDE MORAFIORI

select * from classAPositionReport where mmsi=247405800;
select * from classAStaticVoyageData where mmsi=247405800; -- None
select * from staticDataReportA where mmsi=247405800; -- None
select * from staticDataReportB where mmsi=247405800; -- None

select * from rawFields;

select distinct(field5) from rawFields;


-- Find active classA mmsi's

select distinct mmsi, count(*), speed from classAPositionReport where speed > 0 group by mmsi order by  count(*) desc;

select * from classAPositionReport where mmsi=368926258;  -- This guy has a funky speed and status = 15
select * from classAPositionReport where mmsi=366902270;  -- Turns out 15 = undefined = default

select distinct status, count(*) from classAPositionReport group by status order by count(*) desc;

select mmsi, count(*) from classAPositionReport
where status=15
group by mmsi order by count(*) desc;