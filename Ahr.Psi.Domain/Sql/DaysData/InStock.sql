
CREATE TABLE InStockMaster(
	Id           int Identity(0,1) NOT NULL,
	InStockId    nvarchar(20) NOT NULL,
	PurchaseId   nvarchar(20) NOT NULL,
	VenderId     nvarchar(20) NOT NULL,
	PaymentType   nvarchar(10) null,

	InStockDate  Date not null,
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
CONSTRAINT PK_InStockMaster PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  InStockMaster ADD CONSTRAINT InStockMaster_VenderId
      FOREIGN KEY (VenderId)
      REFERENCES Vender (VenderId)
GO


Create Trigger InStockMaster_Tr1 On PurchaseMaster After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='InStockMaster';

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

--Drop TABLE InStockDetail;
go
CREATE TABLE InStockDetail(
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
CONSTRAINT PK_InStockDetail PRIMARY KEY CLUSTERED (Id));
go

ALTER TABLE  InStockDetail ADD CONSTRAINT InStockDetail_MasterId
      FOREIGN KEY (MasterId)
      REFERENCES InStockMaster (Id)
GO

ALTER TABLE  InStockDetail ADD CONSTRAINT InStockDetail_ProductId
      FOREIGN KEY (ProductId)
      REFERENCES Product (ProductId)
GO



Create Trigger InStockDetail_Tr1 On InStockDetail After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='InStockDetail';

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