/*Hartsfield-Jackson International Airport, perhaps better known as “ATL” for its IATA airport code, has been the busiest airport in the world since 1998. 
Located in Atlanta, Georgia in the United States, ATL served 93.7 million passengers in 2022. Maybe you were one of them!

Suppose you’ve just been hired to help ATL re-design their database system. In a file called schema.sql in a folder called atl,
write a set of SQL statements to design a database with which Hartsfield-Jackson could keep track of its passengers and their flights.*/
create table "passengers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY("id")
);

create table "checkins"(
    "passenger_id" INTEGER,
    "flight_id" INTEGER,
    "datetime" NUMERIC NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "airports"("id")
);

create table "airlines"(
    "id" INTEGER,
    "name" TEXT NOT NULL UNIQUE,
    "concourse" TEXT NOT NULL CHECK("concourse" IN ('A', 'B', 'C', 'D', 'E', 'F', 'T')),
    PRIMARY KEY("id")
);

CREATE TABLE "flights"(
    "id" INTEGER,
    "airlines_id" INTEGER NOT NULL,
    "flight_number" INTEGER NOT NULL,
    "departing_airport" TEXT NOT NULL,
    "headed_airport" TEXT NOT NULL,
    "departure_time" NUMERIC NOT NULL,
    "arrival_time" NUMERIC NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY("airlines_id") references "airlines"("id")
);


