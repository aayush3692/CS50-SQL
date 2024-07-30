CREATE TABLE "ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price_per_unit" REAL NOT NULL,
    "units" TEXT,
    PRIMARY KEY("id")
);

CREATE TABLE "donuts"(
    "id" INTEGER,
    "ingredients_id" INTEGER
    "name" TEXT NOT NULL,
    "is_gluten_free" BOOLEAN,
    "price" REAL NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id")
);
CREATE TABLE "donutsingredients"(
    "donut_id" INTEGER,
    "ingredients_id" INTEGER,
    PRIMARY KEY("donut_id", "ingredients_id"),
    FOREIGN KEY("ingredients_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);

CREATE TABLE "orders"(
    "id" INTEGER,
    "customer_id" INTEGER
    "order_number" INTEGER NOT NULL,
    PRIMARY KEY("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers"(
    "id" INTEGER,
    "order_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT,
    PRIMARY KEY("id")
    FOREIGN KEY("order_id") REFERENCES "orders"("id")
);

CREATE TABLE "orderdonuts"(
    "donut_id" INTEGER,
    "order_id" INTEGER,
    "quantity" INTEGER,
    PRIMARY KEY("donut_id", "order_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
