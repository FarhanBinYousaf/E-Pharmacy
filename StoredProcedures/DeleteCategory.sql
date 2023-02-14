USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DeleteCategory]    Script Date: 02/14/2023 22:26:24 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[DeleteCategory]
AS
BEGIN
	delete from tblCategory
END

GO

