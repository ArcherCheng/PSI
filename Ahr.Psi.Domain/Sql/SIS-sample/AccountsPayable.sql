CREATE TABLE [dbo].[AccountsPayable](
	[StockID] [nvarchar](20) NOT NULL,
	[ManufacturerID] [nvarchar](20) NULL,
	[CNAME] [nvarchar](20) NULL,
	[UnpaidAmount] [int] NULL,
	[ReversalAmount] [int] NULL,
	[Surplus] [int] NULL,
 CONSTRAINT [PK_AccountsPayable] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AccountsPayable]  WITH NOCHECK ADD  CONSTRAINT [FK_AccountsPayable_StockMaster] FOREIGN KEY([StockID])
REFERENCES [dbo].[StockMaster] ([StockID])
GO

ALTER TABLE [dbo].[AccountsPayable] CHECK CONSTRAINT [FK_AccountsPayable_StockMaster]
GO
