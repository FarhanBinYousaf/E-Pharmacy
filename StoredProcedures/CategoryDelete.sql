USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[CategoryDelete]    Script Date: 02/14/2023 22:26:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CategoryDelete]
	@CatId int
AS
BEGIN
	delete from tblCategory where CategoryID = @CatId
END

GO

