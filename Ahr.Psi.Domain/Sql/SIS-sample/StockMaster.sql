SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StockMaster](
	[StockID] [nvarchar](20) NOT NULL,
	[StockDate] [nvarchar](12) NULL,
	[TotalPreTax] [int] NULL,
	[Tax] [int] NULL,
	[TotalAfterTax] [int] NULL,
	[ManufacturerID] [nvarchar](20) NULL,
	[BusinessTaxStockTaxRate] [int] NULL,
	[AmountPaid] [int] NULL,
	[UnpaidAmount] [int] NULL,
	[StockStaff] [nvarchar](30) NULL,
	[PaymentType] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_StockMaster] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[StockMaster]  WITH CHECK ADD  CONSTRAINT [FK_StockMaster_ManufacturerInfo] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[ManufacturerInfo] ([ManufacturerID])
GO

ALTER TABLE [dbo].[StockMaster] CHECK CONSTRAINT [FK_StockMaster_ManufacturerInfo]
GO


