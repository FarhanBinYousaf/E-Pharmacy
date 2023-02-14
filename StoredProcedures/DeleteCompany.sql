USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DeleteCompany]    Script Date: 02/14/2023 22:26:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteCompany]
	@companyId int
AS
BEGIN
	delete from tblCompany where CompanyID = @companyId
END

GO

