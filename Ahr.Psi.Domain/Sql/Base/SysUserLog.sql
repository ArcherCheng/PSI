
Create Table SysUserLog(
 	Id bigint identity(0,1) not null,
	UserId nvarchar(30) not null,
	Refer nvarchar(255) null,
	Destination nvarchar(255) null,
	QueryString nvarchar(255) null,
	Method nvarchar(30) null,
	IpAddress nvarchar(30) null,
	RequestTime datetime null,
   Constraint PK_SysUserLog Primary Key (Id Asc)
);
Go

Alter Table SysUserLg Add Constraint SysUserLog_Df_RequestTime Default (Getdate()) For RequestTime
Go
