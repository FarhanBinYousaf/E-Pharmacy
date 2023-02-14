USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[GetAllCategories]    Script Date: 02/14/2023 22:28:08 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetAllCategories]
AS
BEGIN
	select * from tblCategory
END

GO

