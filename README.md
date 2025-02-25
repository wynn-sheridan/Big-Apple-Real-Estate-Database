# Big-Apple-Real-Estate-Database

This project implements a relational database for managing residential real estate properties in New York City. It models relationships between agents, clients, properties, boroughs, and leases. The system is designed to track agent performance, client preferences, property availability, roommate groups, and leases.

## Features

- **Agent Management**: Manage agents with details like names and emails.
- **Borough Data**: Store borough-level information such as average rent and population.
- **Property Listings**: Keep track of properties with details like rent, number of bedrooms, size, and assigned agents.
- **Roommate Groups**: Track client roommate groups, including group budgets and number of roommates.
- **Leases**: Manage leases with start and end dates, linked to properties, agents, and roommate groups.
- **Client Preferences**: Match clients to properties based on their preferences (e.g., rent budget, desired number of bedrooms and bathrooms).

## Database Schema

The database consists of the following key entities:
- **Agent**: Stores agent details.
- **Borough**: Stores borough-level data.
- **Roommate Group**: Manages roommate groups and their budgets.
- **Property**: Tracks property listings, including monthly rent and details about the property.
- **Client**: Contains client information, preferences, and the roommate group they belong to.
- **Lease**: Keeps track of lease details, including which property a group leases and the managing agent.

## ERD (Entity-Relationship Diagram)

go to final_diagram.png

## How to Use

### 1. Setup

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/realestate-database.git
   cd realestate-database
Set up your MySQL database and import the provided SQL schema:

CREATE SCHEMA RealEstate;
-- Import the SQL schema from this project to set up the database
Ensure the following tables are created:

agent
borough
roommate_group
property
client
lease
2. Running Queries
The project includes several SQL queries for matching clients with properties, finding agents managing leases, identifying soon-to-expire leases, calculating rent per agent, and more.

Run these queries to explore:

Matching clients to suitable properties based on preferences
Tracking active agents and their clients
Lease expiration analysis
Rent calculations and analysis
3. Example Data
Sample data for agents, properties, clients, and leases is provided in the SQL file. Insert this data into your database to test the system.

SQL Queries
Matching Clients to Properties:

Finds properties that match the client's preferences for budget, bedrooms, and bathrooms.
Active Agents with Leases:

Finds agents actively managing leases for clients in their desired borough.
Leases Expiring Soon:

Identifies leases expiring within 30 days for potential renewal opportunities.
Property Count by Borough:

Counts the number of properties in each borough.
Total Rent Collected by Agent:

Calculates the total rent for each agent based on their listed properties.
Priciest Property in Manhattan:

Finds the most expensive property rented in Manhattan.
Client and Roommate Group Lease Matching:

Matches clients to properties and tracks their lease status.
Future Improvements
Integration with a Frontend: Connect the database to a web or mobile app for client-agent interaction.
Real-Time Data: Implement real-time data updates for property availability and lease expirations.
Advanced Reporting: Build reporting features for tracking market trends, agent performance, and property statistics.
License
This project is licensed under the MIT License - see the LICENSE file for details.

Contact
For any questions or contributions, feel free to reach out to me at sheridan.w@northeastern.edu

