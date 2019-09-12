SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[EmployeeInfo](
	[EmployeeID] [nvarchar](20) NOT NULL,
	[CNAME] [nvarchar](10) NULL,
	[ENAME] [nvarchar](30) NULL,
	[Photos] [image] NULL,
	[Sex] [nvarchar](2) NULL,
	[Birthday] [nvarchar](12) NULL,
	[BooldType] [nvarchar](5) NULL,
	[ID] [nvarchar](10) NULL,
	[PresentAddress] [nvarchar](100) NULL,
	[Professional] [nvarchar](30) NULL,
	[HireDate] [nvarchar](12) NULL,
	[Positions] [nvarchar](20) NULL,
	[Background] [nvarchar](100) NULL,
	[Phone] [nvarchar](10) NULL,
	[Status] [nvarchar](2) NULL,
 CONSTRAINT [PK_EmployeeInfo] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
