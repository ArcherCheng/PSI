

CREATE TABLE ProductCategory(
	CategoryId nvarchar(20) NOT NULL,
	CategoryName nvarchar(20) NOT NULL,

	CreateTime    Datetime       Null,
	UpdateTime    Datetime       Null,
	UserId        Nvarchar(30)   Null,
	UserIp        Nvarchar(30)   Null,
CONSTRAINT PK_ProductCategory PRIMARY KEY CLUSTERED (CategoryId));
go

Create Trigger ProductCategory_Tr1 On ProductCategory After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='ProductCategory';

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

