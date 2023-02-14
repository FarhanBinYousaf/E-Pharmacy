USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DeleteProduct]    Script Date: 02/14/2023 22:26:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DeleteProduct]
	@ProductId int
AS
BEGIN
	delete from tblProduct where ProductID = @ProductId
END

GO

