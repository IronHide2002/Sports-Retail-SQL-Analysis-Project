DROP TABLE brands;
CREATE TABLE brands (
    product_id VARCHAR(100) PRIMARY KEY,
    brand VARCHAR(255)
);

DROP TABLE info;
CREATE TABLE info (
    product_name VARCHAR(255),
    product_id VARCHAR(100) PRIMARY KEY,
    description TEXT
);

-- STEP 1: Create Staging Tables (All Columns as VARCHAR)
CREATE TABLE reviews_staging (
    product_id VARCHAR(100),
    rating VARCHAR(100),
    reviews VARCHAR(100)
);

CREATE TABLE traffic_staging (
    product_id VARCHAR(100),
    last_visited VARCHAR(100)
);

CREATE TABLE finance_staging (
    product_id VARCHAR(100),
    listing_price VARCHAR(100),
    sale_price VARCHAR(100),
    discount VARCHAR(100),
    revenue VARCHAR(100)
);

-- STEP 2: Final Clean Tables with Correct Data Types
CREATE TABLE reviews (
    product_id VARCHAR(100) PRIMARY KEY,
    rating FLOAT NULL,
    reviews FLOAT NULL
);

CREATE TABLE traffic (
    product_id VARCHAR(100) PRIMARY KEY,
    last_visited DATETIME NULL
);

CREATE TABLE finance (
    product_id VARCHAR(100) PRIMARY KEY,
    listing_price FLOAT NULL,
    sale_price FLOAT NULL,
    discount FLOAT NULL,
    revenue FLOAT NULL
);

-- STEP 3: Transfer Data from Staging to Final Tables with Type Conversions
-- Reviews Table (Converts blanks to NULL, valid numbers to FLOAT)
INSERT INTO reviews (product_id, rating, reviews)
SELECT 
    product_id,
    NULLIF(rating, '') + 0,
    NULLIF(reviews, '') + 0
FROM reviews_staging;

-- Traffic Table (Converts to DATETIME format)
INSERT INTO traffic (product_id, last_visited)
SELECT 
    product_id,
    STR_TO_DATE(NULLIF(last_visited, ''), '%d-%m-%Y %H:%i')
FROM traffic_staging;

-- Finance Table (Converts blanks to NULL, valid numbers to FLOAT)
INSERT INTO finance (product_id, listing_price, sale_price, discount, revenue)
SELECT 
    product_id,
    NULLIF(listing_price, '') + 0,
    NULLIF(sale_price, '') + 0,
    NULLIF(discount, '') + 0,
    NULLIF(revenue, '') + 0
FROM finance_staging;


SHOW tables;

DESCRIBE info;
DESCRIBE finance;
DESCRIBE info;
DESCRIBE reviews;
DESCRIBE traffic;
DESCRIBE brands;

https://claude.ai/share/b561de1d-61ca-43c8-a539-3053e269fa85
