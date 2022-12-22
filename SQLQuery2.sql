USE [EPharmacy027]
GO

/****** Object:  Table [dbo].[tblProduct]    Script Date: 12/20/2022 18:02:30 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblProduct](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [varchar](100) NOT NULL,
	[ProductDescription] [varchar](500) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductMG] [varchar](50) NULL,
	[ProductQuantity] [varchar](50) NULL,
	[ProductUses] [varchar](100) NULL,
	[ProductIngredients] [varchar](200) NULL,
	[ProductBenefits] [varchar](100) NULL,
	[ProductCompany] [varchar](50) NULL,
	[ProductMFG] [date] NULL,
	[ProductEXP] [date] NULL,
	[ProductFormat] [varchar](50) NULL,
	[ProductSideEffects] [varchar](100) NULL,
	[ProductPrecautions] [varchar](100) NULL,
	[ProductAgeLimit] [varchar](100) NULL,
	[ProductFormula] [varchar](50) NULL,
	[ProductManipulations] [varchar](200) NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[tblProduct]  WITH CHECK ADD  CONSTRAINT [FK_tblProduct_tblCategory] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[tblCategory] ([CategoryID])
GO

ALTER TABLE [dbo].[tblProduct] CHECK CONSTRAINT [FK_tblProduct_tblCategory]
GO


