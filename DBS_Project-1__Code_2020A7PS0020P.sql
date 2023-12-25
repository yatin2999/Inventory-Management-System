CREATE DATABASE pharma_dbs;

USE pharma_dbs;
CREATE TABLE customers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);
CREATE TABLE suppliers (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_name VARCHAR(255) NOT NULL,
  address VARCHAR(255) NOT NULL,
  phone_number VARCHAR(20) NOT NULL
);
CREATE TABLE medicines (
  id INT AUTO_INCREMENT PRIMARY KEY,
  medicine_name VARCHAR(255) NOT NULL,
  manufacturer VARCHAR(255) NOT NULL,
  category VARCHAR(255) NOT NULL,
  selling_price DECIMAL(10,2) NOT NULL,
  threshold INT NOT NULL
);
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  supplier_id INT NOT NULL,
  order_date DATE NOT NULL,
  FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);
CREATE TABLE order_medicines (
  order_id INT NOT NULL,
  medicine_id INT NOT NULL,
  purchase_price DECIMAL(10,2) NOT NULL,
  order_quantity INT NOT NULL,
  expiry_date DATE NOT NULL,
  PRIMARY KEY (order_id, medicine_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);
CREATE TABLE sales (
  id INT AUTO_INCREMENT PRIMARY KEY,
  customer_id INT NOT NULL,
  sale_date DATE DEFAULT (CURDATE()),
  FOREIGN KEY (customer_id) REFERENCES customers(id)
);
CREATE TABLE sale_medicines (
  sale_id INT NOT NULL,
  medicine_id INT NOT NULL,
  sale_quantity INT NOT NULL,
  PRIMARY KEY (sale_id, medicine_id),
  FOREIGN KEY (sale_id) REFERENCES sales(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);
CREATE TABLE inventory (
  order_id INT NOT NULL,
  medicine_id INT NOT NULL,
  quantity_in_stock INT NOT NULL,
  PRIMARY KEY (order_id, medicine_id),
  FOREIGN KEY (order_id) REFERENCES orders(id),
  FOREIGN KEY (medicine_id) REFERENCES medicines(id)
);

INSERT INTO customers (customer_name, address, phone_number)
VALUES 
  ('John Smith', '123 Main St, Anytown USA', '555-123-4567'),
  ('Jane Doe', '456 Elm St, Anytown USA', '555-987-6543'),
  ('Bob Johnson', '789 Oak St, Anytown USA', '555-555-1212'),
  ('Emily Johnson', '345 Pine St, Anytown USA', '555-555-3456'),
  ('Mark Davis', '678 Maple St, Anytown USA', '555-555-6789'),
  ('Avery Wilson', '910 Cherry St, Anytown USA', '555-555-9101'),
  ('Samantha Lee', '123 Oak St, Anytown USA', '555-555-1234'),
  ('Daniel Kim', '456 Birch St, Anytown USA', '555-555-4567'),
  ('John Doe', '123 Main St, Anytown USA', '555-555-1111'),
  ('Jane Smith', '456 Elm St, Anytown USA', '555-555-2222');

INSERT INTO suppliers (supplier_name, address, phone_number)
VALUES 
  ('ABC Pharmaceuticals', '1234 Market St, Anytown USA', '555-555-1234'),
  ('XYZ Healthcare', '5678 Broadway, Anytown USA', '555-555-5678'),
  ('MNO Medical Supplies', '9101 Park Ave, Anytown USA', '555-555-9101'),
  ('Pharma International', '1111 Walnut St, Anytown USA', '555-555-1111'),
  ('Medicines R Us', '2222 Cedar St, Anytown USA','555-555-2222'),
  ('Global Health Inc.', '3333 Pine St, Anytown USA', '555-555-3333'),
  ('The Medicine Shoppe', '4444 Maple St, Anytown USA', '555-555-4444'),
  ('Rx Solutions', '5555 Oak St, Anytown USA', '555-555-5555'),
  ('Acme Pharmaceuticals', '789 Oak St, Anytown USA', '555-555-6666'),
  ('Global Pharmaceutical Corp.', '901 Walnut St, Anytown USA', '555-555-7777');

INSERT INTO medicines (medicine_name, manufacturer, category, selling_price, threshold)
VALUES 
  ('Ibuprofen', 'Pfizer', 'Pain Relief', 9.99, 100),
  ('Metformin', 'Mylan', 'Diabetes', 12.99, 75),
  ('Simvastatin', 'Teva', 'Cholesterol', 7.99, 50),
  ('Paracetamol', 'GSK', 'Pain Relief', 5.99, 200),
  ('Amoxicillin', 'Aurobindo', 'Antibiotics', 7.99, 150),
  ('Lisinopril', 'Mylan', 'Hypertension', 9.99, 100),
  ('Metoprolol', 'Teva', 'Cardiovascular', 8.99, 125),
  ('Omeprazole', 'Sandoz', 'Gastrointestinal', 12.99, 75),
  ('Amoxicillin', 'Pfizer', 'Antibiotic', 12.99, 50),
  ('Ibuprofen', 'Advil', 'Pain relief', 8.50, 100);

INSERT INTO orders (supplier_id, order_date)
VALUES 
  (1, '2023-01-01'),
  (2, '2023-02-01'),
  (3, '2023-03-01'),
  (4, '2022-08-01'),
  (5, '2022-09-01'),
  (6, '2022-10-01'),
  (7, '2022-04-10'),
  (8, '2022-05-10'),
  (9, '2022-06-10'),
  (10, '2022-07-10');

INSERT INTO order_medicines (order_id, medicine_id, purchase_price, order_quantity, expiry_date)
VALUES 
  (1, 7, 5.99, 500, '2023-01-01'),
  (1, 6, 8.99, 300, '2023-02-01'),
  (2, 5, 7.99, 250, '2023-03-01'),
  (3, 4, 3.99, 300, '2023-04-01'),
  (2, 6, 7.99, 200, '2023-04-01'),
  (6, 2, 5.99, 100, '2023-06-01'),
  (4, 3, 10.99, 150, '2023-10-01'),
  (5, 2, 6.99, 250, '2023-11-01'),
  (6, 1, 10.99, 100, '2024-04-05'),
  (7, 1, 7.50, 200, '2024-04-10'),
  (8, 2, 6.99, 250, '2024-05-10'),
  (9, 1, 10.99, 100, '2024-06-10'),
  (10, 1, 7.50, 200, '2024-07-10');

INSERT INTO sales (customer_id, sale_date)
VALUES 
  (1, '2023-04-01'),
  (2, '2023-04-05'),
  (3, '2023-04-06'),
  (3, '2023-03-02'),
  (4, '2023-01-01'),
  (5, '2023-04-02'),
  (5, '2023-03-03'),
  (7, '2023-03-07'),
  (6, '2023-03-09'),
  (8, '2023-02-01'),
  (9, '2023-04-07'),
  (10, '2023-02-09');

INSERT INTO sale_medicines (sale_id, medicine_id, sale_quantity)
VALUES 
  (1, 1, 50),
  (2, 4, 30),
  (3, 2, 25),
  (4, 3, 15),
  (5, 5, 30),
  (7, 7, 5),
  (6, 6, 10),
  (8, 10, 30),
  (9, 9, 5),
  (10, 8, 10);

INSERT INTO inventory (order_id, medicine_id, quantity_in_stock)
VALUES 
  (1, 7, 1500),
  (1, 6, 1300),
  (2, 5, 1250),
  (3, 4, 1300),
  (2, 6, 1200),
  (6, 2, 1100),
  (4, 3, 1150),
  (5, 2, 1250),
  (6, 1, 1100),
  (7, 1, 1200),
  (8, 2, 1250),
  (9, 1, 1100),
  (10, 1, 1200);
  
  -- What is the current stock level for medication X?
SELECT SUM(quantity_in_stock) 
FROM inventory 
WHERE medicine_id = 3;

-- Which medications will expire within the next 30 days?
SELECT medicine_name, expiry_date 
FROM order_medicines 
JOIN medicines ON order_medicines.medicine_id = medicines.id 
JOIN inventory ON order_medicines.order_id = inventory.order_id AND order_medicines.medicine_id = inventory.medicine_id 
WHERE expiry_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY);

-- How many units of medication Y were sold in the last month?
SELECT SUM(sale_quantity) 
FROM sale_medicines 
JOIN sales ON sale_medicines.sale_id = sales.id 
WHERE medicine_id = 4 AND sale_date BETWEEN DATE_SUB(NOW(), INTERVAL 1 MONTH) AND NOW();

-- Which medications are currently out of stock?
SELECT medicine_name 
FROM medicines 
LEFT JOIN inventory ON medicines.id = inventory.medicine_id 
WHERE quantity_in_stock IS NULL OR quantity_in_stock = 0;

-- What is the average monthly sales revenue for the pharmacy?
SELECT AVG(total_sales) 
FROM (
  SELECT SUM(sale_quantity * selling_price) AS total_sales 
  FROM sale_medicines 
  JOIN medicines ON sale_medicines.medicine_id = medicines.id 
  JOIN sales ON sale_medicines.sale_id = sales.id 
  WHERE MONTH(sale_date) = MONTH(CURRENT_DATE()) 
  GROUP BY YEAR(sale_date), MONTH(sale_date)
) AS monthly_sales;

-- What is the total inventory value of the pharmacy?
SELECT SUM(quantity_in_stock * selling_price) 
FROM inventory 
JOIN medicines ON inventory.medicine_id = medicines.id;

-- Which medications are most frequently sold?
SELECT medicine_name, manufacturer, SUM(sale_quantity) AS total_sold 
FROM sale_medicines 
JOIN medicines ON sale_medicines.medicine_id = medicines.id 
GROUP BY medicine_id 
ORDER BY total_sold DESC 
LIMIT 10;

-- What is the sales trend for medication Z over the past 6 months?
SELECT YEAR(sales.sale_date) AS year, MONTH(sales.sale_date) AS month, SUM(sale_medicines.sale_quantity) AS total_sold
FROM sale_medicines
JOIN sales ON sale_medicines.sale_id = sales.id
WHERE sale_medicines.medicine_id = 5 AND sales.sale_date BETWEEN DATE_SUB(NOW(), INTERVAL 6 MONTH) AND NOW()
GROUP BY YEAR(sales.sale_date), MONTH(sales.sale_date)
ORDER BY year ASC, month ASC;

-- Which medications have the highest profit margin?
SELECT medicine_name, manufacturer, suppliers.supplier_name, (selling_price - purchase_price) / selling_price * 100 AS profit_margin
FROM order_medicines 
JOIN medicines ON order_medicines.medicine_id = medicines.id 
JOIN orders ON order_medicines.order_id = orders.id 
JOIN suppliers ON orders.supplier_id = suppliers.id
ORDER BY profit_margin DESC 
LIMIT 10;

-- Which medications have the lowest turnover rate?
SELECT medicine_name, SUM(sale_quantity) / SUM(order_quantity) AS turnover_rate 
FROM order_medicines 
JOIN medicines ON order_medicines.medicine_id = medicines.id 
JOIN sale_medicines ON order_medicines.medicine_id = sale_medicines.medicine_id 
GROUP BY order_medicines.medicine_id 
ORDER BY turnover_rate ASC 
LIMIT 10;