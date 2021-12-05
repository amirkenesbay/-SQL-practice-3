CREATE TABLE Manufacturers (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name CHAR(50) NOT NULL
);

CREATE TABLE Products (
    Code INTEGER PRIMARY KEY NOT NULL,
    Name CHAR(50) NOT NULL ,
    Price REAL NOT NULL ,
    Manufacturer INTEGER NOT NULL
        CONSTRAINT fk_Manufacturers_Code REFERENCES Manufacturers(Code)
);

INSERT INTO Manufacturers (Code, Name) VALUES (1, 'Sony');
INSERT INTO Manufacturers (Code, Name) VALUES (2, 'Creative Labs');
INSERT INTO Manufacturers (Code, Name) VALUES (3, 'Hewlett-Packard');
INSERT INTO Manufacturers (Code, Name) VALUES (4, 'Iomega');
INSERT INTO Manufacturers (Code, Name) VALUES (5, 'Fujitsu');
INSERT INTO Manufacturers (Code, Name) VALUES (6, 'Winchester');
INSERT INTO Manufacturers (Code, Name) VALUES (7, 'Bose');
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (1, 'Hard drive', 240, 5);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (2, 'Memory', 120, 6);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (3, 'ZIP drive', 150, 4);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (4, 'Floppy disk', 5, 6);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (5, 'Monitor', 240, 1);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (6, 'DVD drive', 180, 2);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (7, 'CD drive', 90, 2);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (8, 'Printer', 270, 3);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (9, 'Toner cartridge', 66, 3);
INSERT INTO Products (Code, Name, Price, Manufacturer) VALUES (10, 'DVD burner', 180, 2);

SELECT Name FROM products2;

SELECT Name, Price FROM products2;

SELECT Name FROM products2 WHERE Price <= 200;

SELECT * FROM products2 WHERE Price BETWEEN 60 AND 120;

SELECT Name, Price * 100 FROM products2;

SELECT avg(Price) AS allAvgPrice FROM products2;

SELECT avg(Price) FROM Products2 WHERE Manufacturer = 2;

SELECT count(*) FROM Products2 WHERE Price >= 180;

SELECT Name, Price FROM Products2 WHERE Price >= 180 ORDER BY Price DESC, Name;

SELECT * FROM Products2 INNER JOIN Manufacturers ON Products2.Manufacturer = Manufacturers.Code;

SELECT Products2.Name, Price, Manufacturers.Name FROM Products2 INNER JOIN Manufacturers ON Products2.Manufacturer = Manufacturers.Code;

SELECT avg(Price), Manufacturer FROM Products2 GROUP BY Manufacturer;

SELECT avg(Price), Manufacturers.Name FROM Products2, Manufacturers WHERE Products2.Manufacturer = Manufacturers.Code GROUP BY Manufacturers.Name;

SELECT Manufacturers.Name, avg(Price) FROM Products2 INNER JOIN Manufacturers on Manufacturers.Code = Products2.Manufacturer group by Manufacturers.Name HAVING avg(Price) >= 150;

SELECT Name, Price FROM Products2 ORDER BY Price LIMIT 1;

SELECT Manufacturers.Name, Products2.Name, Price FROM Products2 INNER JOIN Manufacturers ON Manufacturers.Code = Products2.Manufacturer AND Products2.Price = (SELECT MAX(Price) FROM Products2 WHERE Products2.Manufacturer = Manufacturers.Code);

SELECT Manufacturers.Name FROM Products2 INNER JOIN Manufacturers on Manufacturers.Code = Products2.Manufacturer GROUP BY Manufacturers.Name HAVING avg(Price) >= 145 AND count(Products2.Manufacturer) >= 2;

INSERT INTO Products2 (Code, Name, Price, Manufacturer) VALUES (11, 'Loudspeakers', 70, 2);

SELECT * FROM Products2;

UPDATE Products2 SET Name = 'Laser Printer' WHERE Code = 8;

UPDATE Products2 SET Price = Price * 0.9;

UPDATE Products2 SET Price = Price * 0.9 WHERE Price >= 120;