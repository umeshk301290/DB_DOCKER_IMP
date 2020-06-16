--Claims Cargill Data Insertion Scripts
    

--INSERT CLAIM FIELDS NiteshJindal: CS-1899

DECLARE @ClaimObjectId UNIQUEIDENTIFIER
SELECT 
	@ClaimObjectId = Id 
FROM [dbo].[Object] 
WHERE name = 'Claim'

DECLARE @CreatedDate datetime
SET @CreatedDate = CURRENT_TIMESTAMP

DECLARE @TextDataType UNIQUEIDENTIFIER
SELECT 
	@TextDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Text'

DECLARE @DateDataType UNIQUEIDENTIFIER
SELECT 
	@DateDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Date Picker (single)'

DECLARE @NumberDataType UNIQUEIDENTIFIER
SELECT 
	@NumberDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Number'


DECLARE @DropDownDataType UNIQUEIDENTIFIER
SELECT 
	@DropDownDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Dropdown (single selection)'

INSERT INTO [dbo].[ObjectField]([Id],[Name],[FieldType],[DefaultValue],[IsRequired],[ObjectId],[ObjectFieldTypeId],[CreatedBy],[CreatedDate],[IsForeignKey])
VALUES
('0b1f616c-eff5-11e9-81b4-2a2ae2dbcce4', 'id', 'STANDARD', '', 1, @ClaimObjectId, @NumberDataType, 'Prgx', @CreatedDate,0),
('0b1f65f4-eff5-11e9-81b4-2a2ae2dbcce4', 'claimAmount', 'STANDARD', '', 1, @ClaimObjectId, @NumberDataType, 'Prgx', @CreatedDate,0),
('0b1f6770-eff5-11e9-81b4-2a2ae2dbcce4', 'claimCurrency', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,1),
('0b1f6a68-eff5-11e9-81b4-2a2ae2dbcce4', 'claimNumber', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f6ba8-eff5-11e9-81b4-2a2ae2dbcce4', 'clientClaimNumber', 'STANDARD', '', 0, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f6cd4-eff5-11e9-81b4-2a2ae2dbcce4', 'disposition', 'STANDARD', '', 0, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f7076-eff5-11e9-81b4-2a2ae2dbcce4', 'dispositionId', 'STANDARD', '', 0, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,0),
('0b1f71ac-eff5-11e9-81b4-2a2ae2dbcce4', 'netClaimAmount', 'STANDARD', '', 1, @ClaimObjectId, @NumberDataType, 'Prgx', @CreatedDate,0),
('0b1f72ce-eff5-11e9-81b4-2a2ae2dbcce4', 'stage', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f73fa-eff5-11e9-81b4-2a2ae2dbcce4', 'stageId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,0),
('0b1f7526-eff5-11e9-81b4-2a2ae2dbcce4', 'status', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f79c2-eff5-11e9-81b4-2a2ae2dbcce4', 'statusId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,0),
('0b1f7b48-eff5-11e9-81b4-2a2ae2dbcce4', 'vendorName', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f7c7e-eff5-11e9-81b4-2a2ae2dbcce4', 'vendorNumber', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f7daa-eff5-11e9-81b4-2a2ae2dbcce4', 'vendorId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,1),
('0b1f7ed6-eff5-11e9-81b4-2a2ae2dbcce4', 'rootCauseDescription', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f8214-eff5-11e9-81b4-2a2ae2dbcce4', 'businessUnit', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f85de-eff5-11e9-81b4-2a2ae2dbcce4', 'narrative', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f9416-eff5-11e9-81b4-2a2ae2dbcce4', 'problemType', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f95a6-eff5-11e9-81b4-2a2ae2dbcce4', 'problemTypeId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,0),
('0b1f93a1-eff5-11e9-81b4-2a2ae2dbcce4', 'auditName', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f96a1-eff5-11e9-81b4-2a2ae2dbcce4', 'auditProject', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('0b1f96d2-eff5-11e9-81b4-2a2ae2dbcce4', 'projectId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate,1),
('0b1f97fe-eff5-11e9-81b4-2a2ae2dbcce4', 'exchangeRate', 'STANDARD', '', 0, @ClaimObjectId, @NumberDataType, 'Prgx', @CreatedDate,0),
('0b1f992a-eff5-11e9-81b4-2a2ae2dbcce4', 'claimDate', 'STANDARD', '', 1, @ClaimObjectId, @DateDataType, 'Prgx', @CreatedDate,0),
('3c30a69e-f59a-11e9-802a-5aa538984bd8', 'createdDate', 'STANDARD', '', 1, @ClaimObjectId, @DateDataType, 'Prgx', @CreatedDate,0),
('3c30a90a-f59a-11e9-802a-5aa538984bd8', 'lastModifiedDate', 'STANDARD', '', 0, @ClaimObjectId, @DateDataType, 'Prgx', @CreatedDate,0),
('3c30aa5e-f59a-11e9-802a-5aa538984bd8', 'createdBy', 'STANDARD', '', 1, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0),
('3c30ab94-f59a-11e9-802a-5aa538984bd8', 'lastModifiedBy', 'STANDARD', '', 0, @ClaimObjectId, @TextDataType, 'Prgx', @CreatedDate,0)

DECLARE @StageIDField UNIQUEIDENTIFIER
SELECT 
	@StageIDField = Id 
FROM [dbo].[ObjectField] 
WHERE name = 'stageId'

DECLARE @DispositionIDField UNIQUEIDENTIFIER
SELECT 
	@DispositionIDField = Id 
FROM [dbo].[ObjectField] 
WHERE name = 'dispositionId'

DECLARE @StatusIDField UNIQUEIDENTIFIER
SELECT 
	@StatusIDField = Id 
FROM [dbo].[ObjectField] 
WHERE name = 'statusId'

DECLARE @ProblemTypeIdField UNIQUEIDENTIFIER
SELECT 
	@ProblemTypeIdField = Id 
FROM [dbo].[ObjectField] 
WHERE name = 'problemTypeId'

INSERT INTO [dbo].[ObjectFieldValue]([Id], [Value], [ValueOrder], [ObjectFieldId])
VALUES
('cfab488e-f00e-11e9-81b4-2a2ae2dbcce4', 'Potential', 1, @StageIDField),
('cfab4b9a-f00e-11e9-81b4-2a2ae2dbcce4', 'Client', 2, @StageIDField),
('cfab4d20-f00e-11e9-81b4-2a2ae2dbcce4', 'Vendor', 3, @StageIDField),
('cfab4ed8-f00e-11e9-81b4-2a2ae2dbcce4', 'Posting', 4, @StageIDField),
('cfab505e-f00e-11e9-81b4-2a2ae2dbcce4', 'Invoice', 5, @StageIDField)

INSERT INTO [dbo].[ObjectFieldValue]([Id], [Value], [ValueOrder], [ObjectFieldId])
VALUES
('cfab5298-f00e-11e9-81b4-2a2ae2dbcce4', 'In Process', 1, @DispositionIDField),
('cfab545a-f00e-11e9-81b4-2a2ae2dbcce4', 'Approved', 2, @DispositionIDField),
('cfab5608-f00e-11e9-81b4-2a2ae2dbcce4', 'Rejected', 3, @DispositionIDField),
('cfab573e-f00e-11e9-81b4-2a2ae2dbcce4', 'Paid', 4, @DispositionIDField),
('cfab5900-f00e-11e9-81b4-2a2ae2dbcce4', 'Non Collectible', 5, @DispositionIDField)

INSERT INTO [dbo].[ObjectFieldValue]([Id], [Value], [ValueOrder], [ObjectFieldId])
VALUES
('cfab5b12-f00e-11e9-81b4-2a2ae2dbcce4', 'Draft', 1, @StatusIDField),
('cfab5c52-f00e-11e9-81b4-2a2ae2dbcce4', 'In Review', 2, @StatusIDField),
('cfab5e3c-f00e-11e9-81b4-2a2ae2dbcce4', 'Approved', 3, @StatusIDField),
('cfab6094-f00e-11e9-81b4-2a2ae2dbcce4', 'Corrections', 4, @StatusIDField),
('cfab6260-f00e-11e9-81b4-2a2ae2dbcce4', 'Rejected', 5, @StatusIDField),
('cfab640e-f00e-11e9-81b4-2a2ae2dbcce4', 'Pending Delivery', 6, @StatusIDField),
('cfab65ee-f00e-11e9-81b4-2a2ae2dbcce4', 'Disputed', 7, @StatusIDField),
('cfab6788-f00e-11e9-81b4-2a2ae2dbcce4', 'Research', 8, @StatusIDField),
('cfab6936-f00e-11e9-81b4-2a2ae2dbcce4', 'Blocking', 9, @StatusIDField),
('cfab6b02-f00e-11e9-81b4-2a2ae2dbcce4', 'Bankruptcy', 10, @StatusIDField),
('cfab6c88-f00e-11e9-81b4-2a2ae2dbcce4', 'Void', 11, @StatusIDField),
('cfab6f44-f00e-11e9-81b4-2a2ae2dbcce4', 'Perm Hold', 12, @StatusIDField),
('cfab7124-f00e-11e9-81b4-2a2ae2dbcce4', 'Debit Balance', 13, @StatusIDField),
('cfab7304-f00e-11e9-81b4-2a2ae2dbcce4', 'Submitted', 14, @StatusIDField),
('cfab74a8-f00e-11e9-81b4-2a2ae2dbcce4', 'Posted', 15, @StatusIDField),
('cfab762e-f00e-11e9-81b4-2a2ae2dbcce4', 'Hold', 16, @StatusIDField),
('cfab778c-f00e-11e9-81b4-2a2ae2dbcce4', 'Prepare', 17, @StatusIDField),
('cfab793a-f00e-11e9-81b4-2a2ae2dbcce4', 'Invoiced', 18, @StatusIDField),
('cfab7aac-f00e-11e9-81b4-2a2ae2dbcce4', 'Paid', 19, @StatusIDField)

INSERT INTO [dbo].[ObjectFieldValue]([Id], [Value], [ValueOrder], [ObjectFieldId])
VALUES
('cfab7c50-f00e-11e9-81b4-2a2ae2dbcce4', 'Duplicates', 1, @ProblemTypeIdField),
('cfab7de0-f00e-11e9-81b4-2a2ae2dbcce4', 'Credits', 2, @ProblemTypeIdField)

-- SahilAggarwal:insert-PS-9026

INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('7f553630-f3ea-11e9-81b4-2a2ae2dbcce4', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Relational (single selection)'),
	('7f553932-f3ea-11e9-81b4-2a2ae2dbcce4', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Relational (multi selection)')
	

/* 
PS-10049 VarunMehta
for already present STANDARD fields set update [DisplayName] 
*/ 
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'id'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Claim amount'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimAmount'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Claim currency'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimCurrency'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Claim number'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimNumber'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Client claim number'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'clientClaimNumber'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Disposition'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'disposition'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Disposition ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'dispositionId'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Net claim amount'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'netClaimAmount'
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Stage'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'stage'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Stage ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'stageId'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Status'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'status'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Status ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'statusId'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Vendor name'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorName'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Vendor number'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorNumber'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Vendor ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'vendorId'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Root cause description'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'rootCauseDescription' 
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Business unit'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'businessUnit'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Narrative'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'narrative'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Problem type'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'problemType'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Problem type ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'problemTypeID' 
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Audit name'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'auditName'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Audit project'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'auditProject'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Project ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'projectId'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Exchange rate'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'exchangeRate'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Claim date'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'claimDate'  
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Root cause ID'  WHERE [FieldType] = 'STANDARD' AND [Name] = 'rootCauseID' 
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Created date'  WHERE [FieldType] = 'STANDARD' AND [Name] =  'createdDate';
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Last modified date'  WHERE [FieldType] = 'STANDARD' AND [Name] =  'lastModifiedDate';
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Created by'  WHERE [FieldType] = 'STANDARD' AND [Name] =  'createdBy';
UPDATE [Dbo].[ObjectField] SET [DisplayName] =  'Last modified by'  WHERE [FieldType] = 'STANDARD' AND [Name] =  'lastModifiedBy';

/* for already present CUSTOM fields set [DisplayName]=[Name] field value */ 
UPDATE [dbo].[ObjectField] SET [DisplayName] = [Name] WHERE [FieldType] = 'CUSTOM'
