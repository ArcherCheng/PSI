SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TakeStockDetails](
	[TakeStockID] [nvarchar](20) NOT NULL,
	[ItemsID] [nvarchar](20) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[Inventory] [int] NULL,
	[TakeStockInventory] [int] NULL,
	[GainLossInventory] [int] NULL,
	[IsTakeStock] [bit] NULL,
	[ItemsUnit] [nvarchar](5) NULL,
	[Price] [int] NULL,
	[Totals] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_TakeStockDetails] PRIMARY KEY CLUSTERED 
(
	[TakeStockID] ASC,
	[ItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
