USE [EPharmacy027]
GO

/****** Object:  Table [dbo].[tblAdmin]    Script Date: 02/14/2023 18:14:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblAdmin](
	[AdminID] [int] IDENTITY(1,1) NOT NULL,
	[AdminName] [varchar](30) NOT NULL,
	[AdminEmail] [varchar](30) NOT NULL,
	[AdminPassword] [varchar](30) NOT NULL,
 CONSTRAINT [PK_tblAdmin] PRIMARY KEY CLUSTERED 
(
	[AdminID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


