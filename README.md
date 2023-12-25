# Inventory-Management-System
This database project aims to design and implement a relational database for a pharmaceutical company. The company manages various operations such as ordering medicines from suppliers, managing inventory, sales to customers etc. The database will store information about medicines, orders, suppliers, inventory as well as sales.

The relationships connect the entities and show how they are related to each other. The entities and relationships in this project are:
- Customers: Represents the customers of the pharmaceutical business. It has a one-to-many relationship with Sales.
- Suppliers: Represents the suppliers that provide medicines to the pharmaceutical business. It has a one-to-many relationship with Orders.
- Medicines: Represents the medicines that the pharmaceutical business sells. It has a many-to-many relationship with Orders and Sales through the Order_Medicines and Sale_Medicines tables, respectively.
- Orders: Represents the orders placed by the pharmaceutical business with suppliers. It has a many-to-one relationship with Suppliers and a many-to-many relationship with Medicines through the Order_Medicines table.
- Sales: Represents the sales made by the pharmaceutical business to customers. It has a many-to-one relationship with Customers and a many-to-many relationship with Medicines through the Sale_Medicines table.
- Inventory: Represents the current stock of medicines held by the pharmaceutical business. It has a one-to-many relationship with Orders and Medicines through the Order_Medicines table.

## Relational Schema
The relational schema for this project is shown below:
- Customers (id, customer_name, address, phone_number)
- Suppliers (id, supplier_name, address, phone_number)
- Medicines (id, medicine_name, manufacturer, category, selling_price, threshold)
- Orders (id, supplier_id, order_date)
- Order_Medicines (order_id, medicine_id, purchase_price, order_quantity, expiry_date)
- Sales (id, customer_id, sale_date)
- Sale_Medicines (sale_id, medicine_id, sale_quantity)
- Inventory (order_id, medicine_id, quantity_in_stock)
Each entity in the ER diagram is represented by a table, and each attribute is represented by a column in the table. The relationships between the entities are represented by foreign key constraints.

## Normalization
The tables in the relational schema are normalized to third normal form (3NF) by identifying functional dependencies.
The functional dependencies for each table are as follows:
- Customers: id -> customer_name, address, phone_number
- Suppliers: id -> supplier_name, address, phone_number
- Medicines: id -> medicine_name, manufacturer, category, selling_price, threshold
- Orders: id -> supplier_id, order_date
- Order_Medicines: (order_id, medicine_id) -> purchase_price, order_quantity, expiry_date
- Sales: id -> customer_id, sale_date
- Sale_Medicines: (sale_id, medicine_id) -> sale_quantity
- Inventory: (order_id, medicine_id) -> quantity_in_stock
