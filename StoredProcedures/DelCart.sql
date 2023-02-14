USE [EPharmacy027]
GO

/****** Object:  StoredProcedure [dbo].[DelCart]    Script Date: 02/14/2023 22:26:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DelCart]
	@UniqueId bigint
AS
BEGIN
	delete from tblTemp where UniqueNo = @UniqueId
END

GO

