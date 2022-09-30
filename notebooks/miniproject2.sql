-- high rankings given a floor of review counts, limit 10

SELECT DISTINCT(yl.name), yc.title, yl.rating, yl.review_count FROM yelp_loc yl
JOIN yelp_cats yc ON yl.category_id = yc.alias
WHERE review_count >= 18
ORDER BY review_count DESC LIMIT 10;

SELECT DISTINCT(fl.name), fc.name, fl.rating, fl.total_ratings FROM fsq_loc fl
JOIN fsq_cats fc ON fl.category_id = fc.id
WHERE total_ratings > 0
ORDER BY total_ratings DESC LIMIT 10;

-- Highest averages given a floor of review counts, limit 10

SELECT yc.title, ROUND(AVG(yl.rating),2) as avg FROM yelp_loc yl
JOIN yelp_cats yc ON yc.alias = yl.category_id
WHERE review_count > 20
GROUP BY yc.title
ORDER BY avg DESC LIMIT 10;

SELECT fc.name, ROUND(AVG(fl.rating),2) as avg FROM fsq_loc fl
JOIN fsq_cats fc ON fc.id = fl.category_id
WHERE total_ratings > 0
GROUP BY fc.name
ORDER BY avg DESC LIMIT 10;

-- average number of review counts, given more than 0

SELECT AVG(yl.review_count) FROM yelp_loc yl
JOIN yelp_cats yc ON yl.category_id = yc.alias
WHERE yl.review_count > 0
ORDER BY review_count;

SELECT AVG(fl.total_ratings) FROM fsq_loc fl
JOIN fsq_cats fc ON fl.category_id = fc.id
WHERE total_ratings > 0
ORDER BY total_ratings;

-- total count of POIs with review counts

SELECT COUNT(yl.review_count) FROM yelp_loc yl
JOIN yelp_cats yc ON yl.category_id = yc.alias
WHERE yl.review_count > 0
ORDER BY review_count;

SELECT COUNT(fl.total_ratings) FROM fsq_loc fl
JOIN fsq_cats fc ON fl.category_id = fc.id
WHERE total_ratings > 0
ORDER BY total_ratings;

-- functions to quickly view and remove tables, used during creation

-- SELECT * FROM yelp_loc;
-- SELECT * FROM fsq_loc;
-- SELECT * FROM yelp_cats;
SELECT * FROM fsq_cats;

-- DROP TABLE fsq_cats;
-- DROP TABLE fsq_loc;
-- DROP TABLE yelp_cats;
-- DROP TABLE yelp_loc;
