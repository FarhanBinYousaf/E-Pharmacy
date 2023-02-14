USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DoAdminDelete]    Script Date: 02/14/2023 22:27:36 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DoAdminDelete]
	@adminId int
AS
BEGIN
	delete from tblAdmin where AdminID = @adminId
END

GO

