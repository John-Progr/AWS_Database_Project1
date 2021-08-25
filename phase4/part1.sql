CREATE TABLE Amenity AS(SELECT DISTINCT regexp_split_to_table(amenities,E'[,{}}{"]') as amenity_name  FROM room);
   

DELETE FROM Amenity WHERE amenity_name='';


ALTER  TABLE Amenity
ADD COLUMN amenity_id SERIAL PRIMARY KEY;


CREATE TABLE Room_Amenity AS(select listing_id,amenity_id
from (select Distinct regexp_split_to_table(amenities,E'[,{}}{"]') as amenity_name,listing_id
	 from Room) as temporary
inner join Amenity
on temporary.amenity_name=Amenity.amenity_name)


ALTER TABLE Room_Amenity
ADD CONSTRAINT PK_Room_Amenity PRIMARY KEY (listing_id,amenity_id);

ALTER TABLE Room_Amenity
ADD FOREIGN KEY (listing_id) REFERENCES Room(listing_id);

ALTER TABLE Room_Amenity
ADD FOREIGN KEY (amenity_id) REFERENCES Amenity(amenity_id);


ALTER TABLE Room
DROP COLUMN amenities;



