CREATE TABLE "users"(
    "id" INTEGER,
    "first_name" TEXT,
    "last_name" TEXT,
    "username" TEXT UNIQUE,
    "password" TEXT,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT,
    "location" TEXT,
    "established_year" INTEGER,
    PRIMARY KEY ("id")
);

ALTER TABLE "schools"
DROP COLUMN "location";

ALTER table "schools" ADD COLUMN "type" TEXT NOT NULL;

ALTER TABLE "schools"
RENAME COLUMN "location" TO "Place";

ALTER TABLE "schools"
RENAME COLUMN "Place" TO "location";

CREATE TABLE "schoolconnection"(
    "user_id" INTEGER,
    "school_id" INTEGER
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "degree_type" TEXT,
    PRIMARY KEY("user_id", "school_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools"("id")
);

CREATE TABLE "companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT,
    "location" TEXT,
    PRIMARY KEY (id)
);
CREATE table "companyconnection"(
    "user_id" INTEGER,
    "company_id" INTEGER,
    "start_date" NUMERIC,
    "end_date" NUMERIC,
    "title" TEXT,
    PRIMARY KEY("user_id", "company_id"),
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id")
);

create table userconnection(
    "userID1" INTEGER,
    "userID2" INTEGER,
    PRIMARY KEY("userID1", "userID2")
    FOREIGN KEY("userID1") REFERENCES "users"("id"),
    FOREIGN KEY("userID2") REFERENCES "users"("id")
);
