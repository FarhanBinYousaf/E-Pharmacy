USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[GetCategoryDepProducts]    Script Date: 02/14/2023 22:28:35 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetCategoryDepProducts]
	@CatID int
AS
BEGIN
	
	SET NOCOUNT ON;
	select * from tblProduct where CategoryID = @CatID
END

GO

