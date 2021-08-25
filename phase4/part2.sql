
/*finds the amenities of listings which are more expensive than 1000 dollars
output:197 rows*/
select price.listing_id,amenity.amenity_name,price.price
from  price 
inner join listing
on listing.id=price.listing_id
inner join  room_amenity
on listing.id=room_amenity.listing_id
inner join amenity
on room_amenity.amenity_id=amenity.amenity_id
where price.price>1000
order by price.listing_id


/*finds listings with no reviews and their hosts also checks if their host are verified
output:2559 rows*/
select listing.id,listing.description,host.id,host.identity_verified
from listing
inner join host
on listing.host_id=host.id
full outer join review
on review.listing_id=listing.id
where review.id is null 

/*finds how many listings hosts are responsible for.we pick the hosts who are rensposible for more than twenty listings
output:35 rows*/
select host.id,count(listing.id)
from host
inner join listing
on host.id=listing.host_id
group by host.id
Having count(listing.id)>20

/*finds the average price of listings host are rensposible for but for listings with no reviews and number of listings for each host more than 10
output:20 rows*/
select host.id,avg(price.price)::integer as average_price,count(listing.id) as host_listings_count
from host
inner join listing 
on listing.host_id=host.id
inner join price
on price.listing_id=listing.id
full outer join review
on review.listing_id=listing.id
where review.id is null
group by host.id 
having count(listing.id)>10


/*Finds geometry coordinates of neighbourhoods with houses that rented between specific dates
Output:45 rows */
SELECT Geolocation.*
FROM Geolocation
INNER JOIN Neighbourhoods
ON Geolocation.properties_neighbourhood=neighbourhoods.neighbourhood
WHERE Neighbourhoods.neighbourhood IN (SELECT location.neighbourhood_cleansed 
									 FROM location 
									  INNER JOIN Calendar
									   ON location.listing_id=Calendar.listing_id
									   WHERE Calendar.date BETWEEN '2020-04-14' AND '2020-04-30' );
									   
									   
									   





			