﻿SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ShipDetails](
	[ShipID] [nvarchar](20) NOT NULL,
	[ItemsID] [nvarchar](20) NOT NULL,
	[NAME] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[ItemsUnit] [nvarchar](5) NULL,
	[SellingPrice] [int] NULL,
	[Totals] [int] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ShipDetails] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC,
	[ItemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[ShipDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShipDetails_ItemsInfo] FOREIGN KEY([ItemsID])
REFERENCES [dbo].[ItemsInfo] ([ItemsID])
GO

ALTER TABLE [dbo].[ShipDetails] CHECK CONSTRAINT [FK_ShipDetails_ItemsInfo]
GO