USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[AllProducts]    Script Date: 02/14/2023 22:24:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AllProducts]
AS
BEGIN
	select p.*,ct.CategoryName,cp.CompanyName from tblProduct as p left join tblCategory as ct on p.CategoryID = ct.CategoryID left join tblCompany as cp on cp.CompanyID = p.CompanyID
END

GO


