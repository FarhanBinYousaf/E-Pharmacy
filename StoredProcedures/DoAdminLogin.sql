USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DoAdminLogin]    Script Date: 02/14/2023 22:27:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DoAdminLogin]
	@email varchar(30),
	@password varchar(30)
AS
BEGIN
	select * from tblAdmin where AdminEmail = @email AND AdminPassword = @password
END

GO

