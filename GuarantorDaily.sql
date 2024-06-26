USE [crb]
GO
/****** Object:  StoredProcedure [dbo].[GuarantorDaily]    Script Date: 4/25/2024 10:03:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[GuarantorDaily]
	
AS
BEGIN
	
	SET NOCOUNT ON;

   INSERT INTO GuarantorDailyData (
    accountNumber, country, dateOfBirth, guarantorType, surName, foreName1, foreName2, foreName3,
    mobileTelephone, homeTelephone, nationalId, nationality, passportNumber, placeOfBirth,
    postalAddressNumber, postalCode, town, workTelephone, recordType
)
SELECT 
    accountNumber, country, dateOfBirth, guarantorType, surName, foreName1, foreName2, foreName3,
    mobileTelephone, homeTelephone, nationalId, nationality, passportNumber, placeOfBirth,
    postalAddressNumber, postalCode, town, workTelephone, recordType
FROM [192.168.0.250\USACCOMAIN].AphaComptaDB2019.dbo.CRBGuarantorTable;


END
