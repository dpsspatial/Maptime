--get list of crime types
--select distinct crime_type from maptime.crime

--count crimes by type, sort in descending order using a subquery

select * from (
	select 
	crime_type 
	, count(*) as count
	from maptime.crime
	group by crime_type
) as counts
order by counts.count desc