--liquibase formatted sql

--changeset nITESHjINDAL:UPDATE-PS-10866

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

--rollback SELECT 1 WHERE 1=0;

--changeset NiteshJindal:UPDATE-PS-10866-1

DECLARE @ClaimObjectId UNIQUEIDENTIFIER
SELECT 
	@ClaimObjectId = Id 
FROM [dbo].[Object] 
WHERE name = 'Claim'

UPDATE [Dbo].[ObjectField] SET [isRequired]=0 WHERE [FieldType] = 'STANDARD' AND [Name] = 'narrative' AND ObjectId = @ClaimObjectId
--rollback SELECT 1 WHERE 1=0;

--changeset NitinYadav:UPDATE-CS-1899

UPDATE objectfield SET DisplayName= 'ClaimDescription' WHERE name = 'narrative'

DECLARE @NumberDataType UNIQUEIDENTIFIER
SELECT 
	@NumberDataType = Id 
FROM [dbo].[ObjectFieldType] 
WHERE name = 'Number'
SELECT @NumberDataType

UPDATE ObjectField SET ObjectFieldTypeId = @NumberDataType WHERE [Name] = 'claimAmount'

--rollback SELECT 1 WHERE 1=0;

--changeset ShreyaMalhotra:ALTER-CS-2292

ALTER TABLE [dbo].[Claim] 
ADD [Source] VARCHAR(255) ;

ALTER TABLE [dbo].[Claim] 
ADD [SourceFieldValue] [varchar](max);

ALTER TABLE [dbo].[Claim] 
DROP COLUMN ClaimNumberPrefix;

ALTER TABLE [dbo].[Claim] 
DROP COLUMN MultipleValueField;

--rollback  ALTER TABLE [dbo].[Claim] ADD [MultipleValueField] VARCHAR(255);
--rollback  ALTER TABLE [dbo].[Claim] ADD [ClaimNumberPrefix] VARCHAR(255);
--rollback  ALTER TABLE [dbo].[Claim] DROP COLUMN SourceFieldValue;
--rollback  ALTER TABLE [dbo].[Claim] DROP COLUMN Source;
			
--changeset NitinYadav:Alter-PS-8483

EXEC sp_RENAME 'claim.JsonColumnName' , 'JsonValue', 'COLUMN';	

--rollback EXEC sp_RENAME 'claim.JsonValue' , 'JsonColumnName', 'COLUMN';

--changeset UmeshKumar:Create-PS-11510

CREATE TABLE [dbo].[Template](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[TemplateName] [varchar](50) NULL,
	[TemplateData] [nvarchar](max) NULL,
	[InactiveDate] [datetime2](7) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_Template] PRIMARY KEY CLUSTERED([Id] ASC)
)

--rollback DROP TABLE [dbo].[Template]

--changeset UmeshKumar:Alter-PS-11510-N1

alter table [dbo].[Template]
add ProjectId varchar(50)

--rollback alter table [dbo].[Template] drop ProjectId;

--changeset UmeshKumar:Alter-PS-11510-N2

CREATE FUNCTION [dbo].[UF_CountTemplate] (@name varchar(50), @projectId varchar(50))
RETURNS int
AS 
BEGIN
  DECLARE @retval int
    SELECT @retval =count(*)
    FROM [dbo].[Template]
    WHERE TemplateName = @name and ProjectId = @projectId and (InactiveDate > CURRENT_TIMESTAMP or InactiveDate is null)
  RETURN @retval
END;
GO

--rollback drop function [dbo].[UF_CountTemplate]

--changeset UmeshKumar:Alter-PS-11510-N3

alter table [dbo].[Template] 
add CONSTRAINT [CK_CountTemplate] CHECK  (([dbo].[UF_CountTemplate]([TemplateName],[ProjectId])<=(1)))

--rollback alter table [dbo].[Template] drop constraint [CK_CountTemplate]


--changeset UmeshKumar:Create-CS-1811

CREATE TABLE [dbo].[WorkFlowObject](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimId] [varchar](255) NULL,
	[ProcessInstanceId] [varchar](255) NULL,
	[WorkFlow] [varchar](255) NULL,
	[WorkFlowStatus] [varchar](255) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [UK_WorkFlowObject] UNIQUE (ClaimId,ProcessInstanceId,WorkFlow),
 CONSTRAINT [PK_WorkFlowObject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]

--rollback DROP TABLE [dbo].[WorkFlowObject]

--changeset MohitSharma:CS-1756
CREATE TABLE [dbo].[Workflow]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [name] [varchar](255) UNIQUE NOT NULL,
    [createdby] [varchar](255) NULL,
    [createddate] [datetime2](7) NULL,
    [lastmodifiedby] [varchar](255) NULL,
    [lastmodifieddate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    CONSTRAINT PK_workflow PRIMARY KEY (id)
); 
--rollback DROP TABLE [dbo].[Workflow]

INSERT INTO [dbo].[workflow] (name,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted)
	VALUES  ('AP','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0);

--rollbackDelete from [dbo].[Workflow] where name ='AP'

--chageset AmanKapoor:CS-3023
CREATE TABLE [dbo].[WfStage]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [workflowid] [bigint] NOT NULL,
	[objectfieldvalueid] UNIQUEIDENTIFIER NOT NULL,
    [createdby] [varchar](255) NULL,
    [createddate] [datetime2](7) NULL,
    [lastmodifiedby] [varchar](255) NULL,
    [lastmodifieddate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    CONSTRAINT pk_wfstage PRIMARY KEY (id),
	constraint fk_wfstage_workflow foreign key ([workflowid]) references workflow(id),
	constraint fk_wfstage_objectfieldvalue foreign key ([objectfieldvalueid]) references objectfieldvalue(id)
)

--rollback DROP TABLE [dbo].[WfStage]

--chageset MohitSharma:CS-1800
CREATE TABLE [dbo].[WorkFlowStatus]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [wfStageId] [bigint] NOT NULL,
	[serviceLine] [bigint] NULL,
	[status] UNIQUEIDENTIFIER NOT NULL,
	[dispositionStatus] UNIQUEIDENTIFIER NOT NULL,
	[defaultStatus] [bit] NOT NULL,
    [createdBy] [varchar](255) NULL,
    [createdDate] [datetime2](7) NULL,
    [lastModifiedBy] [varchar](255) NULL,
    [lastModifiedDate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    CONSTRAINT PK_workflowstatus PRIMARY KEY (id),
	CONSTRAINT fk_workflowstatus_workflowstage foreign key ([wfstageid]) references [dbo].[wfstage](id),
	constraint fk_wfstatus_objectfieldvalue foreign key ([status]) references objectfieldvalue(id),
	constraint fk_wfstatus_dispfieldvalue foreign key ([dispositionStatus]) references objectfieldvalue(id)
) 
--rollback DROP TABLE  [dbo].[WorkFlowStatus]

--changeset UmeshKumar:Create-CS-1811-1

sp_rename '[dbo].[WorkFlowObject].WorkFlow', 'WorkFlowId', 'COLUMN';

--rollback sp_rename '[dbo].[WorkFlowObject].WorkFlowId', 'WorkFlow', 'COLUMN';

--changeset UmeshKumar:Create-CS-1811-2

ALTER TABLE [dbo].[WorkFlowObject]
DROP CONSTRAINT UK_WorkFlowObject

--rollback ALTER TABLE [dbo].[WorkFlowObject] ADD CONSTRAINT [UK_WorkFlowObject] UNIQUE (ClaimId,ProcessInstanceId,WorkFlowId)

--changeset UmeshKumar:Create-CS-1811-3

ALTER TABLE [dbo].[WorkFlowObject]
ALTER COLUMN ClaimId [bigint];

--rollback ALTER TABLE [dbo].[WorkFlowObject] ALTER COLUMN claimId [varchar](255);

--changeset UmeshKumar:Create-CS-1811-4

ALTER TABLE [dbo].[WorkFlowObject]
ALTER COLUMN WorkFlowId [bigint];

--rollback ALTER TABLE [dbo].[WorkFlowObject] ALTER COLUMN WorkFlowId [varchar](255);

--changeset UmeshKumar:Create-CS-1811-5

ALTER TABLE [dbo].[WorkFlowObject]
ADD CONSTRAINT FK_WorkFlow
FOREIGN KEY (WorkFlowId) REFERENCES WorkFlow(Id);

--rollback ALTER TABLE [dbo].[WorkFlowObject] DROP CONSTRAINT FK_WorkFlow;

--changeset UmeshKumar:Create-CS-1811-6

ALTER TABLE [dbo].[WorkFlowObject]
ADD CONSTRAINT [UK_WorkFlowObject] UNIQUE (ClaimId,ProcessInstanceId,WorkFlowId)

--rollback ALTER TABLE [dbo].[WorkFlowObject] DROP CONSTRAINT UK_WorkFlowObject

--changeset AmanKapoor:CS-3023Insert
--Inserts for Workflow AP
declare @fieldValueid varchar(255)
declare @workflowName varchar(255)
declare @workflowId varchar(255)
declare @objectFieldId varchar(255)
declare @objectFieName varchar(255)
declare @fieldValueName varchar(255)

set @workflowName = 'AP'
select @workflowId=id from workflow where name  = @workflowName


set @objectFieName = 'stageId'
select @objectFieldId=id from objectfield where name =@objectFieName

set @fieldValueName = 'Invoice'
select  @fieldValueid=id from objectfieldvalue where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,objectfieldvalueid,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

set @fieldValueName = 'Client'
select @fieldValueid=id from objectfieldvalue where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,objectfieldvalueid,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

set @fieldValueName = 'Posting'
select @fieldValueid =id from objectfieldvalue  where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,objectfieldvalueid,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

--changeset MohitSharma:Change workflow stage column

EXEC sp_RENAME 'wfstage.objectfieldvalueid' , 'Workflowstage', 'COLUMN'

--changeset MohitSharma: Add workflow as foreign key for rules table

ALTER TABLE WorkflowRules ADD workflowid bigint

ALTER TABLE WorkflowRules ADD CONSTRAINT fk_workflowrules_workflow FOREIGN KEY(workflowid) REFERENCES workflow(id)

--changeset MohitSharma:CS-1789Create
CREATE TABLE [dbo].[action](
       [action] [varchar](50) UNIQUE NOT NULL
)

CREATE TABLE [dbo].[workflowaction](
       [id] [bigint] IDENTITY(1,1) NOT NULL,
       [wfstageid] [bigint] NOT NULL,
       [useraction] [varchar](50) NOT NULL,
       [camundaaction] [varchar](50) NOT NULL,
       [wfostatusid] [bigint] NOT NULL,
       [createdby] [varchar](255) NULL,
       [createddate] [datetime2](7) NULL,
       [lastmodifiedby] [varchar](255) NULL,
       [lastmodifieddate] [datetime2](7) NULL,
       [deleted] [bit] NULL,
       CONSTRAINT fk_workflowaction_action foreign key ([useraction]) references [dbo].[action](action),
       CONSTRAINT fk_workflowaction_workflowstage foreign key ([wfstageid]) references [dbo].[wfstage](id),
       CONSTRAINT fk_workflowaction_workflowstatus foreign key ([wfostatusid]) references [dbo].[WorkFlowStatus](id)
)

--rollback drop table [dbo].[action]
--rollback drop table [dbo].[workflowaction]

--changeset MohitSharma:CS-1789-Change-workflow-action-column

EXEC sp_RENAME 'workflowaction.wfostatusid' , 'wfostatus', 'COLUMN'

--rollback EXEC sp_RENAME 'wfstage.wfostatus' , 'wfostatusid', 'COLUMN'

--changeset MohitSharma:CS-1789-Drop-foriegn-key-constraint

ALTER TABLE [dbo].[workflowaction] DROP CONSTRAINT fk_workflowaction_workflowstatus

--rollback ALTER TABLE [dbo].[workflowaction] ADD CONSTRAINT fk_workflowaction_workflowstatus foreign key ([wfostatusid]) references [dbo].[WorkFlowStatus](id)

--changeset MohitSharma:CS-1789-Change-data-type

ALTER TABLE [dbo].[workflowaction] ALTER COLUMN [wfostatus] [varchar](255) NULL

--rollback ALTER TABLE [dbo].[workflowaction] ALTER COLUMN [wfostatus] [bigint]

--changeset MohitSharma:CS-1789-Add-COLUMN

ALTER TABLE [dbo].[workflowstatus] ADD [WfoStatus] VARCHAR(255) NULL

--rollback ALTER TABLE [dbo].[workflowstatus] DROP COLUMN [WfoStatus]

--changeset MohitSharma:CS-1789-Add-Unique-Constraint-1

ALTER TABLE [dbo].[workflowstatus] ADD CONSTRAINT unique_stage_serviceline_wfostatus_status UNIQUE(wfStageId, serviceLine, wfostatus, status)

--rollback ALTER TABLE [dbo].[workflowstatus] DROP CONSTRAINT unique_stage_serviceline_wfostatus_status

--changeset MohitSharma:CS-1789-Add-Unique-Constraint-2

ALTER TABLE [dbo].[workflowaction] ADD CONSTRAINT unique_stage_wfostatus_useraction UNIQUE(wfStageId, wfostatus, useraction)

--rollback ALTER TABLE [dbo].[workflowaction] DROP CONSTRAINT unique_stage_wfostatus_useraction

--changeset MohitSharma:Rename-tables-1

EXEC sp_rename 'workflowaction', 'WorkflowAction'

--rollback EXEC sp_rename 'WorkflowAction', 'workflowaction'

--changeset MohitSharma:Rename-tables-2

EXEC sp_rename 'WorkFlowObject', 'WorkflowObject'

--rollback EXEC sp_rename 'WorkflowObject', 'WorkFlowObject'

--changeset MohitSharma:Rename-tables-3

EXEC sp_rename 'WorkFlowStatus', 'WorkflowStatus'

--rollback EXEC sp_rename 'WorkflowStatus', 'WorkFlowStatus'

--changeset MohitSharma:CS-1789-Remove-Not-Null

ALTER TABLE [dbo].[workflowaction] ALTER COLUMN [camundaaction] VARCHAR(255) NULL

--rollback ALTER TABLE [dbo].[workflowaction] ALTER COLUMN [camundaaction] VARCHAR(255) NOT NULL

--changeset UmeshKumar:Alter-CS-2915

alter table  [dbo].[Template]
add TemplateType [varchar](255);

--rollback ALTER TABLE [dbo].[Template] DROP COLUMN TemplateType;

--changeset UmeshKumar:Alter-CS-2915-1

CREATE TABLE [dbo].[TemplateMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[TemplateType] [varchar](255) NULL,
	[MappingColumnLabel] [varchar](255) NULL,
	[MappingExceptionField] [varchar](255) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[Deleted] [bit] NULL,

	    CONSTRAINT [PK_TemplateMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)
) ON [PRIMARY]


--rollback DROP TABLE [dbo].[TemplateMapping];

--changeset MohitSharma:Add-Delete-To-ClaimWorkflowObject

ALTER TABLE [dbo].[WorkflowObject] ADD [Locked] BIT DEFAULT 0

-- rollback ALTER TABLE [dbo].[WorkflowObject] DROP COLUMN [Locked]

--changeset MohitSharma:Drop-column-Approval-Workflow

DECLARE @ConstraintName nvarchar(200)
SELECT @ConstraintName = Name FROM SYS.DEFAULT_CONSTRAINTS WHERE PARENT_OBJECT_ID = OBJECT_ID('WorkflowRules') AND PARENT_COLUMN_ID = (SELECT column_id FROM sys.columns WHERE NAME = 'ApprovalWorkflow' AND object_id = OBJECT_ID('WorkflowRules'))
IF @ConstraintName IS NOT NULL
EXEC('ALTER TABLE WorkflowRules DROP CONSTRAINT ' + @ConstraintName)
IF EXISTS (SELECT * FROM syscolumns WHERE id=object_id('VendorSelection') AND name='Deleted')
EXEC('ALTER TABLE WorkflowRules DROP COLUMN ApprovalWorkflow')

--rollback ALTER TABLE [WorkflowRules] ADD [ApprovalWorkflow] BIGINT NOT NULL DEFAULT 1

-- changeset Shreya:CS-3278
CREATE TABLE [dbo].[DocumentMetaData]
(
   [Id] uniqueidentifier PRIMARY KEY,
   [ProjectId] bigint NULL,
   [ProjectVendorId] bigint,
   [FileOrder] bigint,
   [ModuleId] bigint,
   [DocumentTypeId] bigint,
   [DocumentName] varchar(255) NOT NULL,
   [AliasFileName] varchar(255) NULL,
   [DocumentStatus] varchar(100),
   [Comment] varchar(4000),
   [ClaimPackage] bit DEFAULT 0,
   [ObjectId] varchar(255),
   [ObjectValueId] varchar(255),
   [Deleted] bit,
   [VisibilityLevel] int,
   [Code] varchar(64),
   [CreatedBy] varchar(255),
   [CreatedDate] [datetime2] (7) NULL,
   [LastModifiedBy] varchar(255),
   [LastModifiedDate] [datetime2] (7) NULL,
)

--rollback SELECT 1 WHERE 1=0;

--changeset GauravGulati:alter-PS-12210

ALTER TABLE [dbo].[Claim]
ALTER COLUMN JsonValue nvarchar(max)

--rollback ALTER TABLE [dbo].[Claim] ALTER COLUMN JsonValue varchar(max)

--changeset NiteshJindal:Insert-CS-1114

INSERT INTO [dbo].[workflow] (name,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted)
	VALUES  ('Vendor Only','Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0);

--rollback Delete from [dbo].[Workflow] where name ='Vendor Only'

--changeset NiteshJindal:Insert-CS-1114-2
declare @fieldValueid varchar(255)
declare @workflowName varchar(255)
declare @workflowId varchar(255)
declare @objectFieldId varchar(255)
declare @objectFieName varchar(255)
declare @fieldValueName varchar(255)

set @workflowName = 'Vendor Only'
select @workflowId=id from workflow where name  = @workflowName


set @objectFieName = 'stageId'
select @objectFieldId=id from objectfield where name =@objectFieName

set @fieldValueName = 'Vendor'
select @fieldValueid=id from objectfieldvalue where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

set @fieldValueName = 'Posting'
select @fieldValueid =id from objectfieldvalue  where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

set @fieldValueName = 'Invoice'
select  @fieldValueid=id from objectfieldvalue where value =@fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@workflowId,@fieldValueid,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

--rollback Delete from [dbo].[wfstage] where workflowid =@workflowId

-- changeset SourabhYadav:Alter-PS-15976-1
ALTER TABLE [dbo].[ObjectField]
ADD ParentObjectFieldID  uniqueidentifier

ALTER TABLE [dbo].[ObjectField]
ADD CONSTRAINT [FK_ObjectField_ParentObjectFieldID] FOREIGN KEY (ParentObjectFieldID) REFERENCES [dbo].[ObjectField] ([Id])


ALTER TABLE [dbo].[ObjectFieldValue]
ADD ParentObjectFieldValueID uniqueidentifier

ALTER TABLE [dbo].[ObjectFieldValue]
ADD CONSTRAINT [FK_ObjectFieldValue_ParentObjectFieldValueID] FOREIGN KEY (ParentObjectFieldValueID) REFERENCES [dbo].[ObjectFieldValue] ([Id])

--rollback ALTER TABLE [dbo].[ObjectField] DROP CONSTRAINT [FK_ObjectField_ParentObjectFieldID]
--rollback ALTER TABLE [dbo].[ObjectField] DROP COLUMN ParentObjectFieldID
--rollback ALTER TABLE [dbo].[ObjectFieldValue] DROP CONSTRAINT [FK_ObjectFieldValue_ParentObjectFieldValueID]
--rollback ALTER TABLE [dbo].[ObjectFieldValue] DROP COLUMN ParentObjectFieldValueID

--changeset ShreyaMalhotra:alter-CS-3333
ALTER TABLE [dbo].[Claim]
ADD TemplateId [bigint] NULL

--rollback ALTER TABLE [dbo].[Claim] DROP COLUMN TemplateId

--changeset AmanKapoor:CS-3255
Alter table ClaimFieldColumn add templateId Bigint
Alter table ClaimFieldColumn drop column  projectId


Alter table ClaimFieldSetting add templateId Bigint;
Alter table ClaimFieldSetting drop column  projectId ;

--rollback ALTER TABLE [dbo].[ClaimFieldSetting] DROP COLUMN TemplateId
--rollback ALTER TABLE [dbo].[ClaimFieldColumn] DROP COLUMN TemplateId
--rollback ALTER TABLE [dbo].[ClaimFieldSetting] add projectId Bigint;
--rollback ALTER TABLE [dbo].[ClaimFieldColumn] add projectId Bigint;



--changeset UmeshKumar:update-CS-3309

update [dbo].[objectfield] set DisplayName = 'Problem Type ID' where name = 'problemtypeid'
update [dbo].[objectfield] set DisplayName = 'Problem Type' where name = 'problemtype'
update [dbo].[objectfield] set DisplayName = 'Root Cause ID' , ParentObjectFieldID = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4' where name = 'rootCauseId'
update [dbo].[ObjectFieldValue] set value = 'Duplicate Payment' where value = 'Duplicates' and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4'
update [dbo].[ObjectFieldValue] set value = 'Key punch error' where objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19' and id ='A2C698B6-B789-468E-A743-7E6C726CD6EF'
update [dbo].[ObjectFieldValue] set value = 'Multi vendor number' where objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19' and id ='4EF5C2C0-E2C4-4B16-AD83-EB9803F96D05'
update [dbo].[ObjectFieldValue] set ParentObjectFieldValueID = 'CFAB7C50-F00E-11E9-81B4-2A2AE2DBCCE4' where id in ('A2C698B6-B789-468E-A743-7E6C726CD6EF','4EF5C2C0-E2C4-4B16-AD83-EB9803F96D05')


--rollback update [dbo].[objectfield] set DisplayName = 'Problem Type' where name = 'problemtypeid'
--rollback update [dbo].[objectfield] set DisplayName = 'Problem Type Desc' where name = 'problemtype'
--rollback update [dbo].[objectfield] set DisplayName = 'Root Cause' , ParentObjectFieldID = null where name = 'rootCauseId'
--rollback update [dbo].[ObjectFieldValue] set value = 'Duplicates' where value = 'Duplicate Payment' and objectfieldid = '0B1F95A6-EFF5-11E9-81B4-2A2AE2DBCCE4'
--rollback update [dbo].[ObjectFieldValue] set value = 'Keypunch error' where objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19' and id ='A2C698B6-B789-468E-A743-7E6C726CD6EF'
--rollback update [dbo].[ObjectFieldValue] set value = 'Multivendor number' where objectfieldid = '04DB3078-72F9-44A7-8DA1-EF5E84887F19' and id ='4EF5C2C0-E2C4-4B16-AD83-EB9803F96D05'
--rollback update [dbo].[ObjectFieldValue] set ParentObjectFieldValueID = null where id in ('A2C698B6-B789-468E-A743-7E6C726CD6EF','4EF5C2C0-E2C4-4B16-AD83-EB9803F96D05')


--changeset MohitSharma:CS-2139

CREATE TABLE ClaimAdjustments(
	[Id] [bigint] IDENTITY(1,1),
	[ClaimId] [bigint],
	[AdjustmentAmount] decimal (14,2),
	[AdjustmentTypeId] UNIQUEIDENTIFIER NOT NULL,
	[AdjustmentReasonId] UNIQUEIDENTIFIER NOT NULL,
	[AdjustmentNotes] [varchar](255),
    [CreatedBy] [varchar](255) NULL,
    [CreatedDate] [datetime2](7) NULL,
    [LastModifiedBy] [varchar](255) NULL,
    [LastModifiedDate] [datetime2](7) NULL,
    [Deleted] [bit] NULL,
	CONSTRAINT PK_ClaimAdjustments PRIMARY KEY CLUSTERED ([Id] asc)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_ClaimAdjustments_Claim FOREIGN KEY ([ClaimId]) REFERENCES [dbo].[claim]([id])
)

DECLARE @ClaimAdjustmentObjectUUID UNIQUEIDENTIFIER
DECLARE @TextFieldType UNIQUEIDENTIFIER
DECLARE @NumberFieldType UNIQUEIDENTIFIER
DECLARE @AdjustmentTypeId UNIQUEIDENTIFIER
DECLARE @AdjustmentReasonId UNIQUEIDENTIFIER

SET @ClaimAdjustmentObjectUUID = '0a94e316-ba52-44ec-b1e6-bdea987889e3'
SELECT @TextFieldType=id from ObjectFieldType where name = 'Text'
SELECT @NumberFieldType=id from ObjectFieldType where name = 'Number'
SET @AdjustmentTypeId = '4cef3888-3b40-4d47-a0ca-274aac5ee570'
SET @AdjustmentReasonId = 'a5940691-8259-4d16-ac9b-ccff4a006bf5'

INSERT INTO [dbo].[Object]
           ([Id],[Name],[CreatedBy],[CreatedDate],[LastModifiedBy],[LastModifiedDate])
		   VALUES
           (@ClaimAdjustmentObjectUUID,'ClaimAdjustments','prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP)


INSERT INTO [dbo].[ObjectField]
           ([Id],[Name],[FieldType],[DefaultValue],[IsRequired],[ObjectId],[ObjectFieldTypeId],[CreatedBy],[CreatedDate],[LastModifiedBy],[LastModifiedDate],[IsForeignKey],[Description],[DisplayName],[showinui],[showingrid],[fieldorder],[ParentObjectFieldID])
     VALUES
           ('c4686a94-0451-4868-b6dc-691803d53abe','ID','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,'Primary key','Adjustment ID',0,0,null,null),
		   ('dcb505f9-9770-4b38-960e-c6ea42c4ee7c','ClaimID','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,1,'Foreign key link to the claim','Claim',1,1,1,null),
		   ('607643e0-1c5a-45a1-8349-e5bdbec4e218','AdjustmentAmount','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,'Amount adjusted','Adjustment Amount',1,1,2,null),
		   (@AdjustmentTypeId,'AdjustmentTypeID','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@NumberFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,1,'Adjustment type','Adjustment Type',1,1,3,null),
		   (@AdjustmentReasonId,'AdjustmentReasonID','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@NumberFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,1,'Adjustment reason','Adjustment Type',1,1,4,null),
		   ('2b8634bf-312e-424e-80a9-f8c7bb98f41f','AdjustmentNotes','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,'Adjustment Notes','Adjustment notes',1,1,5,null),
		   ('b31ffa2f-96ed-42c5-944f-5d18157e1fa8','Deleted','STANDARD',null,0,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,'Deleted','Adjustment was deleted',0,0,null,null),
		   ('837cdcbe-6799-451f-a157-13444051bcbe','CreatedBy','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,null,'Created By',0,1,6,null),
		   ('938fe4a1-f763-4e90-95f1-350b87395948','CreatedDate','STANDARD',null,1,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,null,'Created Date',0,1,7,null),
		   ('058a50f1-7260-4dd9-9d7f-1919290267d8','ModifiedBy','STANDARD',null,0,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,null, 'Modified By',0,1,8,null),
		   ('98ef406a-36bb-46f3-8f5f-d96d0289187d','ModifiedDate','STANDARD',null,0,@ClaimAdjustmentObjectUUID,@TextFieldType,'prgx',CURRENT_TIMESTAMP,'prgx',CURRENT_TIMESTAMP,0,null,'Modified Date',0,1,9,null)

INSERT INTO [dbo].[ObjectFieldValue]
           ([Id],[Value],[ValueOrder],[ObjectFieldId],[ParentObjectFieldValueID])
     VALUES
           ('ddeb7193-a7f1-4fa5-8d97-7dfc55d9f3a9','OTHER',1,@AdjustmentTypeId,null),
		   ('5e682c86-06f8-4cf1-8c16-d61330b85687','CANCELLATION',2,@AdjustmentTypeId,null),
		   ('6f8beccc-5953-4cdd-98c9-38febc7d8db3','PAYBACK',3,@AdjustmentTypeId,null),
		   ('0b17411d-db1c-4351-8900-7523803b494a','POTENTIAL',4,@AdjustmentTypeId,null),
		   --Adjustment Reasons
		   ('33c5a4e4-ed8a-491e-a6ce-eb239d42a4e9','Data entry error',1,@AdjustmentReasonId,null),
		   ('bbd939e4-f849-4648-a061-42ac7a257eba','Vendor or client provided proof of incorrect amount',2,@AdjustmentReasonId,null),
		   ('21ef799b-5bd8-4149-84e5-6ceec6a0c7f1','Vendor applied invoice',3,@AdjustmentReasonId,null),
		   ('1c359c57-6a73-47c9-8d81-ee14cf0e5a0d','Bank fee for refunding',4,@AdjustmentReasonId,null),
		   ('77e8b500-4f4d-418f-b273-35af74b78dd3','Additional credit found which increases claim amount',5,@AdjustmentReasonId,null),
		   ('48df9867-f9b3-49f0-8efe-926c5593f20e','Settlement',6,@AdjustmentReasonId,null)

--rollback DROP TABLE ClaimAdjustments

-- changeset SourabhYadav:Alter-PS-18896-1
ALTER TABLE [dbo].[ObjectField] ADD [CurrencyConversionApplicable] [bit] DEFAULT 0 NOT NULL
ALTER TABLE [dbo].[ObjectField] ADD	[CurrencyConversionEnabled] [bit] DEFAULT 0
ALTER TABLE [dbo].[ObjectField] ADD	[ConvertedCurrencyDisplayName] [varchar](100) NULL

--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN CurrencyConversionApplicable;
--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN CurrencyConversionEnabled;
--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN ConvertedCurrencyDisplayName;

--changeset AmanKapoor:CS-2558
CREATE TABLE [dbo].[ClaimApproval]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [ClaimId] [bigint] NULL,
	[StageId] UNIQUEIDENTIFIER,
	[StatusId] UNIQUEIDENTIFIER,
	[StatusName] [varchar](255) NULL,
	[StageName] [varchar](255) NULL,
	[ApprovalNotes] [varchar](255) NULL,
	[ClaimWorkflowobjectId] bigint NULL,
    [createdby] [varchar](256) NULL,
    [createddate] [datetime2](7) NULL,
    [lastmodifiedby] [varchar](255) NULL,
    [lastmodifieddate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    CONSTRAINT PK_claimApprovalNote PRIMARY KEY (id)
)

ALTER TABLE [dbo].[ClaimApproval]  WITH CHECK ADD  CONSTRAINT [fk_claimApproval_objectfieldvalue_stageId] FOREIGN KEY([StageId])
REFERENCES [dbo].[ObjectFieldValue] ([Id])

ALTER TABLE [dbo].[ClaimApproval]  WITH CHECK ADD  CONSTRAINT [fk_claimApproval_objectfieldvalue_statusId] FOREIGN KEY([StatusId])
REFERENCES [dbo].[ObjectFieldValue] ([Id])

ALTER TABLE [dbo].[ClaimApproval]  WITH CHECK ADD  CONSTRAINT [fk_claimApproval_ClaimWorkflowObject_statusId] FOREIGN KEY([ClaimWorkflowobjectId])
REFERENCES [dbo].[WorkflowObject] ([Id])

--rollback drop table ClaimApproval

--changeset ShreyaMalhotra:alter-CS-2546
ALTER TABLE [dbo].[Claim] DROP COLUMN entity
ALTER TABLE [dbo].[Claim] DROP COLUMN projecttype 

--rollback ALTER TABLE [dbo].[Claim] ADD entity [varchar](50)
--rollback ALTER TABLE [dbo].[Claim] ADD projecttype [varchar](255);


--changeset MohitSharma:CS-1612-1

ALTER TABLE WfStage ADD Skipped bit
ALTER TABLE WfStage ADD FieldOrder int

--rollback ALTER TABLE WfStage DROP COLUMN Skipped
--rollback ALTER TABLE WfStage DROP COLUMN FieldOrder

--changeset MohitSHarma:CS-1612-2

DECLARE @fieldValueid VARCHAR(255)
DECLARE @APWorkflowName VARCHAR(255)
DECLARE @APWorkflowId VARCHAR(255)
DECLARE @VOWorkflowName VARCHAR(255)
DECLARE @VOWorkflowId VARCHAR(255)
DECLARE @objectFieldId VARCHAR(255)
DECLARE @objectFieldName VARCHAR(255)
DECLARE @fieldValueName VARCHAR(255)


set @APWorkflowName = 'AP'
select @APWorkflowId=id from workflow where name = @APWorkflowName

set @VOWorkflowName = 'Vendor Only'
select @VOWorkflowId=id from workflow where name = @VOWorkflowName

set @objectFieldName = 'stageId'
select @objectFieldId=id from objectfield where name = @objectFieldName

set @fieldValueName = 'Potential'
select @fieldValueid=id from objectfieldvalue where value = @fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,Skipped, FieldOrder,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@APWorkflowId,@fieldValueid,1,1,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)
set @fieldValueName = 'Vendor'
select @fieldValueid=id from objectfieldvalue where value = @fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,Skipped, FieldOrder,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@APWorkflowId,@fieldValueid,1,2,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)

set @fieldValueName = 'Potential'
select @fieldValueid=id from objectfieldvalue where value = @fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,Skipped, FieldOrder,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@VOWorkflowId,@fieldValueid,1,1,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)
set @fieldValueName = 'Client'
select @fieldValueid=id from objectfieldvalue where value = @fieldValueName and objectFieldId = @objectFieldId
insert into wfstage (workflowid,Workflowstage,Skipped, FieldOrder,createdBy,createdDate,lastmodifiedby,lastmodifieddate,deleted) values (@VOWorkflowId,@fieldValueid,1,2,'Prgx',CURRENT_TIMESTAMP,'Prgx',CURRENT_TIMESTAMP,0)


UPDATE WfStage SET FieldOrder=5, Skipped=0 WHERE workflowid=@APWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Invoice' and objectFieldId = @objectFieldId)
UPDATE WfStage SET FieldOrder=3, Skipped=0 WHERE workflowid=@APWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Client' and objectFieldId = @objectFieldId)
UPDATE WfStage SET FieldOrder=4, Skipped=0 WHERE workflowid=@APWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Posting' and objectFieldId = @objectFieldId)


UPDATE WfStage SET FieldOrder=5, Skipped=0 WHERE workflowid=@VOWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Invoice' and objectFieldId = @objectFieldId)
UPDATE WfStage SET FieldOrder=3, Skipped=0 WHERE workflowid=@VOWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Vendor' and objectFieldId = @objectFieldId)
UPDATE WfStage SET FieldOrder=4, Skipped=0 WHERE workflowid=@VOWorkflowId AND Workflowstage=(select id from objectfieldvalue where value = 'Posting' and objectFieldId = @objectFieldId)

--rollback SELECT 1 where 1=0


--changeset MohitSharma:CS-2139-2
DECLARE @DropDownFieldType UNIQUEIDENTIFIER
SELECT @DropDownFieldType=id from ObjectFieldType where name = 'Dropdown (single selection)'

DECLARE @AdjustmentTypeId UNIQUEIDENTIFIER
DECLARE @AdjustmentReasonId UNIQUEIDENTIFIER

SET @AdjustmentTypeId = '4cef3888-3b40-4d47-a0ca-274aac5ee570'
SET @AdjustmentReasonId = 'a5940691-8259-4d16-ac9b-ccff4a006bf5'

UPDATE [dbo].[ObjectField] SET [ObjectFieldTypeId]=@DropDownFieldType WHERE [Id]=@AdjustmentTypeId
UPDATE [dbo].[ObjectField] SET [ObjectFieldTypeId]=@DropDownFieldType WHERE [Id]=@AdjustmentReasonId

--rollback SELECT 1 where 1=0

--changeset MohitSharma:CS-2139-3
CREATE TABLE [dbo].[ClaimAdjustments](
	[Id] [bigint] IDENTITY(1,1),
	[ClaimId] [bigint],
	[AdjustmentAmount] decimal (14,2),
	[AdjustmentTypeId] UNIQUEIDENTIFIER NOT NULL,
	[AdjustmentReasonId] UNIQUEIDENTIFIER NOT NULL,
	[AdjustmentNotes] [varchar](255),
    [CreatedBy] [varchar](255) NULL,
    [CreatedDate] [datetime2](7) NULL,
    [LastModifiedBy] [varchar](255) NULL,
    [LastModifiedDate] [datetime2](7) NULL,
    [Deleted] [bit] NULL,
	CONSTRAINT PK_ClaimAdjustments PRIMARY KEY CLUSTERED ([Id] asc)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_ClaimAdjustments_Claim FOREIGN KEY ([ClaimId]) REFERENCES [dbo].[claim]([id])
)
-- rollback drop table ClaimAdjustments

--changeset MohitSharma:CS-4435

UPDATE [dbo].[ObjectField] SET DisplayName='Adjustment Reason' where id='A5940691-8259-4D16-AC9B-CCFF4A006BF5'

-- rollback SELECT 1 where 1=0

--changeset MohitSharma:CS-4435-1

update ObjectField set IsForeignKey=0 where id in ('4CEF3888-3B40-4D47-A0CA-274AAC5EE570', 'A5940691-8259-4D16-AC9B-CCFF4A006BF5')

-- rollback SELECT 1 where 1=0

--changeset MohitSharma:CS-4565

declare @wfstagevendorid varchar(50)
declare @wfstageclientid varchar(50)
declare @userName varchar(4)
declare @createdDate datetime2
set @userName= 'prgx'
set @createdDate = CURRENT_TIMESTAMP

select @wfstagevendorid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Vendor' and WfStage.workflowid = (select id from Workflow where name='Vendor Only')

select @wfstageclientid=wfstage.id from wfstage,objectfieldvalue o  where wfstage.Workflowstage = o.id and o.value = 'Client' and WfStage.workflowid = (select id from Workflow where name='AP')

INSERT INTO [dbo].[action] values ('adjust-amount')
INSERT INTO [dbo].[workflowaction]
           ([wfstageid],[useraction],[camundaaction],[wfostatus],[createdby],[createddate],[lastmodifiedby],[lastmodifieddate], [deleted])
     VALUES
           (@wfstageclientid, 'adjust-amount', null, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0),
		   (@wfstagevendorid, 'adjust-amount', null, 'IN_PROGRESS', @userName, @createdDate, @userName, @createdDate, 0)

-- rollback SELECT 1 where 1=0

--changeset VarunMehta:CS-4411

CREATE TABLE [dbo].[ClaimPackageConfig](
	[Id] [bigint] IDENTITY(1,1),
	[PackageConfigOrder] [bigint] NOT NULL,
	[ProjectModuleConfigId] [bigint] NOT NULL,
	[AttachmentTypeId] [bigint] NOT NULL,
	[Required] [bit] NOT NULL,
	[Generated] [bit] NULL,
	[DocumentId] [UNIQUEIDENTIFIER] NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](255) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[Deleted] [bit] NULL,
	CONSTRAINT PK_ClaimPackageConfig PRIMARY KEY CLUSTERED ([Id] asc) ON [PRIMARY]
);

-- rollback DROP TABLE [dbo].[ClaimPackageConfig];

--changeset NiteshJindal:CS-4817

ALTER TABLE [dbo].[DocumentMetaData] ADD AppVendorId uniqueidentifier;
ALTER TABLE [dbo].[DocumentMetaData] ADD SendFrom varchar(255);

--rollback ALTER TABLE [dbo].[DocumentMetaData] DROP COLUMN AppVendorId
--rollback ALTER TABLE [dbo].[DocumentMetaData] DROP COLUMN SendFrom

--changeset MohitSharma:CS-3195
DECLARE @APInvoiceStageId varchar(50)
DECLARE @APPostingStageId varchar(50)
DECLARE @VOInvoiceStageId varchar(50)
DECLARE @VOPostingStageId varchar(50)
DECLARE @Action varchar(10)
DECLARE @WFOStatus varchar(10)
DECLARE @User varchar(5)
DECLARE @TimeStamp DATETIME2

SET @Action='revert'
SET @WFOStatus='IN_PROGRESS'
SET @User='prgx'
SET @TimeStamp=CURRENT_TIMESTAMP

select @APInvoiceStageId=wf.id from wfstage wf join objectfieldvalue o on wf.workflowstage=o.id join workflow w on wf.workflowid=w.id where o.Value='Invoice' and w.name='AP'
select @APPostingStageId=wf.id from wfstage wf join objectfieldvalue o on wf.workflowstage=o.id join workflow w on wf.workflowid=w.id where o.Value='Posting' and w.name='AP'

select @VOInvoiceStageId=wf.id from wfstage wf join objectfieldvalue o on wf.workflowstage=o.id join workflow w on wf.workflowid=w.id where o.Value='Invoice' and w.name='Vendor Only'
select @VOPostingStageId=wf.id from wfstage wf join objectfieldvalue o on wf.workflowstage=o.id join workflow w on wf.workflowid=w.id where o.Value='Posting' and w.name='Vendor Only'

INSERT INTO Action values ('revert')

INSERT INTO [dbo].[WorkflowAction]
([wfstageid],[useraction],[camundaaction],[wfostatus],[createdby],[createddate],[lastmodifiedby],[lastmodifieddate],[deleted])
     VALUES
           (@APInvoiceStageId,@Action,@Action,@WFOStatus,@User,@TimeStamp,@User,@TimeStamp,0),
		   (@APPostingStageId,@Action,@Action,@WFOStatus,@User,@TimeStamp,@User,@TimeStamp,0),
		   (@VOInvoiceStageId,@Action,@Action,@WFOStatus,@User,@TimeStamp,@User,@TimeStamp,0),
		   (@VOPostingStageId,@Action,@Action,@WFOStatus,@User,@TimeStamp,@User,@TimeStamp,0)

-- rollback SELECT 1 where 1=0
--changeset MohitSharma:CS-4095-1
CREATE TABLE [dbo].[Recovery](
	[RecoveryId] [bigint] IDENTITY(1,1),
	[ClaimId] [bigint],
	[Amount] decimal (14,2),
	[RecoveryTypeId] UNIQUEIDENTIFIER NOT NULL,
	[RecoveryType] [varchar](255) NOT NULL,
	[RecoveryDate] [datetime2](7),
    [CreatedBy] [varchar](255) NULL,
    [CreatedDate] [datetime2](7) NULL,
    [LastModifiedBy] [varchar](255) NULL,
    [LastModifiedDate] [datetime2](7) NULL,
    [Deleted] [bit] NULL,
	CONSTRAINT PK_Recovery PRIMARY KEY CLUSTERED ([RecoveryId] asc)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_Recovery_Claim FOREIGN KEY ([ClaimId]) REFERENCES [dbo].[claim]([id])
)

CREATE TABLE [dbo].[Allocations](
	[Id] [bigint] IDENTITY(1,1),
	[RecoveryId] [bigint],
	[Amount] decimal (14,2),
	[AllocationTypeId] UNIQUEIDENTIFIER NOT NULL,
	[AllocationType] [varchar](255) NOT NULL,
    [CreatedBy] [varchar](255) NULL,
    [CreatedDate] [datetime2](7) NULL,
    [LastModifiedBy] [varchar](255) NULL,
    [LastModifiedDate] [datetime2](7) NULL,
    [Deleted] [bit] NULL,
	CONSTRAINT PK_Allocations PRIMARY KEY CLUSTERED ([Id] asc)
	WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_Allocation_Recovery FOREIGN KEY ([RecoveryId]) REFERENCES [dbo].[Recovery]([RecoveryId])
)

--rollback DROP TABLE Allocations
--rollback DROP TABLE Recovery

--changeset MohitSharma:CS-4095-2
DECLARE @User varchar(10)
DECLARE @Timestamp DATETIME2
DECLARE @RecoveryId UNIQUEIDENTIFIER
DECLARE @AllocationId UNIQUEIDENTIFIER
DECLARE @DropDownFieldType UNIQUEIDENTIFIER
DECLARE @RecoveryObjectID UNIQUEIDENTIFIER
SELECT @DropDownFieldType=id from ObjectFieldType where name = 'Dropdown (single selection)'
SET @RecoveryId='154a697c-7f8d-48cd-8d8c-c0bca064e5ad'
SET @AllocationId='0ca53544-9da9-4b1c-a91a-aa108a9b8135'
SET @User='prgx'
SET @Timestamp=CURRENT_TIMESTAMP

INSERT INTO [dbo].[Object]
           ([Id],[Name],[CreatedBy],[CreatedDate],[LastModifiedBy],[LastModifiedDate])
     VALUES
           ('26fb3c4b-fa89-4f37-85be-c030d15459eb','Recovery & Allocation',@User,@Timestamp,@User,@Timestamp)

select @RecoveryObjectID=id from object where name='Recovery & Allocation'

INSERT INTO [dbo].[ObjectField]
           ([Id],[Name],[FieldType],[DefaultValue],[IsRequired],[ObjectId],[ObjectFieldTypeId],[CreatedBy],
		   [CreatedDate],[LastModifiedBy],[LastModifiedDate],[IsForeignKey],[Description],[DisplayName],
		   [showinui],[showingrid],[fieldorder],[ParentObjectFieldID])
     VALUES
           (@RecoveryId,'Recovery','STANDARD',null,1,@RecoveryObjectID,@DropDownFieldType,@User,@Timestamp,@User,@Timestamp,1,'Recovery','Recovery',1,1,1,null),
		   (@AllocationId,'Allocation','STANDARD',null,1,@RecoveryObjectID,@DropDownFieldType,@User,@Timestamp,@User,@Timestamp,1,'Allocation','Allocation',1,1,2,null)

INSERT INTO [dbo].[ObjectFieldValue]
           ([Id],[Value],[ValueOrder],[ObjectFieldId],[ParentObjectFieldValueID])
     VALUES
           ('060ac05f-92ad-4fab-9986-5d43d5c21b0e','ACH',1,@RecoveryId,null),
		   ('9c729fdc-4069-40de-b832-b7feb2fe8325','Check',2,@RecoveryId,null),
		   ('8cdb659c-8e2a-42d2-ba75-6614656d0fe2','Credit Memo',3,@RecoveryId,null),
		   ('76b2452b-6329-4110-923e-555f23ad32cc','Claim',1,@AllocationId,null),
		   ('61d41e57-9690-4a74-a084-ef8fa87c580a','Fees',2,@AllocationId,null),
		   ('846d4633-b39f-4808-b3fe-667b8866ec2b','VAT',3,@AllocationId,null),
		   ('7eab68d2-80b4-4a47-bd34-51cda17eaa3d','GST',4,@AllocationId,null),
		   ('62fee3bf-6b22-4bb0-ba94-6f63bfc75a73','HST',5,@AllocationId,null),
		   ('993d978e-f469-4271-893c-998702023a4d','PST',6,@AllocationId,null)

-- rollback SELECT 1 where 1=0

--changeset Umesh:CS-2915-CREATE-TABLE

CREATE TABLE [dbo].[ClaimTemplateMapping](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Categeory] [varchar](255) NULL,
	[MappingColumnLabel] [varchar](255) NULL,
	[MappingExceptionField] [varchar](255) NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
	[Deleted] [bit] NULL,

	CONSTRAINT [PK_ClaimTemplateMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)

) ON [PRIMARY]

--rollback DROP TABLE [dbo].[ClaimTemplateMapping]

--changeset Umesh:CS-2915-ALTER-TABLE

ALTER TABLE [dbo].[ClaimTemplateMapping] 
ADD  Source [varchar](255)

--rollback DROP TABLE [dbo].[ClaimTemplateMapping]
