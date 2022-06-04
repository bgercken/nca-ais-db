select count(*) from rawData;

-- Figure out the message types in this database.
select s_type, count(*) from rawData group by s_type;

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

-- Type 24

select * from staticDataReport;

select * from staticDataReport R, staticDataReportA A
where A.sentence_id = R.sentence_id;

select * from staticDataReport R, staticDataReportB B
where R.sentence_id = B.sentence_id;
