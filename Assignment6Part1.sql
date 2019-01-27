CREATE DATABASE ClothingStore;
USE ClothingStore

CREATE TABLE Products (
	ItemID Int NOT NULL PRIMARY KEY,
	ClothingType VARCHAR(100) NOT NULL DEFAULT 'Garment',
	ClothingName VARCHAR(100) NOT NULL,
	Price decimal(6,2) NOT NULL,
)

/* Adding data to table */

INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(1, 'Dress', 'Black satin dress', '140,90')
INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(2, 'Boots', 'Chelsea boots', '287,00')
INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(3, 'Coat', 'Warm fur coat', '1250,00')
INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(4, 'Shirt', 'Basic black t-shirt', '15,20')
INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(5, 'Pants', 'Jeans pants', '25,50')
INSERT INTO Products(ItemID, ClothingType, ClothingName, Price)
	VALUES(6, 'Jacket', 'Stylish leather jacket', '64,45')

/* Alter table */

ALTER TABLE Products ADD Brand VARCHAR(100) NOT NULL;
ALTER TABLE Products DROP COLUMN ClothingType;

/* Select ALL and specific values */

SELECT * FROM Products;
SELECT ItemID FROM Products;
SELECT ItemID FROM Products WHERE ItemID=2;
SELECT ItemID FROM Products WHERE ItemID BETWEEN 3 AND 6;

/* Update values */

UPDATE Products SET ClothingType='T-Shirt' WHERE ItemID=4;

/* Delete */
DELETE FROM Products WHERE ItemID=1;
