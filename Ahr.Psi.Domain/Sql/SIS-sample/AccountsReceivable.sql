SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[AccountsReceivable](
	[ShipID] [nvarchar](20) NOT NULL,
	[CustomerID] [nvarchar](20) NULL,
	[CNAME] [nvarchar](20) NULL,
	[UnpaidAmount] [int] NULL,
	[ReversalAmount] [int] NULL,
	[Surplus] [int] NULL,
 CONSTRAINT [PK_AccountsReceivable] PRIMARY KEY CLUSTERED 
(
	[ShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[AccountsReceivable]  WITH NOCHECK ADD  CONSTRAINT [FK_AccountsReceivable_ShipMaster] FOREIGN KEY([ShipID])
REFERENCES [dbo].[ShipMaster] ([ShipID])
GO

ALTER TABLE [dbo].[AccountsReceivable] CHECK CONSTRAINT [FK_AccountsReceivable_ShipMaster]
GO
