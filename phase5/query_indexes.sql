/*query 1*/
 CREATE INDEX listing_host_id ON Listing(host_id);
 
 
 /*query 2*/
 CREATE INDEX price_guests_included ON Price(guests_included,price);
 
 /*query 3*/
 CREATE INDEX Listing_host_id on listing(host_id);
 CREATE INDEX Review_listing_id on Review(listing_id);
 
 /*query 4*/
  CREATE INDEX Listing_Host_id on Listing(host_id);
 
 /*query 5*/
 create index price_price on price(price);
 
 /*query 6*/
 CREATE INDEX location_neighbourhood_cleansed on location(neighbourhood_cleansed)
 
 /*query 7*/
 CREATE INDEX Listing_Host_id on Listing(host_id);
 
 