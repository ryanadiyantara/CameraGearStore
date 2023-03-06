/*
--------------------------------------------------------------------
PROJECT 2 Java Programming GROUP 8
--------------------------------------------------------------------
Group Member :	Muchammad Ryan Adiyantara
				Faras Sakha Muhammad Santoso
				Aryadwipa Mahendra Ermawan
Class		 :	2SE5
*/

/*==================================================================*/
-- create databases
	CREATE DATABASE Camera_Gear_Store
	USE Camera_Gear_Store
/*==================================================================*/
-- create schemas
	CREATE SCHEMA Items;
	GO
	CREATE SCHEMA Sales;
	GO
/*==================================================================*/
-- create tables
-- 1
	CREATE TABLE Items.Products (
	product_id VARCHAR(4) CONSTRAINT PK_product_id PRIMARY KEY,
	product_name VARCHAR(50) not null,
	categories VARCHAR(10)CONSTRAINT checkcategories CHECK(categories IN('CAMERA','LENSE','ACTION CAM','TRIPOD','STABILIZER','SD CARD','default')) not null,
	price MONEY not null,
	stock INT CONSTRAINT checkstock CHECK(stock>=0) not null,
	);
-- 2
	CREATE TABLE Sales.Staffs (
	staff_id VARCHAR(10) CONSTRAINT PK_staff_id not null PRIMARY KEY,
	staff_full_name CHAR(50)not null,
	staff_username CHAR(8)not null,
	staff_gender CHAR(6) CONSTRAINT checkgenderstaff CHECK(staff_gender IN('Male','Female')) not null,
	phone VARCHAR(20)not null UNIQUE,
	password VARCHAR(50)not null,
	);
-- 3
	CREATE TABLE Sales.Purchases (
	ID INT IDENTITY (1,1) not null,
	IDChar VARCHAR (50) not null,
	Purchase_id AS (IDChar+RIGHT('0000000'+CAST(ID AS VARCHAR(7)),7)) PERSISTED PRIMARY KEY,
	Customer_Full_Name CHAR(50)not null,
	Customer_Gender CHAR(6) CONSTRAINT check_gender CHECK(customer_gender IN('Male','Female')) not null,
	Email VARCHAR(50)not null,
	Phone VARCHAR(50)not null ,
	Address VARCHAR(50)not null,
	ZIP_code VARCHAR(50)not null, 
	Date VARCHAR(30) not null,
	ID1 VARCHAR(4) DEFAULT 'P000', Stock1 INT DEFAULT '0',
	ID2 VARCHAR(4) DEFAULT 'P000', Stock2 INT DEFAULT '0',
	ID3 VARCHAR(4) DEFAULT 'P000', Stock3 INT DEFAULT '0',
	ID4 VARCHAR(4) DEFAULT 'P000', Stock4 INT DEFAULT '0',
	ID5 VARCHAR(4) DEFAULT 'P000', Stock5 INT DEFAULT '0',
	ID6 VARCHAR(4) DEFAULT 'P000', Stock6 INT DEFAULT '0',
	ID7 VARCHAR(4) DEFAULT 'P000', Stock7 INT DEFAULT '0',
	ID8 VARCHAR(4) DEFAULT 'P000', Stock8 INT DEFAULT '0',
	ID9 VARCHAR(4) DEFAULT 'P000', Stock9 INT DEFAULT '0',
	ID10 VARCHAR(4) DEFAULT 'P000', Stock10 INT DEFAULT '0',
	);
-- 4
	CREATE TABLE Sales.Updates(
	ID INT IDENTITY (1,1) not null,
	IDChar VARCHAR (50) not null,
	Update_id AS (IDChar+RIGHT('0000000'+CAST(ID AS VARCHAR(7)),7)) PERSISTED PRIMARY KEY,
	date VARCHAR(30) not null,
	ID1 VARCHAR(4) DEFAULT 'P000', Stock1 INT DEFAULT '0',
	ID2 VARCHAR(4) DEFAULT 'P000', Stock2 INT DEFAULT '0',
	ID3 VARCHAR(4) DEFAULT 'P000', Stock3 INT DEFAULT '0',
	ID4 VARCHAR(4) DEFAULT 'P000', Stock4 INT DEFAULT '0',
	ID5 VARCHAR(4) DEFAULT 'P000', Stock5 INT DEFAULT '0',
	ID6 VARCHAR(4) DEFAULT 'P000', Stock6 INT DEFAULT '0',
	ID7 VARCHAR(4) DEFAULT 'P000', Stock7 INT DEFAULT '0',
	ID8 VARCHAR(4) DEFAULT 'P000', Stock8 INT DEFAULT '0',
	ID9 VARCHAR(4) DEFAULT 'P000', Stock9 INT DEFAULT '0',
	ID10 VARCHAR(4) DEFAULT 'P000', Stock10 INT DEFAULT '0',
	);
/*==================================================================*/
-- create triggers
-- 1
	CREATE TRIGGER Sales.Purchases_Trigger ON Sales.Purchases
	AFTER INSERT AS
	DECLARE
	@product1 VARCHAR(4), @product2 VARCHAR(4), @product3 VARCHAR(4), @product4 VARCHAR(4), @product5 VARCHAR(4),
	@product6 VARCHAR(4), @product7 VARCHAR(4), @product8 VARCHAR(4), @product9 VARCHAR(4), @product10 VARCHAR(4),
	@stockproduct1 INT, @stockproduct2 INT, @stockproduct3 INT, @stockproduct4 INT, @stockproduct5 INT,
	@stockproduct6 INT, @stockproduct7 INT, @stockproduct8 INT, @stockproduct9 INT, @stockproduct10 INT
	SELECT @product1 = ID1 FROM inserted
	SELECT @product2 = ID2 FROM inserted
	SELECT @product3 = ID3 FROM inserted
	SELECT @product4 = ID4 FROM inserted
	SELECT @product5 = ID5 FROM inserted
	SELECT @product6 = ID6 FROM inserted
	SELECT @product7 = ID7 FROM inserted
	SELECT @product8 = ID8 FROM inserted
	SELECT @product9 = ID9 FROM inserted
	SELECT @product10 = ID10 FROM inserted
	SELECT @stockproduct1 = Stock1 FROM inserted
	SELECT @stockproduct2 = Stock2 FROM inserted
	SELECT @stockproduct3 = Stock3 FROM inserted
	SELECT @stockproduct4 = Stock4 FROM inserted
	SELECT @stockproduct5 = Stock5 FROM inserted
	SELECT @stockproduct6 = Stock6 FROM inserted
	SELECT @stockproduct7 = Stock7 FROM inserted
	SELECT @stockproduct8 = Stock8 FROM inserted
	SELECT @stockproduct9 = Stock9 FROM inserted
	SELECT @stockproduct10 = Stock10 FROM inserted
	UPDATE Items.Products SET stock = stock - @stockproduct1  WHERE product_id = @product1
	UPDATE Items.Products SET stock = stock - @stockproduct2  WHERE product_id = @product2
	UPDATE Items.Products SET stock = stock - @stockproduct3  WHERE product_id = @product3
	UPDATE Items.Products SET stock = stock - @stockproduct4  WHERE product_id = @product4
	UPDATE Items.Products SET stock = stock - @stockproduct5  WHERE product_id = @product5
	UPDATE Items.Products SET stock = stock - @stockproduct6  WHERE product_id = @product6
	UPDATE Items.Products SET stock = stock - @stockproduct7  WHERE product_id = @product7
	UPDATE Items.Products SET stock = stock - @stockproduct8  WHERE product_id = @product8
	UPDATE Items.Products SET stock = stock - @stockproduct9  WHERE product_id = @product9
	UPDATE Items.Products SET stock = stock - @stockproduct10  WHERE product_id = @product10
-- 2
	CREATE TRIGGER Sales.Updates_Trigger ON Sales.Updates
	AFTER INSERT AS
	DECLARE
	@product1 VARCHAR(4), @product2 VARCHAR(4), @product3 VARCHAR(4), @product4 VARCHAR(4), @product5 VARCHAR(4),
	@product6 VARCHAR(4), @product7 VARCHAR(4), @product8 VARCHAR(4), @product9 VARCHAR(4), @product10 VARCHAR(4),
	@stockproduct1 INT, @stockproduct2 INT, @stockproduct3 INT, @stockproduct4 INT, @stockproduct5 INT,
	@stockproduct6 INT, @stockproduct7 INT, @stockproduct8 INT, @stockproduct9 INT, @stockproduct10 INT
	SELECT @product1 = ID1 FROM inserted
	SELECT @product2 = ID2 FROM inserted
	SELECT @product3 = ID3 FROM inserted
	SELECT @product4 = ID4 FROM inserted
	SELECT @product5 = ID5 FROM inserted
	SELECT @product6 = ID6 FROM inserted
	SELECT @product7 = ID7 FROM inserted
	SELECT @product8 = ID8 FROM inserted
	SELECT @product9 = ID9 FROM inserted
	SELECT @product10 = ID10 FROM inserted
	SELECT @stockproduct1 = Stock1 FROM inserted
	SELECT @stockproduct2 = Stock2 FROM inserted
	SELECT @stockproduct3 = Stock3 FROM inserted
	SELECT @stockproduct4 = Stock4 FROM inserted
	SELECT @stockproduct5 = Stock5 FROM inserted
	SELECT @stockproduct6 = Stock6 FROM inserted
	SELECT @stockproduct7 = Stock7 FROM inserted
	SELECT @stockproduct8 = Stock8 FROM inserted
	SELECT @stockproduct9 = Stock9 FROM inserted
	SELECT @stockproduct10 = Stock10 FROM inserted
	UPDATE Items.Products SET stock = stock + @stockproduct1  WHERE product_id = @product1
	UPDATE Items.Products SET stock = stock + @stockproduct2  WHERE product_id = @product2
	UPDATE Items.Products SET stock = stock + @stockproduct3  WHERE product_id = @product3
	UPDATE Items.Products SET stock = stock + @stockproduct4  WHERE product_id = @product4
	UPDATE Items.Products SET stock = stock + @stockproduct5  WHERE product_id = @product5
	UPDATE Items.Products SET stock = stock + @stockproduct6  WHERE product_id = @product6
	UPDATE Items.Products SET stock = stock + @stockproduct7  WHERE product_id = @product7
	UPDATE Items.Products SET stock = stock + @stockproduct8  WHERE product_id = @product8
	UPDATE Items.Products SET stock = stock + @stockproduct9  WHERE product_id = @product9
	UPDATE Items.Products SET stock = stock + @stockproduct10  WHERE product_id = @product10
/*==================================================================*/
-- create view
-- 1
	CREATE VIEW Sales.PurchasesView
	AS SELECT
	Purchase_id, Date,
	ID1, Stock1, ID2, Stock2, ID3, Stock3, ID4, Stock4, ID5, Stock5,
	ID6, Stock6, ID7, Stock7, ID8, Stock8, ID9, Stock9, ID10, Stock10
	FROM Sales.Purchases
-- 2
	CREATE VIEW Sales.PurchasesDetailView
	AS SELECT
	Purchase_id, Customer_Full_Name, Customer_Gender, Email, Phone, Address, ZIP_code, Date,
	ID1, Stock1, ID2, Stock2, ID3, Stock3, ID4, Stock4, ID5, Stock5,
	ID6, Stock6, ID7, Stock7, ID8, Stock8, ID9, Stock9, ID10, Stock10
	FROM Sales.Purchases
-- 3
	CREATE VIEW Sales.UpdatesView
	AS SELECT
	Update_id, Date,
	ID1, Stock1, ID2, Stock2, ID3, Stock3, ID4, Stock4, ID5, Stock5,
	ID6, Stock6, ID7, Stock7, ID8, Stock8, ID9, Stock9, ID10, Stock10
	FROM Sales.Updates
/*==================================================================*/
-- insert data
-- 1
	INSERT INTO Items.Products VALUES ('P000','Not an Items','default','0','100') -- For Default Insert
	INSERT INTO Items.Products VALUES ('P001','Canon 1100D (Body Only)','Camera','1800000','100')
	INSERT INTO Items.Products VALUES ('P002','Canon 1200D (Body Only)','Camera','2400000','100')
	INSERT INTO Items.Products VALUES ('P003','Canon 700D (Body Only)','Camera','3750000','100')
	INSERT INTO Items.Products VALUES ('P004','Canon 60D (Body Only)','Camera','3300000','100')
	INSERT INTO Items.Products VALUES ('P005','Canon 70D (Body Only)','Camera','6100000','100')
	INSERT INTO Items.Products VALUES ('P006','Canon 80D (Body Only)','Camera','8900000','100')
	INSERT INTO Items.Products VALUES ('P007','Canon 7D (Body Only)','Camera','7450000','100')
	INSERT INTO Items.Products VALUES ('P008','Canon 7D Mark II (Body Only)','Camera','11850000','100')
	INSERT INTO Items.Products VALUES ('P009','Canon 6D (Body Only)','Camera','7500000','100')
	INSERT INTO Items.Products VALUES ('P010','Canon 6D Mark II (Body Only)','Camera','18700000','100')
	INSERT INTO Items.Products VALUES ('P011','Canon 5D MK II (Body Only)','Camera','8125000','100')
	INSERT INTO Items.Products VALUES ('P012','Canon 5D MK III (Body Only)','Camera','19900000','100')
	INSERT INTO Items.Products VALUES ('P013','Canon 5D MK IV (Body Only)','Camera','45999000','100')
	INSERT INTO Items.Products VALUES ('P014','Nikon D90 (Body Only)','Camera','4200000','100')
	INSERT INTO Items.Products VALUES ('P015','Nikon D5100 (Body Only)','Camera','3200000','100')
	INSERT INTO Items.Products VALUES ('P016','Nikon D7000 (Body Only)','Camera','3600000','100')
	INSERT INTO Items.Products VALUES ('P017','Nikon D7100 (Body Only)','Camera','7350000','100')
	INSERT INTO Items.Products VALUES ('P018','Nikon D7200 ( Body Only)','Camera','12810000','100')
	INSERT INTO Items.Products VALUES ('P019','Nikon D7500 (Body Only)','Camera','12800000','100')
	INSERT INTO Items.Products VALUES ('P020','Nikon D600 (Body Only)','Camera','10750000','100')
	INSERT INTO Items.Products VALUES ('P021','Nikon D800 (Body Only)','Camera','22000000','100')
	INSERT INTO Items.Products VALUES ('P022','Nikon D850 (Body Only)','Camera','46899000','100')
	INSERT INTO Items.Products VALUES ('P023','Canon EF 8-15mm f/4L USM  fisheye','Lense','22999000','100')
	INSERT INTO Items.Products VALUES ('P024','Canon EF 15mm f/2.8 Fisheye','Lense','2800000','100')
	INSERT INTO Items.Products VALUES ('P025','Canon TS-E 17mm f/4 L Tilt-Shift','Lense','38999000','100')
	INSERT INTO Items.Products VALUES ('P026','Canon EF 24mm f2.8','Lense','1685000','100')
	INSERT INTO Items.Products VALUES ('P027','Canon EF 24mm f/1.4 L II USM','Lense','11950000','100')
	INSERT INTO Items.Products VALUES ('P028','Canon EF 28mm f/2.8 IS USM','Lense','7950000','100')
	INSERT INTO Items.Products VALUES ('P029','Canon EF 35mm f/1.4 L USM','Lense','6900000','100')
	INSERT INTO Items.Products VALUES ('P030','Canon EF 35mm f2 IS USM','Lense','7850000','100')
	INSERT INTO Items.Products VALUES ('P031','Canon EF 40mm f/2.8 STM','Lense','1777750','100')
	INSERT INTO Items.Products VALUES ('P032','Canon EF 50mm f/1.2 L USM','Lense','17500000','100')
	INSERT INTO Items.Products VALUES ('P033','Canon EF 50mm f/1.4 USM','Lense','5000000','100')
	INSERT INTO Items.Products VALUES ('P034','Canon EF 50mm f/1.8 II','Lense','900000','100')
	INSERT INTO Items.Products VALUES ('P035','Canon EF 50mm f/1.8 STM','Lense','1708000','100')
	INSERT INTO Items.Products VALUES ('P036','Canon EF 85mm f/1.2 L II USM','Lense','14000000','100')
	INSERT INTO Items.Products VALUES ('P037','Canon EF 85mm f/1.8 USM','Lense','5900000','100')
	INSERT INTO Items.Products VALUES ('P038','Canon EF 100mm f/2.8 Macro USM','Lense','8450000','100')
	INSERT INTO Items.Products VALUES ('P039','Canon EF 100mm  f/2.8 L IS USM Macro','Lense','8999000','100')
	INSERT INTO Items.Products VALUES ('P040','Canon EF 135mm f/2 L USM','Lense','15999000','100')
	INSERT INTO Items.Products VALUES ('P041','Canon EF-S 10-18mm f/4.5-5.6 IS STM','Lense','3100000','100')
	INSERT INTO Items.Products VALUES ('P042','Canon EF-S 10-22mm f/3.5-4.5 USM','Lense','2250000','100')
	INSERT INTO Items.Products VALUES ('P043','Canon EF 16-35mm f/2.8 L USM mark II','Lense','22300000','100')
	INSERT INTO Items.Products VALUES ('P044','Canon EF 16-35mm f/4 L IS USM','Lense','9400000','100')
	INSERT INTO Items.Products VALUES ('P045','Canon EF 17-40mm f/4 L USM','Lense','12499000','100')
	INSERT INTO Items.Products VALUES ('P046','Canon EF-S 17-55mm f/2.8 IS USM','Lense','6800000','100')
	INSERT INTO Items.Products VALUES ('P047','Canon EF-S 18-55mm f/3.5-5.6 IS','Lense','1500000','100')
	INSERT INTO Items.Products VALUES ('P048','Canon EF-S 18-135mm f/3.5-5.6 IS','Lense','2500000','100')
	INSERT INTO Items.Products VALUES ('P049','Canon EF-S 18-200mm f/3.5-5.6 IS','Lense','9450000','100')
	INSERT INTO Items.Products VALUES ('P050','Canon EF 24-70mm f/2.8 L II USM','Lense','17900000','100')
	INSERT INTO Items.Products VALUES ('P051','Canon EF 24-70mm f/2.8 L USM','Lense','7800000','100')
	INSERT INTO Items.Products VALUES ('P052','Canon EF 24-70mm f/4 L IS USM','Lense','16500000','100')
	INSERT INTO Items.Products VALUES ('P053','Canon EF 24-105mm f/4 L IS USM','Lense','5300000','100')
	INSERT INTO Items.Products VALUES ('P054','Canon EF 24-105mm f/4 L IS II USM','Lense','17990000','100')
	INSERT INTO Items.Products VALUES ('P055','Canon EF 70-200mm f/4 Non IS USM','Lense','4750000','100')
	INSERT INTO Items.Products VALUES ('P056','Canon EF 70-200mm f/4 L IS USM','Lense','7350000','100')
	INSERT INTO Items.Products VALUES ('P057','Canon EF 70-200mm f/2.8 L Non IS USM','Lense','7300000','100')
	INSERT INTO Items.Products VALUES ('P058','Canon EF 70-200mm f/2.8 L IS USM','Lense','8400000','100')
	INSERT INTO Items.Products VALUES ('P059','Canon EF 70-200mm f/2.8 L IS II USM','Lense','14500000','100')
	INSERT INTO Items.Products VALUES ('P060','Canon EF 100-400mm f/4.5-5.6','Lense','17000000','100')
	INSERT INTO Items.Products VALUES ('P061','Nikon AF 10.5mm f/2.8 G ED DX Fisheye','Lense','2750000','100')
	INSERT INTO Items.Products VALUES ('P062','Nikon 16mm f/2.8D Fisheye','Lense','4750000','100')
	INSERT INTO Items.Products VALUES ('P063','Nikon 24mm f/2.8D','Lense','7800000','100')
	INSERT INTO Items.Products VALUES ('P064','Nikon AF-S 35mm f/1.8G DX','Lense','2000000','100')
	INSERT INTO Items.Products VALUES ('P065','Nikon AF 50mm f/1.8D','Lense','1465000','100')
	INSERT INTO Items.Products VALUES ('P066','Nikon AF-S 50mm f/1.8G','Lense','2810000','100')
	INSERT INTO Items.Products VALUES ('P067','Nikon AF 50mm f/1.4D','Lense','4210000','100')
	INSERT INTO Items.Products VALUES ('P068','Nikon AF-S 50mm f/1.4G','Lense','7500000','100')
	INSERT INTO Items.Products VALUES ('P069','Nikon AF 85mm f/1.8D','Lense','4365000','100')
	INSERT INTO Items.Products VALUES ('P070','Nikon AF 85mm f1.4D','Lense','7750000','100')
	INSERT INTO Items.Products VALUES ('P071','Nikon AF-S 85mm f1.8 G','Lense','5250000','100')
	INSERT INTO Items.Products VALUES ('P072','Nikon AF-S 85mm f1.4 G','Lense','22930000','100')
	INSERT INTO Items.Products VALUES ('P073','Nikon AF-S 85mm f/3.5 G ED VR Micro','Lense','6990000','100')
	INSERT INTO Items.Products VALUES ('P074','Nikon AF-S 105mm f/2.8G IF ED VR Micro','Lense','9999000','100')
	INSERT INTO Items.Products VALUES ('P075','Nikon AF-S DX 10-24mm f/3.5-4.5 ED','Lense','16500000','100')
	INSERT INTO Items.Products VALUES ('P076','Nikon AF-S 12-24mm f/4 IF ED DX','Lense','5250000','100')
	INSERT INTO Items.Products VALUES ('P077','Nikon AF-S 14-24mm f/2.8 G','Lense','10500000','100')
	INSERT INTO Items.Products VALUES ('P078','Nikon AF-S 16-35mm f/4G ED VR','Lense','8250000','100')
	INSERT INTO Items.Products VALUES ('P079','Nikon AF-S 17-35mm f/2.8 ED IF','Lense','23699000','100')
	INSERT INTO Items.Products VALUES ('P080','Nikon AF-S 17-55mm f2.8 G IF ED DX','Lense','27199000','100')
	INSERT INTO Items.Products VALUES ('P081','Nikon AF-S VR DX 18-55mm f/3.5-5.6 G','Lense','1550000','100')
	INSERT INTO Items.Products VALUES ('P082','Nikon AF-S VR 18-105mm f3.5-5.6 GED','Lense','1500000','100')
	INSERT INTO Items.Products VALUES ('P083','Nikon AF-S DX 18-140mm f3.5-5.6 G ED','Lense','1550000','100')
	INSERT INTO Items.Products VALUES ('P084','Nikon AF-S DX VR II 18-200mm f 3.5-5.6 G IF ED','Lense','7850000','100')
	INSERT INTO Items.Products VALUES ('P085','Nikon DX VR 18-300mm f/3.5-5.6 IF ED','Lense','10600000','100')
	INSERT INTO Items.Products VALUES ('P086','Nikon AF-S 24-70mm f/2.8 ED','Lense','8750000','100')
	INSERT INTO Items.Products VALUES ('P087','Nikon AF-S 28-70mm f/2.8D IF ED','Lense','10500000','100')
	INSERT INTO Items.Products VALUES ('P088','Nikon AF-S 70-200mm f/2.8 IF ED VR','Lense','33637000','100')
	INSERT INTO Items.Products VALUES ('P089','Nikon AF-S 70-200mm f/2.8G ED VR II','Lense','38399000','100')
	INSERT INTO Items.Products VALUES ('P090','Nikon AF-S 70-200mm f/4G ED VR','Lense','18990000','100')
	INSERT INTO Items.Products VALUES ('P091','Nikon AF 80-200mm f/2.8 ED','Lense','17299000','100')
	INSERT INTO Items.Products VALUES ('P092','GoPro Hero 3 Black Edition','Action Cam','9656000','100')
	INSERT INTO Items.Products VALUES ('P093','GoPro Hero 4 Black Edition','Action Cam','4600000','100')
	INSERT INTO Items.Products VALUES ('P094','GoPro Hero 6 Black Edition','Action Cam','5850000','100')
	INSERT INTO Items.Products VALUES ('P095','Manfrotto 725B','Tripod','799000','100')
	INSERT INTO Items.Products VALUES ('P096','Manfrotto 055X Pro B','Tripod','2240000','100')
	INSERT INTO Items.Products VALUES ('P097','Manfrotto 561 BHDV-1-Monopod','Tripod','1900000','100')
	INSERT INTO Items.Products VALUES ('P098','DJI Ronin-S','Stabilizer','8999000','100')
	INSERT INTO Items.Products VALUES ('P099','SanDisk SD CARD 64 GB','SD Card','37000','100')
	INSERT INTO Items.Products VALUES ('P100','SanDisk SD CARD 128 GB','SD Card','130000','100')
-- 2
	INSERT INTO Sales.Staffs VALUES ('S01','Muchammad Ryan Adiyantara','Ryan','Male','082123456789','ccit21')
	INSERT INTO Sales.Staffs VALUES ('S02','Faras Sakha Muhammad Santoso','Sakha','Male','082123456790','ccit21')
	INSERT INTO Sales.Staffs VALUES ('S03','Aryadwipa Mahendra Ermawan','Arya','Male','082123456791','ccit21')
-- 3 example.
--	INSERT INTO Sales.Orders (IDChar,Customer_Full_Name,Customer_Gender,Email,Phone,Address,ZIP_code,Date,ID1,Stock1,ID2,Stock2,ID3,Stock3,ID4,Stock4,ID5,Stock5,ID6,Stock6,ID7,Stock7,ID8,Stock8,ID9,Stock9,ID10,Stock10)
--	VALUES ('ORD','Megawati','Female','mega@gmail.com','082128428935','ciomas','212121','18/05/22','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1')
-- 4 example.
--	INSERT INTO Sales.Updates (IDChar,Date,ID1,Stock1,ID2,Stock2,ID3,Stock3,ID4,Stock4,ID5,Stock5,ID6,Stock6,ID7,Stock7,ID8,Stock8,ID9,Stock9,ID10,Stock10)
--	VALUES ('UPT','17/05/2022','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','1','P001','P001')
/*==================================================================*/
-- read data
	select*from Items.Products
	select*from Sales.PurchasesView
	select*from Sales.PurchasesDetailView
	select*from Sales.UpdatesView
/*==================================================================*/
DELETE FROM Sales.Purchases WHERE Purchase_id =''
DELETE FROM Sales.Updates WHERE Update_id =''
/*==================================================================*/
