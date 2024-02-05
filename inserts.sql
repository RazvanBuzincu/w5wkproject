-- INSERTING CUSTOMERS/SALES PERSON/MECHANIC --


create or replace function insert_customer(first_name VARCHAR, last_name VARCHAR, phone_number VARCHAR, email VARCHAR)
returns VOID as $$
begin
  insert into Customer(first_name, last_name, phone_number, email) values (first_name, last_name, phone_number, email);
end;
$$ language plpgsql;


select insert_customer('John', 'Wick', '123-456-7890', 'john.wick@mydog.com');
select insert_customer('Django', 'Unchained', '098-765-4321', 'django@dissilent.com');
select insert_customer('Jack', 'Sparrow', '555-123-4567', 'jacksparrow@blackpearl.net');
select insert_customer('Jermaine', 'Cole', '555-987-6543', 'jcole@thebest.org');
select insert_customer('Connor', 'McGregor', '555-678-1234', 'thenotorious@propertwelve.com');

select *
from customer;

-- INSERTING ONE COLUMN TO THE TABLE CAR

alter table Car 
add column is_serviced BOOLEAN 
default false;

-- INSERTING SALES PERSON --

create or replace function insert_sales_person(first_name varchar, last_name varchar)
returns void as $$
begin
  insert into sales_person(first_name, last_name) values (first_name, last_name);
end;
$$ language plpgsql;

select insert_sales_person('Quentin', 'Tarantino');

select *
from sales_person;

-- INSERTING THE HANDY MAN AKA MECHANIC --

create or replace function insert_mechanic(first_name varchar, last_name varchar)
returns void as $$
begin
  insert into mechanic(first_name, last_name) values (first_name, last_name);
end;
$$ language plpgsql;

select insert_mechanic('Jason', 'Statham');

select *
from mechanic;

----

create or replace procedure update_service_status(carId int)
language plpgsql
as $$
begin
    if exists (select 1 from invoice i
               join service s on i.service_id = s.service_id
               where s.service_type = 'Oil Change' and i.car_id = carId)
    and (select is_serviced from car where car_id = carId) = 0 then
        update car set is_serviced = 1 where car_id = carId;
    end if;
end;
$$;

-- PAIRING CARS WITH CUSTOMERS --

create or replace function insert_check_out(customer_id int, sales_person_id int, invoice_id int, car_id int, total numeric)
returns void as $$
begin
  insert into check_out(customer_id, sales_person_id, invoice_id, car_id, total) 
  values (customer_id, sales_person_id, invoice_id, car_id, total);
end;
$$ language plpgsql;


-- ADDING CARS OF THE CUSTOMERS --

create or replace function insert_car(make varchar, model varchar, year int, color varchar, price numeric)
returns int as $$
declare
  new_car_id int; 
begin
  insert into car(make, model, year, color, price) values (make, model, year, color, price) returning car_id into new_car_id;
  return new_car_id; 
end;
$$ language plpgsql;

-- got some errors above need to adjust functions



























