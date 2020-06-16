--liquibase formatted sql

--changeset AmanKapoor:Create-CS-606

CREATE TABLE [dbo].[claim]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [createdby] [varchar](255) NULL,
    [createddate] [datetime2](7) NULL,
    [lastmodifiedby] [varchar](255) NULL,
    [lastmodifieddate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    [adjustmentcomment] [varchar](255) NULL,
    [adjustmentreason] [varchar](255) NULL,
    [auditname] [varchar](255) NULL,
    [auditproject] [varchar](255) NULL,
    [claimamount] [numeric](19, 2) NULL,
    [claimcurrency] [varchar](255) NULL,
    [claimdescription] [varchar](255) NULL,
    [claimnumber] [varchar](255) NULL,
    [claimNumberPrefix] [varchar](255) NULL,
    [clientdpprovaldate] [datetime2](7) NULL,
    [clientapprovalstatus] [varchar](255) NULL,
    [clientapproved] [varchar](255) NULL,
    [clientapprovedby] [varchar](255) NULL,
    [clientclaimnumber] [varchar](255) NULL,
    [disposition] [varchar](255) NULL,
    [multiplevaluefield] [varchar](255) NULL,
    [netclaimamount] [numeric](19, 2) NULL,
    [stage] [varchar](255) NULL,
    [status] [varchar](255) NULL,
    [taxamount1] [numeric](19, 2) NULL,
    [taxamount2] [numeric](19, 2) NULL,
    [taxamount3] [numeric](19, 2) NULL,
    [taxamount4] [numeric](19, 2) NULL,
    [taxname1] [varchar](255) NULL,
    [taxname2] [varchar](255) NULL,
    [taxname3] [varchar](255) NULL,
    [taxname4] [varchar](255) NULL,
    [taxpercent1] [numeric](19, 2) NULL,
    [taxpercent2] [numeric](19, 2) NULL,
    [taxpercent3] [numeric](19, 2) NULL,
    [taxpercent4] [numeric](19, 2) NULL,
    [vendorname] [varchar](255) NULL,
    [vendornumber] [varchar](255) NULL,
    [rootcauseid] [bigint] NULL,
    [rootcausedescription] [nvarchar](255) NULL,
    CONSTRAINT PK_Claim PRIMARY KEY (id)
)



CREATE TABLE [dbo].[attachment]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [createdby] [varchar](255) NULL,
    [createddate] [datetime2](7) NULL,
    [lastmodifiedby] [varchar](255) NULL,
    [lastmodifieddate] [datetime2](7) NULL,
    [deleted] [bit] NULL,
    [attachmenttype] [int] NULL,
    [claimid] [bigint] NULL,
    [documentid] [varchar](max) NULL,
    [viewfielddatatypes] [varchar](max) NULL,
    [metadata] [varchar](max) NULL,
    CONSTRAINT PK_Attachment PRIMARY KEY (id),
    CONSTRAINT fk_claim_attachment foreign key (claimid) REFERENCES claim(id)
)

--rollback  DROP TABLE [dbo].[attachment]
--rollback  DROP TABLE [dbo].[claim]

--changeset AmanKapoor:createAttachmhmentContext

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[attachmentcontext]
(
    [id] [bigint] IDENTITY(1,1) NOT NULL,
    [code] [varchar](64) NULL,
    [context] [varchar](1650) NULL,
    [type] [varchar](50) NULL
) ON [PRIMARY]
GO

--rollback  DROP TABLE [dbo].[attachmentcontext]

--changeset VarunMehta:create-PS-7203

CREATE TABLE [dbo].[Object]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [Name] VARCHAR(255),
    [CreatedBy] VARCHAR(255),
    [CreatedDate] DATETIME2,
    [LastModifiedBy] VARCHAR(255),
    [LastModifiedDate] DATETIME2,
    CONSTRAINT PK_Object PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT UQ_Object_Name UNIQUE(Name) 
)

CREATE TABLE [dbo].[ObjectFieldType]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [Name] VARCHAR(255),
    [InactiveDate] DATETIME2,
    [CreatedBy] VARCHAR(255),
    [CreatedDate] DATETIME2,
    [LastModifiedBy] VARCHAR(255),
    [LastModifiedDate] DATETIME2,
    CONSTRAINT PK_ObjectFieldType PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)


CREATE TABLE [dbo].[ObjectField]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [Name] VARCHAR(255),
    [FieldType] VARCHAR(255),
    [DefaultValue] VARCHAR(255),
    [IsRequired] BIT,
    [ObjectId] UNIQUEIDENTIFIER NOT NULL,
    [ObjectFieldTypeId] UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy] VARCHAR(255),
    [CreatedDate] DATETIME2,
    [LastModifiedBy] VARCHAR(255),
    [LastModifiedDate] DATETIME2,
    CONSTRAINT PK_ObjectField PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_ObjectField_ObjectFieldType FOREIGN KEY (ObjectFieldTypeId)
    REFERENCES [dbo].[ObjectFieldType](Id),
    CONSTRAINT FK_ObjectField_Object FOREIGN KEY(ObjectId)
    REFERENCES [dbo].[Object](Id),
    CONSTRAINT UQ_ObjectField_Name UNIQUE(Name, ObjectId)
)


CREATE TABLE [dbo].[ObjectFieldValue]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [Value] VARCHAR(255),
    [ValueOrder] INTEGER,
    [ObjectFieldId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT PK_ObjectFieldValue PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT FK_ObjectFieldValue_ObjectField FOREIGN KEY(ObjectFieldId)
    REFERENCES [dbo].[ObjectField](Id)
)


CREATE TABLE [dbo].[ObjectFieldServiceLine]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [ServiceLineId] BIGINT NOT NULL,
    [DefaultValue] VARCHAR(255),
    [FieldAlias] VARCHAR(255),
    [IsRequired] BIT,
    [SortAlphabetically] BIT,
    [ObjectFieldId] UNIQUEIDENTIFIER NOT NULL,
    [CreatedBy] VARCHAR(255),
    [CreatedDate] DATETIME2,
    [LastModifiedBy] VARCHAR(255),
    [LastModifiedDate] DATETIME2,
    CONSTRAINT PK_ObjectFieldServiceLine PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	CONSTRAINT UQ_ObjectFieldServiceLine_Name UNIQUE(ObjectFieldId, ServiceLineId),
    CONSTRAINT FK_ObjectFieldServiceLine_ObjectField FOREIGN KEY(ObjectFieldId)
    REFERENCES [dbo].[ObjectField](Id)
)



CREATE TABLE [dbo].[ObjectFieldServiceLineValue]
(
    [Id] UNIQUEIDENTIFIER DEFAULT NEWID(),
    [ValueOrder] INTEGER,
    [ObjectFieldServiceLineId] UNIQUEIDENTIFIER,
    [ObjectFieldValueId] UNIQUEIDENTIFIER,
    CONSTRAINT PK_ObjectFieldServiceLineValue PRIMARY  KEY CLUSTERED 
    (
		[Id] ASC
	) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT FK_ObjectFieldServiceLineValue_ObjectFieldServiceLine FOREIGN KEY(ObjectFieldServiceLineId)
    REFERENCES [dbo].[ObjectFieldServiceLine](Id),
    CONSTRAINT FK_ObjectFieldServiceLineValue_ObjectFieldValue FOREIGN KEY(ObjectFieldValueId)
    REFERENCES [dbo].[ObjectFieldValue](Id)
)
 
--rollback  DROP TABLE [dbo].[ObjectFieldServiceLineValue];
--rollback  DROP TABLE [dbo].[ObjectFieldServiceLine];
--rollback  DROP TABLE [dbo].[ObjectFieldValue];
--rollback  DROP TABLE [dbo].[ObjectField];
--rollback  DROP TABLE [dbo].[ObjectFieldType];
--rollback  DROP TABLE [dbo].[Object]; 

--changeset NiteshJindal:alter-CS-1281
		      
alter table claim add entity varchar(50)
alter table claim add bussinessunit varchar(50)
alter table claim add narrative varchar(255)
alter table claim add projecttype varchar(255)
alter table claim add problemtype varchar(255)

--rollback alter table claim drop column entity
--rollback alter table claim drop column bussinessunit
--rollback alter table claim drop column narrative
--rollback alter table claim drop column projecttype
--rollback alter table claim drop column problemtype
		      
--changeset NiteshJindal:alter-CS-1281-1
EXEC sp_RENAME 'claim.bussinessunit' , 'businessunit', 'COLUMN'
--rollback EXEC sp_RENAME 'claim.businessunit' , 'bussinessunit', 'COLUMN'

--changeset Sahil:alter-PS-9342

ALTER TABLE [dbo].[ObjectField] ADD IsForeignKey BIT NOT NULL DEFAULT 0;

--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN IsForeignKey;

--changeset Varun:create-CS-1484

CREATE TABLE [dbo].[WorkflowRules](
	[Id] [bigint] NOT NULL IDENTITY(1,1),
	[ProjectId] [bigint] NOT NULL,
    [Priority] [bigint] NOT NULL,
	[Criteria] [varchar](5000) NOT NULL,
	[ApprovalWorkflow] [bigint] NOT NULL,
	[AutoDeductDays] [bigint] NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_WorkflowRules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--rollback  DROP TABLE [dbo].[WorkflowRules];

--changeset NiteshJindal:alter-CS-1899

ALTER TABLE claim DROP COLUMN adjustmentcomment
ALTER TABLE claim DROP COLUMN adjustmentreason
ALTER TABLE claim DROP COLUMN claimdescription
ALTER TABLE claim DROP COLUMN clientdpprovaldate
ALTER TABLE claim DROP COLUMN clientapprovalstatus
ALTER TABLE claim DROP COLUMN clientapproved
ALTER TABLE claim DROP COLUMN clientapprovedby
ALTER TABLE claim DROP COLUMN taxamount1
ALTER TABLE claim DROP COLUMN taxamount2
ALTER TABLE claim DROP COLUMN taxamount3
ALTER TABLE claim DROP COLUMN taxamount4
ALTER TABLE claim DROP COLUMN taxname1
ALTER TABLE claim DROP COLUMN taxname2
ALTER TABLE claim DROP COLUMN taxname3
ALTER TABLE claim DROP COLUMN taxname4
ALTER TABLE claim DROP COLUMN taxpercent1
ALTER TABLE claim DROP COLUMN taxpercent2
ALTER TABLE claim DROP COLUMN taxpercent3
ALTER TABLE claim DROP COLUMN taxpercent4

ALTER TABLE claim ADD projectid varchar(50)
ALTER TABLE claim ADD dispositionid varchar(50)
ALTER TABLE claim ADD stageid varchar(50)
ALTER TABLE claim ADD statusid varchar(50)
ALTER TABLE claim ADD vendorid varchar(50)
ALTER TABLE claim ADD problemtypeid varchar(50)
ALTER TABLE claim ADD claimdate dateTime2
ALTER TABLE claim ADD exchangerate [numeric](19, 2)
ALTER TABLE claim ALTER COLUMN rootcauseid varchar(50)

--rollback SELECT 1 WHERE 1=0;


--changeset Jaspreet:create-CS-1270

CREATE TABLE [dbo].[DmnDeploymentProjectMapping](
	[Id] [bigint] NOT NULL IDENTITY(1,1),
	[ProjectId] [bigint] NOT NULL,
    [DeploymentId] [varchar](50) NOT NULL,
	[LastModifiedBy] [varchar](50) NULL,
	[LastModifiedDate] [datetime] NULL,
	[CreatedBy] [varchar](50) NULL,
	[CreatedDate] [datetime] NULL,
	[Deleted] [bit] NULL,
 CONSTRAINT [PK_DmnDeploymentProjectMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--rollback  DROP TABLE [dbo].[DmnDeploymentProjectMapping];


--changeset Jaspreet:create-CS-1270-1

ALTER TABLE [dbo].[DmnDeploymentProjectMapping] ALTER COLUMN deploymentid VARCHAR(255);

--rollback  ALTER TABLE [dbo].[DmnDeploymentProjectMapping] ALTER COLUMN deploymentid VARCHAR(50);



