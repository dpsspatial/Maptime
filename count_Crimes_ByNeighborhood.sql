--optional create table
--be sure to uncomment ) at bottom of file

--create table maptime.nhoods_crime_count as (



select 
counts.nbhd_id
, counts.count
, h.geom

from (
	select 
	h.nbhd_id
	, count(*) as count
	from maptime.crime as c
	join maptime.neighborhoods as h on ST_Intersects(c.geom, h.geom)
	group by h.nbhd_id

) as counts

join maptime.neighborhoods as h on counts.nbhd_id = h.nbhd_id

--)

--to drop table
--drop table maptime.nhoods_crime_count

