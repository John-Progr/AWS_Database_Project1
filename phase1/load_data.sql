
\copy Listings2 FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/phase1/csv_data/listings.csv' DELIMITER ',' CSV HEADER;

\copy Calendar FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/calendar.csv' DELIMITER ',' CSV HEADER;

\copy Reviews FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/reviews.csv' DELIMITER ',' CSV HEADER;

\copy Geolocation FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/geolocation.csv' DELIMITER ',' CSV HEADER;

\copy Reviews_summary FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/reviews-summary.csv' DELIMITER ',' CSV HEADER;

\copy Listings_summary FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/listings-summary.csv' DELIMITER ',' CSV HEADER;

\copy Neighbourhoods FROM 'C:/Users/johnm/OneDrive/DatabaseProject2021/airbnb/neighbourhoods.csv' DELIMITER ',' CSV HEADER;