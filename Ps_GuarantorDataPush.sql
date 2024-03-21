USE [AphaComptaDB2019_08_01_2024_TEST]
GO

/****** Object:  StoredProcedure [dbo].[Ps_GuarantorDataPush]    Script Date: 3/21/2024 11:13:36 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[Ps_GuarantorDataPush] 
	
AS
BEGIN

	;with NewLoans
as
(
--Select  *  from dbo.GuarantorSaccoDaily where LoanID Not in (Select LoanID from GuarantorRequestTable) 

/*SELECT GSD.*
FROM dbo.GuarantorSaccoDaily AS GSD
WHERE NOT EXISTS (
    SELECT 1
    FROM GuarantorRequestTable AS GRT
    WHERE GRT.LoanID = GSD.ClientID
      AND (GRT.LoanID IS NULL OR GSD.LoanID IS NULL)
)*/

SELECT GSD.*
FROM dbo.GuarantorSaccoDaily AS GSD
LEFT JOIN GuarantorRequestTable AS GRT ON GSD.LoanID = GRT.LoanID
WHERE GRT.LoanID IS NULL


 ),



 NewClients as (
 
--Select  *  from dbo.GuarantorSaccoDaily where ClientID Not in (Select ClientID from GuarantorRequestTable) 


/*SELECT GSD.*
FROM dbo.GuarantorSaccoDaily AS GSD
WHERE NOT EXISTS (
    SELECT 1
    FROM GuarantorRequestTable AS GRT
    WHERE GRT.ClientID = GSD.ClientID
      AND (GRT.ClientID IS NULL OR GSD.ClientID IS NULL)
)*/

SELECT GSD.*
FROM dbo.GuarantorSaccoDaily AS GSD
LEFT JOIN GuarantorRequestTable AS GRT ON GSD.ClientID = GRT.ClientID
WHERE GRT.ClientID IS NULL

 ),
 LoanExpired as (
 
 Select  *  from dbo.GuarantorSaccoDaily where LoanID  in (Select LoanID from CRBGuarantorTable where Balance=0) 

 ),

 FinalGuarantorsDailyData as (
 
 select * from NewLoans
  
  Union 
 
  select  * from  NewClients
 
 )
 insert into GuarantorRequestTable
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
	  from FinalGuarantorsDailyData



--Select * from GuarantorSaccoDaily
END


Select * from GuarantorRequestTable
GO


