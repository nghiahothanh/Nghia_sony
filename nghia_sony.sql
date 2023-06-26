use nghia_sony; 

create table Admins(
admin_id int primary key,
username nvarchar(70) not null,
password nvarchar(70) not null,
role nvarchar(30) default 'ROLE_ADMIN' 
);
create table categories(
category_id int primary key,
cateory_name nvarchar(100) not null
);
create table Products (
product_id int primary key auto_increment,
product_name nvarchar(80) not null,
product_description text,
product_price decimal(10,2) not null,
category_id int ,
image nvarchar(200),
foreign key (category_id) references categories (category_id)
);

CREATE TABLE customers (
  customer_id INT PRIMARY KEY,
  username VARCHAR(50) NOT NULL,
  password VARCHAR(50) NOT NULL,
  email VARCHAR(100),
  full_name VARCHAR(100),
  address VARCHAR(200)
);
create table orders(
order_id int primary key,
user_id int,
order_date date,
total_amount decimal(10,2) not null,
shipping_address nvarchar(250),
status nvarchar(50),
foreign key (user_id) references customers(customer_id)
);
CREATE TABLE Order_Items (
  order_item_id INT PRIMARY KEY,
  order_id INT,
  product_id INT,
  quantity INT,
  price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id),
  FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
CREATE TABLE Transactions (
  transaction_id INT PRIMARY KEY,
  order_id INT,
  payment_method VARCHAR(50),
  transaction_date DATE,
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Shipping (
  shipping_id INT PRIMARY KEY,
  order_id INT,
  shipping_date DATE,
  estimated_delivery_date DATE,
  actual_delivery_date DATE,
  courier_company VARCHAR(100),
  tracking_number VARCHAR(50),
  FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

