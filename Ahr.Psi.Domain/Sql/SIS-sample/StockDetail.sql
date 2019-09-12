SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[StockDetails](
	[StockID] [nvarchar](20) NOT NULL,
	[ItemsID] [nvarchar](20) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[ItemsUnit] [nvarchar](5) NULL,
	[CostPrice] [int] NULL,
	[Totals] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_StockDetails] PRIMARY KEY CLUSTERED 
(
	[StockID] ASC,
	[ItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[StockDetails]  WITH CHECK ADD  CONSTRAINT [FK_StockDetails_ItemsInfo] FOREIGN KEY([ItemsID])
REFERENCES [dbo].[ItemsInfo] ([ItemsID])
GO

ALTER TABLE [dbo].[StockDetails] CHECK CONSTRAINT [FK_StockDetails_ItemsInfo]
GO
