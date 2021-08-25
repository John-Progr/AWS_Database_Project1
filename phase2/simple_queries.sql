1/*Finds comments for houses in a specific neighbourhood
 Output:11338*/

SELECT Listings.id,Reviews.comments
FROM Listings
INNER JOIN Reviews
ON Listings.id=Reviews.listing_id
WHERE Listings.neighbourhood_cleansed='ΑΜΠΕΛΟΚΗΠΟΙ';

2/* Finds number of houses in every neighbourhood
    Output:45 rows */

SELECT Neighbourhoods.neighbourhood,Count(Listings.id)
FROM Neighbourhoods
INNER JOIN Listings
ON Neighbourhoods.neighbourhood=Listings.neighbourhood_cleansed
GROUP BY Neighbourhoods.neighbourhood;




3/* Finds reviews from reviewers whose name stars with A and they are reviewing houses in neighbourhoods that start with A as well
Output:7206 rows*/

SELECT Listings.id,Reviews.reviewer_name,Reviews.comments
FROM Listings
INNER JOIN Reviews
ON Listings.id=Reviews.listing_id
WHERE Reviews.reviewer_name LIKE 'A%' AND Listings.neighbourhood_cleansed LIKE 'Α%';

4 /*Finds the number of listings with minimum nights between 1 and 3
Output:1 row*/
SELECT COUNT(*) AS minimum_nights_between_1_3
FROM Listings
WHERE minimum_nights BETWEEN 1 AND 3;


5/*Finds the max price of houses
Output:1 row*/
SELECT Max(price)
FROM listings_summary;


6 /* Finds 50 listings that cost under 250 and they have good reviews(we excluded comments which had not good reviews because with %good% you could get comments with not good in them
      Output:50 */


SELECT Listings.id,Listings.price,Reviews.comments
FROM Listings
INNER JOIN Reviews
ON Listings.id=Reviews.listing_id
WHERE Reviews.comments LIKE '%good%' AND Reviews.comments NOT IN(SELECT Reviews.comments FROM Reviews WHERE comments LIKE '%not good%') AND  Listings.id IN(SELECT id FROM Listings_summary WHERE price <250)
LIMIT 50;

7/* Finds all the listings that have price higher than the average price
Output:8287*/

SELECT Listings.id,Listings.price
FROM Listings
INNER JOIN Listings_summary
ON Listings.id=Listings_summary.id
WHERE Listings_summary.price<(SELECT AVG(price)::integer
							  FROM Listings_summary);

8/*Finds coordinates of neighbourhoods with houses that rented between specific dates
Output:45 rows */
SELECT Geolocation.*
FROM Geolocation
INNER JOIN Neighbourhoods
ON Geolocation.properties_neighbourhood=neighbourhoods.neighbourhood
WHERE Neighbourhoods.neighbourhood IN (SELECT Listings.neighbourhood_cleansed 
									 FROM  Listings
									  INNER JOIN Calendar
									   ON Listings.id=Calendar.listing_id
									   WHERE Calendar.date BETWEEN '2020-04-14' AND '2020-04-30' )

9/* Finds the cheapest neighbourhoods for a house to rent our criteria under 10$
Output:11 rows*/
SELECT DISTINCT Listings.neighbourhood_cleansed
FROM Listings
INNER JOIN Listings_summary
ON Listings.id=Listings_summary.id
WHERE Listings_summary.price<10




10/*Finds the cheapest houses which were rent on a specific date
Output:10 rows*/
SELECT Listings.id,Listings.price,Calendar.date
FROM Listings
INNER JOIN Calendar 
ON Listings.id=Calendar.listing_id
WHERE Calendar.date='2020-09-10'  AND Listings.id IN(SELECT id
												   FROM listings_summary
												   ORDER BY price 
													limit 10)
LIMIT 10;





11/* Finds number of neighbourhoods which contain no listings
Output: 1 row */
SELECT COUNT(*) AS number_of_neighbourhoods_with_no_listings
FROM Neighbourhoods
LEFT OUTER JOIN Listings
ON Neighbourhoods.neighbourhood=Listings.neighbourhood_cleansed
WHERE  Listings.id IS NULL;


12
/*finds number of listings with no reviews
Output:1 row */
SELECT COUNT(*) AS number_of_listings_with_no_reviews
FROM Reviews
RIGHT OUTER JOIN Listings
ON Reviews.listing_id=Listings.id
WHERE Reviews.id IS NULL;


