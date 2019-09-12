/*
報價單 - QUOTATION 
訂購單 - REQEUST ORDER 
採購單 - PURCHASE ORDER 
進貨單 - BILL OF PURCHASE 
銷貨單 - BILL OF SALE
*/
CREATE TABLE PurchaseMaster(
	Id           int Identity(0,1) NOT NULL,
	PurchaseId   nvarchar(20) NOT NULL,
	VenderId     nvarchar(20) NOT NULL,
	PurchaseDate Date not null,
	Operator     nvarchar(30),
	DeliveryDate Date null,
	--DeliveryAddress nvarchar(60) null,
	PaymentType   nvarchar(10) null,
	TaxRate       int not null,
	TotalPreTax   int not null,
	TaxAmt        int not null,
	TotalAfterTax int not null,

	Notes nvarchar(500) NOT NULL,

 	--以下每檔資料表都會有這些欄位
	CreateTime    Datetime       Null,
	UpdateTime    Datetime       Null,
	UserId        Nvarchar(30)   Null,
	UserIp        Nvarchar(30)   Null,
CONSTRAINT PK_PurchaseMaster PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  PurchaseMaster ADD CONSTRAINT PurchaseMaster_VenderId
      FOREIGN KEY (VenderId)
      REFERENCES Vender (VenderId)
GO


Create Trigger PurchaseMaster_Tr1 On PurchaseMaster After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='PurchaseMaster';

	Declare @IudType Tinyint;
	Set @IudType=0;
 
	If Exists(Select 1 From Inserted) And Not Exists(Select 1 From Deleted)
		Set @IudType = 1;    --Insert
	Else If Exists(Select 1 From Inserted) And Exists(Select 1 From Deleted)
		Set @IudType = 2;    --Update
	Else If Not Exists(Select 1 From Inserted) And Exists(Select 1 From Deleted)
		Set @IudType = 3;    --Delete
	
	Declare @InsertData Nvarchar(max);
	Declare @DeleteData Nvarchar(max);

	Set @InsertData=(Select * From Inserted For Json Auto);
	Set @DeleteData=(Select * From Deleted For Json Auto);

	Insert Into SysTransLog(TableName,InsertData,DeleteData,IudType) Values(@TableName,@InsertData,@DeleteData,@IudType);
End
Go

--Drop TABLE PurchaseDetail;
go
CREATE TABLE PurchaseDetail(
	Id           int Identity(0,1) NOT NULL,
	MasterId     int NOT NULL,
	ProductId    nvarchar(20) NOT NULL,
	Qty          int not null,
	Price        int not null,
	Total        int not null,

	Notes        nvarchar(500) NOT NULL,

 	--以下每檔資料表都會有這些欄位
	CreateTime    Datetime       Null,
	UpdateTime    Datetime       Null,
	UserId        Nvarchar(30)   Null,
	UserIp        Nvarchar(30)   Null,
CONSTRAINT PK_PurchaseDetail PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  PurchaseDetail ADD CONSTRAINT PurchaseDetail_MasterId
      FOREIGN KEY (MasterId)
      REFERENCES PurchaseMaster (Id)
GO

ALTER TABLE  PurchaseDetail ADD CONSTRAINT PurchaseDetail_ProductId
      FOREIGN KEY (ProductId)
      REFERENCES Product (ProductId)
GO



Create Trigger PurchaseDetail_Tr1 On PurchaseDetail After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='PurchaseDetail';

	Declare @IudType Tinyint;
	Set @IudType=0;
 
	If Exists(Select 1 From Inserted) And Not Exists(Select 1 From Deleted)
		Set @IudType = 1;    --Insert
	Else If Exists(Select 1 From Inserted) And Exists(Select 1 From Deleted)
		Set @IudType = 2;    --Update
	Else If Not Exists(Select 1 From Inserted) And Exists(Select 1 From Deleted)
		Set @IudType = 3;    --Delete
	
	Declare @InsertData Nvarchar(max);
	Declare @DeleteData Nvarchar(max);

	Set @InsertData=(Select * From Inserted For Json Auto);
	Set @DeleteData=(Select * From Deleted For Json Auto);

	Insert Into SysTransLog(TableName,InsertData,DeleteData,IudType) Values(@TableName,@InsertData,@DeleteData,@IudType);
End
Go