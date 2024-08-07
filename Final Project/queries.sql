-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database
INSERT INTO `categories` (`category_name`) VALUES ('Electronics');
INSERT INTO `categories` (`category_name`) VALUES ('Home Appliances');
INSERT INTO `categories` (`category_name`) VALUES ('Furniture');
INSERT INTO `categories` (`category_name`) VALUES ('Books');
INSERT INTO `categories` (`category_name`) VALUES ('Clothing');

INSERT INTO `brands` (`category_id`, `brand_name`) VALUES
        (1, 'Samsung'),
        (1, 'Apple'),
        (1, 'Sony'),
        (1, 'Wega'),

        (2, 'Whirlpool'),
        (2, 'Bosch'),
        (2, 'KitchenAid');

INSERT INTO `products`(`brand_id`, `product_name`) VALUES
        (1, 'Samsung Galaxy S21'),
        (1, 'Samsung OLED TV'),
        (2, 'Apple iPhone 13'),
        (2, 'Apple MacBook Pro'),
        (3, 'Sony PlayStation 5'),
        (4, 'WEGA OLED TV'),
        (5, 'Whirlpool Refrigerator'),
        (6, 'Bosch Coffee Machine'),
        (7, 'KitchenAid Food Processor');

INSERT INTO `suppliers` (`supplier_name`) VALUES
        ('TechCorp Inc.'),
        ('HomeGoods Ltd.'),
        ('ElectroMasters Co.'),
        ('GadgetStore Supply');

INSERT INTO `products_supplied` (`product_id`, `supplier_id`) VALUES
    (1, 1),  -- Samsung Galaxy S21 supplied by TechCorp Inc.
    (1, 2),  -- Samsung Galaxy S21 supplied by HomeGoods Ltd.
    (2, 1),  -- Samsung OLED TV supplied by TechCorp Inc.
    (2, 2),  -- Samsung OLED TV supplied by HomeGoods Ltd.
    (3, 3),  -- Apple iPhone 13 supplied by ElectroMasters Co.
    (4, 4),  -- Apple MacBook Pro supplied by GadgetStore Supply
    (5, 1),  -- Sony PlayStation 5 supplied by TechCorp Inc.
    (6, 2),  -- Bosch Coffee Machine supplied by HomeGoods Ltd.
    (7, 3);  -- KitchenAid Food Processor supplied by ElectroMasters Co.

 -- Insert multiple rows into the transactions table in a single query

INSERT INTO `transactions` (`product_id`, `quantity`, `transaction_type`, `date`) VALUES
    (1, 2, 'sale', '2024-08-05 10:00:00'),  -- Sale of 2 units of Samsung Galaxy S21
    (3, 10, 'restock', '2024-08-05 11:00:00'), -- Restocking of 10 units of Apple iPhone 13
    (5, 1, 'sale', '2024-08-05 12:00:00'),  -- Sale of 1 unit of Sony PlayStation 5
    (2, 5, 'restock', '2024-08-05 13:00:00'); -- Restocking of 5 units of Samsung OLED TV


SELECT `brand_name`, `product_name` from brands
JOIN `products` ON `products`.`brand_id` = `brands`.id;

SELECT `product_name` from products
WHERE `deleted` = 1;

SELECT * from `transactions` where `action` = 'sale';

