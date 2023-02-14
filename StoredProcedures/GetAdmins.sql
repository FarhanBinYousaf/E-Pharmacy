USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[GetAdmins]    Script Date: 02/14/2023 22:27:57 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetAdmins]

AS
BEGIN
	select * from tblAdmin
END

GO

