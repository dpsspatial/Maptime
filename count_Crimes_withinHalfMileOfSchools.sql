select 
s.name
, data.count
from (
	select 
	count.orig_fid
	, count(*) as count
	from (
		select
		s.orig_fid
		 from maptime.schools as s
		join maptime.crime as c 
		on ST_DWithin(ST_Transform(c.geom, 2877), ST_Transform(s.geom, 2877), 2640)
		where c.crime_type = 'liquor-possession'
	) as count --alias subquery doing the counting
	group by count.orig_fid
) as data --alias subquery so we can order the counts and add the school information, including geometry if needed!
join maptime.schools as s on data.orig_fid = s.orig_fid

 order by data.count desc