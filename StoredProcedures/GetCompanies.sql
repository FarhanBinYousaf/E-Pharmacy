USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[GetCompanies]    Script Date: 02/14/2023 22:28:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCompanies]
AS
BEGIN
	select * from tblCompany
END

GO

