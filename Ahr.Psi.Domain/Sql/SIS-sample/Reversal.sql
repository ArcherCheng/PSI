SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reversal](
	[ReversalID] [nvarchar](20) NOT NULL,
	[ReversalDate] [nvarchar](12) NULL,
	[ReversalStaff] [nvarchar](30) NULL,
	[ReversalType] [nvarchar](20) NULL,
	[CustomerOrManufacturer] [nvarchar](30) NULL,
	[StockIDOrShipID] [nvarchar](20) NULL,
	[PaymentAmount] [int] NULL,
	[ReversalAmount] [int] NULL,
	[IsReversal] [bit] NULL,
	[PaymentType] [nvarchar](10) NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_Reversal] PRIMARY KEY CLUSTERED 
(
	[ReversalID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO