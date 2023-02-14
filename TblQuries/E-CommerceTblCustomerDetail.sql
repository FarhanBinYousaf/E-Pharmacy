USE [EPharmacy027]
GO

/****** Object:  Table [dbo].[tblCustomerDetail]    Script Date: 02/14/2023 18:18:23 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[tblCustomerDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[ShippingAddress] [varchar](50) NOT NULL,
	[PhoneNo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_tblCustomerDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


