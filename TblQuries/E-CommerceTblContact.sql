USE [EPharmacy027]
GO

/****** Object:  Table [dbo].[tblContact]    Script Date: 02/14/2023 18:18:07 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblContact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](30) NOT NULL,
	[Email] [varchar](30) NOT NULL,
	[Subject] [varchar](50) NOT NULL,
	[Message] [varchar](500) NOT NULL,
 CONSTRAINT [PK_tblContact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


