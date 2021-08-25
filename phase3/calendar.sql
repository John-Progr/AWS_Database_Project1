UPDATE calendar
SET
price=REPLACE(price,'$',''),
adjusted_price=REPLACE(adjusted_price,'$','');

UPDATE calendar
SET
price=REPLACE(price,',',''),
adjusted_price=REPLACE(adjusted_price,',','');


ALTER TABLE calendar
ALTER COLUMN price TYPE numeric using price::numeric,
ALTER COLUMN adjusted_price TYPE numeric USING adjusted_price::numeric,
ALTER COLUMN available TYPE boolean;
