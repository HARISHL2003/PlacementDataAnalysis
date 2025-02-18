select * from placementdata;
CREATE TABLE place_1 LIKE placementdata;
INSERT place_1 select *from placementdata;
select* from place_1;
select count(StudentID),avg(Projects),avg(Internships),avg(AptitudeTestScore) 
from place_1 
where PlacementStatus='Placed' and PlacementTraining='Yes';
select count(StudentID),avg(AptitudeTestScore) 
from place_1 
where PlacementStatus='Notplaced' and PlacementTraining='Yes';
alter table place_1 add column placedvalue INT;
alter table place_1 add column placedvalue2 INT;
ALTER TABLE place_1 DROP COLUMN placedvalue2;
Update place_1
set placedvalue=
case 
	when PlacementStatus='Placed' then 1
    when PlacementStatus='NotPlaced' Then 0
    else null
END;
select * from place_1;
select count(StudentID),avg(AptitudeTestScore) 
from place_1 
where Placedvalue=1;
SELECT projects, internships, COUNT(*) AS total_students

FROM place_1
where placedvalue=1
GROUP BY projects, internships
ORDER BY total_students DESC;

select avg(Projects) as stu
from place_1
where CGPA>=8.5 and placedvalue=0;
