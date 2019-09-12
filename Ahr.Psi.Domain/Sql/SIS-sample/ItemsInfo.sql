SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ItemsInfo](
	[ItemsID] [nvarchar](20) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[ItemsType] [nvarchar](20) NULL,
	[Specifications] [nvarchar](max) NULL,
	[ItemsUnit] [nvarchar](5) NULL,
	[SellingPrice] [int] NULL,
	[CostPrice] [int] NULL,
	[MSRP] [int] NULL,
	[ManufacturerID] [nvarchar](20) NULL,
	[Inventory] [int] NULL,
	[SafeInventory] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ItemsInfo] PRIMARY KEY CLUSTERED 
(
	[ItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ItemsInfo]  WITH CHECK ADD  CONSTRAINT [FK_ItemsInfo_ManufacturerInfo] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[ManufacturerInfo] ([ManufacturerID])
GO

ALTER TABLE [dbo].[ItemsInfo] CHECK CONSTRAINT [FK_ItemsInfo_ManufacturerInfo]
GO
