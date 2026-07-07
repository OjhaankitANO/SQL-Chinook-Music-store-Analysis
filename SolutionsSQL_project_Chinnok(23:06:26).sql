USE chinook;
SHOW TABLES;
-- ------------------------------------------------------------------------------------------------
	-- Objectives Questions:-
-- ------------------------------------------------------------------------------------------------
-- 1. Does any table have missing values or duplicates? If yes how would you handle it ?

-- NULLs in CUSTOMER
DESCRIBE customer;
SELECT 'customer.customer_id' AS column_name, COUNT(*) FROM customer WHERE customer_id IS NULL
UNION ALL
SELECT 'customer.first_name', COUNT(*) FROM customer WHERE first_name IS NULL
UNION ALL
SELECT 'customer.last_name', COUNT(*) FROM customer WHERE last_name IS NULL
UNION ALL
SELECT 'customer.company', COUNT(*) FROM customer WHERE company IS NULL
UNION ALL
SELECT 'customer.address', COUNT(*) FROM customer WHERE address IS NULL
UNION ALL
SELECT 'customer.city', COUNT(*) FROM customer WHERE city IS NULL
UNION ALL
SELECT 'customer.state', COUNT(*) FROM customer WHERE state IS NULL
UNION ALL
SELECT 'customer.country', COUNT(*) FROM customer WHERE country IS NULL
UNION ALL
SELECT 'customer.postal_code', COUNT(*) FROM customer WHERE postal_code IS NULL
UNION ALL
SELECT 'customer.phone', COUNT(*) FROM customer WHERE phone IS NULL
UNION ALL
SELECT 'customer.fax', COUNT(*) FROM customer WHERE fax IS NULL
UNION ALL
SELECT 'customer.email', COUNT(*) FROM customer WHERE email IS NULL
UNION ALL
SELECT 'customer.support_rep_id', COUNT(*) FROM customer WHERE support_rep_id IS NULL;

-- NULLs in EMPLOYEE
DESC employee;
SELECT 'employee.employee_id', COUNT(*) FROM employee WHERE employee_id IS NULL
UNION ALL
SELECT 'employee.last_name', COUNT(*) FROM employee WHERE last_name IS NULL
UNION ALL
SELECT 'employee.first_name', COUNT(*) FROM employee WHERE first_name IS NULL
UNION ALL
SELECT 'employee.title', COUNT(*) FROM employee WHERE title IS NULL
UNION ALL
SELECT 'employee.reports_to', COUNT(*) FROM employee WHERE reports_to IS NULL
UNION ALL
SELECT 'employee.birth_date', COUNT(*) FROM employee WHERE birthdate IS NULL
UNION ALL
SELECT 'employee.hire_date', COUNT(*) FROM employee WHERE hire_date IS NULL
UNION ALL
SELECT 'employee.address', COUNT(*) FROM employee WHERE address IS NULL
UNION ALL
SELECT 'employee.city', COUNT(*) FROM employee WHERE city IS NULL
UNION ALL
SELECT 'employee.state', COUNT(*) FROM employee WHERE state IS NULL
UNION ALL
SELECT 'employee.country', COUNT(*) FROM employee WHERE country IS NULL
UNION ALL
SELECT 'employee.postal_code', COUNT(*) FROM employee WHERE postal_code IS NULL
UNION ALL
SELECT 'employee.phone', COUNT(*) FROM employee WHERE phone IS NULL
UNION ALL
SELECT 'employee.fax', COUNT(*) FROM employee WHERE fax IS NULL
UNION ALL
SELECT 'employee.email', COUNT(*) FROM employee WHERE email IS NULL;

-- NULLs in artist
Desc artist;
SELECT 'artist.stist_id',COUNT(*) FROM artist WHERE artist_id IS NULL
UNION ALL
SELECT 'artist.name', COUNT(*) FROM artist WHERE name  IS NULL;


-- NULLs in ALBUM
DESC album;
SELECT 'album.album_id', COUNT(*) FROM album WHERE album_id IS NULL
UNION ALL
SELECT 'album.title', COUNT(*) FROM album WHERE title IS NULL
UNION ALL
SELECT 'album.artist_id', COUNT(*) FROM album WHERE artist_id IS NULL;

-- NULLs in TRACK
DESC track;
SELECT 'track.track_id', COUNT(*) FROM track WHERE track_id IS NULL
UNION ALL
SELECT 'track.name', COUNT(*) FROM track WHERE name IS NULL
UNION ALL
SELECT 'track.album_id', COUNT(*) FROM track WHERE album_id IS NULL
UNION ALL
SELECT 'track.media_type_id', COUNT(*) FROM track WHERE media_type_id IS NULL
UNION ALL
SELECT 'track.genre_id', COUNT(*) FROM track WHERE genre_id IS NULL
UNION ALL
SELECT 'track.composer', COUNT(*) FROM track WHERE composer IS NULL
UNION ALL
SELECT 'track.milliseconds', COUNT(*) FROM track WHERE milliseconds IS NULL
UNION ALL
SELECT 'track.bytes', COUNT(*) FROM track WHERE bytes IS NULL
UNION ALL
SELECT 'track.unit_price', COUNT(*) FROM track WHERE unit_price IS NULL;

-- NULLs in INVOICE
DESC invoice;
SELECT 'invoice.invoice_id', COUNT(*) FROM invoice WHERE invoice_id IS NULL
UNION ALL
SELECT 'invoice.customer_id', COUNT(*) FROM invoice WHERE customer_id IS NULL
UNION ALL
SELECT 'invoice.invoice_date', COUNT(*) FROM invoice WHERE invoice_date IS NULL
UNION ALL
SELECT 'invoice.billing_address', COUNT(*) FROM invoice WHERE billing_address IS NULL
UNION ALL
SELECT 'invoice.billing_city', COUNT(*) FROM invoice WHERE billing_city IS NULL
UNION ALL
SELECT 'invoice.billing_state', COUNT(*) FROM invoice WHERE billing_state IS NULL
UNION ALL
SELECT 'invoice.billing_country', COUNT(*) FROM invoice WHERE billing_country IS NULL
UNION ALL
SELECT 'invoice.billing_postal_code', COUNT(*) FROM invoice WHERE billing_postal_code IS NULL
UNION ALL
SELECT 'invoice.total', COUNT(*) FROM invoice WHERE total IS NULL;

-- NULLs in INVOICE_LINE
DESC invoice_line;
SELECT 'invoice_line.invoice_line_id', COUNT(*) FROM invoice_line WHERE invoice_line_id IS NULL
UNION ALL
SELECT 'invoice_line.invoice_id', COUNT(*) FROM invoice_line WHERE invoice_id IS NULL
UNION ALL
SELECT 'invoice_line.track_id', COUNT(*) FROM invoice_line WHERE track_id IS NULL
UNION ALL
SELECT 'invoice_line.unit_price', COUNT(*) FROM invoice_line WHERE unit_price IS NULL
UNION ALL
SELECT 'invoice_line.quantity', COUNT(*) FROM invoice_line WHERE quantity IS NULL;

-- ------------------------------------------------------------------------
	-- Duplicates
-- ------------------------------------------------------------------------

-- Duplicates in CUSTOMER (excluding customer_id)
SELECT first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id, COUNT(*) AS occurrences
FROM customer
GROUP BY first_name, last_name, company, address, city, state, country, postal_code, phone, fax, email, support_rep_id
HAVING occurrences > 1;

-- Duplicates in EMPLOYEE (excluding employee_id)
SELECT last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email, COUNT(*) AS occurrences
FROM employee
GROUP BY last_name, first_name, title, reports_to, birthdate, hire_date, address, city, state, country, postal_code, phone, fax, email
HAVING occurrences > 1;

-- Duplicates in ARTIST (excluding artist_id)
SELECT name, COUNT(*) AS occurrences
FROM artist
GROUP BY name
HAVING occurrences > 1;

-- Duplicates in ALBUM (excluding album_id)
SELECT title, artist_id, COUNT(*) AS occurrences
FROM album
GROUP BY title, artist_id
HAVING occurrences > 1;

-- Duplicates in TRACK (excluding track_id)
SELECT name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price, COUNT(*) AS occurrences
FROM track
GROUP BY name, album_id, media_type_id, genre_id, composer, milliseconds, bytes, unit_price
HAVING occurrences > 1;

-- Duplicates in INVOICE (excluding invoice_id)
SELECT customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total, COUNT(*) AS occurrences
FROM invoice
GROUP BY customer_id, invoice_date, billing_address, billing_city, billing_state, billing_country, billing_postal_code, total
HAVING occurrences > 1;

-- Duplicates in INVOICE_LINE (excluding invoice_line_id)
SELECT invoice_id, track_id, unit_price, quantity, COUNT(*) AS occurrences
FROM invoice_line
GROUP BY invoice_id, track_id, unit_price, quantity
HAVING occurrences > 1;

-- Duplicates in PLAYLIST (excluding playlist_id)
SELECT name, COUNT(*) AS occurrences
FROM playlist
GROUP BY name
HAVING occurrences > 1;

-- Duplicates in MEDIA_TYPE (excluding media_type_id)
SELECT name, COUNT(*) AS occurrences
FROM media_type
GROUP BY name
HAVING occurrences > 1;

-- Duplicates in GENRE (excluding genre_id)
SELECT name, COUNT(*) AS occurrences
FROM genre
GROUP BY name
HAVING occurrences > 1;

-- 2. Find the top-selling track and top artist in the USA and identify their most famous genres.

CREATE OR REPLACE VIEW usa_sales AS
SELECT
    il.invoice_line_id,
    i.invoice_id,
    il.track_id,
    il.unit_price,
    il.quantity,
    t.name AS track_name,
    t.genre_id,
    al.album_id,
    al.artist_id,
    ar.name AS artist_name,
    g.name AS genre_name
FROM invoice_line il
JOIN invoice i
    ON il.invoice_id = i.invoice_id
JOIN track t
    ON il.track_id = t.track_id
JOIN album al
    ON t.album_id = al.album_id
JOIN artist ar
    ON al.artist_id = ar.artist_id
JOIN genre g
    ON t.genre_id = g.genre_id
WHERE i.billing_country = 'USA';

-- Top 3 Selling Tracks in USA

WITH top_tracks AS (
    SELECT
        track_id,
        track_name,
        SUM(quantity) AS total_quantity,
        SUM(unit_price * quantity) AS total_sales,
        DENSE_RANK() OVER (
            ORDER BY SUM(unit_price * quantity) DESC
        ) AS track_rank
    FROM usa_sales
    GROUP BY track_id, track_name
)

SELECT
    track_id,
    track_name,
    total_quantity,
    total_sales,
    track_rank
FROM top_tracks
WHERE track_rank <= 3
ORDER BY track_rank;

-- Top 5 Selling Artists in USA

WITH top_artists AS (
    SELECT
        artist_id,
        artist_name,
        SUM(quantity) AS total_quantity,
        SUM(unit_price * quantity) AS total_sales,
        DENSE_RANK() OVER (
            ORDER BY SUM(unit_price * quantity) DESC
        ) AS artist_rank
    FROM usa_sales
    GROUP BY artist_id, artist_name
)

SELECT
    artist_id,
    artist_name,
    total_quantity,
    total_sales,
    artist_rank
FROM top_artists
WHERE artist_rank <= 5
ORDER BY artist_rank;

-- Most Famous Genre of Each Top 5 Artist

WITH top_artists AS (
    SELECT
        artist_id,
        DENSE_RANK() OVER (
            ORDER BY SUM(unit_price * quantity) DESC
        ) AS artist_rank
    FROM usa_sales
    GROUP BY artist_id
),

top_artist_selection AS (
    SELECT artist_id
    FROM top_artists
    WHERE artist_rank <= 5
),

top_artist_genre AS (
    SELECT
        us.artist_id,
        us.artist_name,
        us.genre_name,
        SUM(us.quantity) AS total_quantity,
        SUM(us.unit_price * us.quantity) AS total_sales,

        RANK() OVER (
            PARTITION BY us.artist_id
            ORDER BY SUM(us.unit_price * us.quantity) DESC
        ) AS genre_rank

    FROM usa_sales us

    JOIN top_artist_selection tas               				-- optimised the query here
        ON us.artist_id = tas.artist_id

    GROUP BY
        us.artist_id,
        us.artist_name,
        us.genre_name
)

SELECT
    artist_id,
    artist_name,
    genre_name,
    total_quantity,
    total_sales
FROM top_artist_genre
WHERE genre_rank = 1
ORDER BY total_sales DESC;



-- 3. What is the customer demographic breakdown (age, gender, location) of Chinook's customer base?
-- Total customers
SELECT COUNT(customer_id) AS customer_count
FROM customer;

-- Customers by country
SELECT country, COUNT(*) AS customers_count
FROM customer
GROUP BY country
ORDER BY customers_count DESC;

-- Customers by country & state
SELECT country, state, COUNT(*) AS customers_count
FROM customer
GROUP BY country, state
ORDER BY customers_count DESC;

-- Customers by country, state, and city
SELECT country, state, city, COUNT(*) AS customers_count
FROM customer
GROUP BY country, state, city
ORDER BY customers_count DESC;

-- 4. Calculate the total revenue and number of invoices for each country, state and city.
-- By Country
SELECT billing_country AS country,
       COUNT(*) AS invoice_count,
       SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_country
ORDER BY total_revenue DESC;

-- By Country and state
SELECT billing_country AS country,
       billing_state AS state,
       COUNT(*) AS invoice_count,
       SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_country, billing_state
ORDER BY total_revenue DESC;

-- By Country, state and city
SELECT billing_country AS country,
       billing_state AS state,
       billing_city AS city,
       COUNT(*) AS invoice_count,
       SUM(total) AS total_revenue
FROM invoice
GROUP BY billing_country, billing_state, billing_city
ORDER BY total_revenue DESC;

-- 5. Find the top 5 customers by total revenue in each country.
WITH customer_revenue AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           c.country,
           SUM(i.total) AS total_revenue,
           DENSE_RANK() OVER (PARTITION BY c.country ORDER BY SUM(i.total) DESC) AS revenue_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, customer_name, c.country
)
SELECT country, customer_id, customer_name, total_revenue, revenue_rank
FROM customer_revenue
WHERE revenue_rank <= 5
ORDER BY country, revenue_rank;

-- 6. Identify the top-selling track for each customer.
-- Top selling track
WITH customer_tracks AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           t.track_id,
           t.name AS track_name,
           SUM(il.quantity) AS total_quantity,
           SUM(il.unit_price * il.quantity) AS total_revenue,
           RANK() OVER (PARTITION BY c.customer_id ORDER BY SUM(il.unit_price * il.quantity) DESC) AS track_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    GROUP BY c.customer_id, customer_name, t.track_id, t.name
)
SELECT customer_id, customer_name, track_id, track_name, total_quantity, total_revenue
FROM customer_tracks
WHERE track_rank = 1
ORDER BY customer_id;

-- Top selling genre
WITH customer_genres AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           g.genre_id,
           g.name AS genre_name,
           SUM(il.quantity) AS total_quantity,
           SUM(il.unit_price * il.quantity) AS total_revenue,
           RANK() OVER (PARTITION BY c.customer_id ORDER BY SUM(il.quantity) DESC) AS genre_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY c.customer_id, customer_name, g.genre_id, g.name
)
SELECT customer_id, customer_name, genre_name, total_quantity, total_revenue
FROM customer_genres
WHERE genre_rank = 1
ORDER BY customer_id;

-- Top selling artist
WITH customer_artists AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           a.artist_id,
           a.name AS artist_name,
           SUM(il.quantity) AS total_quantity,
           SUM(il.unit_price * il.quantity) AS total_revenue,
           RANK() OVER (PARTITION BY c.customer_id ORDER BY SUM(il.quantity) DESC) AS artist_rank
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN album al ON t.album_id = al.album_id
    JOIN artist a ON al.artist_id = a.artist_id
    GROUP BY c.customer_id, customer_name, a.artist_id, a.name
)
SELECT customer_id, customer_name, artist_name, total_quantity, total_revenue
FROM customer_artists
WHERE artist_rank = 1
ORDER BY customer_id;

-- 7. Are there any patterns or trends in customer purchasing behavior 
-- (e.g., frequency of purchases, preferred payment methods, average order value)?
-- Total purchases, AOV, Total spent
SELECT c.customer_id,
       CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(i.invoice_id) AS total_purchases,
       AVG(i.total) AS avg_order_value,
       SUM(i.total) AS total_spent
FROM customer c
JOIN invoice i ON c.customer_id = i.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY total_purchases DESC;

-- Purchase Frequency: Avg gap, Min gap, Max gap
WITH customer_invoices AS (
    SELECT 
        customer_id,
        invoice_date,
        LAG(invoice_date) OVER (PARTITION BY customer_id ORDER BY invoice_date) AS prev_invoice_date
    FROM invoice
),
gaps AS (
    SELECT 
        customer_id,
        DATEDIFF(invoice_date, prev_invoice_date) AS gap_days
    FROM customer_invoices
    WHERE prev_invoice_date IS NOT NULL
)
SELECT 
    c.customer_id,
    CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
    AVG(g.gap_days) AS avg_gap_days,
    MIN(g.gap_days) AS min_gap_days,
    MAX(g.gap_days) AS max_gap_days
FROM gaps g
JOIN customer c ON g.customer_id = c.customer_id
GROUP BY c.customer_id, customer_name
ORDER BY c.customer_id;

-- 8. What is the customer churn rate?
WITH latest_date AS (
    SELECT MAX(invoice_date) AS max_invoice_date
    FROM invoice
),
last_purchase AS (
    SELECT customer_id, MAX(invoice_date) AS last_invoice_date
    FROM invoice
    GROUP BY customer_id
)

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE WHEN last_invoice_date < DATE_SUB(						-- optimised all these
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 3 MONTH
      ) THEN 1 ELSE 0 END) AS churned_3m,
    CONCAT(ROUND(SUM(CASE WHEN last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 3 MONTH
      ) THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS churn_rate_3m,

    SUM(CASE WHEN last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 6 MONTH
      ) THEN 1 ELSE 0 END) AS churned_6m,
    CONCAT(ROUND(SUM(CASE WHEN last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 6 MONTH
      ) THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS churn_rate_6m,

    SUM(CASE WHEN last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 12 MONTH
      ) THEN 1 ELSE 0 END) AS churned_12m,
    CONCAT(ROUND(SUM(CASE WHEN last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),
          INTERVAL 12 MONTH
      ) THEN 1 ELSE 0 END) / COUNT(*) * 100, 2), '%') AS churn_rate_12m

FROM last_purchase;

-- 9. Calculate the percentage of total sales contributed by each genre in the USA and identify the best-selling genres and artists.
-- Genre level sales in USA
WITH usa_sales AS (
    SELECT il.invoice_line_id, il.unit_price, il.quantity,
           i.billing_country, t.genre_id, g.name AS genre_name,
           al.artist_id, ar.name AS artist_name
    FROM invoice_line il
    JOIN invoice i ON il.invoice_id = i.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    JOIN album al ON t.album_id = al.album_id
    JOIN artist ar ON al.artist_id = ar.artist_id
    WHERE i.billing_country = 'USA'
),
genre_sales AS (
    SELECT genre_name,
           SUM(unit_price * quantity) AS genre_revenue
    FROM usa_sales
    GROUP BY genre_name
),
total_usa_sales AS (
    SELECT SUM(unit_price * quantity) AS total_revenue
    FROM usa_sales
)
SELECT gs.genre_name,
       gs.genre_revenue,
       ROUND(gs.genre_revenue / tus.total_revenue * 100, 2) AS percent_of_usa_sales
FROM genre_sales gs
CROSS JOIN total_usa_sales tus
ORDER BY gs.genre_revenue DESC;

-- 10. Find customers who have purchased tracks from at least 3 different genres.
WITH customer_genre_count AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name, 
           COUNT(DISTINCT t.genre_id) AS genre_count
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    GROUP BY c.customer_id, customer_name
)
SELECT customer_id, customer_name, genre_count
FROM customer_genre_count
WHERE genre_count >= 3
ORDER BY genre_count DESC;

-- 11. Rank genres based on their sales performance in the USA.
WITH usa_genre_sales AS (
    SELECT g.genre_id,
           g.name AS genre_name,
           SUM(il.unit_price * il.quantity) AS total_sales
    FROM invoice_line il
    JOIN invoice i ON il.invoice_id = i.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    WHERE i.billing_country = 'USA'
    GROUP BY g.genre_id, g.name
)
SELECT genre_name,
       total_sales,
       DENSE_RANK() OVER (ORDER BY total_sales DESC) AS genre_rank
FROM usa_genre_sales
ORDER BY genre_rank;

-- 12. Identify customers who have not made a purchase in the last 3 months.
WITH latest_date AS (											-- optimised here
    SELECT MAX(invoice_date) AS max_invoice_date
    FROM invoice
),
last_purchase AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           MAX(i.invoice_date) AS last_invoice_date
    FROM customer c
    LEFT JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, customer_name
)
SELECT customer_id, customer_name, last_invoice_date
FROM last_purchase
WHERE last_invoice_date < DATE_SUB(
          (SELECT max_invoice_date
           FROM latest_date),									-- optimised here
          INTERVAL 3 MONTH
      ) OR last_invoice_date IS NULL
ORDER BY last_invoice_date;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Subjective Questions
-- -------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. Recommend the three albums from the new record label that should be prioritised for advertising and promotion in the USA based on genre sales analysis.
WITH usa_genre_sales AS (
    SELECT g.genre_id,
           g.name AS genre_name,
           SUM(il.unit_price * il.quantity) AS genre_sales_usa
    FROM invoice_line il
    JOIN invoice i ON il.invoice_id = i.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    WHERE i.billing_country = 'USA'
    GROUP BY g.genre_id, g.name
),
top_3_genres AS (
    SELECT genre_id, genre_name
    FROM usa_genre_sales
    ORDER BY genre_sales_usa DESC
    LIMIT 3
),
usa_album_sales AS (
    SELECT al.album_id,
           al.title AS album_title,
           g.genre_id,
           g.name AS genre_name,
           SUM(il.unit_price * il.quantity) AS total_sales_usa
    FROM album al
    JOIN track t ON al.album_id = t.album_id
    JOIN genre g ON t.genre_id = g.genre_id
    JOIN invoice_line il ON t.track_id = il.track_id
    JOIN invoice i ON il.invoice_id = i.invoice_id
    WHERE i.billing_country = 'USA'
      AND g.genre_id IN (SELECT genre_id FROM top_3_genres)
    GROUP BY al.album_id, al.title, g.genre_id, g.name
),
ranked_albums AS (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY genre_name ORDER BY total_sales_usa DESC) AS rn
    FROM usa_album_sales
)
SELECT album_title, genre_name, total_sales_usa
FROM ranked_albums
WHERE rn = 1
ORDER BY total_sales_usa DESC;

-- 2. Determine the top-selling genres in countries other than the USA and identify any commonalities or differences.
WITH genre_sales_non_usa AS (
    SELECT g.name AS genre_name,
           SUM(il.unit_price * il.quantity) AS total_sales
    FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    WHERE i.billing_country != 'USA'
    GROUP BY g.name
)
SELECT genre_name, total_sales,
       DENSE_RANK() OVER (ORDER BY total_sales DESC) AS genre_rank
FROM genre_sales_non_usa
ORDER BY genre_rank;

-- 3. Customer Purchasing Behavior Analysis: How do the purchasing habits (frequency, basket size, spending amount) of long-term customers differ from those of new customers? What insights can these patterns provide about customer loyalty and retention strategies?

WITH latest_date AS (
    SELECT MAX(invoice_date) AS max_invoice_date
    FROM invoice
),
last_purchase AS (
    SELECT c.customer_id,
           CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
           MAX(i.invoice_date) AS last_invoice_date
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, customer_name
),
customer_status AS (
    SELECT lp.customer_id,
           lp.customer_name,
           lp.last_invoice_date,
           CASE
               WHEN lp.last_invoice_date >= DATE_SUB(					-- optimised here
          (SELECT max_invoice_date						
           FROM latest_date),
          INTERVAL 6 MONTH
      ) THEN 'Active'
               ELSE 'Dormant'
           END AS status
    FROM last_purchase lp
),
customer_metrics AS (
    SELECT cs.status,
           cs.customer_id,
           COUNT(DISTINCT i.invoice_id) AS invoice_count,
           SUM(il.quantity) AS total_tracks,
           SUM(i.total) AS total_spent
    FROM customer_status cs
    JOIN invoice i ON cs.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY cs.status, cs.customer_id
)
SELECT 
    status,
    COUNT(*) AS customer_count,
    ROUND(AVG(invoice_count), 2) AS avg_frequency_per_customer,
    ROUND(AVG(total_tracks / invoice_count), 2) AS avg_basket_size,
    ROUND(AVG(total_spent), 2) AS avg_spent_per_customer,
    ROUND(SUM(total_spent), 2) AS total_spent_group
FROM customer_metrics
GROUP BY status;

-- 4. Product Affinity Analysis: Which music genres, artists, or albums are frequently purchased together by customers? How can this information guide product recommendations and cross-selling initiatives?
-- Frequently Bought Together: GENRES
WITH invoice_genres AS (
    SELECT i.invoice_id, g.name AS genre_name
    FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN genre g ON t.genre_id = g.genre_id
    GROUP BY i.invoice_id, g.name
),
genre_pairs AS (
    SELECT ig1.genre_name AS genre_1,
           ig2.genre_name AS genre_2,
           COUNT(*) AS pair_count
    FROM invoice_genres ig1
    JOIN invoice_genres ig2
      ON ig1.invoice_id = ig2.invoice_id AND ig1.genre_name < ig2.genre_name
    GROUP BY ig1.genre_name, ig2.genre_name
)
SELECT genre_1, genre_2, pair_count
FROM genre_pairs
ORDER BY pair_count DESC
LIMIT 10;

-- Frequently Bought Together: ARTISTS
WITH invoice_artists AS (
    SELECT i.invoice_id, ar.name AS artist_name
    FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN album al ON t.album_id = al.album_id
    JOIN artist ar ON al.artist_id = ar.artist_id
    GROUP BY i.invoice_id, ar.name
),
artist_pairs AS (
    SELECT ia1.artist_name AS artist_1,
           ia2.artist_name AS artist_2,
           COUNT(*) AS pair_count
    FROM invoice_artists ia1
    JOIN invoice_artists ia2
      ON ia1.invoice_id = ia2.invoice_id AND ia1.artist_name < ia2.artist_name
    GROUP BY ia1.artist_name, ia2.artist_name
)
SELECT artist_1, artist_2, pair_count
FROM artist_pairs
ORDER BY pair_count DESC
LIMIT 10;

-- Frequently Bought Together: ALBUMS
WITH invoice_albums AS (
    SELECT i.invoice_id, al.title AS album_title
    FROM invoice i
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    JOIN track t ON il.track_id = t.track_id
    JOIN album al ON t.album_id = al.album_id
    GROUP BY i.invoice_id, al.title
),
album_pairs AS (
    SELECT ia1.album_title AS album_1,
           ia2.album_title AS album_2,
           COUNT(*) AS pair_count
    FROM invoice_albums ia1
    JOIN invoice_albums ia2
      ON ia1.invoice_id = ia2.invoice_id AND ia1.album_title < ia2.album_title
    GROUP BY ia1.album_title, ia2.album_title
)
SELECT album_1, album_2, pair_count
FROM album_pairs
ORDER BY pair_count DESC
LIMIT 10;

-- 5. Regional Market Analysis: Do customer purchasing behaviors and churn rates vary across different geographic regions or store locations? How might these correlate with local demographic or economic factors?
WITH last_purchase AS (
    SELECT c.customer_id, c.country,
           MAX(i.invoice_date) AS last_invoice_date,
           COUNT(i.invoice_id) AS total_invoices,
           SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.country
),
customer_status AS (
    SELECT lp.country,
           CASE WHEN lp.last_invoice_date < DATE_SUB(								-- optimised here
									(SELECT MAX(invoice_date) FROM invoice),				
									INTERVAL 6 MONTH)
		   THEN 'Churned' ELSE 'Active' END AS status,
           lp.customer_id,
           lp.total_invoices,
           lp.total_spent
    FROM last_purchase lp
)
SELECT country,
       COUNT(DISTINCT customer_id) AS customer_count,
       SUM(total_invoices) / COUNT(DISTINCT customer_id) AS avg_frequency,
       SUM(total_spent) / COUNT(DISTINCT customer_id) AS avg_spent_per_customer,
       SUM(CASE WHEN status = 'Churned' THEN 1 ELSE 0 END) / COUNT(*) * 100 AS churn_rate
FROM customer_status
GROUP BY country
ORDER BY customer_count DESC;

-- 6. Customer Risk Profiling: Based on customer profiles (age, gender, location, purchase history), which customer segments are more likely to churn or pose a higher risk of reduced spending? What factors contribute to this risk?

WITH latest_date AS (									-- whole optimised query
    SELECT MAX(invoice_date) AS max_invoice_date
    FROM invoice
),
customer_metrics AS (
    SELECT
        c.customer_id,
        c.country,
        MAX(i.invoice_date) AS last_purchase,
        COUNT(DISTINCT i.invoice_id) AS total_invoices,
        SUM(i.total) AS total_spent
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY
        c.customer_id,
        c.country
),
country_wise_metrics AS (
    SELECT
        country,
        ROUND(
            AVG(total_invoices),2) AS avg_frequency,
        ROUND(
            AVG(total_spent),2) AS avg_spending,
        ROUND(
            SUM(
                CASE WHEN last_purchase <
                         DATE_SUB(
                             (SELECT max_invoice_date FROM latest_date),
                              INTERVAL 6 MONTH ) THEN 1 ELSE 0 END ) * 100.0 / COUNT(*),2 ) AS churn_rate
    FROM customer_metrics
    GROUP BY country
),
churn_category AS (
    SELECT *,
        CASE
            WHEN churn_rate = 100 THEN 'High'
            WHEN churn_rate > 0 THEN 'Medium'
            ELSE 'Low'
        END AS churn_category
    FROM country_wise_metrics
)
SELECT
    churn_category,
    ROUND(AVG(avg_frequency),2) AS avg_frequency,
    ROUND(AVG(avg_spending),2) AS avg_spending,
    COUNT(*) AS country_count
FROM churn_category
GROUP BY churn_category
ORDER BY
    FIELD(churn_category,'High','Medium','Low');

-- 7. Customer Lifetime Value Modeling: How can you leverage customer data (tenure, purchase history, engagement) to predict the lifetime value of different customer segments? This could inform targeted marketing and loyalty program strategies. Can you observe any common characteristics or purchase patterns among customers who have stopped purchasing?

CREATE OR REPLACE VIEW customer_clv_tier AS						-- whole optimised query
WITH customer_history AS (
    SELECT c.customer_id,
        CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
        MIN(i.invoice_date) AS first_purchase,
        MAX(i.invoice_date) AS last_purchase,
        DATEDIFF(
            MAX(i.invoice_date),
            MIN(i.invoice_date)
        ) AS tenure_days,
        SUM(i.total) AS total_revenue,
        COUNT(i.invoice_id) AS total_invoices
    FROM customer c
    JOIN invoice i
        ON c.customer_id = i.customer_id
    GROUP BY
        c.customer_id,
        customer_name
),
ranked_metrics AS (
    SELECT *,
        ROUND(
            total_revenue /
            NULLIF(tenure_days / 365, 0),2 ) AS annual_revenue,
        NTILE(4) OVER ( ORDER BY tenure_days ) AS tenure_rank,
        NTILE(4) OVER ( ORDER BY total_invoices ) AS invoice_rank
FROM customer_history
),
final_scores AS (
    SELECT *,
        NTILE(4) OVER (
            ORDER BY annual_revenue ) AS revenue_rank
FROM ranked_metrics
)
SELECT *,
    (tenure_rank + invoice_rank + revenue_rank) AS total_score,
    CASE
        WHEN (tenure_rank + invoice_rank + revenue_rank) >= 10
            THEN 'High CLV'
        WHEN (tenure_rank + invoice_rank + revenue_rank) >= 7
            THEN 'Medium CLV' ELSE 'Low CLV'
    END AS clv_tier
FROM final_scores;

-- Customers in each CLV Tier
-- Dynamic churn calculation based on latest purchase date in dataset

SELECT customer_name,
    clv_tier,
    CASE
        WHEN last_purchase <
             DATE_SUB(
                 (SELECT MAX(invoice_date) FROM invoice),
                 INTERVAL 6 MONTH )
        THEN 'Churned'
        ELSE 'Active'
    END AS churn
FROM customer_clv_tier
ORDER BY
    FIELD(
        clv_tier,
        'High CLV',
        'Medium CLV',
        'Low CLV'),
    customer_name;

-- Percentage of Active vs Churned Customers
-- within each CLV Tier
WITH clv_churn AS (
    SELECT clv_tier,
        CASE WHEN last_purchase <
                 DATE_SUB(
                     (SELECT MAX(invoice_date) FROM invoice),
                     INTERVAL 6 MONTH ) THEN 'Churned' ELSE 'Active'
        END AS churn
    FROM customer_clv_tier
)
SELECT clv_tier,
    churn,
    COUNT(*) AS customer_count,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*))
        OVER (PARTITION BY clv_tier),2
    ) AS percent_in_tier
FROM clv_churn
GROUP BY
    clv_tier,
    churn
ORDER BY
    FIELD(
        clv_tier,
        'High CLV',
        'Medium CLV',
        'Low CLV'),
    churn;

-- 10. How can you alter the "Albums" table to add a new column named "ReleaseYear" of type INTEGER to store the release year of each album?
ALTER TABLE album
ADD COLUMN ReleaseYear INTEGER;

SELECT * FROM album;

-- 11. Chinook is interested in understanding the purchasing behavior of customers based on their geographical location. They want to know the average total amount spent by customers from each country, along with the number of customers and the average number of tracks purchased per customer. Write an SQL query to provide this information.
WITH customer_summary AS (
    SELECT c.country,
           c.customer_id,
           SUM(i.total) AS total_spent,
           SUM(il.quantity) AS total_tracks
    FROM customer c
    JOIN invoice i ON c.customer_id = i.customer_id
    JOIN invoice_line il ON i.invoice_id = il.invoice_id
    GROUP BY c.country, c.customer_id
)
SELECT country,
       COUNT(customer_id) AS num_customers,
       ROUND(AVG(total_spent), 2) AS avg_spent_per_customer,
       ROUND(AVG(total_tracks), 2) AS avg_tracks_per_customer
FROM customer_summary
GROUP BY country
ORDER BY country;




















