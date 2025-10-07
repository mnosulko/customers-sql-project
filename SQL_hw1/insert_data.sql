use customers;

INSERT INTO Customers VALUES
(1, 'Mariia', 'mnosulko@gmail.com', '2025-01-10'),
(2, 'Tanya', 'tlanina@gmail.com', '2025-02-15'),
(3, 'Bozhena', 'bshutak@gmail.com', '2025-03-05'),
(4, 'Maryna', 'mbondar@gmail.com', '2025-04-12'),
(5, 'Yuliana', 'yfedorova@gmail.com', '2025-05-20');

INSERT INTO Categories VALUES
(1, 'Smartphones'),
(2, 'Laptops'),
(3, 'Headphones'),
(4, 'Tablets'),
(5, 'Accessories');

INSERT INTO Products VALUES
(1, 'iPhone 15', 1, 999.99),
(2, 'MacBook Pro', 2, 1999.99),
(3, 'AirPods Pro', 3, 249.99),
(4, 'iPad Air', 4, 599.99),
(5, 'Charger', 5, 29.99);

INSERT INTO Orders VALUES
(1, 1, '2024-06-01', 1249.98),
(2, 2, '2024-06-05', 1999.99),
(3, 1, '2024-06-10', 249.99),
(4, 3, '2024-06-15', 599.99),
(5, 4, '2024-06-20', 29.99);

INSERT INTO Order_Items VALUES
(1, 1, 1, 1),
(2, 1, 3, 1),
(3, 2, 2, 1),
(4, 3, 3, 1),
(5, 4, 4, 1),
(6, 5, 5, 1);

INSERT INTO Reviews VALUES
(1, 1, 1, 5, '2024-06-02'),
(2, 2, 2, 4, '2024-06-06'),
(3, 3, 1, 5, '2024-06-11'),
(4, 4, 3, 4, '2024-06-16'),
(5, 5, 4, 3, '2024-06-21');
