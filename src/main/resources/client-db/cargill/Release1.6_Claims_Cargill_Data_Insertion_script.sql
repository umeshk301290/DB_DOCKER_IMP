DECLARE @ClaimObjectId UNIQUEIDENTIFIER
SELECT 
	@ClaimObjectId = Id 
FROM [dbo].[Object] 
WHERE name = 'Claim'

UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=18 WHERE [FieldType] = 'STANDARD' AND [Name] = 'businessUnit' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=17 WHERE [FieldType] = 'STANDARD' AND [Name] = 'problemType' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=9 WHERE [FieldType] = 'STANDARD' AND [Name] = 'status' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=7 WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimDate' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=3 WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorName' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=1 WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimNumber' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'id' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=6 WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimCurrency' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'dispositionId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=2 WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorNumber' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'auditName' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'auditProject' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'problemTypeId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=13 WHERE [FieldType] = 'STANDARD' AND [Name] = 'clientClaimNumber' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=12 WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=5 WHERE [FieldType] = 'STANDARD' AND [Name] = 'netClaimAmount' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'statusId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=8 WHERE [FieldType] = 'STANDARD' AND [Name] = 'stage' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=11 WHERE [FieldType] = 'STANDARD' AND [Name] = 'projectId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=14 WHERE [FieldType] = 'STANDARD' AND [Name] = 'disposition' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=15 WHERE [FieldType] = 'STANDARD' AND [Name] = 'rootCauseDescription' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'narrative' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=4 WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimAmount' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'stageId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=1 , [fieldorder]=16 WHERE [FieldType] = 'STANDARD' AND [Name] = 'exchangeRate' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=23 WHERE [FieldType] = 'STANDARD' AND [Name] = 'lastModifiedDate' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=20 WHERE [FieldType] = 'STANDARD' AND [Name] = 'createdBy' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=22 WHERE [FieldType] = 'STANDARD' AND [Name] = 'lastModifiedBy' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0 ,  [showingrid]=1 , [fieldorder]=21 WHERE [FieldType] = 'STANDARD' AND [Name] = 'createdDate' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=1 ,  [showingrid]=0 , [fieldorder]=null WHERE [FieldType] = 'STANDARD' AND [Name] = 'rootCauseId' AND ObjectId = @ClaimObjectId
