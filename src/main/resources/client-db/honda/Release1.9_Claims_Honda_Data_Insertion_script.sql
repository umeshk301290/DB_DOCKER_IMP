--changeset NiteshJindal:Insert-CS-1114
declare @objectFieldId varchar(255)
declare @objectFieName varchar(255)
declare @workflowId varchar(255)

select @workflowId=id from workflow where name  = 'Vendor Only'

set @objectFieName = 'stageId'
select @objectFieldId=id from objectfield where name =@objectFieName

--inserts for workflowaction
declare @wfstagevendorid varchar(50)
declare @wfstageinvoiceid varchar(50)
declare @wfstagepostingid varchar(50)
declare @wfstageid varchar(50)

declare @userName varchar(4)
declare @createdDate datetime2

set @userName= 'Prgx'
set @createdDate = CURRENT_TIMESTAMP

select @wfstagevendorid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Vendor' and WfStage.workflowid=@workflowid
select @wfstageinvoiceid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Invoice' and WfStage.workflowid=@workflowid
select @wfstagepostingid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Posting' and WfStage.workflowid=@workflowid


INSERT INTO [dbo].[workflowaction]
           ([wfstageid],[useraction],[camundaaction],[wfostatus],[createdby],[createddate],[lastmodifiedby],[lastmodifieddate], [deleted])
     VALUES
           (@wfstagevendorid, 'approve', 'approve', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagevendorid, 'reject', 'reject', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagevendorid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagevendorid, 'edit', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'approve', 'approve', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'reject', 'reject', 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'edit', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagepostingid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstageinvoiceid, 'adjust-status', NULL, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0)

--inserts into workflowStatus
--Service Line
declare @servicelineid varchar(50)


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


-- Need to set this explicitly in databases
select @servicelineid=[ServiceLineId] from [HONDA_NORTH_AMERICA_Audit].[dbo].[ServiceLine] where [ServiceLineName]='Retail'


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
	 (@wfstagevendorid, @servicelineid, @statusinreview, @dispositioninprocess, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statusdisputed, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statusresearch, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statusblocking, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statusbankruptcy, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statusvoid, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagevendorid, @servicelineid, @statuspermhold, @dispositionnoncollectible, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstageinvoiceid, @servicelineid, @statusinvoiced, @dispositionapproved, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusposted, @dispositionapproved, 1, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statushold, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statussubmitted, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusinreview, @dispositionapproved, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS'),
	 (@wfstagepostingid, @servicelineid, @statusdisputed, @dispositioninprocess, 0, @userName, @createdDate, @userName, @createdDate, 0, 'IN_PROGRESS')
--rollback Delete from [dbo].[WorkFlowStatus] where wfStageId =@wfstagevendorid
--rollback Delete from [dbo].[WorkFlowStatus] where wfStageId =@wfstageinvoiceid
--rollback Delete from [dbo].[WorkFlowStatus] where wfStageId =@wfstagepostingid

--rollback Delete from [dbo].[workflowaction] where wfstageid =@wfstagevendorid
--rollback Delete from [dbo].[workflowaction] where wfstageid =@wfstageinvoiceid
--rollback Delete from [dbo].[workflowaction] where wfstageid =@wfstagepostingid


--changeset UmeshKumar:Insert-CS-3309
-- insert command for  ObjectFieldServiceLine table for inserting the data for Accounts Payable service line. It will insert only if the data is not existing for the same service line and objectfield 
insert into [dbo].[ObjectFieldServiceLine] 
select 'd82141a8-82bd-47a9-8896-feebb67be2c1',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable'),'Duplicate Payment','Problem Type',1,0,'0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4');

-- insert command for  ObjectFieldServiceLine table for inserting the data for Contract Complaince service line. It will insert only if the data is not existing for the same service line and objectfield 

insert into [dbo].[ObjectFieldServiceLine] 
select '4E0134F1-7520-415B-A1CA-31905BD396BA',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance'),'Duplicate Payment','Problem Type',1,0,'0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4');

-- insert command for  ObjectFieldServiceLine table for inserting the data for Retail service line. It will insert only if the data is not existing for the same service line and objectfield 

insert into [dbo].[ObjectFieldServiceLine] 
select '73D713FB-E44B-4DE1-BBFC-6FB09BEF2D0C',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail'),'Duplicate Payment','Problem Type',1,0,'0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Accounts Payable service line. It will insert only if the data is not existing for the same service line and objectfieldvalueid 

insert into [dbo].[ObjectFieldServiceLineValue] 
select '9e025dba-5aaf-494c-a092-5aae28e1fdc5',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4'),'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4') and ObjectFieldValueId = 'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Retail service line. It will insert only if the data is not existing for the same service line and objectfieldvalueid 

insert into [dbo].[ObjectFieldServiceLineValue] 
select '01ce3aa6-df15-44b7-b087-3c4c02b358a7',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4'),'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4') and ObjectFieldValueId = 'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Contract Complaince service line. It will insert only if the data is not existing for the same service line and objectfieldvalueid 
insert into [dbo].[ObjectFieldServiceLineValue] 
select 'c8137e0f-d305-4128-b88e-a1b6903542e4',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4'),'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4') and ObjectFieldValueId = 'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4');



-- update command to set the default value for problem type for Contract Compliance service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Duplicate Payment' 
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4';


-- update command to set the default value for problem type for  Retail service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Duplicate Payment' 
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4';

-- update command to set the default value for problem type for Accounts Payable service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Duplicate Payment' 
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and ObjectFieldId = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4';

-- insert command for  ObjectFieldServiceLine table for inserting the data for Retail service line. It will insert only if the data is not existing for the same service line and objectfield

insert into [dbo].[ObjectFieldServiceLine] 
select '88ac1916-2f80-4f16-ab8c-530172d02403',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail'),'Key punch error','Root Cause',1,0,'04DB3078-72F9-44A7-8DA1-EF5E84887F19','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19');

-- insert command for  ObjectFieldServiceLine table for inserting the data for Accounts Payable service line. It will insert only if the data is not existing for the same service line and objectfield

insert into [dbo].[ObjectFieldServiceLine] 
select 'bbcdfe57-d53b-495a-b6bd-32ddb80af0ed',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable'),'Key punch error','Root Cause',1,0,'04DB3078-72F9-44A7-8DA1-EF5E84887F19','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19');

-- insert command for  ObjectFieldServiceLine table for inserting the data for Contract Complaince service line. It will insert only if the data is not existing for the same service line and objectfield
insert into [dbo].[ObjectFieldServiceLine] 
select '1265217b-f450-46d2-9d96-5d4c9bc4a747',(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance'),'Key punch error','Root Cause',1,0,'04DB3078-72F9-44A7-8DA1-EF5E84887F19','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,1,0
where not exists ( select 1 from objectfieldserviceline where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Accounts Payable service line. It will insert only if the data is not existing for the same service line and objectfieldvalueid
insert into [dbo].[ObjectFieldServiceLineValue] 
select '856acbb3-9a33-463b-a5d5-241bc78ced24',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19'),'A2C698B6-B789-468E-A743-7E6C726CD6EF'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19') and ObjectFieldValueId = 'A2C698B6-B789-468E-A743-7E6C726CD6EF');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Contract Complaince line. It will insert only if the data is not existing for the same service line and objectfieldvalueid

insert into [dbo].[ObjectFieldServiceLineValue] 
select '823909c4-58e6-413b-94d3-1edb038931c5',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19'),'A2C698B6-B789-468E-A743-7E6C726CD6EF'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19') and ObjectFieldValueId = 'A2C698B6-B789-468E-A743-7E6C726CD6EF');

-- insert command for  ObjectFieldServiceLineValue table for inserting the data for Retail service line. It will insert only if the data is not existing for the same service line and objectfieldvalueid

insert into [dbo].[ObjectFieldServiceLineValue] 
select 'a684f9c6-d079-4745-afe4-13b6b31dbb69',1,(select Id from objectfieldserviceline where ServiceLineId = (select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19'),'A2C698B6-B789-468E-A743-7E6C726CD6EF'
where not exists ( select 1 from objectfieldservicelinevalue  where objectfieldServiceLineId =
(select Id from objectfieldserviceline where ServiceLineId=(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19') and ObjectFieldValueId = 'A2C698B6-B789-468E-A743-7E6C726CD6EF');

-- update command to set the default value for problem sub type for Accounts Payable service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Key punch error'
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Accounts Payable') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19';

-- update command to set the default value for problem sub type for Contract Complaince service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Key punch error' 
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Contract Compliance') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19';

-- update command to set the default value for problem sub type for Retail service line

update  [dbo].[ObjectFieldServiceLine] set DefaultValue = 'Key punch error' 
 where ServiceLineId =
(select servicelineid from [HONDA_NORTH_AMERICA_Audit].[dbo].[serviceline] where servicelinename = 'Retail') and ObjectFieldId = '04DB3078-72F9-44A7-8DA1-EF5E84887F19';

--rollback SELECT 1 WHERE 1=0;


