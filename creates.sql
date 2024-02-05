-- CREATING TABLES IN THE DATA BASE --

CREATE TABLE Customer (
  customer_id SERIAL primary key,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  phone_number VARCHAR(16),
  email VARCHAR(50)
);
CREATE TABLE Sales_Person (
  sales_person_id SERIAL primary key,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);
CREATE TABLE Mechanic (
  mechanic_id SERIAL primary key,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);
CREATE TABLE Parts (
  parts_id SERIAL primary key,
  part_number INTEGER,
  description VARCHAR(50),
  price NUMERIC(6,2),
  quantity INTEGER
);
CREATE TABLE Invoice (
  invoice_id SERIAL primary key,
  car_id INTEGER,
  service_id INTEGER,
  hours_serviced VARCHAR(10),
  FOREIGN KEY (car_id) REFERENCES Car(car_id),
  FOREIGN KEY (service_id) REFERENCES Service(service_id)
);
create table Service (
	service_id SERIAL primary key,
	service_type Varchar(50),
	rate_per_hour NUMERIC(6,2),
	parts_id INTEGER,
	FOREIGN KEY (parts_id) REFERENCES parts(parts_id)
);
CREATE TABLE Car (
  car_id SERIAL primary key,
  make VARCHAR(20),
  model VARCHAR(20),
  year INTEGER,
  color VARCHAR(20),
  price NUMERIC(6,2)
);
CREATE TABLE Check_Out (
  check_out_id SERIAL primary key,
  customer_id INTEGER,
  sales_person_id INTEGER,
  invoice_id INTEGER,
  car_id INTEGER,
  total NUMERIC(6,2),
  FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
  FOREIGN KEY (sales_person_id) REFERENCES Sales_Person(sales_person_id),
  FOREIGN KEY (invoice_id) REFERENCES Invoice(invoice_id),
  FOREIGN KEY (car_id) REFERENCES Car(car_id)
);
CREATE TABLE Service_Order_Number (
  service_order_number_id SERIAL primary key,
  mechanic_id INTEGER,
  service_id INTEGER,
  FOREIGN KEY (mechanic_id) REFERENCES Mechanic(mechanic_id),
  FOREIGN KEY (service_id) REFERENCES Service(service_id)
);