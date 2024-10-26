CREATE TABLE User_Roles (
    role_id NUMBER PRIMARY KEY,
    role_name VARCHAR2(50) NOT NULL,
    description VARCHAR2(255)
);
CREATE TABLE Users (
    user_id NUMBER PRIMARY KEY,
    username VARCHAR2(50) UNIQUE NOT NULL,
    password_hash VARCHAR2(255) NOT NULL,
    role_id NUMBER,
    FOREIGN KEY (role_id) REFERENCES User_Roles(role_id)
);
CREATE TABLE Customers (
    customer_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    email VARCHAR2(100) UNIQUE NOT NULL,
    phone_number VARCHAR2(15),
    address VARCHAR2(255),
    loyalty_points NUMBER DEFAULT 0
);
CREATE TABLE Restaurants (
    restaurant_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    location VARCHAR2(255),
    phone_number VARCHAR2(15),
    rating NUMBER(2,1)
);
CREATE TABLE Menu_Categories (
    category_id NUMBER PRIMARY KEY,
    name VARCHAR2(50) NOT NULL UNIQUE,
    description VARCHAR2(255)
);
CREATE TABLE Menu_Items (
    item_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    name VARCHAR2(100) NOT NULL,
    price NUMBER(10, 2) NOT NULL,
    description VARCHAR2(255),
    availability VARCHAR2(50),
    category_id NUMBER,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id),
    FOREIGN KEY (category_id) REFERENCES Menu_Categories(category_id)
);
CREATE TABLE Orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    total_amount NUMBER(10,2) NOT NULL,
    status VARCHAR2(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    item_id NUMBER,
    quantity NUMBER,
    price NUMBER(10, 2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);
CREATE TABLE Payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_method VARCHAR2(50),
    amount NUMBER(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Reviews (
    review_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    restaurant_id NUMBER,
    rating NUMBER CHECK (rating >= 1 AND rating <= 5),
    comment_text VARCHAR2(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Delivery_Persons (
    delivery_person_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) NOT NULL,
    phone_number VARCHAR2(15),
    vehicle_type VARCHAR2(50),
    status VARCHAR2(50)
);
CREATE TABLE Deliveries (
    delivery_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    delivery_person_id NUMBER,
    status VARCHAR2(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (delivery_person_id) REFERENCES Delivery_Persons(delivery_person_id)
);
CREATE TABLE Coupons (
    coupon_id NUMBER PRIMARY KEY,
    code VARCHAR2(50) UNIQUE NOT NULL,
    discount_percentage NUMBER(5,2),
    valid_until DATE,
    minimum_order_amount NUMBER(10,2)
);
CREATE TABLE Favorites (
    favorite_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    item_id NUMBER,
    added_date DATE DEFAULT SYSDATE,
    notes VARCHAR2(255),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Notifications (
    notification_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    message VARCHAR2(255),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Order_Status_History (
    status_history_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    status VARCHAR2(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);
CREATE TABLE Restaurant_Images (
    image_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    image_url VARCHAR2(255),
    description VARCHAR2(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Category_Items (
    category_item_id NUMBER PRIMARY KEY,
    category_id NUMBER,
    item_id NUMBER,
    FOREIGN KEY (category_id) REFERENCES Menu_Categories(category_id),
    FOREIGN KEY (item_id) REFERENCES Menu_Items(item_id)
);
CREATE TABLE Customer_Addresses (
    address_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    address VARCHAR2(255),
    is_default VARCHAR2(1) CHECK (is_default IN ('Y', 'N')),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Customer_Preferences (
    preference_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    preference_key VARCHAR2(50),
    preference_value VARCHAR2(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Restaurant_Preferences (
    preference_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    preference_key VARCHAR2(50),
    preference_value VARCHAR2(50),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Loyalty_Programs (
    program_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    points NUMBER,
    level_text VARCHAR2(50),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);
CREATE TABLE Discounts (
    discount_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    discount_percentage NUMBER(5,2),
    valid_until DATE,
    description VARCHAR2(255),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE Special_Offers (
    offer_id NUMBER PRIMARY KEY,
    restaurant_id NUMBER,
    offer_details VARCHAR2(255),
    valid_until DATE,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);
CREATE TABLE User_Sessions (
    session_id NUMBER PRIMARY KEY,
    user_id NUMBER,
    session_token VARCHAR2(255),
    expires_at DATE,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
CREATE TABLE System_Settings (
    setting_id NUMBER PRIMARY KEY,
    setting_key VARCHAR2(50),
    setting_value VARCHAR2(255)
);

INSERT ALL
    INTO User_Roles (role_id, role_name, description) VALUES (1, 'Customer', 'Regular customer of the platform')
    INTO User_Roles (role_id, role_name, description) VALUES (2, 'Restaurant Owner', 'Owner of the restaurant')
    INTO User_Roles (role_id, role_name, description) VALUES (3, 'Delivery Person', 'Person responsible for delivering orders')
SELECT * FROM dual;

INSERT ALL
    INTO Users (user_id, username, password_hash, role_id) VALUES (1, 'alice', 'hashed_password_1', 1)
    INTO Users (user_id, username, password_hash, role_id) VALUES (2, 'bob', 'hashed_password_2', 2)
    INTO Users (user_id, username, password_hash, role_id) VALUES (3, 'charlie', 'hashed_password_3', 3)
SELECT * FROM dual;

INSERT ALL
    INTO Customers (customer_id, name, email, phone_number, address, loyalty_points) VALUES (1, 'Alice Johnson', 'alice@example.com', '123-456-7890', '123 Elm St', 100)
    INTO Customers (customer_id, name, email, phone_number, address, loyalty_points) VALUES (2, 'Bob Smith', 'bob@example.com', '234-567-8901', '456 Oak St', 200)
SELECT * FROM dual;

INSERT ALL
    INTO Restaurants (restaurant_id, name, location, phone_number, rating) VALUES (1, 'Pasta Paradise', '789 Pine St', '345-678-9012', 4.5)
    INTO Restaurants (restaurant_id, name, location, phone_number, rating) VALUES (2, 'Burger Haven', '101 Maple St', '456-789-0123', 4.0)
SELECT * FROM dual;

INSERT ALL
    INTO Menu_Categories (category_id, name, description) VALUES (1, 'Appetizers', 'Starters to begin your meal')
    INTO Menu_Categories (category_id, name, description) VALUES (2, 'Main Course', 'Hearty meals to fill you up')
    INTO Menu_Categories (category_id, name, description) VALUES (3, 'Desserts', 'Sweet treats to finish your meal')
SELECT * FROM dual;

INSERT ALL
    INTO Menu_Items (item_id, restaurant_id, name, price, description, availability, category_id) VALUES (1, 1, 'Garlic Bread', 5.99, 'Crispy garlic bread', 'Available', 1)
    INTO Menu_Items (item_id, restaurant_id, name, price, description, availability, category_id) VALUES (2, 1, 'Spaghetti Carbonara', 12.99, 'Classic Italian pasta dish', 'Available', 2)
    INTO Menu_Items (item_id, restaurant_id, name, price, description, availability, category_id) VALUES (3, 2, 'Cheeseburger', 10.99, 'Juicy beef burger with cheese', 'Available', 2)
    INTO Menu_Items (item_id, restaurant_id, name, price, description, availability, category_id) VALUES (4, 2, 'Chocolate Cake', 6.99, 'Rich and moist chocolate cake', 'Available', 3)
SELECT * FROM dual;

INSERT ALL
    INTO Orders (order_id, customer_id, total_amount, status) VALUES (1, 1, 18.98, 'Completed')
    INTO Orders (order_id, customer_id, total_amount, status) VALUES (2, 2, 17.98, 'Pending')
SELECT * FROM dual;

INSERT ALL
    INTO Order_Items (order_item_id, order_id, item_id, quantity, price) VALUES (1, 1, 1, 2, 5.99)
    INTO Order_Items (order_item_id, order_id, item_id, quantity, price) VALUES (2, 1, 2, 1, 12.99)
    INTO Order_Items (order_item_id, order_id, item_id, quantity, price) VALUES (3, 2, 3, 1, 10.99)
    INTO Order_Items (order_item_id, order_id, item_id, quantity, price) VALUES (4, 2, 4, 1, 6.99)
SELECT * FROM dual;

INSERT ALL
    INTO Payments (payment_id, order_id, payment_method, amount) VALUES (1, 1, 'Credit Card', 18.98)
    INTO Payments (payment_id, order_id, payment_method, amount) VALUES (2, 2, 'PayPal', 17.98)
SELECT * FROM dual;

INSERT ALL
    INTO Reviews (review_id, customer_id, restaurant_id, rating, comment_text) VALUES (1, 1, 1, 5, 'Amazing food and service!')
    INTO Reviews (review_id, customer_id, restaurant_id, rating, comment_text) VALUES (2, 2, 2, 4, 'Good burgers, but a bit pricey.')
SELECT * FROM dual;

INSERT ALL
    INTO Delivery_Persons (delivery_person_id, name, phone_number, vehicle_type, status) VALUES (1, 'Dave', '567-890-1234', 'Bike', 'Available')
    INTO Delivery_Persons (delivery_person_id, name, phone_number, vehicle_type, status) VALUES (2, 'Eva', '678-901-2345', 'Car', 'Unavailable')
SELECT * FROM dual;

INSERT ALL
    INTO Deliveries (delivery_id, order_id, delivery_person_id, status) VALUES (1, 1, 1, 'Delivered')
    INTO Deliveries (delivery_id, order_id, delivery_person_id, status) VALUES (2, 2, 2, 'In Progress')
SELECT * FROM dual;

INSERT ALL
    INTO Coupons (coupon_id, code, discount_percentage, valid_until, minimum_order_amount) VALUES (1, 'SAVE10', 10.00, TO_DATE('2024-12-31', 'YYYY-MM-DD'), 20.00)
    INTO Coupons (coupon_id, code, discount_percentage, valid_until, minimum_order_amount) VALUES (2, 'FREESHIP', 0.00, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 15.00)
SELECT * FROM dual;

INSERT ALL
    INTO Favorites (favorite_id, customer_id, item_id, added_date, notes) VALUES (1, 1, 1, SYSDATE, 'Best garlic bread!')
    INTO Favorites (favorite_id, customer_id, item_id, added_date, notes) VALUES (2, 2, 3, SYSDATE, 'Love this cheeseburger!')
SELECT * FROM dual;

INSERT ALL
    INTO Notifications (notification_id, customer_id, message) VALUES (1, 1, 'Your order has been shipped!')
    INTO Notifications (notification_id, customer_id, message) VALUES (2, 2, 'Your favorite item is back in stock!')
SELECT * FROM dual;

INSERT ALL
    INTO Order_Status_History (status_history_id, order_id, status) VALUES (1, 1, 'Ordered')
    INTO Order_Status_History (status_history_id, order_id, status) VALUES (2, 1, 'In Progress')
    INTO Order_Status_History (status_history_id, order_id, status) VALUES (3, 1, 'Delivered')
SELECT * FROM dual;

INSERT ALL
    INTO Restaurant_Images (image_id, restaurant_id, image_url, description) VALUES (1, 1, 'http://example.com/image1.jpg', 'Pasta Paradise exterior')
    INTO Restaurant_Images (image_id, restaurant_id, image_url, description) VALUES (2, 2, 'http://example.com/image2.jpg', 'Burger Haven interior')
SELECT * FROM dual;

INSERT ALL
    INTO Category_Items (category_item_id, category_id, item_id) VALUES (1, 1, 1)
    INTO Category_Items (category_item_id, category_id, item_id) VALUES (2, 2, 2)
SELECT * FROM dual;

INSERT ALL
    INTO Customer_Addresses (address_id, customer_id, address, is_default) VALUES (1, 1, '123 Elm St', 'Y')
    INTO Customer_Addresses (address_id, customer_id, address, is_default) VALUES (2, 2, '456 Oak St', 'N')
SELECT * FROM dual;

INSERT ALL
    INTO Customer_Preferences (preference_id, customer_id, preference_key, preference_value) VALUES (1, 1, 'Favorite Cuisine', 'Italian')
    INTO Customer_Preferences (preference_id, customer_id, preference_key, preference_value) VALUES (2, 2, 'Favorite Cuisine', 'American')
SELECT * FROM dual;

INSERT ALL
    INTO Loyalty_Programs (program_id, customer_id, points, level_text) VALUES (1, 1, 100, 'Silver')
    INTO Loyalty_Programs (program_id, customer_id, points, level_text) VALUES (2, 2, 200, 'Gold')
SELECT * FROM dual;

INSERT ALL
    INTO Discounts (discount_id, restaurant_id, discount_percentage, valid_until, description) VALUES (1, 1, 15.00, TO_DATE('2024-12-31', 'YYYY-MM-DD'), 'Holiday discount for pasta lovers!')
    INTO Discounts (discount_id, restaurant_id, discount_percentage, valid_until, description) VALUES (2, 2, 10.00, TO_DATE('2024-11-30', 'YYYY-MM-DD'), 'Discount on all burgers for a limited time!')
SELECT * FROM dual;

INSERT ALL
    INTO Special_Offers (offer_id, restaurant_id, offer_details, valid_until) VALUES (1, 1, 'Buy 1 Get 1 Free Pasta', TO_DATE('2024-12-01', 'YYYY-MM-DD'))
    INTO Special_Offers (offer_id, restaurant_id, offer_details, valid_until) VALUES (2, 2, 'Free Drink with Burger', TO_DATE('2024-11-15', 'YYYY-MM-DD'))
SELECT * FROM dual;

INSERT ALL
    INTO User_Sessions (session_id, user_id, session_token, expires_at) VALUES (1, 1, 'abc123xyz', SYSDATE + 1)
    INTO User_Sessions (session_id, user_id, session_token, expires_at) VALUES (2, 2, 'def456uvw', SYSDATE + 1)
SELECT * FROM dual;

INSERT ALL
    INTO System_Settings (setting_id, setting_key, setting_value) VALUES (1, 'AppVersion', '1.0.0')
    INTO System_Settings (setting_id, setting_key, setting_value) VALUES (2, 'MaintenanceMode', 'N')
SELECT * FROM dual;

SELECT*FROM Menu_Categories;

SELECT*FROM Menu_Items;

SELECT FI.name AS food_name, FI.price, C.name AS category_name
FROM Menu_Items FI
JOIN Menu_Categories C ON FI.category_id = C.category_id
WHERE C.name = 'Main Course';

SELECT O.order_id, O.total_amount, O.status
FROM Orders O
JOIN Customers C ON O.customer_id = C.customer_id
WHERE C.name = 'Alice Smith';

SELECT FI.name AS food_name, SUM(OD.quantity * FI.price) AS total_sales
FROM Order_Items OD
JOIN Menu_Items FI ON OD.item_id = FI.item_id
GROUP BY FI.name;

SELECT discount_id, restaurant_id, discount_percentage, valid_until, description
FROM Discounts;

SELECT offer_id, restaurant_id, offer_details, valid_until
FROM Special_Offers;


SELECT user_id, username, password_hash, role_id
FROM Users;

SELECT 
    SUM(o.total_amount * (1 - COALESCE(d.discount_percentage, 0) / 100)) AS total_sales_after_discount
FROM 
    Orders o
LEFT JOIN 
    Discounts d ON o.order_id = d.restaurant_id;