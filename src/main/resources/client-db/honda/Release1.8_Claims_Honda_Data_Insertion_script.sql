--Update in ObjectField 

DECLARE @ClaimObjectId UNIQUEIDENTIFIER
SELECT 
	@ClaimObjectId = Id 
FROM [dbo].[Object] 
WHERE name = 'Claim'

UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'dispositionId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'statusId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'disposition' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'status' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'stageId' AND ObjectId = @ClaimObjectId
UPDATE [Dbo].[ObjectField] SET [showinui]=0  WHERE [FieldType] = 'STANDARD' AND [Name] = 'stage' AND ObjectId = @ClaimObjectId


--MohitSharma:CS-1789-Create-Seed-data-Workflow-Action
declare @wfstageclientid varchar(50)
declare @wfstageinvoiceid varchar(50)
declare @wfstagepostingid varchar(50)
declare @wfstageid varchar(50)

declare @workflowid varchar(50)
declare @userName varchar(4)
declare @createdDate datetime2

set @userName= 'Prgx'
set @createdDate = CURRENT_TIMESTAMP

select @workflowid=id from Workflow where name='AP'

select @wfstageclientid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Client' and WfStage.workflowid=@workflowid
select @wfstageinvoiceid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Invoice' and WfStage.workflowid=@workflowid
select @wfstagepostingid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Posting' and WfStage.workflowid=@workflowid

INSERT INTO [dbo].[action] ([action]) VALUES ('approve'), ('reject'), ('adjust-status'), ('edit')

INSERT INTO [dbo].[workflowaction]
           ([wfstageid],[useraction],[camundaaction],[wfostatus],[createdby],[createddate],[lastmodifiedby],[lastmodifieddate], [deleted])
     VALUES
           (@wfstageclientid, 'approve', 'approve', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstageclientid, 'reject', 'reject', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstageclientid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstageclientid, 'edit', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'approve', 'approve', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'reject', 'reject', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'edit', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstageinvoiceid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0)



--MohitSharma:CS-1800Create-Seed-data
declare @userName varchar(4)
declare @createdDate datetime2

--Service Line
declare @servicelineid varchar(50)

-- Workflow stage
declare @wfstageclientid varchar(50)
declare @wfstageinvoiceid varchar(50)
declare @wfstagepostingid varchar(50)

-- Current status
declare @statusinreview varchar(50)
declare @statusdisputed varchar(50)
declare @statusrejected varchar(50)
declare @statusresearch varchar(50)
declare @statusposted varchar(50)
declare @statusblocking varchar(50)
declare @statusbankruptcy varchar(50)
declare @statusvoid varchar(50)
declare @statuspermhold varchar(50)
declare @statussubmitted varchar(50)
declare @statushold varchar(50)
declare @statusinvoiced varchar(50)


-- Disposition status
declare @dispositioninprocess varchar(50)
declare @dispositionrejected varchar(50)
declare @dispositionapproved varchar(50)
declare @dispositionnoncollectible varchar(50)

set @userName= 'Prgx'
set @createdDate = CURRENT_TIMESTAMP

-- Need to set this explicitly in databases
select @servicelineid=[ServiceLineId] from [HONDA_NORTH_AMERICA_Audit].[dbo].[ServiceLine] where [ServiceLineName]='AP'


select @wfstageclientid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Client' and wfstage.workflowid=@workflowid
select @wfstageinvoiceid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Invoice' and wfstage.workflowid=@workflowid
select @wfstagepostingid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Posting' and wfstage.workflowid=@workflowid


select @statusinreview=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='In Review'
select @statusdisputed=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Disputed'
select @statusrejected=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Rejected'
select @statusresearch=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Research'
select @statusposted=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Posted'
select @statusblocking=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Blocking'
select @statusbankruptcy=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Bankruptcy'
select @statusvoid=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Void'
select @statuspermhold=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Perm Hold'
select @statussubmitted=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Submitted'
select @statushold=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Hold'
select @statusinvoiced=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='statusId' and ov.value='Invoiced'


select @dispositioninprocess=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='dispositionId' and ov.Value='In Process'
select @dispositionrejected=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='dispositionId' and ov.Value='Rejected'
select @dispositionapproved=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='dispositionId' and ov.Value='Approved'
select @dispositionnoncollectible=ov.id from objectfield o,objectfieldvalue ov  where o.id=ov.objectfieldid and o.Name='dispositionId' and ov.Value='Non Collectible'


INSERT INTO [dbo].[WorkFlowStatus]
([wfStageId],[serviceLine],[status],[dispositionStatus],[defaultStatus],
[createdBy],[createdDate],[lastModifiedBy],[lastModifiedDate],[deleted],[WfoStatus])
     VALUES
	 (@wfstageclientid, @servicelineid, @statusinreview, @dispositioninprocess, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statusdisputed, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statusresearch, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statusblocking, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statusbankruptcy, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statusvoid, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageclientid, @servicelineid, @statuspermhold, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageinvoiceid, @servicelineid, @statusinvoiced, @dispositionapproved, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusposted, @dispositionapproved, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statushold, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statussubmitted, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusinreview, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusdisputed, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS')


