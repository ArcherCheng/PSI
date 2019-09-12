/*
Drop TABLE SaleDetail
Drop TABLE SaleMaster
*/
CREATE TABLE SaleMaster(
	Id           int Identity(0,1) NOT NULL,
	SaleId       nvarchar(20) NOT NULL,
	PurchaseId   nvarchar(20) NOT NULL,
	CustomerId   nvarchar(20) NOT NULL,
	PaymentType  nvarchar(10) null,

	SaleDate     Date not null,
	Operator     nvarchar(30),

	--DeliveryAddress nvarchar(60) null,
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
CONSTRAINT PK_SaleMaster PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  SaleMaster ADD CONSTRAINT SaleMaster_CustomerId
      FOREIGN KEY (CustomerId)
      REFERENCES Customer (CustomerId)
GO


Create Trigger SaleMaster_Tr1 On PurchaseMaster After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='SaleMaster';

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

--Drop TABLE SaleDetail;
go
CREATE TABLE SaleDetail(
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
CONSTRAINT PK_SaleDetail PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  SaleDetail ADD CONSTRAINT SaleDetail_MasterId
      FOREIGN KEY (MasterId)
      REFERENCES SaleMaster (Id)
GO

ALTER TABLE  SaleDetail ADD CONSTRAINT SaleDetail_ProductId
      FOREIGN KEY (ProductId)
      REFERENCES Product (ProductId)
GO



Create Trigger SaleDetail_Tr1 On SaleDetail After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='SaleDetail';

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