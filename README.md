FlavorQuest Database

Description:
FlavorQuest is an innovative culinary database designed to celebrate the art of food. This project transforms the way food lovers, chefs, and home cooks interact with recipes and ingredients, creating an engaging platform to explore the world of flavors.

Key Features of FlavorQuest:

Recipe Management:

The core functionality of adding, updating, and deleting recipes with detailed ingredient lists and preparation steps. This feature is essential for any culinary database.

Categorized Food Items:

Organizing food items into various categories (e.g., appetizers, main courses, desserts) allows for easier navigation and search, making it user-friendly.

Customer Preferences:

Managing customer information, including their food preferences and dietary restrictions, enables personalized recipe recommendations and enhances user engagement.

Advanced Search Functionality:

Implementing complex querying options to find specific recipes or food items based on various criteria (like ingredients or cooking time) improves usability and efficiency.

Nutritional Information:

Including nutritional information for recipes helps users make informed dietary choices and caters to health-conscious individuals.

Technologies Used:

SQL

Database Structure:

Tables:

CATEGORIES Table: To categorize different types of food items.

CATEGORY_ID: Unique identifier for each category.
CATEGORY_NAME: The name of the category, used to identify it.
DESCRIPTION: Description of the food item.

FOOD_ITEMS Table: Stores details about the food items available for ordering.

FOOD_ID: Unique identifier for each food item.
FOOD_NAME: Name of the food item.
DESCRIPTION: Description of the food item.
PRICE: Price of the food item.
CATEGORY_ID: Unique identifier for each category.

CUSTOMERS Table: To track customer information.

CUSTOMER_ID: A unique identifier for each customer, serving as the primary key in the CUSTOMERS table.
NAME: The name of the customer, used to identify them in the CUSTOMERS table.
EMAIL: The email address of the customer, used for communication and as a unique identifier for account-related purposes.
PHONE: The phone number of the customer, used for contact purposes.

ORDERS Table: Stores customer orders.

ORDER_ID: Unique identifier for each order.
CUSTOMER_NAME: Name of the customer placing the order.
CUSTOMER_PHONE: Customer’s phone number.
ORDER_DATE: Date the order was placed (default is the current date).
TOTAL_AMOUNT: Total price of the order.

ORDER_DETAILS Table: Stores the details of each order (i.e., the items ordered and their quantities).

ORDER_DETAIL_ID: Unique identifier for each order detail.
ORDER_ID: References the order from the ORDERS table.
FOOD_ID: References the food item from the FOOD_ITEMS table.
QUANTITY: Number of units of the food item ordered.
PRICE: Price of the food item at the time of the order (can include discounts, etc.).

Getting Started:

Prerequisites:

Basic knowledge of SQL.

Running the Project:
Once the schema is built, you can execute SQL queries to explore food items and recipes directly in SQL Fiddle.

Example of Usage Instructions for FlavorQuest:

Usage Instructions:

Once you have set up FlavorQuest, you can start exploring food items and recipes. Here are some basic instructions on how to use the database:

Accessing the Database:

Using SQL Fiddle: After building the schema in SQL Fiddle, you can directly execute SQL queries in the provided query editor.

Using SQL Client: If you have set up the project locally on your SQL server, connect to the database using your preferred SQL client (e.g., MySQL Workbench, pgAdmin).

Common Operations:

Viewing All Food Items:

SELECT * FROM FOOD_ITEMS;

Adding a New Food Item:

INSERT INTO FOOD_ITEMS (FOOD_NAME, CATEGORY_ID, PRICE, DESCRIPTION)
VALUES ('New Dish', 1, 15.99, 'A delightful new dish.');

Updating an Existing Food Item:

UPDATE FOOD_ITEMS
SET PRICE = 12.99, 
DESCRIPTION = 'Updated description of the food item.'
WHERE FOOD_ID = 1;  -- Replace 1 with the actual FOOD_ID

Deleting a Food Item:

DELETE FROM FOOD_ITEMS
WHERE FOOD_ID = 1;  -- Replace 1 with the actual FOOD_ID

Exploring Customer Preferences:

You can also manage customer data:

To view all customers:

SELECT * FROM CUSTOMERS;

To add a new customer:

INSERT INTO CUSTOMERS (CUSTOMER_ID, NAME, EMAIL, PHONE)
VALUES (1, 'John Doe', 'john.doe@example.com', '123-456-7890');

Contributing:

We welcome contributions to FlavorQuest! Here’s how you can help:

How to Contribute:

Fork the Repository: Click the "Fork" button at the top right corner of the repository page to create your own copy of the project.

Clone Your Fork: 

Clone your forked repository to your local machine using:

bash
git clone https://github.com/yourusername/flavorquest.git

Create a Branch: Create a new branch for your feature or bug fix:

bash
git checkout -b my-feature-branch

Make Changes: Implement your feature or fix the bug. Ensure to follow the project's coding standards and conventions.

Commit Your Changes: Commit your changes with a clear and descriptive message:

bash
git commit -m "Add a new feature or fix a bug"

Push to Your Fork: Push your changes to your forked repository:
bash
git push origin my-feature-branch

Open a Pull Request: Go to the original repository and click on the "Pull Requests" tab. Click "New Pull Request," select your branch, and provide a clear description of your changes before submitting the pull request.

Code of Conduct:

Please adhere to the Code of Conduct when contributing. We strive to create a welcoming environment for all contributors.

Issues:

If you find a bug or have a feature request, please open an issue in the repository. Provide as much detail as possible to help us understand the problem.

Thank you for considering contributing to FlavorQuest! Your help is greatly appreciated.

How to Run:

Copy the SQL code in 'FlavorQuest.sql'.
Go to SQL Fiddle and select your database.
Paste the SQL code in the left pane and run the script to create the database.

Sample Queries:

Retrieve all food items:

SELECT * FROM FOOD_ITEMS;

Delete food items:

DELETE FROM FOOD_ITEMS WHERE FOOD_ID = 1;  -- Replace 1 with the actual FOOD_ID of the item you want to delete

Contact Information:

For any inquiries or feedback regarding the FlavorQuest project, please feel free to reach out:

Name: Godavarthi Jyothi

Email: jyothigodavarthi1@gmail.com

GitHub: https://github.com/Jyothigodavarthi

LinkedIn: https://linkedin.com/in/godavarthi-jyothi9

I welcome contributions, suggestions, and any discussions about the project!

SQL FIDDLE Link:

Using SQL Fiddle:

You can run the SQL scripts directly on SQL Fiddle without needing to set up a local environment.

Click here to access SQL Fiddle

https://sqlfiddle.com/oracle/online-compiler?id=7628d942-2657-4689-9d10-298ad6c88ae7

Navigate to the SQL Fiddle link above.

Copy and paste the SQL scripts from the FlavorQuest.sql file into the SQL Fiddle editor.

Click the "Build Schema" button to create the necessary tables and insert sample data.

Conclusion:

FlavorQuest aims to enhance the culinary experience by providing a robust platform for managing and exploring food recipes and preferences. We believe in the power of community contributions to make this project even better. Whether you're a chef, a food enthusiast, or someone looking to try new recipes, FlavorQuest is here to serve your culinary journey. We appreciate your interest and support!

