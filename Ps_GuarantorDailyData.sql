USE [AphaComptaDB2019_08_01_2024_TEST]
GO

/****** Object:  StoredProcedure [dbo].[Ps_GuarantorDailyData]    Script Date: 3/21/2024 11:00:45 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[Ps_GuarantorDailyData] 

AS
BEGIN

	SET NOCOUNT ON;


		insert into GuarantorSaccoDaily
(
       creationDate,
       [accountNumber]
      ,[country]
      ,[dateOfBirth]
      ,[guarantorType]
      ,[foreName1]
      ,[foreName2]
      ,[foreName3]
      ,[homeTelephone]
      ,[mobileTelephone]
      ,[nationalId]
      ,[nationality]
      ,[passportNumber]
      ,[placeOfBirth]
      ,[postalAddressNumber]
      ,[postalCode]
      ,[surName]
      ,[town]
      ,[workTelephone]
      ,[recordType],
	  ClientID,
	  LoanID
)
select 
       getdate(),
       [accountNumber]
      ,[country]
      ,[dateOfBirth]
      ,[guarantorType]
      ,[foreName1]
      ,[foreName2]
      ,[foreName3]
      ,[homeTelephone]
      ,[mobileTelephone]
      ,[nationalId]
      ,[nationality]
      ,[passportNumber]
      ,[placeOfBirth]
      ,[postalAddressNumber]
      ,[postalCode]
      ,[surName]
      ,[town]
      ,[workTelephone]
      ,[recordType],
	  ClientID,
	  LoanID
	  from CRBGuarantorTable
END


--Select * from GuarantorSaccoDaily

--Delete from GuarantorSaccoDaily
GO


