SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[CompanyInfo](
	[CompanyID] [nvarchar](20) NOT NULL,
	[CNAME] [nvarchar](30) NULL,
	[ENAME] [nvarchar](30) NULL,
	[UnifiedBusinessNo] [nvarchar](8) NULL,
	[CompanyType] [nvarchar](10) NULL,
	[Owner] [nvarchar](30) NULL,
	[Contact] [nvarchar](30) NULL,
	[Phone] [nvarchar](10) NULL,
	[MobilePhone] [nvarchar](10) NULL,
	[Fax] [nvarchar](10) NULL,
	[Address] [nvarchar](100) NULL,
	[WebSite] [nvarchar](100) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_CompanyInfo] PRIMARY KEY CLUSTERED 
(
	[CompanyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

