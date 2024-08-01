.import --csv meteorites.csv meteorites_temp

update "meteorites_temp" set "mass" = NULL
where mass = (
    select "mass" from "meteorites_temp" where
    mass = ''
);
update "meteorites_temp" set "year" = NULL
where year = (
    select "year" from "meteorites_temp" where
    year = ''
);
update "meteorites_temp" set "lat" = NULL
where lat = (
    select "lat" from "meteorites_temp" where
    lat = ''
);
update "meteorites_temp" set "long" = NULL
where long = (
    select "long" from "meteorites_temp" where
    long = ''
);

update "meteorites_temp" set "mass" = ROUND("mass", 2);
update "meteorites_temp" set "lat" = ROUND("lat", 2);

update "meteorites_temp" set "long" = ROUND("long", 2);

delete from "meteorites_temp" where "nametype" = 'Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

insert into "meteorites" ("name", "class", "mass", "discovery","year","lat", "long")
select "name", "class", "mass", "discovery","year","lat", "long" from meteorites_temp
order by "year", "name";

drop table "meteorites_temp";

