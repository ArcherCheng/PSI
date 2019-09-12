SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShipMaster](
	[ShipID] [nvarchar](20) NOT NULL,
	[ShipDate] [nvarchar](12) NULL,
	[TotalPreTax] [int] NULL,
	[Tax] [int] NULL,
	[TotalAfterTax] [int] NULL,
	[CustomerID] [nvarchar](20) NULL,
	[BusinessTaxShipTaxRate] [int] NULL,
	[AmountPaid] [int] NULL,
	[UnpaidAmount] [int] NULL,
	[ShipStaff] [nvarchar](30) NULL,
	[PaymentType] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShipMaster] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO


