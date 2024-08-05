CREATE TABLE `users`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `first_name` VARCHAR(32) NOT NULL,
    `last_name` VARCHAR(32) NOT NULL,
    `username` VARCHAR(32) NOT NULL UNIQUE,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`id`)
);
CREATE TABLE `userconnection`(
    `userID1` INT ,
    `userID2` INT ,
    PRIMARY KEY(`userID1`, `userID2`),
    FOREIGN KEY(`userID1`) REFERENCES users(`id`),
    FOREIGN KEY(`userID2`) REFERENCES users(`id`)
);
CREATE TABLE `schools`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `type` VARCHAR(32),
    `location` VARCHAR(32),
    `established_year` YEAR,
    PRIMARY KEY (`id`)
);
CREATE TABLE `schoolsconnection`(
    `user_id` INT ,
    `school_id` INT ,
    `start_date`DATETIME,
    `end_date` DATETIME,
    `degree_type` VARCHAR(32) NOT NULL,
    PRIMARY KEY(`user_id`, `school_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`school_id`) REFERENCES `schools`(`id`)
);
CREATE TABLE `companies`(
    `id` INT UNSIGNED AUTO_INCREMENT,
    `name` VARCHAR(32) NOT NULL,
    `industry` VARCHAR(32),
    `location` VARCHAR(32),
    PRIMARY KEY (`id`)
);
CREATE TABLE `companiesconnections`(
    `user_id` INT ,
    `company_id` INT ,
    `start_date` DATETIME ,
    `end_date` DATETIME,
    `title` TEXT,
    PRIMARY KEY(`user_id`, `company_id`),
    FOREIGN KEY(`user_id`) REFERENCES `users`(`id`),
    FOREIGN KEY(`company_id`) REFERENCES `companies`(`id`)
);

