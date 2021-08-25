create table Location AS(Select id as listing_id, street, neighbourhood, neighbourhood_cleansed, city, state,
zipcode, market, smart_location, country_code, country, latitude, longitude,
is_location_exact from listings);


ALTER TABLE Location
ADD FOREIGN KEY (id) REFERENCES Listings(id)


ALTER TABLE Listings
DROP CONSTRAINT  listings_neighbourhood_cleansed_fkey;

ALTER TABLE location
ADD FOREIGN KEY (neighbourhood_cleansed) REFERENCES neighbourhoods(neighbourhood);

ALTER TABLE Location
ADD FOREIGN KEY (listing_id) REFERENCES Listings(id);

ALTER TABLE listings
DROP COLUMN street, 
DROP COLUMN neighbourhood, 
DROP COLUMN neighbourhood_cleansed, 
DROP COLUMN city,
DROP COLUMN state,
DROP COLUMN zipcode, 
DROP COLUMN market,
DROP COLUMN smart_location,
DROP COLUMN country_code,
DROP COLUMN country,
DROP COLUMN latitude, 
DROP COLUMN longitude,
DROP COLUMN is_location_exact;
