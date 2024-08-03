CREATE VIEW "june_vacancies" AS
    SELECT "listings"."id", "listings"."host_name","listings"."property_type", COUNT(*) as 'days_vacant'
    from "listings"
    JOIN "availabilities" ON
        "listings"."id" = "availabilities"."listing_id"
    WHERE "available" = "TRUE" AND
    "date" LIKE "2023-06%"
    GROUP BY("listings"."id");
