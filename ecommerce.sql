-- use ecommerce;
-- create database ERD;
-- use ERD;

--table category
CREATE TABLE category(
category_id INT PRIMARY KEY AUTO_INCREMENT,
categoryName VARCHAR (100),
description VARCHAR(100)
);

-- table products
CREATE TABLE product(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR (100) ,
base_price DECIMAL (50,2) CHECK(base_price>0),
quantity INT ,
description VARCHAR (100),
stockQuantity INT,
category_id INT,
FOREIGN KEY(category_id) REFERENCES category(category_id));


-- table productImage
CREATE TABLE productImage(
    imageID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (100) NOT NULL,
    product_id INT,
    imageURL VARCHAR (255),
    description VARCHAR (100),
FOREIGN KEY(product_id) REFERENCES   product(product_id));

CREATE TABLE product_item (
item_id INT PRIMARY KEY AUTO_INCREMENT,
product_id int,
stock_quantity int not null,
price decimal(10,2) not null,
FOREIGN KEY(product_id) REFERENCES   product(product_id));

CREATE Table color (
color_id  INT PRIMARY KEY AUTO_INCREMENT,
color_name varchar(50) not null,
hex_code varchar(7) not null
);


-- table category
-- CREATE TABLE category(
-- category_id INT PRIMARY KEY AUTO_INCREMENT,
-- categoryName VARCHAR (100),
-- description VARCHAR(100)
-- );

CREATE TABLE size_category (
size_category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name VARCHAR(100));

CREATE TABLE size_option (
size_option_id int PRIMARY KEY AUTO_INCREMENT,
size_name varchar(50) NOT NULL,
size_category_id int ,
FOREIGN KEY(size_category_id) REFERENCES   size_category(size_category_id));

CREATE TABLE product_variation (
variation_id int PRIMARY KEY AUTO_INCREMENT,
item_id int ,
color_id int ,
size_option_id INT NOT NULL,
FOREIGN KEY(item_id) REFERENCES   product_item(item_id),
FOREIGN KEY(color_id) REFERENCES   color(color_id));

CREATE TABLE attribute_category (
attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
category_name varchar(100)
);

CREATE TABLE attribute_type (
attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
type_name VARCHAR (100) NOT NULL,
attribute_category_id INT,
FOREIGN KEY(attribute_category_id) REFERENCES   attribute_category(attribute_category_id));

CREATE TABLE product_attribute (
attribute_id INT PRIMARY KEY AUTO_INCREMENT,
product_id INT NOT NULL,
attribute_type_id INT NOT NULL,
value varchar(255),
FOREIGN KEY(product_id) REFERENCES   product(product_id),
FOREIGN KEY(attribute_type_id) REFERENCES   attribute_type(attribute_type_id));






