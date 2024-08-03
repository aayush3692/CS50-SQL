create table "answers"(
    "id" INTEGER,
    "sentence" TEXT,
    PRIMARY KEY("id")
);

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 14;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 114;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 618;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 630;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 932;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 2230;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 2346;

insert into answers("id", "sentence")
SELECT "id", "sentence" from sentences where id = 3041;

/*14	98	4
114	3	5
618	72	9
630	7	3
932	12	5
2230	50	7
2346	44	10
3041	14	5*/
create table "clues"(
    "answer" TEXT
);
INSERT INTO "clues" ("answer")
select substr("sentence",98,4) from "answers" where id = 14;

INSERT INTO "clues" ("answer")
select substr("sentence",3,5) from "answers" where id = 114;

INSERT INTO "clues" ("answer")
select substr("sentence",72,9) from "answers" where id = 618;

INSERT INTO "clues" ("answer")
select substr("sentence",7,3) from "answers" where id = 630;

INSERT INTO "clues" ("answer")
select substr("sentence",12,5) from "answers" where id = 932;

INSERT INTO "clues" ("answer")
select substr("sentence",50,7) from "answers" where id = 2230;

INSERT INTO "clues" ("answer")
select substr("sentence",44,10) from "answers" where id = 2346;

INSERT INTO "clues" ("answer")
select substr("sentence",14,5) from "answers" where id = 3041;

CREATE VIEW "message" AS
SELECT "answer" AS "phrase" FROM "clues";
