Create Table SysTransLog(
   Id Bigint Identity(1,1) Not Null,
   TableName Nvarchar(30) not Null,
   InsertData Nvarchar(max) Null,
   DeleteData Nvarchar(max) Null,
   IudType Tinyint not Null,
   WriteTime Datetime Null,
   Constraint PK_SysTransLog Primary Key (Id Asc)
);
Go

Alter Table SysTransLog Add Constraint SysTransLog_Df_WriteTime Default (Getdate()) For WriteTime
Go
