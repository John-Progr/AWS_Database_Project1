CREATE TABLE Host AS (SELECT Distinct host_id, host_url, host_name, host_since, host_location, host_about,
host_response_time, host_response_rate, host_acceptance_rate, host_is_superhost,
host_thumbnail_url, host_picture_url, host_neighbourhood, host_listings_count,
host_total_listings_count, host_verifications, host_has_profile_pic, host_identity_verified,
calculated_host_listings_count FROM listings);


ALTER TABLE Host RENAME host_id to id;
ALTER TABLE Host RENAME host_url to url ;
ALTER TABLE Host RENAME host_name to name;
ALTER TABLE Host RENAME host_since to since;
ALTER TABLE Host RENAME host_location to location;
ALTER TABLE Host RENAME host_about to about;
ALTER TABLE Host RENAME host_response_time to response_time;
ALTER TABLE Host RENAME host_response_rate to response_rate;
ALTER TABLE Host RENAME host_acceptance_rate to acceptance_rate;
ALTER TABLE Host RENAME host_is_superhost to is_superhost;
ALTER TABLE Host RENAME host_thumbnail_url to thumbnail_url;
ALTER TABLE Host RENAME host_picture_url to picture_url;
ALTER TABLE Host RENAME host_neighbourhood to neighbourhood;
ALTER TABLE Host RENAME host_listings_count to count;
ALTER TABLE Host RENAME host_total_listings_count to total_listings_count;
ALTER TABLE Host RENAME host_verifications to  verifications;
ALTER TABLE Host RENAME host_has_profile_pic to has_profile_pic;
ALTER TABLE Host RENAME host_identity_verified to identity_verified;


ALTER TABLE Host
ADD PRIMARY KEY (id);

ALTER TABLE Listings
ADD FOREIGN KEY (host_id) REFERENCES Host(id);


ALTER TABLE Listings
DROP COLUMN host_url,
DROP COLUMN host_name,
DROP COLUMN host_since, 
DROP COLUMN host_location, 
DROP COLUMN host_about,
DROP COLUMN host_response_time,
DROP COLUMN host_response_rate,
DROP COLUMN host_acceptance_rate,
DROP COLUMN host_is_superhost,
DROP COLUMN host_thumbnail_url,
DROP COLUMN host_picture_url,
DROP COLUMN host_listings_count,
DROP COLUMN host_total_listings_count,
DROP COLUMN host_verifications,
DROP COLUMN host_has_profile_pic, 
DROP COLUMN host_identity_verified,
DROP COLUMN calculated_host_listings_count;


