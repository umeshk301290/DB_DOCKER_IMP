--Execute on MSSQL server, database Sobeys_Claims

--Claims Honda Data insertion scripts

-- NiteshJindal: PS-7203

DECLARE @CreatedDate datetime
SET @CreatedDate = CURRENT_TIMESTAMP


--INSERT IN Object

INSERT INTO dbo.Object(id, createdby, createddate, lastmodifiedby, lastmodifieddate, name)
					VALUES('db9499cc-e872-49d0-beb6-30f99beb63fc', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, 'Claim')


--INSERT IN ObjectFieldType

INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('f3c88b5a-013c-45c8-b7ba-0af9f3718d63', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Text')

INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('01461321-fe6d-4f62-b1fd-f84d57ee6cdc', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Text Area')
	
INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('8af646e2-cff3-4738-bb2e-2f380affc343', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Number')
	
INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('b9135ee8-c833-42cf-b007-ee772582a5c4', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Date Picker (single)')
	
INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('246bcac2-e95e-4f91-a340-7b3651cbe58a', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Date Picker (range)')
	
INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('0871ab31-a0a7-4f74-a32d-2706c38a172e', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Dropdown (single selection)')
	
INSERT INTO dbo.ObjectFieldType(id, createdby, createddate, lastmodifiedby, lastmodifieddate, inactivedate, name)
	VALUES ('25677c42-ae07-4afb-b5f8-37dcf894add3', 'Prgx', @CreatedDate, 'Prgx', @CreatedDate, null, 'Dropdown (multi selection)')
	

 --INSERT IN ObjectField Claim

DECLARE @ClaimObjectId UNIQUEIDENTIFIER
SELECT 
	@ClaimObjectId = Id 
FROM [dbo].[Object] 
WHERE name = 'Claim'

DECLARE @DropDownDataType UNIQUEIDENTIFIER
SELECT 
	@DropDownDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Dropdown (single selection)'

INSERT INTO [dbo].[ObjectField]([Id],[Name],[FieldType],[DefaultValue],[IsRequired],[ObjectId],[ObjectFieldTypeId],[CreatedBy],[CreatedDate])
     VALUES('04db3078-72f9-44a7-8da1-ef5e84887f19', 'rootCauseId', 'STANDARD', '', 1, @ClaimObjectId, @DropDownDataType, 'Prgx', @CreatedDate)


--INSERT IN ObjectFieldValue RootCause

DECLARE @RootCauseFieldId UNIQUEIDENTIFIER
SELECT 
              @RootCauseFieldId = Id 
FROM [dbo].[ObjectField] 
WHERE name = 'rootCauseId'

INSERT INTO [dbo].[ObjectFieldValue]([Id], [Value], [ValueOrder], [ObjectFieldId])
     VALUES ('66570db3-491d-4272-924c-c4b4953095bd', 'Credit Card and ERP', 1, @RootCauseFieldId),
            ('bc0158c8-ff9e-467a-9a11-b2a5201227a8', 'Different ERP Methods', 2, @RootCauseFieldId),
            ('221f8a94-ac70-4d5e-8f2e-83dc25a63781', 'Duplicate Company Codes', 3, @RootCauseFieldId),
            ('2ac2600b-607c-488b-a280-d2cadc44e4b0', 'Duplicate Plant Codes', 4, @RootCauseFieldId),
            ('d288ee8b-a869-476b-b261-415a2ca3aa8f', 'Duplicate Source Documents', 5, @RootCauseFieldId),
            ('cc28c90f-b3eb-4bd4-b2f8-7df8a3caaf95', 'ERS', 6, @RootCauseFieldId),
            ('73c339d4-4ba4-4f25-9814-f0e0682d0882', 'Inventory Vendor - No PO', 7, @RootCauseFieldId),
            ('def6a75f-acd6-42ad-8810-7cdc8669cc91', 'Invoice Amount Error', 8, @RootCauseFieldId),
            ('108950bc-dc70-4a8c-aca6-9a967b5f3fb3', 'Invoice Date Error', 9, @RootCauseFieldId),
            ('5e2b6cc0-9701-408b-9df2-b4e7a5596628', 'Invoice Number Error', 10, @RootCauseFieldId),
            ('2ffbdd14-821c-4dc8-aeab-f06f7cca7779', 'Invoiced Twice', 11, @RootCauseFieldId),
            ('a2c698b6-b789-468e-a743-7e6c726cd6ef', 'Keypunch Error', 12, @RootCauseFieldId),
            ('4ef5c2c0-e2c4-4b16-ad83-eb9803f96d05', 'Multiple Vendor Numbers', 13, @RootCauseFieldId),
            ('fcd11fbf-a7af-4daf-ad18-e361f61603e2', 'None', 14, @RootCauseFieldId),
            ('e2c11c96-f780-4d5c-8d3d-2f80ab150054', 'Other', 15, @RootCauseFieldId),
            ('73a12738-357b-49c4-99fb-1a435bc53a38', 'Paid Credited Invoice', 16, @RootCauseFieldId),
            ('2dd1c9f0-0409-4f4d-9508-e59ee9897e63', 'Paid Invoice and Statement', 17, @RootCauseFieldId),
            ('c9bc937d-b6c9-479e-bc58-519501938e2f', 'Paid Original & Revised Invoices', 18, @RootCauseFieldId),
            ('6a451c29-5a66-4b69-9acd-438ce1d1300d', 'Paid to Wrong Vendor', 19, @RootCauseFieldId),
            ('7825cb1b-ddde-4f70-95ae-b261bf566208', 'Pro Forma Invoice', 20, @RootCauseFieldId),
            ('75634bf2-ca5a-46ab-b02e-7f6525527e07', 'Separate Pay Entities', 21, @RootCauseFieldId),
            ('534a9f34-baa3-4fb2-8ad8-10b9b645d0e9', 'Supply Chain Management Duplicate', 22, @RootCauseFieldId),
            ('7354a012-4e74-4b34-9290-5ee419cbc21d', 'System Override', 23, @RootCauseFieldId),
            ('898b59db-5a8f-4f7b-b9d5-02cac3fec221', 'Voided Check Cleared', 24, @RootCauseFieldId)
                                           
