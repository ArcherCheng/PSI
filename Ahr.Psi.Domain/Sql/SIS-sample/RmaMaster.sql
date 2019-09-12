SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RMAMaster](
	[RMAID] [nvarchar](20) NOT NULL,
	[RMADate] [nvarchar](12) NULL,
	[RMAType] [nvarchar](20) NULL,
	[TotalPreTax] [int] NULL,
	[Tax] [int] NULL,
	[TotalAfterTax] [int] NULL,
	[StockIDOrShipID] [nvarchar](20) NULL,
	[BusinessTax] [int] NULL,
	[AmountPaid] [int] NULL,
	[UnpaidAmount] [int] NULL,
	[RMAAmount] [int] NULL,
	[Staff] [nvarchar](30) NULL,
	[PaymentType] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_RMAMaster] PRIMARY KEY CLUSTERED 
(
	[RMAID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO