--liquibase formatted sql

--changeset VarunMehta:alter-PS-10049-1

ALTER TABLE [dbo].[ObjectField] 
ADD [Description] VARCHAR(256);

ALTER TABLE [dbo].[ObjectField] 
ADD [DisplayName] VARCHAR(50);

--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN DisplayName;
--rollback  ALTER TABLE [dbo].[ObjectField] DROP COLUMN Description;

--changeset ShreyaMalhotra:create-CS-1833-1

CREATE TABLE [dbo].[ClaimFieldSetting](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[claimFieldId] [uniqueidentifier] NOT NULL,
	[claimCreationSettingType][varchar](255) NULL,
	[claimPageSettingType][varchar](255) NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](255) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
CONSTRAINT PK_ClaimFieldSetting PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
	

) ON [PRIMARY]
GO

--rollback  DROP TABLE [dbo].[ClaimFieldSetting];

--changeset ShreyaMalhotra:create-CS-1833-2

CREATE TABLE [dbo].[ClaimFieldColumn](
	[ClaimFieldColumnId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProjectId] [bigint] NOT NULL,
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](255) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
CONSTRAINT PK_ClaimFieldColumn PRIMARY KEY CLUSTERED 
(
	[ClaimFieldColumnId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],

) ON [PRIMARY]

GO

CREATE TABLE [dbo].[ClaimFieldColumnDetail](
	[ClaimFieldColumnDetailId] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaimFieldColumnId] [bigint] NOT NULL,
	[ClaimFieldId] [uniqueidentifier] NOT NULL,
	[columnNumber] [integer],
	[FieldOrder]  [integer],
	[CreatedBy] [varchar](255) NULL,
	[CreatedDate] [datetime2](7) NULL,
	[LastModifiedBy] [varchar](255) NULL,
	[LastModifiedDate] [datetime2](7) NULL,
CONSTRAINT PK_ClaimFieldColumnDetail PRIMARY KEY CLUSTERED 
(
	[ClaimFieldColumnDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, 
	ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],

	CONSTRAINT FK_ClaimFieldColumnDetail_ClaimFieldColumn FOREIGN KEY (ClaimFieldColumnId)
    REFERENCES ClaimFieldColumn(ClaimFieldColumnId),

) ON [PRIMARY]

GO

--rollback  DROP TABLE [dbo].[ClaimFieldColumnDetail];
--rollback  DROP TABLE [dbo].[ClaimFieldColumn];

--changeset ShreyaMalhotra:Alter-CS-2091
ALTER TABLE [dbo].[Claim] 
ADD [AppVendorId] UNIQUEIDENTIFIER;

--rollback  ALTER TABLE [dbo].[Claim] DROP COLUMN AppVendorId;
			    
--changeset NiteshJindal:Alter-PS-10866
ALTER TABLE [dbo].[ObjectField] ADD showinui BIT NOT NULL DEFAULT 1;
ALTER TABLE [dbo].[ObjectField] ADD showingrid BIT NOT NULL DEFAULT 1;
ALTER TABLE [dbo].[ObjectField] ADD fieldorder [numeric](5, 3) NULL;
--rollback  alter table [dbo].[ObjectField] DROP Column  showinui;
--rollback  alter table [dbo].[ObjectField] DROP Column  showingrid;
--rollback  alter table [dbo].[ObjectField] DROP Column  fieldorder; 
						
--changeset NitinYadav:Alter-PS-11410
ALTER TABLE [dbo].[Claim] add JsonColumnName varchar(MAX);
--rollback alter table [dbo].[Claim] DROP Column JsonColumnName;

--changeset NiteshJindal:Alter-PS-10866-1
ALTER TABLE [dbo].[ObjectFieldServiceLine] ADD showinui BIT NOT NULL DEFAULT 1;
ALTER TABLE [dbo].[ObjectFieldServiceLine] ADD showingrid BIT NOT NULL DEFAULT 1;
--rollback  alter table [dbo].[ObjectFieldServiceLine] DROP Column  showinui;
--rollback  alter table [dbo].[ObjectFieldServiceLine] DROP Column  showingrid;
						
--changeset NiteshJindal:Alter-PS-10866-2
CREATE UNIQUE NONCLUSTERED INDEX UQ_ObjectField_FieldOrder
ON objectField(objectId, fieldOrder)
WHERE fieldOrder IS NOT NULL;
--rollback drop index UQ_ObjectField_FieldOrder on objectField

--changeset VarunMehta:Alter-PS-10049
ALTER TABLE [dbo].[ObjectField] 
ALTER COLUMN [DisplayName] VARCHAR(50) NOT NULL

--rollback ALTER TABLE [dbo].[ObjectField] ALTER COLUMN [DisplayName] VARCHAR(50) NULL
