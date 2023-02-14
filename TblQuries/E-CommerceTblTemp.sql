USE [EPharmacy027]
GO

/****** Object:  Table [dbo].[tblTemp]    Script Date: 02/14/2023 18:19:31 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[tblTemp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProID] [int] NOT NULL,
	[UniqueNo] [bigint] NOT NULL,
	[DateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_tblTemp] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[tblTemp]  WITH CHECK ADD  CONSTRAINT [FK_tblTemp_tblProduct] FOREIGN KEY([ProID])
REFERENCES [dbo].[tblProduct] ([ProductID])
GO

ALTER TABLE [dbo].[tblTemp] CHECK CONSTRAINT [FK_tblTemp_tblProduct]
GO


