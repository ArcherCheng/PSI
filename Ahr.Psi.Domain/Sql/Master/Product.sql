CREATE TABLE Product(
	ProductId nvarchar(20) NOT NULL,
	ProductName nvarchar(60) NOT NULL,
	CategoryId  nvarchar(20) NOT NULL,
	UnitId  nvarchar(20) NOT NULL,
	BarCode nvarchar(30) NOT NULL,

	CostPrice int not null,
	SellingPrice int not null,
	SuggestPrice int not null,

	StockQty int not null,
	MaxQty int not null,
	MinQty int not null,

	Notes nvarchar(500) NOT NULL,

 	--以下每檔資料表都會有這些欄位
	CreateTime    Datetime       Null,
	UpdateTime    Datetime       Null,
	UserId        Nvarchar(30)   Null,
	UserIp        Nvarchar(30)   Null,
CONSTRAINT PK_Product PRIMARY KEY CLUSTERED (ProductId));
go

ALTER TABLE  Product ADD CONSTRAINT Product_CategoryId
      FOREIGN KEY (CategoryId)
      REFERENCES ProductCategory (CategoryId)
GO

ALTER TABLE  Product ADD CONSTRAINT Product_UnitId
      FOREIGN KEY (CategoryId)
      REFERENCES ProductUnit (UnitId)
GO

Create Trigger Product_Tr1 On Product After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='Product';

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

