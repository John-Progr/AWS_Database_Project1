ALTER TABLE Listings
ADD PRIMARY KEY (id);


/*calendar has rows with duplicates so we have to delete them*/
CREATE TABLE calendarNoDuplicates as(SELECT *,
         ROW_NUMBER() OVER( PARTITION BY listing_id,date
        ORDER BY  listing_id ) AS row_num from calendar)
		
		
		
delete from calendarNoDuplicates
where row_num>1


ALTER TABLE calendarNoDuplicates
DROP COLUMN row_num;


DROP TABLE Calendar

ALTER TABLE calendarNoDuplicates
RENAME TO Calendar;

ALTER TABLE Calendar
ADD CONSTRAINT PK_Calendar PRIMARY KEY (listing_id,date);


ALTER TABLE neighbourhoods
ADD PRIMARY KEY (neighbourhood);

ALTER TABLE Listings_Summary
ADD PRIMARY KEY (id);

ALTER TABLE Reviews
ADD PRIMARY KEY(id)

CREATE TABLE RSNoDuplicates as(SELECT *,
         ROW_NUMBER() OVER( PARTITION BY listing_id,date
        ORDER BY  listing_id ) AS row_num from Reviews_summary)
		
delete from RSNoDuplicates
where row_num>1


ALTER TABLE RSNoDuplicates
DROP COLUMN row_num;


DROP TABLE Reviews_summary

ALTER TABLE RSNoDuplicates
RENAME TO Reviews_summary;

ALTER TABLE reviews_summary
ADD CONSTRAINT PK_Reviews_Summary PRIMARY KEY (listing_id,date);

alter table Geolocation
Add primary key(properties_neighbourhood)

ALTER TABLE Reviews_Summary
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE Listings_Summary
ADD FOREIGN KEY (id) REFERENCES Listings(id);

ALTER TABLE Reviews
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);
		

ALTER TABLE Calendar
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);


ALTER TABLE Listings
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES Neighbourhoods(neighbourhood);

alter table Geolocation
add foreign key(properties_neighbourhood) REFERENCES Neighbourhoods(neighbourhood);


		




