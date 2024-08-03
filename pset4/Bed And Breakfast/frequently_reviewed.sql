CREATE VIEW "frequently_reviewed" AS
    SELECT "listings"."id", "listings"."host_name","listings"."property_type", COUNT("reviews"."listing_id") AS 'review'
    FROM "listings"
    JOIN "reviews" ON
    "listings"."id" = "reviews"."listing_id"
    GROUP BY("listings"."id")
    ORDER BY "review" DESC, "property_type", "host_name"
    LIMIT 100;
