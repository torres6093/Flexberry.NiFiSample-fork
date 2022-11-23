﻿




CREATE TABLE Brand (
 primaryKey UUID NOT NULL,
 Name VARCHAR(255) NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE CarData (
 primaryKey UUID NOT NULL,
 BrandName VARCHAR(255) NOT NULL,
 CarBody VARCHAR(9) NULL,
 CarDate TIMESTAMP(3) NOT NULL,
 CarNumber VARCHAR(255) NOT NULL,
 SparePartName VARCHAR(255) NULL,
 SparePartProducingCountryName VARCHAR(255) NULL,
 SparePartQuantity INT NULL,
 SparePartUsed BOOLEAN NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE ProducingCountry (
 primaryKey UUID NOT NULL,
 Name VARCHAR(255) NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE SparePart (
 primaryKey UUID NOT NULL,
 Name VARCHAR(255) NULL,
 Quantity INT NULL,
 Used BOOLEAN NULL,
 ProducingCountry_m0 UUID NULL,
 Car_m0 UUID NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE Car (
 primaryKey UUID NOT NULL,
 CarBody VARCHAR(9) NULL,
 CarDate TIMESTAMP(3) NOT NULL,
 CarNumber VARCHAR(255) NOT NULL,
 Brand_m0 UUID NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMNETLOCKDATA (
 LockKey VARCHAR(300) NOT NULL,
 UserName VARCHAR(300) NOT NULL,
 LockDate TIMESTAMP(3) NULL,
 PRIMARY KEY (LockKey));


CREATE TABLE STORMSETTINGS (
 primaryKey UUID NOT NULL,
 Module VARCHAR(1000) NULL,
 Name VARCHAR(255) NULL,
 Value TEXT NULL,
 "User" VARCHAR(255) NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMAdvLimit (
 primaryKey UUID NOT NULL,
 "User" VARCHAR(255) NULL,
 Published BOOLEAN NULL,
 Module VARCHAR(255) NULL,
 Name VARCHAR(255) NULL,
 Value TEXT NULL,
 HotKeyData INT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERSETTING (
 primaryKey UUID NOT NULL,
 Name VARCHAR(255) NOT NULL,
 DataObjectView VARCHAR(255) NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMWEBSEARCH (
 primaryKey UUID NOT NULL,
 Name VARCHAR(255) NOT NULL,
 "Order" INT NOT NULL,
 PresentView VARCHAR(255) NOT NULL,
 DetailedView VARCHAR(255) NOT NULL,
 FilterSetting_m0 UUID NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERDETAIL (
 primaryKey UUID NOT NULL,
 Caption VARCHAR(255) NOT NULL,
 DataObjectView VARCHAR(255) NOT NULL,
 ConnectMasterProp VARCHAR(255) NOT NULL,
 OwnerConnectProp VARCHAR(255) NULL,
 FilterSetting_m0 UUID NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE STORMFILTERLOOKUP (
 primaryKey UUID NOT NULL,
 DataObjectType VARCHAR(255) NOT NULL,
 Container VARCHAR(255) NULL,
 ContainerTag VARCHAR(255) NULL,
 FieldsToView VARCHAR(255) NULL,
 FilterSetting_m0 UUID NOT NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE UserSetting (
 primaryKey UUID NOT NULL,
 AppName VARCHAR(256) NULL,
 UserName VARCHAR(512) NULL,
 UserGuid UUID NULL,
 ModuleName VARCHAR(1024) NULL,
 ModuleGuid UUID NULL,
 SettName VARCHAR(256) NULL,
 SettGuid UUID NULL,
 SettLastAccessTime TIMESTAMP(3) NULL,
 StrVal VARCHAR(256) NULL,
 TxtVal TEXT NULL,
 IntVal INT NULL,
 BoolVal BOOLEAN NULL,
 GuidVal UUID NULL,
 DecimalVal DECIMAL(20,10) NULL,
 DateTimeVal TIMESTAMP(3) NULL,
 PRIMARY KEY (primaryKey));


CREATE TABLE ApplicationLog (
 primaryKey UUID NOT NULL,
 Category VARCHAR(64) NULL,
 EventId INT NULL,
 Priority INT NULL,
 Severity VARCHAR(32) NULL,
 Title VARCHAR(256) NULL,
 Timestamp TIMESTAMP(3) NULL,
 MachineName VARCHAR(32) NULL,
 AppDomainName VARCHAR(512) NULL,
 ProcessId VARCHAR(256) NULL,
 ProcessName VARCHAR(512) NULL,
 ThreadName VARCHAR(512) NULL,
 Win32ThreadId VARCHAR(128) NULL,
 Message VARCHAR(2500) NULL,
 FormattedMessage TEXT NULL,
 PRIMARY KEY (primaryKey));



 ALTER TABLE SparePart ADD CONSTRAINT FKe889cc1c7c4771ab78c1d6033cf588d71eff082a FOREIGN KEY (ProducingCountry_m0) REFERENCES ProducingCountry; 
CREATE INDEX Indexe889cc1c7c4771ab78c1d6033cf588d71eff082a on SparePart (ProducingCountry_m0); 

 ALTER TABLE SparePart ADD CONSTRAINT FK9060f078b443dafa963f06c5dc6cd1c6301e73bd FOREIGN KEY (Car_m0) REFERENCES Car; 
CREATE INDEX Index9060f078b443dafa963f06c5dc6cd1c6301e73bd on SparePart (Car_m0); 

 ALTER TABLE Car ADD CONSTRAINT FK486d49af379b9b088fb8421790708fa4f1b0632a FOREIGN KEY (Brand_m0) REFERENCES Brand; 
CREATE INDEX Index486d49af379b9b088fb8421790708fa4f1b0632a on Car (Brand_m0); 

 ALTER TABLE STORMWEBSEARCH ADD CONSTRAINT FKc4378e39870eb056aec84088683297a01d2a6200 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERDETAIL ADD CONSTRAINT FK921d16269835017e2a0d0e29ad6fb175454a70d0 FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

 ALTER TABLE STORMFILTERLOOKUP ADD CONSTRAINT FKce38ef0db3f01a53acaa49fed8853fb941ad47ba FOREIGN KEY (FilterSetting_m0) REFERENCES STORMFILTERSETTING; 

