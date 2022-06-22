select count(*) from rawData;

-- sorted by types
select s_type, count(*) from rawData group by s_type;

-- Summary of messages/reports in the rawData table.
select distinct s_type, count(*), t.name from rawData r, aisMessageTypes t
where t.message_id=r.s_type
group by s_type;

select * from aisMessageTypes;

-- Type 1, 2, 3
select * from classAPositionReport;

-- Type 4
select * from baseStationReport;

-- Type 5
select * from classAStaticVoyageData;
-- Type 18
select * from classBPositionReport;

-- Type 19
select * from extendedClassBPositionReport;

-- Type 21
select * from aidsToNavigationReport;
select * from aidsToNavigationTypes;

-- Type 24
select * from staticDataReport;
select * from staticDataReportA;
select * from staticDataReportB;