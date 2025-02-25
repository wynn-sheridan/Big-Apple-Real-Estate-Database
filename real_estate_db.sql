DROP SCHEMA IF EXISTS RealEstate;
CREATE SCHEMA IF NOT EXISTS RealEstate DEFAULT CHARACTER SET utf8mb4;
USE RealEstate;

-- Create Table Statements

drop table if exists agent;
CREATE TABLE agent (
    agent_id INT PRIMARY KEY AUTO_INCREMENT,
    agent_firstname VARCHAR(50) NOT NULL,
    agent_lastname VARCHAR(50) NOT NULL,
    agent_email VARCHAR(100) NOT NULL
);

DROP TABLE IF EXISTS borough;
CREATE TABLE borough (
    borough_id INT PRIMARY KEY AUTO_INCREMENT, 
    borough_name VARCHAR(50) NOT NULL,
    avg_rent INT NOT NULL,  
    population INT NOT NULL                    
);

drop table if exists roommate_group;
CREATE TABLE roommate_group (
	roommate_group_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    num_roommates INT NOT NULL,
    group_budget INT NOT NULL
);

drop table if exists property;
CREATE TABLE property (
    property_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    num_bedrooms INT NOT NULL,
    num_bathrooms INT NOT NULL,
    size_sq_ft INT NOT NULL,
    monthly_rent INT NOT NULL,
    listing_agent_id INT NOT NULL,
    borough_id INT NOT NULL,
    FOREIGN KEY (listing_agent_id) REFERENCES agent(agent_id),
    FOREIGN KEY (borough_id) REFERENCES borough(borough_id) 
);


DROP TABLE IF EXISTS client;
CREATE TABLE client (
    client_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    client_firstname VARCHAR(50) NOT NULL,
    client_lastname VARCHAR(50) NOT NULL,
    client_email VARCHAR(100),
    rent_budget INt NOT NULL,
    desired_beds INT NOT NULL,
    desired_baths INT NOT NULL,
    desired_borough_id INT NOT NULL,
    roommate_group_id INT,
    FOREIGN KEY (desired_borough_id) REFERENCES borough(borough_id),
    FOREIGN KEY (roommate_group_id) REFERENCES roommate_group(roommate_group_id) 
);

DROP TABLE IF EXISTS lease;
CREATE TABLE IF NOT EXISTS lease (
  lease_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  start_date DATETIME NOT NULL,
  end_date DATETIME NULL,
  agent_id INT NOT NULL,
  property_id INT,
  roommate_group_id INT NOT NULL,
  FOREIGN KEY (agent_id) REFERENCES agent(agent_id),
  FOREIGN KEY (property_id) REFERENCES property(property_id),
  FOREIGN KEY (roommate_group_id) REFERENCES roommate_group(roommate_group_id)
  );



-- Insert Sample Data

-- Insert Agents
INSERT INTO agent (agent_firstname, agent_lastname, agent_email) VALUES
('John', 'Doe', 'johndoe@example.com'),
('Jane', 'Smith', 'janesmith@example.com'),
('Emily', 'Johnson', 'emilyjohnson@example.com'),
('Michael', 'Brown', 'michaelbrown@example.com'),
('Sarah', 'Davis', 'sarahdavis@example.com'),
('Paul', 'Anderson', 'paulanderson@example.com'),
('Laura', 'Wilson', 'laurawilson@example.com'),
('Sophia', 'Thomas', 'sophiathomas@example.com');


-- Insert Boroughs
INSERT INTO borough (borough_name, avg_rent, population) VALUES
('Manhattan', 3500, 1600000),
('Brooklyn', 2800, 2500000),
('Queens', 2500, 2300000),
('Bronx', 1800, 1400000),
('Staten Island', 2200, 480000);

-- Insert Properties
INSERT INTO property (num_bedrooms, num_bathrooms, size_sq_ft, monthly_rent, listing_agent_id, borough_id) VALUES
(3, 2, 1200, 4500, 1, 1), -- Property 1 in Manhattan, listed by John Doe
(2, 1, 900, 3200, 2, 2), -- Property 2 in Brooklyn, listed by Jane Smith
(4, 3, 1500, 5000, 1, 1), -- Property 3 in Manhattan, listed by John Doe
(1, 1, 600, 2200, 3, 3), -- Property 4 in Queens, listed by Emily Johnson
(2, 2, 1100, 2700, 4, 4), -- Property 5 in the Bronx, listed by Michael Brown
(3, 2, 1400, 4200, 1, 1), -- Property 6 in Manhattan, unleased
(4, 3, 2000, 7000, 2, 1), -- Property 7 in Manhattan, unleased
(3, 2, 1200, 4500, 1, 2), -- Property 8 in Brooklyn, unleased
(2, 1, 800, 2800, 3, 3), -- Property 9 in Queens, unleased
(5, 4, 3000, 8500, 5, 1), -- Property 10 in Manhattan, unleased
(3, 2, 1300, 4600, 6, 1), -- Manhattan property
(2, 1, 800, 2800, 7, 2), -- Brooklyn property
(1, 1, 700, 2100, 8, 3), -- Queens property
(4, 3, 1600, 5100, 1, 1), -- Manhattan property
(3, 2, 1400, 4500, 5, 4), -- Bronx property
(2, 2, 1000, 2700, 3, 5); -- Staten Island property


-- Insert Roommate Groups
INSERT INTO roommate_group (num_roommates, group_budget) VALUES
(3, 6000), -- Group 1 with 3 roommates
(4, 9000), -- Group 2 with 4 roommates
(1, 3000), -- Single tenant (Group 3)
(2, 5000), -- Group 4 with 2 roommates
(1, 2700), -- Single tenant (Group 5)
(2, 4000), -- Group 6
(3, 8000), -- Group 7
(1, 3500), -- Group 8
(4, 10000); -- Group 9

-- Insert Data into Client Table
INSERT INTO client (client_firstname, client_lastname, client_email, rent_budget, desired_beds, desired_baths, desired_borough_id, roommate_group_id) VALUES
('Alice', 'Walker', 'alice.walker@example.com', 2000, 3, 2, 1, 1), -- Client 1 in Group 1
('Bob', 'Taylor', 'bob.taylor@example.com', 2000, 3, 2, 1, 1),  -- Client 2 in Group 1
('Charlie', 'Harris', 'charlie.harris@example.com', 2000, 3, 2, 1, 1), -- Client 3 in Group 1
('Diana', 'Martinez', 'diana.martinez@example.com', 2200, 4, 2, 2, 2), -- Client 4 in Group 2
('Ethan', 'Clark', 'ethan.clark@example.com', 2200, 4, 2, 2, 2), -- Client 5 in Group 2
('Fiona', 'Rodriguez', 'fiona.rodriguez@example.com', 2000, 4, 2, 2, 2), -- Client 6 in Group 2
('George', 'Lewis', 'george.lewis@example.com', 2000, 4, 2, 2, 2), -- Client 7 in Group 2
('Hannah', 'White', 'hannah.white@example.com', 3000, 1, 1, 3, 3), -- Client 8 in Group 3
('Ian', 'Hall', 'ian.hall@example.com', 2500, 2, 1, 4, 4), -- Client 9 in Group 4
('Jessica', 'Young', 'jessica.young@example.com', 2500, 2, 1, 4, 4), -- Client 10 in Group 4
('Kevin', 'Allen', 'kevin.allen@example.com', 2700, 2, 2, 5, 5), -- Client 11 in Group 5
('Rachel', 'Green', 'rachel.green@example.com', 3000, 2, 1, 1, NULL), -- Client 12 not in a Group
('Monica', 'Geller', 'monica.geller@example.com', 3200, 2, 1, 1, NULL), -- Client 13 not in a Group
('Phoebe', 'Buffay', 'phoebe.buffay@example.com', 2800, 2, 1, 1, NULL), -- Client 14 not in a Group
('Laura', 'Parker', 'laura.parker@example.com', 2500, 2, 1, 2, 6), -- Group 6
('Oscar', 'Morris', 'oscar.morris@example.com', 2500, 2, 1, 2, 6), -- Group 6
('Sophia', 'Garcia', 'sophia.garcia@example.com', 3000, 3, 2, 1, 7), -- Group 7
('Liam', 'Walker', 'liam.walker@example.com', 3000, 3, 2, 1, 7), -- Group 7
('Noah', 'Scott', 'noah.scott@example.com', 3000, 3, 2, 1, 7), -- Group 7
('Emma', 'Rivera', 'emma.rivera@example.com', 3500, 1, 1, 3, 8), -- Group 8
('Evelyn', 'Torres', 'evelyn.torres@example.com', 4000, 4, 3, 4, 9), -- Group 9
('Olivia', 'Cruz', 'olivia.cruz@example.com', 4000, 4, 3, 4, 9), -- Group 9
('Lucas', 'Gray', 'lucas.gray@example.com', 4000, 4, 3, 4, 9); -- Group 9


-- Insert Data into Lease Table
INSERT INTO lease (start_date, end_date, agent_id, property_id, roommate_group_id) VALUES
('2024-06-01', '2025-06-01', 6, 6, 6), -- Lease for Property 6 with Group 6
('2024-07-01', '2025-07-01', 7, 7, 7), -- Lease for Property 7 with Group 7
('2024-08-01', '2025-08-01', 8, 8, 8), -- Lease for Property 8 with Group 8
('2024-09-01', '2025-09-01', 5, 9, 9), -- Lease for Property 9 with Group 9
('2023-11-23', '2024-12-01', 1, 1, 1), -- Lease for Property 1 with Group 1, expires in 8 days
('2023-12-01', '2024-12-15', 2, 2, 2), -- Lease for Property 2 with Group 2, expires in 22 days
('2024-01-01', '2024-12-05', 3, 3, 3), -- Lease for Property 3 with Group 3, expires in 12 days
('2024-02-01', '2024-12-20', 4, 4, 4), -- Lease for Property 4 with Group 4, expires in 27 days
('2024-03-01', '2024-12-22', 5, 5, 5); -- Lease for Property 5 with Group 5, expires in 29 days


-- QUERIES

-- Match Clients to Properties Based on Preferences
SELECT 
    c.client_id, 
    CONCAT(c.client_firstname, ' ', c.client_lastname) AS client_name,
    p.property_id, 
    p.monthly_rent as 'rent',
    p.num_bedrooms as 'bedrooms',
    p.num_bathrooms as 'bathrooms',
    b.borough_name as 'borough'
FROM 
    client c
JOIN 
    property p ON (c.desired_borough_id = p.borough_id)
JOIN 
    borough b ON (p.borough_id = b.borough_id)
WHERE 
    p.num_bedrooms >= c.desired_beds
    AND p.num_bathrooms >= c.desired_baths
    AND p.monthly_rent <= c.rent_budget;
    
-- Find agents who are actively managing leases for clients in their desired borough.
SELECT DISTINCT
    a.agent_id,
    CONCAT(a.agent_firstname, ' ', a.agent_lastname) AS agent_name,
    c.client_id,
    CONCAT(c.client_firstname, ' ', c.client_lastname) AS client_name,
    b.borough_name
FROM 
    agent a
JOIN 
    lease l ON a.agent_id = l.agent_id
JOIN 
    client c ON l.roommate_group_id = c.roommate_group_id
JOIN 
    borough b ON c.desired_borough_id = b.borough_id
WHERE 
    EXISTS (
        SELECT 1
        FROM property p
        WHERE p.property_id = l.property_id AND p.borough_id = c.desired_borough_id
    )
    ORDER BY c.client_id ASC;

-- Identify leases expiring soon (e.g., within 30 days) for renewal opportunities.
SELECT 
    l.lease_id, 
    p.property_id, 
    CONCAT(a.agent_firstname, ' ', a.agent_lastname) AS agent_name,
    rg.roommate_group_id, 
    DATEDIFF(l.end_date, CURDATE()) AS days_to_expire
FROM 
    lease l
JOIN 
    property p ON l.property_id = p.property_id
JOIN 
    agent a ON l.agent_id = a.agent_id
JOIN 
    roommate_group rg ON l.roommate_group_id = rg.roommate_group_id
WHERE 
    l.end_date BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 30 DAY)
ORDER BY 
    l.end_date ASC;

-- Counts the number of properties in each borough
SELECT 
    b.borough_name AS borough_name, 
    COUNT(p.property_id) AS property_count
FROM 
    property p
JOIN 
    borough b ON p.borough_id = b.borough_id
GROUP BY 
    b.borough_name;

-- Finds the total rent collected for each agent across all their listed properties:
SELECT 
    a.agent_firstname AS firstname, 
    a.agent_lastname AS lastname, 
    SUM(p.monthly_rent) AS total_rent
FROM 
    agent a
JOIN 
    property p ON a.agent_id = p.listing_agent_id
GROUP BY 
    a.agent_id
ORDER BY 
    total_rent DESC;

-- Finds the details of the priciest property rented in Manhattan:
SELECT 
    p.property_id AS property_id, 
    p.num_bedrooms AS bedrooms, 
    p.num_bathrooms AS bathrooms, 
    p.size_sq_ft AS sq_ft, 
    p.monthly_rent AS monthly_rent, 
    a.agent_firstname AS agent_firstname, 
    a.agent_lastname AS agent_lastname
FROM 
    property p
JOIN 
    agent a ON p.listing_agent_id = a.agent_id
JOIN 
    borough b ON p.borough_id = b.borough_id
WHERE 
    b.borough_name = 'Manhattan'
ORDER BY 
    p.monthly_rent DESC
LIMIT 1;

-- Query 4: Rachel, Monica, and Phoebe all just moved to New York from College and want to move to Manhattan together.
-- Create a new group for them and find suitable properties based on their preferences

-- Step 1: Create New Roommate Group
INSERT INTO roommate_group (num_roommates, group_budget)
SELECT 
    COUNT(*) AS num_roommates,
    SUM(rent_budget) AS group_budget
FROM client
WHERE client_firstname IN ('Rachel', 'Monica', 'Phoebe');

-- Step 2: Assign Clients to the New Roommate Group
UPDATE client
SET roommate_group_id = LAST_INSERT_ID()
WHERE client_firstname IN ('Rachel', 'Monica', 'Phoebe');

-- Step 3: Find Suitable Properties
SELECT 
    p.property_id, 
    p.num_bedrooms, 
    p.num_bathrooms, 
    p.size_sq_ft, 
    p.monthly_rent, 
    b.borough_name
FROM property p
LEFT JOIN lease l USING (property_id)
JOIN borough b USING (borough_id)
WHERE l.property_id IS NULL -- Property not leased
  AND p.num_bedrooms >= 3   -- At least 3 bedrooms
  AND p.monthly_rent <= (
      SELECT rg.group_budget 
      FROM roommate_group rg
      JOIN client c ON rg.roommate_group_id = c.roommate_group_id
      WHERE c.client_firstname IN ('Rachel', 'Monica', 'Phoebe')
      GROUP BY rg.roommate_group_id
  ) -- Within the group's budget
  AND b.borough_name = 'Manhattan'; -- Preferred borough
  
-- Query 5: the group decides to sign a lease on Property #6. Insert the new lease 
  -- and get the email addresses of all clients and the listing agent so they can communicate.
  INSERT INTO lease (start_date, end_date, agent_id, property_id, roommate_group_id)
SELECT 
    '2024-12-01', -- Lease start date
    '2025-12-01', -- Lease end date
    p.listing_agent_id, -- Agent responsible for the property
    p.property_id, -- Property being leased
    rg.roommate_group_id -- Roommate group renting the property
FROM property p
JOIN roommate_group rg
ON p.property_id = 11 -- Target property
WHERE rg.roommate_group_id = (
    SELECT roommate_group_id 
    FROM client 
    WHERE client_firstname = 'Rachel' -- Identify group by Rachel
    LIMIT 1
);

SELECT 
    CONCAT(c.client_firstname, ' ', c.client_lastname) AS person, 
    c.client_email AS email
FROM lease l
JOIN client c ON l.roommate_group_id = c.roommate_group_id
WHERE l.property_id = 11
UNION ALL
SELECT 
    CONCAT(a.agent_firstname, ' ', a.agent_lastname) AS person, 
    a.agent_email AS email
FROM lease l
JOIN property p ON l.property_id = p.property_id
JOIN agent a ON p.listing_agent_id = a.agent_id
WHERE l.property_id = 11;



