USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[CartedProducts]    Script Date: 02/14/2023 22:25:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[CartedProducts]
	@uniqueNo bigint
AS
BEGIN
	select * from tblProduct p inner join tblTemp t on p.ProductID = t.ProID where UniqueNo = @uniqueNo
END

GO

