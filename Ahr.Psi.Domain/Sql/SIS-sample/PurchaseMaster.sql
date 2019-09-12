SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[PurchaseMaster](
	[PurchaseID] [nvarchar](20) NOT NULL,
	[PurchaseDate] [nvarchar](12) NULL,
	[DeliveryDate] [nvarchar](12) NULL,
	[ManufacturerID] [nvarchar](20) NULL,
	[PurchaseStaff] [nvarchar](30) NULL,
	[PurchasePhone] [nvarchar](10) NULL,
	[DeliveryAddress] [nvarchar](100) NULL,
	[PaymentType] [nvarchar](10) NULL,
	[BusinessTaxStockTaxRate] [int] NULL,
	[TotalPreTax] [int] NULL,
	[Tax] [int] NULL,
	[TotalAfterTax] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_PurchaseMaster] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

