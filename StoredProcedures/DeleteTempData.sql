USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DeleteTempData]    Script Date: 02/14/2023 22:27:03 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteTempData]
	@Id int
AS
BEGIN
	delete from tblTemp where ID = @Id
END

GO

