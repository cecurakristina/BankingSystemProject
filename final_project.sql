-- CREATE TABLES 
CREATE TABLE Customers (
Customer_ID SERIAL PRIMARY KEY,
First_Name VARCHAR(50) NOT NULL, 
Last_Name VARCHAR(50) NOT NULL, 
Address VARCHAR(250) NOT NULL, 
Email VARCHAR (100) UNIQUE, 
Phone VARCHAR(20) UNIQUE
);

CREATE TABLE Branches (
Branch_ID SERIAL PRIMARY KEY,
Branch_Name VARCHAR(50) NOT NULL,
Branch_Location VARCHAR(50) NOT NULL
);

CREATE TABLE Loans (
Loan_ID SERIAL PRIMARY KEY,
Initial_Loan_Amount DECIMAL(10, 2) NOT NULL CHECK(Initial_Loan_Amount >= 0),
Loan_Amount DECIMAL(10, 2) NOT NULL CHECK(Loan_Amount >= 0),
Interest_Rate DECIMAL (10, 2) NOT NULL CHECK(Interest_Rate BETWEEN 0 AND 100),
Customer_ID INT NOT NULL,
Branch_ID INT NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID) ON DELETE CASCADE,
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID)
);

CREATE TABLE Accounts(
Account_ID SERIAL PRIMARY KEY,
Account_Type VARCHAR(10) NOT NULL CHECK (Account_Type IN ('Chequing', 'Credit', 'Savings')),
Account_Balance DECIMAL(10, 2) DEFAULT 0 CHECK(Account_Balance >= 0),
Account_Open_Date DATE DEFAULT CURRENT_DATE,
Customer_ID INT NOT NULL,
Branch_ID INT NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID) ON DELETE CASCADE,
FOREIGN KEY (Branch_ID) REFERENCES Branches(Branch_ID) ON DELETE SET NULL
);

CREATE TABLE ATM_Usage(
ATM_ID SERIAL PRIMARY KEY,
ATM_Name VARCHAR(50) NOT NULL,
ATM_Location VARCHAR(50) NOT NULL,
Usage_Date DATE DEFAULT CURRENT_DATE
);

CREATE TABLE Transactions (
Transaction_ID SERIAL PRIMARY KEY,
Transaction_Amount DECIMAL(10, 2) NOT NULL CHECK(Transaction_Amount > 0),
Transaction_Date DATE DEFAULT CURRENT_DATE,
Transaction_Type VARCHAR(50) NOT NULL CHECK (Transaction_Type IN ('Deposit', 'Withdrawal')),
Account_ID INT NOT NULL,
ATM_ID INT NOT NULL,
FOREIGN KEY (Account_ID) REFERENCES Accounts(Account_ID) ON DELETE CASCADE,
FOREIGN KEY (ATM_ID) REFERENCES ATM_Usage(ATM_ID) ON DELETE CASCADE
);

--INSERT DATA INTO TABLES
INSERT INTO Customers (First_Name, Last_Name, Address, Email, Phone)
VALUES
('Anna', 'Kendrick', '1010 rue de Ruelle', 'aken@example.com', '8193310020'),
('Ian', 'Mion', '123 Rue de Sherbrooke', 'ianm9@example.com', '1122343445'),
('John', 'Doe', '456 Elm Street, Toronto', 'johndoe@example.com', '8192234455'),
('Sara', 'Miller', '789 Oak Avenue, Montreal', 'sara.miller@example.com', '5141234567'),
('Michael', 'Smith', '123 Maple Lane, Toronto', 'michael.smith@example.com', '4167891234'),
('Emily', 'Davis', '333 Pine Crescent, Ottawa', 'emily.davis@example.com', '6139876543'),
('James', 'Brown', '987 Birch Road, Montreal', 'james.brown@example.com', '8194567890'),
('Olivia', 'Johnson', '555 Cedar Blvd, Toronto', 'olivia.johnson@example.com', '4164567890'),
('David', 'Wilson', '222 Birchwood St, Montreal', 'david.wilson@example.com', '5142345678'),
('Sophia', 'Lee', '888 Spruce Lane, Ottawa', 'sophia.lee@example.com', '6138765432');

INSERT INTO Branches (Branch_Name, Branch_Location)
VALUES
('Branch01', 'Montreal'),
('Branch02', 'Toronto'),
('Branch03', 'Ottawa'),
('Branch04', 'Quebec'),
('Branch05', 'Vancouver'),
('Branch06', 'Calgary'),
('Branch07', 'Edmonton'),
('Branch08', 'Hamilton'),
('Branch09', 'London'),
('Branch10', 'Winnipeg');

INSERT INTO ATM_Usage (ATM_Name, ATM_Location, Usage_Date)
VALUES
('ATM01', 'Montreal', '2023-06-01'),
('ATM02', 'Toronto', '2023-06-02'),
('ATM03', 'Ottawa', '2023-06-03'),
('ATM04', 'Quebec', '2023-06-04'),
('ATM05', 'Vancouver', '2023-06-05'),
('ATM06', 'Calgary', '2023-06-06'),
('ATM07', 'Edmonton', '2023-06-07'),
('ATM08', 'Hamilton', '2023-06-08'),
('ATM09', 'London', '2023-06-09'),
('ATM10', 'Winnipeg', '2023-06-10');

INSERT INTO Accounts (Account_Type, Account_Balance, Customer_ID, Branch_ID)
VALUES
('Chequing', 1500, 1, 1),
('Savings', 2500, 2, 2),
('Credit', 3500, 3, 3),
('Chequing', 2200, 4, 4),
('Savings', 5000, 5, 5),
('Chequing', 700, 6, 6),
('Credit', 900, 7, 7),
('Savings', 1200, 8, 8),
('Chequing', 1600, 9, 9),
('Credit', 4000, 10, 10);

INSERT INTO Loans (Initial_Loan_Amount, Loan_Amount, Interest_Rate, Branch_ID, Customer_ID)
VALUES
(15000, 15000, 5.5, 1, 1),
(10000, 10000, 4.7, 2, 2),
(25000, 25000, 6.2, 3, 3),
(5000, 5000, 4.3, 4, 4),
(30000, 30000, 5.0, 5, 5),
(20000, 20000, 6.0, 6, 6),
(15000, 15000, 5.1, 7, 7),
(4000, 4000, 3.8, 8, 8),
(22000, 22000, 5.8, 9, 9),
(18000, 18000, 4.5, 10, 10);

INSERT INTO Transactions (Transaction_Amount, Transaction_Date, Transaction_Type, Account_ID, ATM_ID)
VALUES 
(500, '2023-06-01', 'Deposit', 1, 1),
(200, '2023-06-02', 'Withdrawal', 2, 2),
(300, '2023-06-03', 'Deposit', 3, 3),
(150, '2023-06-04', 'Withdrawal', 4, 4),
(1000, '2023-06-05', 'Deposit', 5, 5),
(200, '2023-06-06', 'Withdrawal', 6, 6),
(450, '2023-06-07', 'Deposit', 7, 7),
(600, '2023-06-08', 'Withdrawal', 8, 8),
(250, '2023-06-09', 'Deposit', 9, 9),
(150, '2023-06-10', 'Withdrawal', 10, 10);

SELECT * FROM accounts;
