-- Real Estate System Database

-- 1. Customers Table
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone_number VARCHAR(15),
    address VARCHAR(255)
);

-- 2. Retailers Table
CREATE TABLE retailers (
    retailer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    company VARCHAR(100),
    years_of_experience INTEGER CHECK (years_of_experience >= 0),
    rating DECIMAL(10, 2),
);

-- 3. Houses Table
CREATE TABLE houses (
    house_id SERIAL PRIMARY KEY,
    owner_id INTEGER REFERENCES customers(customer_id),
    address VARCHAR(255) NOT NULL,
    sold BOOLEAN DEFAULT FALSE,
    days_on_market INTEGER CHECK (days_on_market >= 0),
    contact_retailer_id INTEGER REFERENCES retailers(retailer_id)
);

-- 4. House Details Table
CREATE TABLE house_details (
    house_id INTEGER PRIMARY KEY REFERENCES houses(house_id),
    size INTEGER CHECK (size > 0),
    age INTEGER CHECK (age >= 0),
    type VARCHAR(50) CHECK (type IN ('Single', 'Semi', 'Apartment')),
    annual_tax DECIMAL(10, 2),
    heat_source VARCHAR(50)
);

-- Insert Data into Customers
INSERT INTO customers (first_name, last_name, email, phone_number, address) VALUES
('John', 'Doe', 'john.doe@example.com', '123-456-7890', '123 Maple Street'),
('Jane', 'Smith', 'jane.smith@example.com', '987-654-3210', '456 Oak Avenue'),
('Alice', 'Johnson', 'alice.johnson@example.com', '555-234-5678', '789 Pine Road'),
('Bob', 'Williams', 'bob.williams@example.com', '555-678-1234', '321 Birch Lane'),
('Emily', 'Clark', 'emily.clark@example.com', '444-555-6666', '654 Cedar Drive'),
('Michael', 'Brown', 'michael.brown@example.com', '111-222-3333', '12 Elm Street'),
('Sarah', 'Miller', 'sarah.miller@example.com', '222-333-4444', '34 Willow Way'),
('David', 'Wilson', 'david.wilson@example.com', '333-444-5555', '56 Cherry Lane'),
('Laura', 'Moore', 'laura.moore@example.com', '444-555-6666', '78 Aspen Court'),
('Chris', 'Taylor', 'chris.taylor@example.com', '555-666-7777', '90 Spruce Drive'),
('Jessica', 'Anderson', 'jessica.anderson@example.com', '666-777-8888', '123 Poplar Street'),
('Matthew', 'Thomas', 'matthew.thomas@example.com', '777-888-9999', '456 Cedar Grove'),
('Sophia', 'Jackson', 'sophia.jackson@example.com', '888-999-0000', '789 Oak Ridge'),
('James', 'White', 'james.white@example.com', '999-000-1111', '321 Pine Hollow'),
('Olivia', 'Harris', 'olivia.harris@example.com', '000-111-2222', '654 Birchwood Lane'),
('Liam', 'Martin', 'liam.martin@example.com', '111-222-3333', '12 Maple Lane'),
('Emma', 'Lee', 'emma.lee@example.com', '222-333-4444', '34 Elmwood Court'),
('Noah', 'Perez', 'noah.perez@example.com', '333-444-5555', '56 Oakwood Drive'),
('Ava', 'Davis', 'ava.davis@example.com', '444-555-6666', '78 Spruce Hollow'),
('Isabella', 'Garcia', 'isabella.garcia@example.com', '555-666-7777', '90 Aspen Grove'),
('Ethan', 'Martinez', 'ethan.martinez@example.com', '666-777-8888', '123 Willow Street'),
('Mia', 'Rodriguez', 'mia.rodriguez@example.com', '777-888-9999', '456 Cedar Ridge'),
('Alexander', 'Lopez', 'alexander.lopez@example.com', '888-999-0000', '789 Poplar Lane'),
('Amelia', 'Gonzalez', 'amelia.gonzalez@example.com', '999-000-1111', '321 Oak Drive'),
('Charlotte', 'Clark', 'charlotte.clark@example.com', '000-111-2222', '654 Pine Grove'),
('Benjamin', 'Hall', 'benjamin.hall@example.com', '111-222-3333', '12 Birch Lane'),
('Lucas', 'Allen', 'lucas.allen@example.com', '222-333-4444', '34 Aspen Way'),
('Harper', 'Young', 'harper.young@example.com', '333-444-5555', '56 Spruce Drive'),
('Ella', 'King', 'ella.king@example.com', '444-555-6666', '78 Cherry Lane');
-- Add 25 more customers as needed.

-- Insert Data into Retailers
INSERT INTO retailers (name, company, years_of_experience) VALUES
('Michael Scott', 'Dunder Mifflin Realty', 15, 3),
('Pam Beesly', 'Art & Homes', 5, 4),
('Jim Halpert', 'Halpert Properties', 8, 4),
('Dwight Schrute', 'Schrute Realty', 10, 4.5),
('Stanley Hudson', 'Hudson Realty', 20, 5);
-- Add 15 more retailers as needed.

-- Insert Data into Houses
INSERT INTO houses (owner_id, address, sold, days_on_market, contact_retailer_id) VALUES
(1, '123 Maple Street', TRUE, 45, 1),
(2, '456 Oak Avenue', FALSE, 120, 2),
(3, '789 Pine Road', FALSE, 75, 3),
(4, '321 Birch Lane', TRUE, 30, 4),
(5, '654 Cedar Drive', TRUE, 60, 5);
(6, '12 Elm Street', FALSE, 90, 6),
(7, '34 Willow Way', TRUE, 50, 7),
(8, '56 Cherry Lane', FALSE, 110, 8),
(9, '78 Aspen Court', TRUE, 20, 9),
(10, '90 Spruce Drive', FALSE, 95, 10),
(11, '123 Poplar Street', TRUE, 40, 11),
(12, '456 Cedar Grove', TRUE, 35, 12),
(13, '789 Oak Ridge', FALSE, 80, 13),
(14, '321 Pine Hollow', TRUE, 25, 14),
(15, '654 Birchwood Lane', FALSE, 100, 15),
(16, '12 Maple Lane', TRUE, 45, 16),
(17, '34 Elmwood Court', FALSE, 70, 17),
(18, '56 Oakwood Drive', TRUE, 50, 18),
(19, '78 Spruce Hollow', TRUE, 30, 19),
(20, '90 Aspen Grove', FALSE, 85, 20),
(21, '123 Willow Street', TRUE, 60, 1),
(22, '456 Cedar Ridge', FALSE, 115, 2),
(23, '789 Poplar Lane', TRUE, 45, 3),
(24, '321 Oak Drive', TRUE, 55, 4),
(25, '654 Pine Grove', FALSE, 75, 5),
(26, '12 Birch Lane', TRUE, 35, 6),
(27, '34 Maple Hollow', FALSE, 120, 7),
(28, '56 Elm Grove', TRUE, 45, 8),
(29, '78 Oak Court', TRUE, 25, 9),
(30, '90 Spruce Street', FALSE, 100, 10),
(31, '123 Cedar Avenue', TRUE, 55, 11),
(32, '456 Willow Drive', FALSE, 75, 12),
(33, '789 Aspen Road', TRUE, 50, 13),
(34, '321 Pine Court', TRUE, 20, 14),
(35, '654 Poplar Grove', FALSE, 95, 15),
(36, '12 Oakwood Hollow', TRUE, 30, 16),
(37, '34 Maple Ridge', FALSE, 90, 17),
(38, '56 Elm Street', TRUE, 40, 18),
(39, '78 Birch Way', TRUE, 60, 19),
(40, '90 Cedar Hollow', FALSE, 85, 20),
(41, '123 Willow Grove', TRUE, 45, 1),
(42, '456 Poplar Lane', FALSE, 110, 2),
(43, '789 Aspen Drive', TRUE, 35, 3),
(44, '321 Pine Ridge', TRUE, 50, 4),
(45, '654 Maple Court', FALSE, 120, 5),
(46, '12 Spruce Grove', TRUE, 25, 6),
(47, '34 Birch Lane', TRUE, 55, 7),
(48, '56 Cedar Road', FALSE, 75, 8),
(49, '78 Elm Court', TRUE, 40, 9),
(50, '90 Oak Hollow', FALSE, 90, 10),
(51, '123 Spruce Drive', TRUE, 30, 11),
(52, '456 Maple Way', FALSE, 115, 12),
(53, '789 Pine Street', TRUE, 50, 13),
(54, '321 Cedar Hollow', TRUE, 60, 14),
(55, '654 Willow Grove', FALSE, 100, 15);
-- Add 55 more houses as needed.

-- Insert Data into House Details
INSERT INTO house_details (house_id, size, age, type, annual_tax, heat_source) VALUES
(1, 1500, 10, 'Single', 3500.00, 'Gas'),
(2, 2000, 5, 'Semi', 4500.00, 'Electric'),
(3, 1200, 20, 'Apartment', 2500.00, 'Gas'),
(4, 1800, 15, 'Single', 4000.00, 'Oil'),
(5, 1400, 8, 'Semi', 3000.00, 'Electric');
(6, 2200, 5, 'Single', 4000.50, 'Gas'),
(7, 1500, 10, 'Semi', 3200.25, 'Electric'),
(8, 1300, 12, 'Apartment', 2500.75, 'Electric'),
(9, 1800, 6, 'Single', 3500.45, 'Gas'),
(10, 1400, 9, 'Semi', 2800.30, 'Gas'),
(11, 1600, 15, 'Apartment', 3000.80, 'Electric'),
(12, 2000, 8, 'Single', 3700.60, 'Gas'),
(13, 1100, 11, 'Semi', 2200.40, 'Electric'),
(14, 1200, 20, 'Apartment', 2400.50, 'Gas'),
(15, 1900, 7, 'Single', 3600.25, 'Gas'),
(16, 1700, 4, 'Semi', 3400.70, 'Electric'),
(17, 950, 18, 'Apartment', 2100.65, 'Gas'),
(18, 1350, 6, 'Single', 2900.40, 'Gas'),
(19, 1550, 10, 'Semi', 3100.85, 'Electric'),
(20, 1450, 9, 'Apartment', 2600.30, 'Gas'),
(21, 2000, 3, 'Single', 3800.90, 'Electric'),
(22, 1300, 16, 'Semi', 2400.55, 'Gas'),
(23, 1750, 7, 'Apartment', 3400.80, 'Electric'),
(24, 1200, 13, 'Semi', 2300.60, 'Gas');
(26, 1800, 10, 'Single', 3500.50, 'Gas'),
(27, 2400, 5, 'Semi', 4200.75, 'Electric'),
(28, 950, 15, 'Apartment', 2000.30, 'Gas'),
(29, 2100, 8, 'Single', 3800.90, 'Gas'),
(30, 1850, 12, 'Semi', 3600.25, 'Electric'),
(31, 1450, 6, 'Apartment', 2400.60, 'Electric'),
(32, 1700, 9, 'Single', 3100.80, 'Gas'),
(33, 1200, 14, 'Semi', 2600.35, 'Electric'),
(34, 1500, 7, 'Apartment', 2700.50, 'Gas'),
(35, 2000, 10, 'Single', 4100.45, 'Gas'),
(36, 2200, 3, 'Semi', 4400.65, 'Electric'),
(37, 1250, 18, 'Apartment', 2100.40, 'Gas'),
(38, 1750, 6, 'Single', 3300.70, 'Gas'),
(39, 1550, 11, 'Semi', 2900.50, 'Electric'),
(40, 1900, 8, 'Apartment', 3500.95, 'Gas'),
(41, 2250, 4, 'Single', 4600.80, 'Electric'),
(42, 1000, 16, 'Apartment', 2300.20, 'Gas'),
(43, 1600, 9, 'Semi', 3000.60, 'Electric'),
(44, 1400, 13, 'Apartment', 2500.55, 'Gas'),
(45, 2300, 2, 'Single', 4700.90, 'Electric'),
(46, 2100, 7, 'Semi', 4000.85, 'Gas'),
(47, 950, 20, 'Apartment', 2200.75, 'Electric'),
(48, 1950, 5, 'Single', 3800.40, 'Gas'),
(49, 1350, 12, 'Semi', 2700.50, 'Electric'),
(50, 1150, 19, 'Apartment', 2600.35, 'Gas'),
(51, 2050, 6, 'Single', 3900.45, 'Gas'),
(52, 1850, 14, 'Semi', 3500.70, 'Electric'),
(53, 1250, 10, 'Apartment', 2400.85, 'Gas'),
(54, 1600, 4, 'Single', 3300.55, 'Electric'),
(55, 2400, 7, 'Semi', 4200.95, 'Gas');