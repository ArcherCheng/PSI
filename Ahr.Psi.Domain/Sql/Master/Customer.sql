
CREATE TABLE Customer(
	CustomerId   nvarchar(20) NOT NULL,
	CustomerName nvarchar(60) NOT NULL,
	EngName      nvarchar(120) NULL,
	TaxId        nvarchar(10) NULL,

	Operator nvarchar(30) NULL,
	TelNo    nvarchar(30) NULL,
	MobileNo nvarchar(30) NULL,
	FaxNo    nvarchar(30) NULL,

	PostNo   nvarchar(6) NULL,
	Address  nvarchar(60) NULL,

	Notes nvarchar(500) NOT NULL,

 	--以下每檔資料表都會有這些欄位
	CreateTime    Datetime       Null,
	UpdateTime    Datetime       Null,
	UserId        Nvarchar(30)   Null,
	UserIp        Nvarchar(30)   Null,
CONSTRAINT PK_Customer PRIMARY KEY CLUSTERED (CustomerId));
go


Create Trigger Customer_Tr1 On Customer After Insert,Update,Delete Not For Replication As
Begin
	Declare @TableName Nvarchar(30);
	Set @TableName='Customer';

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