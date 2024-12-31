-- 2. Retailers Table
CREATE TABLE retailers (
    retailer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    company VARCHAR(100),
    years_of_experience INTEGER CHECK (years_of_experience >= 0),
    rating DECIMAL(10, 2)
);

-- Insert Data into Retailers
INSERT INTO retailers (name, company, years_of_experience) VALUES
('Michael Scott', 'Dunder Mifflin Realty', 15, 3),
('Pam Beesly', 'Art & Homes', 5, 4),
('Jim Halpert', 'Halpert Properties', 8, 4),
('Dwight Schrute', 'Schrute Realty', 10, 4.5),
('Stanley Hudson', 'Hudson Realty', 20, 5);


-- 3. Houses Table
CREATE TABLE houses (
    house_id SERIAL PRIMARY KEY,
    owner_id INTEGER REFERENCES customers(customer_id),
    address VARCHAR(255) NOT NULL,
    sold BOOLEAN DEFAULT FALSE,
    days_on_market INTEGER CHECK (days_on_market >= 0),
    contact_retailer_id INTEGER REFERENCES retailers(retailer_id)
);

-- Insert Data into Houses
INSERT INTO houses (owner_id, address, sold, days_on_market, contact_retailer_id) VALUES
(1, '123 Maple Street', TRUE, 45, 1),
(2, '456 Oak Avenue', FALSE, 120, 2),
(3, '789 Pine Road', FALSE, 75, 3),
(4, '321 Birch Lane', TRUE, 30, 4),
(5, '654 Cedar Drive', TRUE, 60, 5);