
-- *** The Lost Letter ***
select id from addresses where "address" = "900 Somerville Avenue";
select id from addresses where "address" = "2 fin%";

select * from packages where "from_address_id" = (
    select id from addresses where "address" = "900 Somerville Avenue"
) AND "to_address_id" = (
    select id from addresses where "address" = "2 fin%"
);

select * from scans where package_id = (
    select id from addresses where "address" = "900 Somerville Avenue"
) AND "to_address_id" = (
    select id from addresses where "address" = "2 fin%"
);

select * from addresses where id = 854;

-- *** The Devious Delivery ***
select * from packages where "from_address_is" IS NULL;

select * from scans where package_id = (
    select id from packages
    where "from_address_id" IS NULL
);

select address_id from scans where
package_id = (
    select id from packages
    where "from_address_id" IS NULL
) AND action='Drop';

select * from addresses where id = ( select address_id from scans
 where package_id = (
    select id from packages
    where "from_address_id" IS NULL
    ) AND action='Drop'
);

-- *** The Forgotten Gift ***
select id from addresses where address = "109 Tileston Street";

select * from packages where from_address_id = (
    select id from addresses
    where address = "109 Tileston Street"
);

select * from scans where package_id = (
    select id from packages
    where from_address_id = (
        select id from addresses
        where address = "109 Tileston Street"
        )
);

select name from drivers where id = 17;

