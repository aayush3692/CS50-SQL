-- In this SQL file, write (and comment!) the schema of your database, including the CREATE TABLE,
-- CREATE INDEX, CREATE VIEW, etc. statements that compose it

-- Categories Table
CREATE TABLE `categories` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `category_name` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`)
) AUTO_INCREMENT = 1;

-- Brands Table
CREATE TABLE `brands` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `category_id` INT UNSIGNED NOT NULL,
    `brand_name` VARCHAR(64) NOT NULL,
    `deleted` TINYINT DEFAULT 0;
    PRIMARY KEY (`id`),
    FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
);

-- Products Table
CREATE TABLE `products` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `brand_id` INT UNSIGNED NOT NULL,
    `product_name` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`brand_id`) REFERENCES `brands` (`id`)
);

-- Suppliers Table
CREATE TABLE `suppliers` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `supplier_name` VARCHAR(64) NOT NULL,
    PRIMARY KEY (`id`)
);

-- Products Supplied Table
CREATE TABLE `products_supplied` (
    `product_id` INT UNSIGNED NOT NULL,
    `supplier_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`product_id`, `supplier_id`),
    FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
    FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
);

-- Transactions Table
CREATE TABLE `transactions` (
    `id` INT UNSIGNED AUTO_INCREMENT,
    `product_id` INT UNSIGNED NOT NULL,
    `quantity` INT NOT NULL,
    `transaction_type` ENUM('sale', 'restock') NOT NULL,
    `date` DATETIME NOT NULL CURRENT_TIMESTAMP,
    `deleted` TINYINT DEFAULT 0,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
);

DELIMITER //
 CREATE PROCEDURE `sell`(IN sold_id INT)
    BEGIN
        UPDATE `products` set `deleted` = 1
        WHERE id = sold_id;
        INSERT INTO `transactions`(`product_id`, `quantity`, `action`)
        VALUES ((INSERT `id` FROM `products` WHERE `id` = `sold_id`), 1, 'sale');
    END//

DELIMITER ;

CREATE VIEW `products_info` AS
    SELECT `brand_name`, `product_name`, `quantity` FROM products
    JOIN `brands` ON brands.id = products.brand_id
    JOIN `transactions` ON transactions.product_id = products.id;








