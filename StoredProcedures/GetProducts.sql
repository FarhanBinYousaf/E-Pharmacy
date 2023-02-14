USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[GetProducts]    Script Date: 02/14/2023 22:28:54 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetProducts]
AS
BEGIN
	select * from tblProduct
END

GO

