# FlavorQuest Database

## Description
FlavorQuest is an innovative culinary database designed to celebrate the art of food. This project transforms the way food lovers, chefs, and home cooks interact with recipes and ingredients, creating an engaging platform to explore the world of flavors.

## Key Features of FlavorQuest

### Recipe Management
- Add, update, and delete recipes with detailed ingredient lists and preparation steps.

### Categorized Food Items
- Organize food items into various categories (e.g., appetizers, main courses, desserts) for easier navigation.

### Customer Preferences
- Manage customer information, including food preferences and dietary restrictions, to enable personalized recommendations.

### Advanced Search Functionality
- Implement complex querying options to find recipes or food items based on various criteria (like ingredients or cooking time).

### Nutritional Information
- Include nutritional details to help users make informed dietary choices.

## Technologies Used
- SQL

## Database Structure

### Tables

#### `CATEGORIES` Table
```sql
CREATE TABLE CATEGORIES (
    CATEGORY_ID INT PRIMARY KEY,
    CATEGORY_NAME VARCHAR(100) NOT NULL,
    DESCRIPTION TEXT
);
```

#### `FOOD_ITEMS` Table
```sql
CREATE TABLE FOOD_ITEMS (
    FOOD_ID INT PRIMARY KEY,
    FOOD_NAME VARCHAR(255) NOT NULL,
    DESCRIPTION TEXT,
    PRICE DECIMAL(10,2),
    CATEGORY_ID INT,
    FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORIES(CATEGORY_ID)
);
```

#### `CUSTOMERS` Table
```sql
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID INT PRIMARY KEY,
    NAME VARCHAR(255) NOT NULL,
    EMAIL VARCHAR(255) UNIQUE NOT NULL,
    PHONE VARCHAR(15) NOT NULL
);
```

#### `ORDERS` Table
```sql
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(255) NOT NULL,
    CUSTOMER_PHONE VARCHAR(15) NOT NULL,
    ORDER_DATE DATE DEFAULT CURRENT_DATE,
    TOTAL_AMOUNT DECIMAL(10,2) NOT NULL
);
```

#### `ORDER_DETAILS` Table
```sql
CREATE TABLE ORDER_DETAILS (
    ORDER_DETAIL_ID INT PRIMARY KEY,
    ORDER_ID INT,
    FOOD_ID INT,
    QUANTITY INT NOT NULL,
    PRICE DECIMAL(10,2),
    FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ORDER_ID),
    FOREIGN KEY (FOOD_ID) REFERENCES FOOD_ITEMS(FOOD_ID)
);
```

## Getting Started

### Prerequisites
- Basic knowledge of SQL.

### Running the Project
- Once the schema is built, execute SQL queries to explore food items and recipes directly in SQL Fiddle or your preferred SQL client.

## Usage Instructions

### Accessing the Database
- **Using SQL Fiddle:** Paste the SQL schema in SQL Fiddle and execute queries.
- **Using SQL Client:** Connect to the database on your local SQL server and run queries.

### Common SQL Operations

#### View All Food Items
```sql
SELECT * FROM FOOD_ITEMS;
```

#### Add a New Food Item
```sql
INSERT INTO FOOD_ITEMS (FOOD_NAME, CATEGORY_ID, PRICE, DESCRIPTION) 
VALUES ('New Dish', 1, 15.99, 'A delightful new dish.');
```

#### Update an Existing Food Item
```sql
UPDATE FOOD_ITEMS 
SET PRICE = 12.99, DESCRIPTION = 'Updated description of the food item.' 
WHERE FOOD_ID = 1;
```

#### Delete a Food Item
```sql
DELETE FROM FOOD_ITEMS WHERE FOOD_ID = 1;
```

#### View All Customers
```sql
SELECT * FROM CUSTOMERS;
```

#### Add a New Customer
```sql
INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, EMAIL, PHONE) 
VALUES (1, 'John Doe', 'john.doe@example.com', '123-456-7890');
```

## Contributing

### How to Contribute
1. **Fork the Repository** - Click the "Fork" button on GitHub to create your own copy.
2. **Clone Your Fork**
```bash
git clone https://github.com/yourusername/flavorquest.git
```
3. **Create a Branch**
```bash
git checkout -b my-feature-branch
```
4. **Make Changes** - Implement your feature or fix a bug following coding standards.
5. **Commit Changes**
```bash
git commit -m "Add a new feature or fix a bug"
```
6. **Push Changes**
```bash
git push origin my-feature-branch
```
7. **Open a Pull Request** - Submit your changes for review.

### Code of Conduct
- Follow the project's guidelines to maintain a welcoming environment.

### Issues
- Report bugs or request features by opening an issue on GitHub.

## Running the SQL Script
- Copy the SQL code from `FlavorQuest.sql`.
- Open SQL Fiddle and select Oracle SQL.
- Paste the SQL code and click **Build Schema**.

## Sample Queries

### Retrieve All Food Items
```sql
SELECT * FROM FOOD_ITEMS;
```

### Delete a Food Item
```sql
DELETE FROM FOOD_ITEMS WHERE FOOD_ID = 1;
```

## Contact Information
- **Name:** Godavarthi Jyothi  
- **Email:** [jyothigodavarthi1@gmail.com](mailto:jyothigodavarthi1@gmail.com)  
- **GitHub:** [Jyothigodavarthi](https://github.com/Jyothigodavarthi)  
- **LinkedIn:** [Jyothi Godavarthi](https://linkedin.com/in/godavarthi-jyothi9)

## SQL Fiddle Link
- Use [this SQL Fiddle link](https://sqlfiddle.com/oracle/online-compiler?id=7628d942-2657-4689-9d10-298ad6c88ae7) to run SQL scripts online.

## Conclusion
FlavorQuest enhances the culinary experience by providing a robust platform for managing and exploring food recipes and preferences. Contributions are welcome to improve the project further. Whether you're a chef, a food enthusiast, or someone looking to try new recipes, FlavorQuest is here for your culinary journey. Thanks for your interest and support!