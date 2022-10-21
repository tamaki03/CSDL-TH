CREATE TABLE IF NOT EXISTS orders (
  orderNumber int NOT NULL AUTO_INCREMENT,
  orderDate DATETIME ,
  requiredDate DATETIME,
  shippedDate DATETIME ,
  status varchar(15) NOT NULL,	
  comments text ,
  customerNumber int NOT NULL,
  PRIMARY KEY (orderNumber)
);

CREATE TABLE IF NOT EXISTS productlines (
  productLine varchar(50) NOT NULL,
  textDescription varchar(4000) NOT NULL,
  htmlDescription mediumtext,
  image mediumblob,
  PRIMARY KEY (productLine)
);

CREATE TABLE IF NOT EXISTS products (
  productCode varchar(15) NOT NULL,
  productName varchar(70) NOT NULL,
  productLine varchar(50) NOT NULL,
  productScale varchar(10) NOT NULL,
  productVendor varchar(50) NOT NULL,
  productDescription text NOT NULL,
  quantityInStock smallint NOT NULL,
  buyPrice double NOT NULL,
  PRIMARY KEY (productCode),
  FOREIGN KEY (productLine) REFERENCES productlines(productLine) ON UPDATE CASCADE 
);
ALTER TABLE products ADD MSRP double NOT NULL;
CREATE TABLE IF NOT EXISTS orderdetails (
  orderNumber int NOT NULL AUTO_INCREMENT,
  productCode varchar(15) NOT NULL,
  quantityOrdered int NOT NULL,
  priceEach double NOT NULL,
  orderLineNumber smallint NOT NULL,
  PRIMARY KEY (orderNumber, productCode),
  FOREIGN KEY (orderNumber) REFERENCES orders(orderNumber) ON UPDATE CASCADE,
  FOREIGN KEY (productCode) REFERENCES products(productCode)  ON UPDATE CASCADE
);

CREATE TABLE IF NOT EXISTS employees(
	employeeNumber int,
	lastName varchar(100),
    firstName varchar(100),
    extension varchar(100),
    email varchar(100) not null,
    officeCode int not null, 
    reportsTo int,
    jobTitle char(100) not null,
    PRIMARY KEY (employeeNumber)
);

CREATE TABLE IF NOT EXISTS customers(
	customerNumber int,
    customerName varchar(100) not null,
    contactLastName varchar(100) not null,
    contactFirstName varchar(100) not null,
    phone char(100),
    addressLine1 varchar(100) not null,
	addressLine2 varchar(100),
    city varchar(100) not null,
    state varchar(100),
    postalCode varchar(100) not null,
    country varchar(100) not null,
    salesRepEmployeeNumber int,
    creditLimit int not null
);

CREATE TABLE IF NOT EXISTS payments(
	customerNumber INT NOT NULL,	
    checkNumber	char(100) NOT NULL,
    paymentDate	DATE,
    amount DOUBLE,
    PRIMARY KEY (checkNumber)
);


CREATE TABLE IF NOT EXISTS offices(
	officeCode INT NOT NULL,
    city varchar(100) NOT NULL,
    phone varchar(100) NOT NULL,
    addressLine1 varchar(100) NOT NULL,
	addressLine2 varchar(100),
    state varchar(100),
    country varchar(100) NOT NULL,
    postalCode varchar(100) NOT NULL,
    territory varchar(100) NOT NULL
);





INSERT INTO orders
	(orderNumber,orderDate,requiredDate,shippedDate,status,comments,customerNumber)
VALUES
    (10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128),
	(10102,'2003-01-10','2003-01-18','2003-01-14','Shipped',NULL,181),
    (10400,'2005-04-01','2005-04-11','2005-04-04','Shipped','Customer requested that DHL is used for this shipping',450),
    (10401,'2005-04-03','2005-04-14',NULL,'On Hold','Customer credit limit exceeded. Will ship when a payment is received.',328),
	(10402,'2005-04-07','2005-04-14','2005-04-12','Shipped',NULL,406),
	(10152,'2003-09-25','2003-10-03','2003-10-01','Shipped',NULL,333),
	(10153,'2003-09-28','2003-10-05','2003-10-03','Shipped',NULL,141),
	(10418,'2005-05-16','2005-05-24','2005-05-20','Shipped',NULL,412),
	(10419,'2005-05-17','2005-05-28','2005-05-19','Shipped',NULL,382),
	(10420,'2005-05-29','2005-06-07',NULL,'In Process',NULL,282),
	(10394,'2005-03-15','2005-03-25','2005-03-19','Shipped',NULL,141);


    
INSERT INTO productlines
	(productLine,	textDescription,	htmlDescription,	image)
VALUES
	('Classic Cars',	'Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',	NULL,	NULL),
	('Motorcycles',	'Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.',	NULL,	NULL),
	('Planes',	'Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.',	NULL,	NULL),
	('Ships',	'The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.',	NULL,	NULL),
	('Trains',	'Model trains are a rewarding hobby for enthusiasts of all ages. Whether you\'re looking for collectible wooden trains, electric streetcars or locomotives, you\'ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.',	NULL,	NULL),
	('Trucks and Buses',	'The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.',	NULL,	NULL),
	('Vintage Cars',	'Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.',	NULL,	NULL);



INSERT INTO products
	(productCode,productName,productLine,productScale,productVendor,productDescription,quantityInStock,buyPrice,MSRP)
VALUES
	('S10_1678',	'1969 Harley Davidson Ultimate Chopper',	'Motorcycles',	'1:10',	'Min Lin Diecast',	'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',	7933,	48.81,	95.7),
	('S10_1949',	'1952 Alpine Renault 1300',	'Classic Cars',	'1:10',	'Classic Metal Creations',	'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.'	,7305	,98.58,	214.3),
	('S12_4473',	'1957 Chevy Pickup',	'Trucks and Buses',	'1:12',	'Exoto Designs',	'1:12 scale die-cast about 20" long Hood opens, Rubber wheels',	6125	,55.7	,118.5),
	('S12_4675',	'1969 Dodge Charger',	'Classic Cars',	'1:12',	'Welly Diecast Productions',	'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.',	7323,	58.73,	115.16),
	('S18_1097',	'1940 Ford Pickup Truck',	'Trucks and Buses',	'1:18',	'Studio M Art Models',	'This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',	2613,	58.33,	116.67),
	('S18_1129',	'1993 Mazda RX-7',	'Classic Cars',	'1:18',	'Highway 66 Mini Classics',	'This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.',	3975,	83.51,	141.54),
	('S18_1342',	'1937 Lincoln Berline',	'Vintage Cars',	'1:18',	'Motor City Art Classics',	'Features opening engine cover, doors, trunk, and fuel filler cap. Color black',	8693,	60.62,	102.74);



INSERT INTO customers
	(customerNumber,customerName,contactLastName,contactFirstName,phone,addressLine1,addressLine2,city,state,postalCode,country,salesRepEmployeeNumber,creditLimit)
VALUES
	(103,	'Atelier graphique',	'Schmitt',	'Carine', 	'40.32.2555',	'54, rue Royale',	NULL,	'Nantes',	NULL,	'44000',	'France',	1370,	21000),
	(112,	'Signal Gift Stores',	'King',	'Jean',	'7025551838',	'8489 Strong St.',	NULL,	'Las Vegas',	'NV',	'83030',	'USA',	1166,	71800),
	(114,	'Australian Collectors Co.',	'Ferguson',	'Peter',	'03 9520 4555',	'636 St Kilda Road',	'Level 3',	'Melbourne',	'Victoria',	'3004',	'Australia',	1611,	117300),
	(119,	'La Rochelle Gifts',	'Labrune',	'Janine', 	'40.67.8555',	'67, rue des Cinquante Otages',	NULL,	'Nantes',	NULL,	'44000',	'France',1370,	118200),
	(121,	'Baane Mini Imports',	'Bergulfsen',	'Jonas', 	'07-98 9555',	'Erling Skakkes gate 78',	NULL,	'Stavern',	NULL,	'4110',	'Norway',1504,	81700),
	(124,	'Mini Gifts Distributors Ltd.',	'Nelson',	'Susan',	'4155551450',	'5677 Strong St.',	NULL,	'San Rafael',	'CA',	'97562','USA',	1165,	210500),
	(125,	'Havel & Zbyszek Co',	'Piestrzeniewicz',	'Zbyszek', 	'(26) 642-7555',	'ul. Filtrowa 68',	NULL,	'Warszawa',	NULL,	'01-012',	'Poland',	NULL,	0),
	(146,	'Saveley & Henriot, Co.',	'Saveley',	'Mary', 	'78.32.5555',	'2, rue du Commerce',	NULL,	'Lyon',	NULL,	'69004',	'France',	1337,	123900);




INSERT INTO employees
	(employeeNumber,lastName,firstName,extension,email,officeCode,reportsTo,jobTitle)
VALUES
	(1002,	'Murphy',	'Diane',	'x5800',	'dmurphy@classicmodelcars.com',	1,	NULL,	'President'),
	(1056,	'Patterson',	'Mary',	'x4611',	'mpatterso@classicmodelcars.com',	1,	1002,	'VP Sales'),
	(1076,	'Firrelli',	'Jeff',	'x9273',	'jfirrelli@classicmodelcars.com',	1,	1002,	'VP Marketing'),
	(1088,	'Patterson',	'William',	'x4871',	'wpatterson@classicmodelcars.com',	6,	1056,	'Sales Manager (APAC)'),
	(1102,	'Bondur',	'Gerard',	'x5408',	'gbondur@classicmodelcars.com',	4,	1056,	'Sale Manager (EMEA)'),
	(1143,	'Bow',	'Anthony',	'x5428',	'abow@classicmodelcars.com',	1,	1056,	'Sales Manager (NA)'),
	(1165,	'Jennings',	'Leslie', 'x3291','ljennings@classicmodelcars.com',	1,	1143,	'Sales Rep'),
	(1166,	'Thompson',	'Leslie',	'x4065',	'lthompson@classicmodelcars.com',	1,	1143,	'Sales Rep'),
	(1188,	'Firrelli',	'Julie',	'x2173', 'jfirrelli@classicmodelcars.com',	2,	1143,	'Sales Rep'),
	(1216,	'Patterson',	'Steve',	'x4334',	'spatterson@classicmodelcars.com',	2,	1143,	'Sales Rep');

INSERT INTO payments
	(customerNumber,	checkNumber,	paymentDate,	amount)
VALUES
	(103,	'HQ336336', '2004-10-19',	6066.78),
	(103,	'JM555205',	'2003-06-05',	14571.44),
	(103,	'OM314933',	'2004-12-18',	1676.14),
	(112,	'BO864823',	'2004-12-17',	14191.12),
	(112,	'HQ55022',	'2003-06-06',	32641.98),
	(112,	'ND748579',	'2004-08-20',	33347.88),
	(114,	'GG31455',	'2003-05-20',	45864.03),
	(114,	'MA765515',	'2004-12-15',	82261.22),
	(114,	'NP603840',	'2003-05-31',	7565.08);

INSERT INTO offices
	(officeCode,	city,	phone,	addressLine1,	addressLine2,	state,	country,	postalCode,	territory)
VALUES
	(1,	'San Francisco',	'+1 650 219 4782',	'100 Market Street',	'Suite 300',	'CA',	'USA',	'94080',	'NA'),
	(2,	'Boston',	'+1 215 837 0825',	'1550 Court Place',	'Suite 102',	'MA',	'USA',	'2107',	'NA'),
	(3,	'NYC',	'+1 212 555 3000',	'523 East 53rd Street',	'apt. 5A',	'NY',	'USA',	'10022',	'NA'),
	(4,	'Paris',	'+33 14 723 4404',	'43 Rue Jouffroy D\'abbans',	NULL,	NULL,	'France',	'75017',	'EMEA'),
	(5,	'Tokyo',	'+81 33 224 5000',	'4-1 Kioicho',	NULL,	'Chiyoda-Ku',	'Japan',	'102-8578',	'Japan'),
	(6,	'Sydney',	'+61 2 9264 2451',	'5-11 Wentworth Avenue',	'Floor #2',	NULL,	'Australia',	'NSW 2010',	'APAC'),
	(7,	'London',	'+44 20 7877 2041',	'25 Old Broad Street',	'Level 7',	NULL,	'UK',	'EC2N 1HN',	'EMEA');

-- bai 1

select substring(productDescription,1,50) as "Title of products"
from products;


-- bai 2

SELECT CONCAT(firstName," ",lastName) as "Full Name", jobTitle
from employees;

-- bai 3

UPDATE products
Set productLine = REPLACE(productLine,"Cars","Automobiles");

-- bai 4

SELECT orderNumber,requiredDate,shippedDate,DATEDIFF(requiredDate,shippedDate) as "days"
from orders
WHERE shippedDate is NOT NULL
order BY days ASC
LIMIT 5;


-- bai 5

SELECT orderNumber,orderDate,shippedDate
from orders
WHERE shippedDate is NULL AND orderDate between "2005-05-01" AND "2005-05-31"


