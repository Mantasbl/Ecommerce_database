
USE Ecommerce;

CREATE TABLE Customer
(
  CustomerID INT NOT NULL AUTO_INCREMENT,
  FirstName TEXT NOT NULL,
  LastName TEXT NOT NULL,
  Mobile VARCHAR(20),
  Email VARCHAR(100),
  CONSTRAINT PK_Customer PRIMARY KEY(CustomerID)
);

CREATE TABLE PaymentType
(
  PaymentTypeID INT NOT NULL AUTO_INCREMENT,
  PaymentType VARCHAR(100) NOT NULL,
  CONSTRAINT PK_PaymentType PRIMARY KEY(PaymentTypeID)
);

CREATE TABLE ProductSupplier
(
  ProductSupplierID INT NOT NULL AUTO_INCREMENT,
  Company TEXT NOT NULL,
  Address TEXT,
  TownCity VARCHAR(20),
  Email VARCHAR(100) NOT NULL,
  Mobile VARCHAR(20) NOT NULL,
  WebURL VARCHAR(100),
  CONSTRAINT PK_ProductSupplier PRIMARY KEY(ProductSupplierID)
);

CREATE TABLE Category
(
  CategoryID INT NOT NULL AUTO_INCREMENT,
  Category VARCHAR(100) NOT NULL,
  CONSTRAINT PK_Category PRIMARY KEY(CategoryID)
);

CREATE TABLE DeliveryMethod
(
  DeliveryMethodID INT NOT NULL AUTO_INCREMENT,
  DeliveryMethod VARCHAR(100) NOT NULL,
  CONSTRAINT PK_DeliveryMethod PRIMARY KEY(DeliveryMethodID)
);

CREATE TABLE OrderBillingAddress
(
  OrderBillingAddressID INT NOT NULL AUTO_INCREMENT,
  Address TEXT NOT NULL,
  Town VARCHAR(50),
  County VARCHAR(30),
  Postcode CHAR(8) NOT NULL,
  CONSTRAINT PK_OrderBillingAddress PRIMARY KEY(OrderBillingAddressID)
);

CREATE TABLE OrderDeliveryAddress
(
  OrderDeliveryAddressID INT NOT NULL AUTO_INCREMENT,
  Address TEXT NOT NULL,
  Town VARCHAR(50),
  County VARCHAR(30),
  Postcode CHAR(8) NOT NULL,
  CONSTRAINT PK_OrderDeliveryAddress PRIMARY KEY(OrderDeliveryAddressID)
);

CREATE TABLE CustomerAddress
(
  CustomerAddressID INT NOT NULL AUTO_INCREMENT,
  OrderBillingAddressID INT NOT NULL,
  OrderDeliveryAddressID INT,
  CustomerID INT NOT NULL,
  CONSTRAINT PK_CustomerAddress PRIMARY KEY(CustomerAddressID),
  CONSTRAINT FK_OrderBillingAddress FOREIGN KEY(OrderBillingAddressID) REFERENCES OrderBillingAddress(OrderBillingAddressID),
  CONSTRAINT FK_OrderDeliveryAddress FOREIGN KEY(OrderDeliveryAddressID) REFERENCES OrderDeliveryAddress(OrderDeliveryAddressID),
  CONSTRAINT FK_CustomerID FOREIGN KEY(CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Product
(
  ProductID INT NOT NULL AUTO_INCREMENT,
  Product VARCHAR(30) NOT NULL,
  Description TEXT,
  Price_Per_Unit FLOAT,
  CONSTRAINT PK_Product PRIMARY KEY(ProductID)
);

CREATE TABLE ProductInStorage
(
  ProductInStorageID INT NOT NULL AUTO_INCREMENT,
  ProductSupplierID INT NOT NULL,
  ProductID INT NOT NULL,
  Qty INT,
  CONSTRAINT PK_ProductInStorage PRIMARY KEY(ProductInStorageID),
  CONSTRAINT FK_ProductSupplier FOREIGN KEY(ProductSupplierID) REFERENCES ProductSupplier(ProductSupplierID),
  CONSTRAINT FK_ProductIS FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE ProductCategory
(
  CategoryID INT NOT NULL,
  ProductID INT NOT NULL,
  CONSTRAINT FK_Category FOREIGN KEY(CategoryID) REFERENCES Category(CategoryID),
  CONSTRAINT FK_Product FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

CREATE TABLE Delivery
(
  DeliveryID INT NOT NULL AUTO_INCREMENT,
  DeliveryMethodID INT NOT NULL,
  ExpDeliveryDate DATE,
  DeliveryPrice FLOAT NOT NULL,
  CONSTRAINT PK_Delivery PRIMARY KEY(DeliveryID),
  CONSTRAINT FK_DeliveryMethodID FOREIGN KEY(DeliveryMethodID) REFERENCES DeliveryMethod(DeliveryMethodID)
);

CREATE TABLE ShopOrder
(
  ShopOrderID INT NOT NULL AUTO_INCREMENT,
  DeliveryID INT,
  PaymentTypeID INT NOT NULL,
  CustomerAddressID INT NOT NULL,
  CONSTRAINT PK_ShopOrder PRIMARY KEY(ShopOrderID),
  CONSTRAINT FK_Delivery FOREIGN KEY(DeliveryID) REFERENCES Delivery(DeliveryID),
  CONSTRAINT FK_PaymentType FOREIGN KEY(PaymentTypeID) REFERENCES PaymentType(PaymentTypeID),
  CONSTRAINT FK_CustomerAddress FOREIGN KEY(CustomerAddressID) REFERENCES CustomerAddress(CustomerAddressID)
);

CREATE TABLE OrderProduct
(
  ShopOrderID INT NOT NULL,
  ProductID INT NOT NULL,
  CONSTRAINT FK_OrderProduct_ShopOrder FOREIGN KEY(ShopOrderID) REFERENCES ShopOrder(ShopOrderID),
  CONSTRAINT FK_OrderProduct_Product FOREIGN KEY(ProductID) REFERENCES Product(ProductID)
);

INSERT INTO Customer VALUES (NULL, 'Abe', 'Walsh', '+74(4)0744986830', 'jameson.pollich@example.net');
INSERT INTO Customer VALUES (NULL, 'Joannie', 'Rogahn', '146-975-9119', 'noelia.feeney@example.net');
INSERT INTO Customer VALUES (NULL, 'Miracle', 'Schoen', '271-825-5519x8745', 'lbrown@example.com');
INSERT INTO Customer VALUES (NULL, 'Bernadine', 'Turcotte', '1-723-187-5972x4899', 'mraz.ila@example.net');
INSERT INTO Customer VALUES (NULL, 'Noel', 'Kunde', '1-726-144-2767x04158', 'estiedemann@example.com');
INSERT INTO Customer VALUES (NULL, 'Dovie', 'Gutkowski', '1-106-064-7626x618', 'emckenzie@example.com');
INSERT INTO Customer VALUES (NULL, 'Reyes', 'O\'Reilly', '606-702-7687', 'geo71@example.com');
INSERT INTO Customer VALUES (NULL, 'Earnestine', 'Beier', '(287)922-2862x424', 'wanda02@example.net');
INSERT INTO Customer VALUES (NULL, 'Virgie', 'Rippin', '(379)352-3226', 'casper.josefa@example.net');
INSERT INTO Customer VALUES (NULL, 'Elaina', 'Prosacco', '(362)032-6647x2758', 'dietrich.aditya@example.org');
INSERT INTO Customer VALUES (NULL, 'Rusty', 'Little', '273-965-4877x375', 'mia.lebsack@example.org');
INSERT INTO Customer VALUES (NULL, 'Jack', 'Torp', '736.440.8933', 'luisa.haley@example.com');
INSERT INTO Customer VALUES (NULL, 'Wilfredo', 'Stoltenberg', '1-326-685-2169x0238', 'jakubowski.noemie@example.net');
INSERT INTO Customer VALUES (NULL, 'Athena', 'Ryan', '1-801-325-4018x13979', 'ona13@example.org');
INSERT INTO Customer VALUES (NULL, 'Ari', 'Friesen', '966.821.2394', 'lempi.veum@example.com');
INSERT INTO Customer VALUES (NULL, 'Amparo', 'Hammes', '06391745732', 'ebahringer@example.net');
INSERT INTO Customer VALUES (NULL, 'Shawna', 'Feest', '733-900-7875x657', 'nhansen@example.net');
INSERT INTO Customer VALUES (NULL, 'Dell', 'Schimmel', '+93(6)7388703757', 'rodrigo45@example.net');
INSERT INTO Customer VALUES (NULL, 'Jake', 'Little', '492.528.7384', 'mrohan@example.net');
INSERT INTO Customer VALUES (NULL, 'Garnett', 'Boyer', '04401953473', 'mariela.cartwright@example.net');

INSERT INTO ProductSupplier VALUES (NULL, 'Powlowski-Rogahn', '728 Lilly Forks Apt. 714\nLake Janahaven, MD 30972', 'East Erling', 'johnson.rodrick@example.net', '(624)199-1798x97568', 'http://cartwright.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Schultz-Jast', '502 Kristian Point Suite 562\nEast Adrianville, MS 07397-7538', 'Winifredberg', 'itreutel@example.org', '659.298.1415x12723', 'http://hahn.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Cormier-Gutmann', '147 Consuelo Square\nNew Vena, SC 63130-4354', 'Ankundingside', 'sebastian32@example.net', '866-786-4005', 'http://collinswalter.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Carter Ltd', '6419 Elroy Estates Apt. 500\nHarrisberg, DC 76608-5318', 'Lake Edisonfort', 'auer.nils@example.com', '(200)012-3229x403', 'http://www.bailey.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Abbott-Thiel', '499 Pollich Stravenue\nHowellview, OR 38964-1217', 'Alfordbury', 'hoeger.darby@example.com', '(865)701-4523x71686', 'http://www.wizaklein.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Davis, Morissette and Jacobson', '2056 Delbert Creek Suite 655\nSiennaview, TX 13447-1527', 'Brandynport', 'king.kelton@example.net', '763.340.3685x2614', 'http://lakin.info/');
INSERT INTO ProductSupplier VALUES (NULL, 'Carroll, Larkin and Stark', '6687 Lazaro Flat Apt. 220\nWest Ladarius, SD 58017-2433', 'West Camryn', 'abernathy.george@example.net', '1-132-868-1981x420', 'http://www.mantejohnston.info/');
INSERT INTO ProductSupplier VALUES (NULL, 'Ebert PLC', '320 Wilkinson Mount Apt. 459\nWest Odell, SD 55266-1217', 'South Leraville', 'michale10@example.org', '1-511-772-2699', 'http://goldner.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'McLaughlin, Reilly and Hamill', '0562 Gislason Forks\nGiovanniside, AL 33472', 'Gleasonville', 'becker.nova@example.net', '1-267-062-3038x003', 'http://kuhic.net/');
INSERT INTO ProductSupplier VALUES (NULL, 'Sauer-Kozey', '0381 Heller Wells Apt. 327\nNew Sammy, ID 07466-2305', 'Sengerview', 'janie32@example.net', '335-103-6520', 'http://hyatt.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Sipes Group', '3440 Kilback Roads\nBaumbachstad, MO 24368-4493', 'Taniastad', 'ckertzmann@example.com', '036-450-9064', 'http://kihn.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Roob LLC', '20146 Hettinger Stream\nPort Doyleberg, NC 98663-6085', 'Laurenbury', 'wtowne@example.org', '1-236-343-4377', 'http://www.donnelly.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Dickens, Hayes and Walter', '21441 Sage Keys Suite 396\nReynoldshaven, WA 72604', 'West Scot', 'francesco14@example.net', '318-600-1949', 'http://faygraham.info/');
INSERT INTO ProductSupplier VALUES (NULL, 'Shanahan Group', '03802 Barton Oval\nEast Ashlynnstad, RI 54896', 'West Watson', 'luther.moore@example.net', '(511)000-9092x2630', 'http://franecki.biz/');
INSERT INTO ProductSupplier VALUES (NULL, 'Grady-Stokes', '782 VonRueden Garden\nOnieberg, MO 95185', 'North Oliverborough', 'beahan.noah@example.org', '+98(4)3550056110', 'http://batz.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Nikolaus LLC', '9559 Dibbert Alley Suite 792\nMonteton, NE 73956-1456', 'Jaskolskiland', 'dare.olen@example.com', '01201617456', 'http://lednerlangosh.info/');
INSERT INTO ProductSupplier VALUES (NULL, 'Runte PLC', '199 West Shore Apt. 208\nKunzeside, UT 25615', 'East Oleta', 'rosario.dooley@example.org', '621-204-8972x03391', 'http://www.kihn.info/');
INSERT INTO ProductSupplier VALUES (NULL, 'Rohan-Steuber', '09718 Kiehn Dale\nNorth Mohamed, MI 02575-5964', 'Lake Ophelia', 'gbauch@example.org', '04281225707', 'http://lebsack.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Mayer, Cremin and Rogahn', '775 Reichel Vista Suite 118\nO\'Reillyside, OH 79777', 'North Wilburnmouth', 'felicita24@example.com', '1-529-355-9644x7930', 'http://www.damore.com/');
INSERT INTO ProductSupplier VALUES (NULL, 'Jones Ltd', '878 Lockman Bypass Suite 641\nWaelchishire, MN 12167', 'Stewartshire', 'cturner@example.net', '(667)919-8907x04041', 'http://www.borerwisoky.com/');

INSERT INTO OrderDeliveryAddress VALUES (NULL, '276 Dale Circle Suite 647\nBoylehaven, WI 63983-6790', 'WestVirginia', 'IN', '17983');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '450 Krajcik Parkway\nSouth Abrahamton, LA 19227-3269', 'Hawaii', 'FL', '14224-90');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '826 Beatty Coves\nNorth Cristal, TX 31844-1352', 'Delaware', 'FL', '04108');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '9755 Nyah Brooks\nTreutelfort, SC 87913', 'Utah', 'NY', '80613-51');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '26056 Fausto Fall Apt. 738\nWillport, NH 48424', 'California', 'TN', '62360');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '6865 Carlee Parkways\nYundtland, KS 28506', 'Pennsylvania', 'MD', '58613-70');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '7616 Talia Viaduct\nEvertville, IN 82486-6462', 'Nebraska', 'HI', '96354');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '47593 Rowe Ports\nEast Elwinfort, GA 73614-0288', 'Delaware', 'ID', '07320-02');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '422 Bridget Ways\nDayanachester, MS 47772-2878', 'NewJersey', 'VT', '70035');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '90277 Jones Lake\nLake Flossieburgh, MN 55131-5295', 'Idaho', 'ID', '12727-17');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '38012 Kuhlman Center Suite 546\nKesslermouth, IL 35609-0731', 'Alaska', 'IL', '07693');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '529 Izaiah Well Suite 779\nMarvinstad, MT 23934-3131', 'Arkansas', 'CA', '07269-22');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '95407 Kertzmann Extension\nElouiseville, TX 62522', 'NewHampshire', 'AZ', '19009');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '36425 Teresa Circle Apt. 319\nNew Dangeloville, SD 84320-6124', 'NewHampshire', 'AR', '72247');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '67783 Koepp Ports Suite 167\nMonahaven, GA 29665-3976', 'Kentucky', 'LA', '56630');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '0862 Sandrine Drive\nTurnerborough, OK 99021-7220', 'RhodeIsland', 'AR', '03222-14');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '0978 Taya Tunnel\nNorth Carrietown, AZ 83660-5665', 'Delaware', 'WA', '23272');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '95589 Homenick Points\nLake London, IA 25954', 'SouthCarolina', 'NC', '18061-00');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '843 Elmore Greens\nKohlerview, HI 99046', 'Nebraska', 'ID', '79140');
INSERT INTO OrderDeliveryAddress VALUES (NULL, '26514 Jon Square\nNew Malcolm, GA 62899', 'Illinois', 'OH', '74419');

INSERT INTO OrderBillingAddress VALUES (NULL, '1780 Earnest Walk\nEast Yadiramouth, CA 74606-8082', 'Washington', 'GA', '49869');
INSERT INTO OrderBillingAddress VALUES (NULL, '5314 Hermann Crest Suite 053\nSouth Bernie, ND 03641', 'Connecticut', 'MT', '29838-06');
INSERT INTO OrderBillingAddress VALUES (NULL, '013 Arely Skyway Suite 095\nPricemouth, NV 39524-4275', 'Texas', 'PA', '33867-61');
INSERT INTO OrderBillingAddress VALUES (NULL, '81974 Ruth Station Apt. 187\nFerrystad, NY 23350-7382', 'Hawaii', 'ND', '63500');
INSERT INTO OrderBillingAddress VALUES (NULL, '83566 Schroeder Garden Suite 088\nMollytown, MN 87809-4147', 'WestVirginia', 'KS', '31818');
INSERT INTO OrderBillingAddress VALUES (NULL, '612 Guiseppe Locks\nNorth Clyde, MT 69652', 'Ohio', 'NC', '56821');
INSERT INTO OrderBillingAddress VALUES (NULL, '0929 Stacey Underpass\nLake Noelborough, AK 79938-2884', 'Michigan', 'UT', '45694');
INSERT INTO OrderBillingAddress VALUES (NULL, '87467 Destini Corners Suite 169\nLake Catharine, OR 56396', 'Alaska', 'SC', '95640-96');
INSERT INTO OrderBillingAddress VALUES (NULL, '01291 Richie Drive\nBlakeberg, NJ 41298-8948', 'WestVirginia', 'PA', '82779-50');
INSERT INTO OrderBillingAddress VALUES (NULL, '65361 Dicki Village\nMelodymouth, OK 43121', 'SouthCarolina', 'ME', '21922-47');
INSERT INTO OrderBillingAddress VALUES (NULL, '001 Zboncak Mount\nSouth Matildefurt, OK 48200-8375', 'Oklahoma', 'NE', '66048');
INSERT INTO OrderBillingAddress VALUES (NULL, '1451 Enrique Estates Suite 190\nNew Cristal, WI 62229-6100', 'Maryland', 'SD', '12168-54');
INSERT INTO OrderBillingAddress VALUES (NULL, '65813 Reymundo Ramp Suite 016\nNorth Eulahchester, MA 99980-9867', 'Nevada', 'MD', '12957');
INSERT INTO OrderBillingAddress VALUES (NULL, '625 Camryn Mountains Apt. 223\nWest Jammie, KS 62465', 'Kansas', 'AR', '03136');
INSERT INTO OrderBillingAddress VALUES (NULL, '27891 Janie Ridges Suite 914\nEast Kolefort, IA 15782', 'Kansas', 'IA', '26464');
INSERT INTO OrderBillingAddress VALUES (NULL, '8254 Dewayne Fork\nPowlowskichester, MI 91953-0429', 'Oregon', 'AK', '71470');
INSERT INTO OrderBillingAddress VALUES (NULL, '47552 Bauch Skyway\nBarrowsfurt, IA 89533-4905', 'SouthDakota', 'TN', '48014');
INSERT INTO OrderBillingAddress VALUES (NULL, '837 Mikel Rue\nHilllberg, NH 19126-1813', 'Arizona', 'MA', '56485-69');
INSERT INTO OrderBillingAddress VALUES (NULL, '674 Robel Place\nSpencerborough, ID 48262-6013', 'Montana', 'AL', '28113');
INSERT INTO OrderBillingAddress VALUES (NULL, '3627 Angelica Junction Apt. 026\nTyresestad, IL 95659', 'Colorado', 'MI', '58193-92');

INSERT INTO PaymentType VALUES (NULL, 'Visa');
INSERT INTO PaymentType VALUES (NULL, 'MasterCard');
INSERT INTO PaymentType VALUES (NULL, 'American Express');
INSERT INTO PaymentType VALUES (NULL, 'Discover Card');

INSERT INTO DeliveryMethod VALUES (NULL, 'Royal Mail');
INSERT INTO DeliveryMethod VALUES (NULL, 'DPD');
INSERT INTO DeliveryMethod VALUES (NULL, 'Hermes');
INSERT INTO DeliveryMethod VALUES (NULL, 'In Store Collection');

INSERT INTO Product VALUES (NULL, 'Shampoo', 'For daily Use', '5.99');
INSERT INTO Product VALUES (NULL, 'Deodorant', 'For casual use, white stain proof', '3.99');
INSERT INTO Product VALUES (NULL, 'MacBook Pro', '2018 Edition', '1500.99');
INSERT INTO Product VALUES (NULL, 'Wooden Horse', 'For kids over 3 years old', '45.99');
INSERT INTO Product VALUES (NULL, 'Dog Collar', 'For dogs of all sizes', '5.99');
INSERT INTO Product VALUES (NULL, 'Trampoline', 'Outside Use only', '65.99');
INSERT INTO Product VALUES (NULL, 'JetPack', 'Military grade stuff', '1255.99');
INSERT INTO Product VALUES (NULL, 'Bazooka', 'Need permit', '995.99');
INSERT INTO Product VALUES (NULL, 'Biscuits', 'Great with tea', '1.99');
INSERT INTO Product VALUES (NULL, 'Tea', 'Great with biscuits', '3.99');

INSERT INTO Category VALUES (NULL, 'Technology');
INSERT INTO Category VALUES (NULL, 'Clothes');
INSERT INTO Category VALUES (NULL, 'Toys');
INSERT INTO Category VALUES (NULL, 'Food');
INSERT INTO Category VALUES (NULL, 'Technology');
INSERT INTO Category VALUES (NULL, 'Books');
INSERT INTO Category VALUES (NULL, 'Handmade');
INSERT INTO Category VALUES (NULL, 'Health&Beauty');

INSERT INTO Delivery VALUES (NULL, 1, '2018-12-24', 5.99);
INSERT INTO Delivery VALUES (NULL, 3, '2018-12-23', '4.99');
INSERT INTO Delivery VALUES (NULL, 2, '2018-12-26', '7.99');
INSERT INTO Delivery VALUES (NULL, 4, '2019-01-24', '6.99');
INSERT INTO Delivery VALUES (NULL, 1, '2018-12-29', '5.99');
INSERT INTO Delivery VALUES (NULL, 2, '2018-12-30', '7.00');



INSERT INTO ProductCategory VALUES (1, 3);
INSERT INTO ProductCategory VALUES (2, 4);
INSERT INTO ProductCategory VALUES (3, 1);
INSERT INTO ProductCategory VALUES (4, 6);
INSERT INTO ProductCategory VALUES (2, 2);
INSERT INTO ProductCategory VALUES (6, 8);
INSERT INTO ProductCategory VALUES (7, 3);
INSERT INTO ProductCategory VALUES (5, 5);
INSERT INTO ProductCategory VALUES (2, 9);
INSERT INTO ProductCategory VALUES (5, 10);
INSERT INTO ProductCategory VALUES (6, 7);

INSERT INTO ProductInStorage VALUES (NULL, 3, 5, '120');
INSERT INTO ProductInStorage VALUES (NULL, 1, 7, '10');
INSERT INTO ProductInStorage VALUES (NULL, 2, 4, '850');
INSERT INTO ProductInStorage VALUES (NULL, 12, 3, '1000');
INSERT INTO ProductInStorage VALUES (NULL, 11, 6, '400');
INSERT INTO ProductInStorage VALUES (NULL, 7, 1, '4000');
INSERT INTO ProductInStorage VALUES (NULL, 13, 8, '333');
INSERT INTO ProductInStorage VALUES (NULL, 18, 9, '125');


INSERT INTO CustomerAddress VALUES (NULL, 1, 1, 1);
INSERT INTO CustomerAddress VALUES (NULL, 2, 2, 2);
INSERT INTO CustomerAddress VALUES (NULL, 3, 3, 3);
INSERT INTO CustomerAddress VALUES (NULL, 4, 4, 4);
INSERT INTO CustomerAddress VALUES (NULL, 5, 5, 5);
INSERT INTO CustomerAddress VALUES (NULL, 6, 6, 6);
INSERT INTO CustomerAddress VALUES (NULL, 7, 7, 7);
INSERT INTO CustomerAddress VALUES (NULL, 8, 8, 8);
INSERT INTO CustomerAddress VALUES (NULL, 9, 9, 9);
INSERT INTO CustomerAddress VALUES (NULL, 10, 10, 10);
INSERT INTO CustomerAddress VALUES (NULL, 11, 11, 11);
INSERT INTO CustomerAddress VALUES (NULL, 12, 12, 12);
INSERT INTO CustomerAddress VALUES (NULL, 13, 13, 13);
INSERT INTO CustomerAddress VALUES (NULL, 14, 14, 14);
INSERT INTO CustomerAddress VALUES (NULL, 15, 15, 15);
INSERT INTO CustomerAddress VALUES (NULL, 16, 16, 16);
INSERT INTO CustomerAddress VALUES (NULL, 17, 17, 17);
INSERT INTO CustomerAddress VALUES (NULL, 18, 18, 18);
INSERT INTO CustomerAddress VALUES (NULL, 19, 19, 19);
INSERT INTO CustomerAddress VALUES (NULL, 20, 20, 20);

INSERT INTO ShopOrder VALUES (NULL, NULL, 4, 20);
INSERT INTO ShopOrder VALUES (NULL, 2, 3, 14);
INSERT INTO ShopOrder VALUES (NULL, NULL, 2, 16);
INSERT INTO ShopOrder VALUES (NULL, 3, 1, 14);
INSERT INTO ShopOrder VALUES (NULL, NULL, 4, 1);
INSERT INTO ShopOrder VALUES (NULL, 4, 2, 2);
INSERT INTO ShopOrder VALUES (NULL, NULL, 3, 3);
INSERT INTO ShopOrder VALUES (NULL, 5, 1, 4);
INSERT INTO ShopOrder VALUES (NULL, NULL, 2, 5);
INSERT INTO ShopOrder VALUES (NULL, 1, 3, 6);
INSERT INTO ShopOrder VALUES (NULL, NULL, 1, 7);
INSERT INTO ShopOrder VALUES (NULL, NULL, 2, 8);
INSERT INTO ShopOrder VALUES (NULL, NULL, 3, 9);

INSERT INTO OrderProduct VALUES (13, 4);
INSERT INTO OrderProduct VALUES (12, 6);
INSERT INTO OrderProduct VALUES (11, 3);
INSERT INTO OrderProduct VALUES (10, 7);
INSERT INTO OrderProduct VALUES (9, 1);
INSERT INTO OrderProduct VALUES (8, 4);
INSERT INTO OrderProduct VALUES (7, 6);
INSERT INTO OrderProduct VALUES (6, 8);
INSERT INTO OrderProduct VALUES (5, 10);
INSERT INTO OrderProduct VALUES (4, 9);
INSERT INTO OrderProduct VALUES (3, 7);
INSERT INTO OrderProduct VALUES (2, 9);
INSERT INTO OrderProduct VALUES (1, 6);
