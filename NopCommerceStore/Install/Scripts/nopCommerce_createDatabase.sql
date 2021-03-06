
CREATE TABLE [dbo].[Nop_SpecificationAttribute](
	[SpecificationAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Nop_SpecificationAttribute_DisplayOrder]  DEFAULT ((1)),
 CONSTRAINT [PK_Nop_SpecificationAttribute] PRIMARY KEY CLUSTERED 
(
	[SpecificationAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_SpecificationAttributeOption](
	[SpecificationAttributeOptionID] [int] IDENTITY(1,1) NOT NULL,
	[SpecificationAttributeID] [int] NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Nop_SpecificationAttributeOption_DisplayOrder]  DEFAULT ((1)),
 CONSTRAINT [PK_Nop_SpecificationAttributeOption] PRIMARY KEY CLUSTERED 
(
	[SpecificationAttributeOptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_CustomerSession](
	[CustomerSessionGUID] [uniqueidentifier] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[LastAccessed] [datetime] NOT NULL,
	[IsExpired] [bit] NOT NULL,
 CONSTRAINT [PK_Nop_CustomerSession] PRIMARY KEY CLUSTERED 
(
	[CustomerSessionGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_CustomerSession_CustomerID] ON [dbo].[Nop_CustomerSession] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Nop_Pricelist](
	[PricelistID] [int] IDENTITY(1,1) NOT NULL,
	[ExportModeID] [int] NOT NULL,
	[ExportTypeID] [int] NOT NULL,
	[AffiliateID] [int] NOT NULL,
	[DisplayName] [nvarchar](100) NOT NULL,
	[ShortName] [nvarchar](20) NOT NULL,
	[PricelistGuid] [nvarchar](40) NOT NULL,
	[CacheTime] [int] NOT NULL,
	[FormatLocalization] [nvarchar](5) NOT NULL,
	[Description] [nvarchar](500) NOT NULL,
	[AdminNotes] [nvarchar](500) NOT NULL,
	[Header] [nvarchar](500) NOT NULL,
	[Body] [nvarchar](500) NOT NULL,
	[Footer] [nvarchar](500) NOT NULL,
	[PriceAdjustmentTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_Pricelist_PriceAdjustmentTypeID]  DEFAULT ((0)),
	[PriceAdjustment] [money] NOT NULL CONSTRAINT [DF_Nop_Pricelist_PriceAdjustment]  DEFAULT ((0)),
	[OverrideIndivAdjustment] [bit] NOT NULL CONSTRAINT [DF_Nop_Pricelist_OverrideIndivAdjustment]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Pricelist] PRIMARY KEY CLUSTERED 
(
	[PricelistID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_SearchLog](
	[SearchLogID] [int] IDENTITY(1,1) NOT NULL,
	[SearchTerm] [nvarchar](100) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_SearchLog] PRIMARY KEY CLUSTERED 
(
	[SearchLogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_CustomerRole](
	[CustomerRoleID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[FreeShipping] [bit] NOT NULL,
	[TaxExempt] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Nop_CustomerRole] PRIMARY KEY CLUSTERED 
(
	[CustomerRoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_LogType](
	[LogTypeID] [int] NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Nop_LogType] PRIMARY KEY CLUSTERED 
(
	[LogTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Country](
	[CountryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[AllowsRegistration] [bit] NOT NULL,
	[AllowsBilling] [bit] NOT NULL,
	[AllowsShipping] [bit] NOT NULL,
	[TwoLetterISOCode] [nvarchar](2) NOT NULL,
	[ThreeLetterISOCode] [nvarchar](3) NOT NULL,
	[NumericISOCode] [int] NOT NULL,
	[Published] [tinyint] NOT NULL CONSTRAINT [DF_Nop_Country_Published]  DEFAULT ((1)),
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Nop_Country_DisplayOrder]  DEFAULT ((1)),
 CONSTRAINT [PK_Nop_Country] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Country_DisplayOrder] ON [dbo].[Nop_Country] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Warehouse](
	[WarehouseID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FaxNumber] [nvarchar](50) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[StateProvince] [nvarchar](100) NOT NULL,
	[ZipPostalCode] [nvarchar](10) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK__Nop_Warehouse__0B5CAFEA] PRIMARY KEY CLUSTERED 
(
	[WarehouseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Affiliate](
	[AffiliateID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[MiddleName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FaxNumber] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[StateProvince] [nvarchar](100) NOT NULL,
	[ZipPostalCode] [nvarchar](10) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Active] [tinyint] NOT NULL CONSTRAINT [DF_Nop_Affiliate_Active]  DEFAULT ((1)),
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Nop_Affiliate_Deleted]  DEFAULT ((0)),
 CONSTRAINT [PK_Nop_Affiliate] PRIMARY KEY CLUSTERED 
(
	[AffiliateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_TaxCategory](
	[TaxCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_TaxCategory] PRIMARY KEY CLUSTERED 
(
	[TaxCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_ProductAttribute](
	[ProductAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](400) NOT NULL,
 CONSTRAINT [PK_Nop_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_TaxProvider](
	[TaxProviderID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[ConfigureTemplatePath] [nvarchar](500) NOT NULL,
	[ClassName] [nvarchar](500) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_TaxProvider] PRIMARY KEY CLUSTERED 
(
	[TaxProviderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_QueuedEmail](
	[QueuedEmailID] [int] IDENTITY(1,1) NOT NULL,
	[Priority] [int] NOT NULL,
	[From] [nvarchar](500) NOT NULL,
	[FromName] [nvarchar](500) NOT NULL,
	[To] [nvarchar](500) NOT NULL,
	[ToName] [nvarchar](500) NOT NULL,
	[Cc] [nvarchar](500) NOT NULL,
	[Bcc] [nvarchar](500) NOT NULL,
	[Subject] [nvarchar](500) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[SendTries] [int] NOT NULL,
	[SentOn] [datetime] NULL,
 CONSTRAINT [PK_Nop_QueuedEmail] PRIMARY KEY CLUSTERED 
(
	[QueuedEmailID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_QueuedEmail_CreatedOn] ON [dbo].[Nop_QueuedEmail] 
(
	[CreatedOn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_BannedIpAddress](
	[BannedIpAddressID] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_BannedIpAddress] PRIMARY KEY CLUSTERED 
(
	[BannedIpAddressID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Nop_ShippingMethod](
	[ShippingMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](2000) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_ShippingMethod] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Nop_ShippingStatus](
	[ShippingStatusID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nop_ShippingStatus] PRIMARY KEY CLUSTERED 
(
	[ShippingStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ShippingRateComputationMethod](
	[ShippingRateComputationMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[ConfigureTemplatePath] [nvarchar](500) NOT NULL,
	[ClassName] [nvarchar](500) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_ShippingRateComputationMethod] PRIMARY KEY CLUSTERED 
(
	[ShippingRateComputationMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_OrderStatus](
	[OrderStatusID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nop_OrderStatus] PRIMARY KEY CLUSTERED 
(
	[OrderStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_BannedIpNetwork](
	[BannedIpNetworkID] [int] IDENTITY(1,1) NOT NULL,
	[StartAddress] [nvarchar](50) NOT NULL,
	[EndAddress] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](500) NULL,
	[IpException] [nvarchar](max) NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_BannedNetworkIP] PRIMARY KEY CLUSTERED 
(
	[BannedIpNetworkID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_MessageTemplate](
	[MessageTemplateID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Nop_MessageTemplate] PRIMARY KEY CLUSTERED 
(
	[MessageTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_MessageTemplate_Name] ON [dbo].[Nop_MessageTemplate] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_CreditCardType](
	[CreditCardTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SystemKeyword] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Nop_CreditCardType] PRIMARY KEY CLUSTERED 
(
	[CreditCardTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ShoppingCartType](
	[ShoppingCartTypeID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nop_ShoppingCartType] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Setting](
	[SettingID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Value] [nvarchar](2000) NOT NULL,
	[Description] [ntext] NOT NULL,
 CONSTRAINT [PK_Nop_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Nop_Setting] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_ProductTemplate](
	[ProductTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TemplatePath] [nvarchar](200) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_ProductTemplate_PK] PRIMARY KEY CLUSTERED 
(
	[ProductTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_CategoryTemplate](
	[CategoryTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TemplatePath] [nvarchar](200) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_CategoryTemplate_PK] PRIMARY KEY CLUSTERED 
(
	[CategoryTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_ManufacturerTemplate](
	[ManufacturerTemplateId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[TemplatePath] [nvarchar](200) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_ManufacturerTemplate_PK] PRIMARY KEY CLUSTERED 
(
	[ManufacturerTemplateId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_MeasureWeight](
	[MeasureWeightID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SystemKeyword] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_MeasureWeight] PRIMARY KEY CLUSTERED 
(
	[MeasureWeightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Nop_ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Nop_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Topic_Name] ON [dbo].[Nop_Topic] 
(
	[Name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO


CREATE TABLE [dbo].[Nop_Campaign](
	[CampaignID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Campaign] PRIMARY KEY CLUSTERED 
(
	[CampaignID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Nop_MeasureDimension](
	[MeasureDimensionID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[SystemKeyword] [nvarchar](100) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_MeasureDimention] PRIMARY KEY CLUSTERED 
(
	[MeasureDimensionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Picture](
	[PictureID] [int] IDENTITY(1,1) NOT NULL,
	[PictureBinary] [image] NOT NULL,
	[Extension] [nvarchar](20) NOT NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [Nop_Picture_PK] PRIMARY KEY CLUSTERED 
(
	[PictureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Download](
	[DownloadID] [int] IDENTITY(1,1) NOT NULL,
	[UseDownloadURL] [bit] NOT NULL CONSTRAINT [DF_Nop_Nop_Download_UseDownloadURL]  DEFAULT ((0)),
	[DownloadURL] [nvarchar](400) NOT NULL CONSTRAINT [DF_Nop_Download_DownloadURL]  DEFAULT (''),
	[DownloadBinary] [image] NULL,
	[ContentType] [nvarchar](20) NOT NULL CONSTRAINT [DF_Nop_Download_ContentType]  DEFAULT (N''),
	[Extension] [nvarchar](20) NOT NULL,
	[IsNew] [bit] NOT NULL,
 CONSTRAINT [Nop_Download_PK] PRIMARY KEY CLUSTERED 
(
	[DownloadID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Forums_Group](
	[ForumGroupID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_Group] PRIMARY KEY CLUSTERED 
(
	[ForumGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Group_DisplayOrder] ON [dbo].[Nop_Forums_Group] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Nop_LowStockActivity](
	[LowStockActivityID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nop_LowStockActivity] PRIMARY KEY CLUSTERED 
(
	[LowStockActivityID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO



CREATE TABLE [dbo].[Nop_Forums_Subscription](
	[SubscriptionID] [int] IDENTITY(1,1) NOT NULL,
	[SubscriptionGUID] [uniqueidentifier] NOT NULL,
	[UserID] [int] NOT NULL,
	[ForumID] [int] NOT NULL,
	[TopicID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_Subscription] PRIMARY KEY CLUSTERED 
(
	[SubscriptionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Subscription_ForumID] ON [dbo].[Nop_Forums_Subscription] 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Subscription_TopicID] ON [dbo].[Nop_Forums_Subscription] 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_Currency](
	[CurrencyID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CurrencyCode] [nvarchar](5) NOT NULL,
	[DisplayLocale] [nvarchar](50) NULL,
	[Rate] [decimal](18, 4) NOT NULL,
	[CustomFormatting] [nvarchar](50) NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_Currency_PK] PRIMARY KEY CLUSTERED 
(
	[CurrencyID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Currency_CurrencyCode] ON [dbo].[Nop_Currency] 
(
	[CurrencyCode] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Currency_DisplayOrder] ON [dbo].[Nop_Currency] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Forums_PrivateMessage](
	[PrivateMessageID] [int] IDENTITY(1,1) NOT NULL,
	[FromUserID] [int] NOT NULL,
	[ToUserID] [int] NOT NULL,
	[Subject] [nvarchar](450) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[IsRead] [bit] NOT NULL,
	[IsDeletedByAuthor] [bit] NOT NULL CONSTRAINT [DF_Nop_Forums_PrivateMessage_IsDeletedByAuthor]  DEFAULT ((0)),
	[IsDeletedByRecipient] [bit] NOT NULL CONSTRAINT [DF_Nop_Forums_PrivateMessage_IsDeletedByRecipient]  DEFAULT ((0)),
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_PrivateMessage] PRIMARY KEY CLUSTERED 
(
	[PrivateMessageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Language](
	[LanguageId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LanguageCulture] [varchar](20) NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [Nop_Language_PK] PRIMARY KEY CLUSTERED 
(
	[LanguageId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Language_DisplayOrder] ON [dbo].[Nop_Language] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_PaymentStatus](
	[PaymentStatusID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Nop_PaymentStatus] PRIMARY KEY CLUSTERED 
(
	[PaymentStatusID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_PaymentMethod](
	[PaymentMethodID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[VisibleName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[ConfigureTemplatePath] [nvarchar](500) NOT NULL,
	[UserTemplatePath] [nvarchar](500) NOT NULL,
	[ClassName] [nvarchar](500) NOT NULL,
	[SystemKeyword] [nvarchar](500) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_PaymentMethod] PRIMARY KEY CLUSTERED 
(
	[PaymentMethodID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_DiscountType](
	[DiscountTypeID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [Nop_DiscountType_PK] PRIMARY KEY CLUSTERED 
(
	[DiscountTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_DiscountRequirement](
	[DiscountRequirementID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
 CONSTRAINT [Nop_DiscountRequirement_PK] PRIMARY KEY CLUSTERED 
(
	[DiscountRequirementID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_CustomerRole_Discount_Mapping](
	[CustomerRoleID] [int] NOT NULL,
	[DiscountID] [int] NOT NULL,
 CONSTRAINT [PK_Nop_CustomerRole_Discount_Mapping] PRIMARY KEY CLUSTERED 
(
	[CustomerRoleID] ASC,
	[DiscountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_Category_Discount_Mapping](
	[CategoryID] [int] NOT NULL,
	[DiscountID] [int] NOT NULL,
 CONSTRAINT [PK_Nop_Category_Discount_Mapping] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC,
	[DiscountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerGUID] [uniqueidentifier] ROWGUIDCOL  NOT NULL CONSTRAINT [DF_Nop_Customer_CustomerGUID]  DEFAULT (newid()),
	[Email] [nvarchar](255) NOT NULL CONSTRAINT [DF_Nop_Customer_Email]  DEFAULT (''),
	[Username] [nvarchar](100) NOT NULL CONSTRAINT [DF_Nop_Customer_Username]  DEFAULT (''),
	[PasswordHash] [nvarchar](255) NOT NULL CONSTRAINT [DF_Nop_Customer_Password]  DEFAULT (''),
	[SaltKey] [nvarchar](255) NOT NULL CONSTRAINT [DF_Nop_Customer_SaltKey]  DEFAULT ((0)),
	[AffiliateID] [int] NOT NULL,
	[BillingAddressID] [int] NOT NULL,
	[ShippingAddressID] [int] NOT NULL,
	[LastPaymentMethodID] [int] NOT NULL,
	[LastAppliedCouponCode] [nvarchar](100) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[CurrencyID] [int] NOT NULL,
	[TaxDisplayTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_Customer_TaxDisplayTypeID]  DEFAULT ((1)),
	[IsTaxExempt] [bit] NOT NULL CONSTRAINT [DF_Nop_Customer_IsTaxExempt]  DEFAULT ((0)),
	[IsAdmin] [bit] NOT NULL,
	[IsGuest] [bit] NOT NULL CONSTRAINT [DF_Nop_Customer_IsGuest]  DEFAULT ((0)),
	[IsForumModerator] [bit] NOT NULL CONSTRAINT [DF_Nop_Customer_IsForumModerator]  DEFAULT ((0)),
	[TotalForumPosts] [int] NOT NULL CONSTRAINT [DF_Nop_Customer_TotalForumPosts]  DEFAULT ((0)),
	[Signature] [nvarchar](300) NOT NULL CONSTRAINT [DF_Nop_Customer_Signature]  DEFAULT (''),
	[AdminComment] [nvarchar](4000) NOT NULL CONSTRAINT [DF_Nop_Customer_AdminComment]  DEFAULT (''),
	[Active] [bit] NOT NULL CONSTRAINT [DF_Nop_Customer_Active]  DEFAULT ((1)),
	[Deleted] [bit] NOT NULL CONSTRAINT [DF_Nop_Customer_Deleted]  DEFAULT ((0)),
	[RegistrationDate] [datetime] NOT NULL,
	[TimeZoneID] [nvarchar](200) NOT NULL CONSTRAINT [DF_Nop_Customer_TimeZoneID]  DEFAULT (''),
	[AvatarID] [int] NOT NULL CONSTRAINT [DF_Nop_Customer_AvatarID]  DEFAULT ((0)),
 CONSTRAINT [PK_Nop_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Customer_AffiliateID] ON [dbo].[Nop_Customer] 
(
	[AffiliateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Customer_Email] ON [dbo].[Nop_Customer] 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Customer_Username] ON [dbo].[Nop_Customer] 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ProductVariant_Pricelist_Mapping](
	[ProductVariantPricelistID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[PricelistID] [int] NOT NULL,
	[PriceAdjustmentTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_Pricelist_Mapping_PriceAdjustmentTypeID]  DEFAULT ((0)),
	[PriceAdjustment] [money] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_Pricelist_Mapping_PriceAdjustment]  DEFAULT ((0)),
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_ProductVariant_Pricelist_Mapping] PRIMARY KEY CLUSTERED 
(
	[ProductVariantPricelistID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_Product_Manufacturer_Mapping](
	[ProductManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[ManufacturerID] [int] NOT NULL,
	[IsFeaturedProduct] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_Product_Manufacturer_Mapping_1] PRIMARY KEY CLUSTERED 
(
	[ProductManufacturerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Nop_Product_Manufacturer_Mapping_Unique] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[ManufacturerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_Product_Category_Mapping](
	[ProductCategoryID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
	[IsFeaturedProduct] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_Product_Category_Mapping_1] PRIMARY KEY CLUSTERED 
(
	[ProductCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Nop_Product_Category_Mapping_Unique] UNIQUE NONCLUSTERED 
(
	[ProductID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO









CREATE TABLE [dbo].[Nop_ProductVariant](
	[ProductVariantId] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[SKU] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](4000) NOT NULL,
	[AdminComment] [nvarchar](4000) NOT NULL,
	[ManufacturerPartNumber] [nvarchar](100) NOT NULL,
	[IsDownload] [bit] NOT NULL,
	[DownloadID] [int] NOT NULL,
	[UnlimitedDownloads] [bit] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_UnlimitedDownloads]  DEFAULT ((1)),
	[MaxNumberOfDownloads] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_MaxNumberOfDownloads]  DEFAULT ((0)),
	[HasSampleDownload] [bit] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_HasSampleDownload]  DEFAULT ((0)),
	[SampleDownloadID] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_SampleDownloadID]  DEFAULT ((0)),
	[IsShipEnabled] [bit] NOT NULL,
	[IsFreeShipping] [bit] NOT NULL,
	[AdditionalShippingCharge] [money] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_AdditionalShippingCharge]  DEFAULT ((0)),
	[IsTaxExempt] [bit] NOT NULL,
	[TaxCategoryID] [int] NOT NULL,
	[ManageInventory] [bit] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_ManageInventory]  DEFAULT ((1)),
	[StockQuantity] [int] NOT NULL,
	[MinStockQuantity] [int] NOT NULL,
	[LowStockActivityID] [int] NOT NULL,
	[NotifyAdminForQuantityBelow] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_NotifyAdminForQuantityBelow]  DEFAULT ((1)),
	[OrderMinimumQuantity] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_OrderMinimumQuantity]  DEFAULT ((1)),
	[OrderMaximumQuantity] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_OrderMaximumQuantity]  DEFAULT ((10000)),
	[WarehouseID] [int] NOT NULL,
	[DisableBuyButton] [bit] NOT NULL,
	[Price] [money] NOT NULL,
	[OldPrice] [money] NOT NULL,
	[Weight] [float] NOT NULL,
	[Length] [decimal](18, 4) NOT NULL,
	[Width] [decimal](18, 4) NOT NULL,
	[Height] [decimal](18, 4) NOT NULL,
	[PictureID] [int] NOT NULL,
	[AvailableStartDateTime] [datetime] NULL,
	[AvailableEndDateTime] [datetime] NULL,
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_ProductVariant_PK] PRIMARY KEY CLUSTERED 
(
	[ProductVariantId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ProductVariant_DisplayOrder] ON [dbo].[Nop_ProductVariant] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ProductVariant_ProductID] ON [dbo].[Nop_ProductVariant] 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ProductRating](
	[ProductRatingID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Rating] [int] NOT NULL,
	[RatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_ProductRating] PRIMARY KEY CLUSTERED 
(
	[ProductRatingID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_RelatedProduct](
	[RelatedProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID1] [int] NOT NULL,
	[ProductID2] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_RelatedProduct] PRIMARY KEY CLUSTERED 
(
	[RelatedProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Nop_RelatedProduct_Unique] UNIQUE NONCLUSTERED 
(
	[ProductID1] ASC,
	[ProductID2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_RelatedProduct_ProductID1] ON [dbo].[Nop_RelatedProduct] 
(
	[ProductID1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ProductReview](
	[ProductReviewID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[ReviewText] [nvarchar](max) NOT NULL,
	[Rating] [int] NOT NULL,
	[HelpfulYesTotal] [int] NOT NULL,
	[HelpfulNoTotal] [int] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_ProductReview] PRIMARY KEY CLUSTERED 
(
	[ProductReviewID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ProductReview_ProductID] ON [dbo].[Nop_ProductReview] 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ProductPicture](
	[ProductPictureID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PictureID] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_ProductPicture] PRIMARY KEY CLUSTERED 
(
	[ProductPictureID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_Product_SpecificationAttribute_Mapping](
	[ProductSpecificationAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[SpecificationAttributeOptionID] [int] NOT NULL,
	[AllowFiltering] [bit] NOT NULL CONSTRAINT [DF_Nop_Product_SpecificationAttribute_Mapping_AllowFiltering]  DEFAULT ((0)),
	[ShowOnProductPage] [bit] NOT NULL CONSTRAINT [DF_Nop_Product_SpecificationAttribute_Mapping_ShowOnProductPage]  DEFAULT ((1)),
	[DisplayOrder] [int] NOT NULL CONSTRAINT [DF_Nop_Product_SpecificationAttribute_Mapping_DisplayOrder]  DEFAULT ((1)),
 CONSTRAINT [PK_Nop_Product_SpecificationAttribute_Mapping] PRIMARY KEY CLUSTERED 
(
	[ProductSpecificationAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ShoppingCartItem](
	[ShoppingCartItemID] [int] IDENTITY(1,1) NOT NULL,
	[ShoppingCartTypeID] [int] NOT NULL,
	[CustomerSessionGUID] [uniqueidentifier] NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[AttributesXML] [xml] NOT NULL CONSTRAINT [DF_Nop_ShoppingCartItem_AttributesXML]  DEFAULT (''),
	[Quantity] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_ShoppingCart_PK] PRIMARY KEY CLUSTERED 
(
	[ShoppingCartItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ShoppingCartItem_ShoppingCartTypeID_CustomerSessionGUID] ON [dbo].[Nop_ShoppingCartItem] 
(
	[ShoppingCartTypeID] ASC,
	[CustomerSessionGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Customer_CustomerRole_Mapping](
	[CustomerID] [int] NOT NULL,
	[CustomerRoleID] [int] NOT NULL,
 CONSTRAINT [PK_Nop_Customer_CustomerRole_Mapping] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC,
	[CustomerRoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ProductReviewHelpfulness](
	[ProductReviewHelpfulnessID] [int] IDENTITY(1,1) NOT NULL,
	[ProductReviewID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[WasHelpful] [bit] NOT NULL,
 CONSTRAINT [PK_Nop_ProductReviewHelpfulness] PRIMARY KEY CLUSTERED 
(
	[ProductReviewHelpfulnessID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_Log](
	[LogID] [int] IDENTITY(1,1) NOT NULL,
	[LogTypeID] [int] NOT NULL,
	[Severity] [int] NOT NULL,
	[Message] [nvarchar](1000) NOT NULL,
	[Exception] [nvarchar](4000) NOT NULL,
	[IPAddress] [nvarchar](100) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PageURL] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Log] PRIMARY KEY CLUSTERED 
(
	[LogID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Log_CreatedOn] ON [dbo].[Nop_Log] 
(
	[CreatedOn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_StateProvince](
	[StateProvinceID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Abbreviation] [nvarchar](10) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_StateProvince] PRIMARY KEY CLUSTERED 
(
	[StateProvinceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_StateProvince_CountryID] ON [dbo].[Nop_StateProvince] 
(
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_TaxRate](
	[TaxRateID] [int] IDENTITY(1,1) NOT NULL,
	[TaxCategoryID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[Zip] [nvarchar](50) NOT NULL,
	[Percentage] [decimal](18, 4) NOT NULL,
 CONSTRAINT [PK_Nop_TaxRate] PRIMARY KEY CLUSTERED 
(
	[TaxRateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ShippingByWeightAndCountry](
	[ShippingByWeightAndCountryID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethodID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
	[From] [decimal](18, 2) NOT NULL,
	[To] [decimal](18, 2) NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[ShippingChargePercentage] [decimal](18, 2) NOT NULL,
	[ShippingChargeAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Nop_ShippingByWeightAndCountry] PRIMARY KEY CLUSTERED 
(
	[ShippingByWeightAndCountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ShippingMethod_RestrictedCountries](
	[ShippingMethodID] [int] NOT NULL,
	[CountryID] [int] NOT NULL,
 CONSTRAINT [PK_Nop_ShippingMethod_RestrictedCountries] PRIMARY KEY CLUSTERED 
(
	[ShippingMethodID] ASC,
	[CountryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_OrderProductVariant](
	[OrderProductVariantID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[UnitPriceInclTax] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_UnitPriceInclTax]  DEFAULT ((0)),
	[UnitPriceExclTax] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_UnitPriceExclTax]  DEFAULT ((0)),
	[PriceInclTax] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_PriceInclTax]  DEFAULT ((0)),
	[PriceExclTax] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_PriceExclTax]  DEFAULT ((0)),
	[UnitPriceInclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_UnitPriceInclTaxInCustomerCurrency]  DEFAULT ((0)),
	[UnitPriceExclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_UnitPriceExclTaxInCustomerCurrency]  DEFAULT ((0)),
	[PriceInclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_PriceInclTaxInCustomerCurrency]  DEFAULT ((0)),
	[PriceExclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_PriceExclTaxInCustomerCurrency]  DEFAULT ((0)),
	[AttributeDescription] [nvarchar](4000) NOT NULL,
	[Quantity] [int] NOT NULL,
	[DiscountAmountInclTax] [decimal](18, 4) NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_DiscountAmountInclTax]  DEFAULT ((0)),
	[DiscountAmountExclTax] [decimal](18, 4) NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_DiscountAmountExclTax]  DEFAULT ((0)),
	[DownloadCount] [int] NOT NULL CONSTRAINT [DF_Nop_OrderProductVariant_DownloadCount]  DEFAULT ((0)),
 CONSTRAINT [Nop_OrderProductVariant_PK] PRIMARY KEY CLUSTERED 
(
	[OrderProductVariantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_OrderProductVariant_OrderID] ON [dbo].[Nop_OrderProductVariant] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_ProductVariant_ProductAttribute_Mapping](
	[ProductVariantAttributeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[ProductAttributeID] [int] NOT NULL,
	[TextPrompt] [nvarchar](200) NOT NULL CONSTRAINT [DF_Nop_ProductVariant_ProductAttribute_Mapping_Attributes]  DEFAULT (''),
	[IsRequired] [bit] NOT NULL,
	[AttributeControlTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_ProductVariant_ProductAttribute_Mapping_ControlTypeID]  DEFAULT ((1)),
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_ProductVariant_ProductAttribute_Mapping] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ProductVariant_ProductAttribute_Mapping_ProductVariantID] ON [dbo].[Nop_ProductVariant_ProductAttribute_Mapping] 
(
	[ProductVariantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO




CREATE TABLE [dbo].[Nop_ProductVariant_Discount_Mapping](
	[ProductVariantID] [int] NOT NULL,
	[DiscountID] [int] NOT NULL,
 CONSTRAINT [PKNop_ProductVariant_Discount_Mapping] PRIMARY KEY CLUSTERED 
(
	[ProductVariantID] ASC,
	[DiscountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_TierPrice](
	[TierPriceID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Price] [money] NOT NULL,
 CONSTRAINT [Nop_TierPrice_PK] PRIMARY KEY CLUSTERED 
(
	[TierPriceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_TierPrice_ProductVariantID] ON [dbo].[Nop_TierPrice] 
(
	[ProductVariantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_ProductVariantAttributeValue](
	[ProductVariantAttributeValueID] [int] IDENTITY(1,1) NOT NULL,
	[ProductVariantAttributeID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PriceAdjustment] [money] NOT NULL,
	[WeightAdjustment] [decimal](18, 4) NOT NULL CONSTRAINT [DF_Nop_ProductVariantAttributeValue_WeightAdjustment]  DEFAULT ((0)),
	[IsPreSelected] [bit] NOT NULL CONSTRAINT [DF_Nop_ProductVariantAttributeValue_IsPreSelected]  DEFAULT ((0)),
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_ProductVariantAttributeValue] PRIMARY KEY CLUSTERED 
(
	[ProductVariantAttributeValueID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_ProductVariantAttributeValue_ProductVariantAttributeID] ON [dbo].[Nop_ProductVariantAttributeValue] 
(
	[ProductVariantAttributeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_ShippingByTotal](
	[ShippingByTotalID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethodID] [int] NOT NULL,
	[From] [decimal](18, 2) NOT NULL,
	[To] [decimal](18, 2) NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[ShippingChargePercentage] [decimal](18, 2) NOT NULL,
	[ShippingChargeAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Nop_ShippingByTotal] PRIMARY KEY CLUSTERED 
(
	[ShippingByTotalID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_ShippingByWeight](
	[ShippingByWeightID] [int] IDENTITY(1,1) NOT NULL,
	[ShippingMethodID] [int] NOT NULL,
	[From] [decimal](18, 2) NOT NULL,
	[To] [decimal](18, 2) NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[ShippingChargePercentage] [decimal](18, 2) NOT NULL,
	[ShippingChargeAmount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Nop_ShippingByWeight] PRIMARY KEY CLUSTERED 
(
	[ShippingByWeightID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderGUID] [uniqueidentifier] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CustomerLanguageID] [int] NOT NULL,
	[CustomerTaxDisplayTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_Order_CustomerTaxDisplayTypeID]  DEFAULT ((1)),
	[OrderSubtotalInclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderSubtotalInclTax]  DEFAULT ((0)),
	[OrderSubtotalExclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderSubtotalExclTax]  DEFAULT ((0)),
	[OrderShippingInclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderShippingInclTax]  DEFAULT ((0)),
	[OrderShippingExclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderShippingExclTax]  DEFAULT ((0)),
	[PaymentMethodAdditionalFeeInclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_PaymentMethodAdditionalFeeInclTax]  DEFAULT ((0)),
	[PaymentMethodAdditionalFeeExclTax] [money] NOT NULL CONSTRAINT [DF_Nop_Order_PaymentMethodAdditionalFeeExclTax]  DEFAULT ((0)),
	[OrderTax] [money] NOT NULL,
	[OrderTotal] [money] NOT NULL,
	[OrderDiscount] [money] NOT NULL,
	[OrderSubtotalInclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderSubtotalInclTaxInCustomerCurrency]  DEFAULT ((0)),
	[OrderSubtotalExclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderSubtotalExclTaxInCustomerCurrency]  DEFAULT ((0)),
	[OrderShippingInclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderShippingInclTaxInCustomerCurrency]  DEFAULT ((0)),
	[OrderShippingExclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_OrderShippingExclTaxInCustomerCurrency]  DEFAULT ((0)),
	[PaymentMethodAdditionalFeeInclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_PaymentMethodAdditionalFeeInclTaxInCustomerCurrency]  DEFAULT ((0)),
	[PaymentMethodAdditionalFeeExclTaxInCustomerCurrency] [money] NOT NULL CONSTRAINT [DF_Nop_Order_PaymentMethodAdditionalFeeExclTaxInCustomerCurrency]  DEFAULT ((0)),
	[OrderTaxInCustomerCurrency] [money] NOT NULL,
	[OrderTotalInCustomerCurrency] [money] NOT NULL,
	[CustomerCurrencyCode] [nvarchar](5) NOT NULL,
	[OrderWeight] [float] NOT NULL,
	[AffiliateID] [int] NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[AllowStoringCreditCardNumber] [bit] NOT NULL CONSTRAINT [DF_Nop_Order_AllowStoringCreditCardNumber]  DEFAULT ((0)),
	[CardType] [nvarchar](100) NOT NULL,
	[CardName] [nvarchar](100) NOT NULL,
	[CardNumber] [nvarchar](100) NOT NULL,
	[MaskedCreditCardNumber] [nvarchar](100) NOT NULL CONSTRAINT [DF_Nop_Order_MaskedCreditCardNumber]  DEFAULT (''),
	[CardCVV2] [nvarchar](100) NOT NULL,
	[CardExpirationMonth] [nvarchar](100) NOT NULL,
	[CardExpirationYear] [nvarchar](100) NOT NULL,
	[PaymentMethodID] [int] NOT NULL,
	[PaymentMethodName] [nvarchar](100) NOT NULL,
	[AuthorizationTransactionID] [nvarchar](4000) NOT NULL,
	[AuthorizationTransactionCode] [nvarchar](4000) NOT NULL,
	[AuthorizationTransactionResult] [nvarchar](4000) NOT NULL,
	[CaptureTransactionID] [nvarchar](4000) NOT NULL,
	[CaptureTransactionResult] [nvarchar](4000) NOT NULL,
	[PurchaseOrderNumber] [nvarchar](100) NOT NULL,
	[PaymentStatusID] [int] NOT NULL,
	[BillingFirstName] [nvarchar](100) NOT NULL,
	[BillingLastName] [nvarchar](100) NOT NULL,
	[BillingPhoneNumber] [nvarchar](50) NOT NULL,
	[BillingEmail] [nvarchar](255) NOT NULL,
	[BillingFaxNumber] [nvarchar](50) NOT NULL,
	[BillingCompany] [nvarchar](100) NOT NULL,
	[BillingAddress1] [nvarchar](100) NOT NULL,
	[BillingAddress2] [nvarchar](100) NOT NULL,
	[BillingCity] [nvarchar](100) NOT NULL,
	[BillingStateProvince] [nvarchar](100) NOT NULL,
	[BillingStateProvinceID] [int] NOT NULL,
	[BillingZipPostalCode] [nvarchar](10) NOT NULL,
	[BillingCountry] [nvarchar](100) NOT NULL,
	[BillingCountryID] [int] NOT NULL,
	[ShippingStatusID] [int] NOT NULL,
	[ShippingFirstName] [nvarchar](100) NOT NULL,
	[ShippingLastName] [nvarchar](100) NOT NULL,
	[ShippingPhoneNumber] [nvarchar](50) NOT NULL,
	[ShippingEmail] [nvarchar](255) NOT NULL,
	[ShippingFaxNumber] [nvarchar](50) NOT NULL,
	[ShippingCompany] [nvarchar](100) NOT NULL,
	[ShippingAddress1] [nvarchar](100) NOT NULL,
	[ShippingAddress2] [nvarchar](100) NOT NULL,
	[ShippingCity] [nvarchar](100) NOT NULL,
	[ShippingStateProvince] [nvarchar](100) NOT NULL,
	[ShippingStateProvinceID] [int] NOT NULL,
	[ShippingZipPostalCode] [nvarchar](10) NOT NULL,
	[ShippingCountry] [nvarchar](100) NOT NULL,
	[ShippingCountryID] [int] NOT NULL,
	[ShippingMethod] [nvarchar](100) NOT NULL,
	[ShippingRateComputationMethodID] [int] NOT NULL,
	[ShippedDate] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK__Nop_Order__035179CE] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Order_AffiliateID] ON [dbo].[Nop_Order] 
(
	[AffiliateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Order_CreatedOn] ON [dbo].[Nop_Order] 
(
	[CreatedOn] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Order_CustomerID] ON [dbo].[Nop_Order] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_OrderNote](
	[OrderNoteID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[Note] [nvarchar](4000) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_OrderNote] PRIMARY KEY CLUSTERED 
(
	[OrderNoteID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_OrderNote_OrderID] ON [dbo].[Nop_OrderNote] 
(
	[OrderID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO









CREATE TABLE [dbo].[Nop_MessageTemplateLocalized](
	[MessageTemplateLocalizedID] [int] IDENTITY(1,1) NOT NULL,
	[MessageTemplateID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Subject] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Nop_MessageTemplateLocalized] PRIMARY KEY CLUSTERED 
(
	[MessageTemplateLocalizedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nop_MessageTemplateLocalized] ON [dbo].[Nop_MessageTemplateLocalized] 
(
	[LanguageID] ASC,
	[MessageTemplateID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_MessageTemplateLocalized_LanguageID] ON [dbo].[Nop_MessageTemplateLocalized] 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[ShortDescription] [ntext] NOT NULL,
	[FullDescription] [ntext] NOT NULL,
	[AdminComment] [ntext] NOT NULL,
	[ProductTypeID] [int] NOT NULL CONSTRAINT [DF_Nop_Product_ProductTypeID]  DEFAULT ((1)),
	[TemplateID] [int] NOT NULL,
	[ShowOnHomePage] [bit] NOT NULL,
	[MetaKeywords] [nvarchar](400) NOT NULL,
	[MetaDescription] [nvarchar](4000) NOT NULL,
	[MetaTitle] [nvarchar](400) NOT NULL,
	[SEName] [nvarchar](100) NOT NULL,
	[AllowCustomerReviews] [bit] NOT NULL,
	[AllowCustomerRatings] [bit] NOT NULL CONSTRAINT [DF_Nop_Product_AllowCustomerRatings]  DEFAULT ((1)),
	[RatingSum] [int] NOT NULL,
	[TotalRatingVotes] [int] NOT NULL,
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [Nop_Product_PK] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [ntext] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[MetaKeywords] [nvarchar](400) NOT NULL,
	[MetaDescription] [nvarchar](4000) NOT NULL,
	[MetaTitle] [nvarchar](400) NOT NULL,
	[SEName] [nvarchar](100) NOT NULL,
	[ParentCategoryID] [int] NOT NULL,
	[PictureID] [int] NOT NULL,
	[PageSize] [int] NOT NULL CONSTRAINT [DF_Nop_Category_PageSize]  DEFAULT ((10)),
	[PriceRanges] [nvarchar](400) NOT NULL CONSTRAINT [DF_Nop_Category_PriceRanges]  DEFAULT (''),
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Category_DisplayOrder] ON [dbo].[Nop_Category] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Category_ParentCategoryID] ON [dbo].[Nop_Category] 
(
	[ParentCategoryID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Description] [ntext] NOT NULL,
	[TemplateID] [int] NOT NULL,
	[MetaKeywords] [nvarchar](400) NOT NULL,
	[MetaDescription] [nvarchar](4000) NOT NULL,
	[MetaTitle] [nvarchar](400) NOT NULL,
	[SEName] [nvarchar](100) NOT NULL,
	[PictureID] [int] NOT NULL,
	[PageSize] [int] NOT NULL CONSTRAINT [DF_Nop_Manufacturer_PageSize]  DEFAULT ((10)),
	[PriceRanges] [nvarchar](400) NOT NULL CONSTRAINT [DF_Nop_Manufacturer_PriceRanges]  DEFAULT (''),
	[Published] [bit] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Manufacturer_DisplayOrder] ON [dbo].[Nop_Manufacturer] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_TopicLocalized](
	[TopicLocalizedID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Body] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL CONSTRAINT [DF_Nop_TopicLocalized_CreatedOn]  DEFAULT (getutcdate()),
	[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Nop_TopicLocalized_UpdatedOn]  DEFAULT (getutcdate()),
 CONSTRAINT [PK_Nop_TopicLocalized] PRIMARY KEY CLUSTERED 
(
	[TopicLocalizedID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_TopicLocalized_LanguageID] ON [dbo].[Nop_TopicLocalized] 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_Forums_Forum](
	[ForumID] [int] IDENTITY(1,1) NOT NULL,
	[ForumGroupID] [int] NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[NumTopics] [int] NOT NULL,
	[NumPosts] [int] NOT NULL,
	[LastTopicID] [int] NOT NULL,
	[LastPostID] [int] NOT NULL,
	[LastPostUserID] [int] NOT NULL,
	[LastPostTime] [datetime] NULL,
	[DisplayOrder] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_Forum] PRIMARY KEY CLUSTERED 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Forum_DisplayOrder] ON [dbo].[Nop_Forums_Forum] 
(
	[DisplayOrder] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Forum_ForumGroupID] ON [dbo].[Nop_Forums_Forum] 
(
	[ForumGroupID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_Forums_Topic](
	[TopicID] [int] IDENTITY(1,1) NOT NULL,
	[ForumID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[TopicTypeID] [int] NOT NULL,
	[Subject] [nvarchar](450) NOT NULL,
	[NumPosts] [int] NOT NULL,
	[Views] [int] NOT NULL,
	[LastPostID] [int] NOT NULL,
	[LastPostUserID] [int] NOT NULL,
	[LastPostTime] [datetime] NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_Topic] PRIMARY KEY CLUSTERED 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Topic_ForumID] ON [dbo].[Nop_Forums_Topic] 
(
	[ForumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_Forums_Post](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[TopicID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[IPAddress] [nvarchar](100) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_Forums_Post] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Post_TopicID] ON [dbo].[Nop_Forums_Post] 
(
	[TopicID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Forums_Post_UserID] ON [dbo].[Nop_Forums_Post] 
(
	[UserID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_BlogPost](
	[BlogPostID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[BlogPostTitle] [nvarchar](200) NOT NULL,
	[BlogPostBody] [nvarchar](max) NOT NULL,
	[BlogPostAllowComments] [bit] NOT NULL,
	[CreatedByID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_BlogPost] PRIMARY KEY CLUSTERED 
(
	[BlogPostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_BlogPost_LanguageID] ON [dbo].[Nop_BlogPost] 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





CREATE TABLE [dbo].[Nop_News](
	[NewsID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Short] [nvarchar](4000) NOT NULL,
	[Full] [nvarchar](max) NOT NULL,
	[Published] [bit] NOT NULL,
	[AllowComments] [bit] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_News] PRIMARY KEY CLUSTERED 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_News_LanguageID] ON [dbo].[Nop_News] 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_Poll](
	[PollID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Published] [bit] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[SystemKeyword] [nvarchar](400) NOT NULL CONSTRAINT [DF_Nop_Poll_SystemKeyword]  DEFAULT (''),
 CONSTRAINT [PK_Nop_Poll] PRIMARY KEY CLUSTERED 
(
	[PollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_LocaleStringResource](
	[LocaleStringResourceID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NOT NULL,
	[ResourceName] [nvarchar](200) NOT NULL,
	[ResourceValue] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Nop_LocaleStringResource] PRIMARY KEY CLUSTERED 
(
	[LocaleStringResourceID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Nop_LocaleStringResource] ON [dbo].[Nop_LocaleStringResource] 
(
	[LanguageID] ASC,
	[ResourceName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_LocaleStringResource_LanguageID] ON [dbo].[Nop_LocaleStringResource] 
(
	[LanguageID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_PollAnswer](
	[PollAnswerID] [int] IDENTITY(1,1) NOT NULL,
	[PollID] [int] NOT NULL,
	[Name] [nvarchar](400) NOT NULL,
	[Count] [int] NOT NULL,
	[DisplayOrder] [int] NOT NULL,
 CONSTRAINT [PK_Nop_PollAnswers] PRIMARY KEY CLUSTERED 
(
	[PollAnswerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_PollAnswer_PollID] ON [dbo].[Nop_PollAnswer] 
(
	[PollID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_PollVotingRecord](
	[PollVotingRecordID] [int] IDENTITY(1,1) NOT NULL,
	[PollAnswerID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
 CONSTRAINT [PK_Nop_PollVotingRecord] PRIMARY KEY CLUSTERED 
(
	[PollVotingRecordID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO









CREATE TABLE [dbo].[Nop_BlogComment](
	[BlogCommentID] [int] IDENTITY(1,1) NOT NULL,
	[BlogPostID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[CommentText] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_BlogComment] PRIMARY KEY CLUSTERED 
(
	[BlogCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_BlogComment_BlogPostID] ON [dbo].[Nop_BlogComment] 
(
	[BlogPostID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO







CREATE TABLE [dbo].[Nop_NewsComment](
	[NewsCommentID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[Title] [nvarchar](1000) NOT NULL,
	[Comment] [nvarchar](max) NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
 CONSTRAINT [PK_Nop_NewsComment] PRIMARY KEY CLUSTERED 
(
	[NewsCommentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_NewsComment_NewsID] ON [dbo].[Nop_NewsComment] 
(
	[NewsID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO






CREATE TABLE [dbo].[Nop_Discount](
	[DiscountID] [int] IDENTITY(1,1) NOT NULL,
	[DiscountTypeID] [int] NOT NULL,
	[DiscountRequirementID] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[UsePercentage] [bit] NOT NULL,
	[DiscountPercentage] [decimal](18, 4) NOT NULL,
	[DiscountAmount] [decimal](18, 4) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[RequiresCouponCode] [bit] NOT NULL,
	[CouponCode] [nvarchar](100) NOT NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [Nop_Discount_PK] PRIMARY KEY CLUSTERED 
(
	[DiscountID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO









CREATE TABLE [dbo].[Nop_CustomerAttribute](
	[CustomerAttributeId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Key] [nvarchar](100) NOT NULL,
	[Value] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_Nop_CustomerAttribute] PRIMARY KEY CLUSTERED 
(
	[CustomerAttributeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [IX_Nop_CustomerAttribute_Unique] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Key] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_CustomerAttribute_CustomerId] ON [dbo].[Nop_CustomerAttribute] 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO








CREATE TABLE [dbo].[Nop_Address](
	[AddressId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[IsBillingAddress] [bit] NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](255) NOT NULL,
	[FaxNumber] [nvarchar](50) NOT NULL,
	[Company] [nvarchar](100) NOT NULL,
	[Address1] [nvarchar](100) NOT NULL,
	[Address2] [nvarchar](100) NOT NULL,
	[City] [nvarchar](100) NOT NULL,
	[StateProvinceID] [int] NOT NULL,
	[ZipPostalCode] [nvarchar](10) NOT NULL,
	[CountryID] [int] NOT NULL,
	[CreatedOn] [datetime] NOT NULL,
	[UpdatedOn] [datetime] NOT NULL CONSTRAINT [DF_Nop_Address_UpdatedOn]  DEFAULT (getutcdate()),
 CONSTRAINT [Nop_Address_PK] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Nop_Address_CustomerID] ON [dbo].[Nop_Address] 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON, FILLFACTOR = 80) ON [PRIMARY]
GO





ALTER TABLE [dbo].[Nop_ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [CK_Nop_ShoppingCart_Quantity] CHECK  (([quantity]>(0)))
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem] CHECK CONSTRAINT [CK_Nop_ShoppingCart_Quantity]
GO
ALTER TABLE [dbo].[Nop_Address]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Address_Nop_Customer1] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Address] CHECK CONSTRAINT [FK_Nop_Address_Nop_Customer1]
GO
ALTER TABLE [dbo].[Nop_BlogComment]  WITH CHECK ADD  CONSTRAINT [FK_Nop_BlogComment_Nop_BlogPost] FOREIGN KEY([BlogPostID])
REFERENCES [dbo].[Nop_BlogPost] ([BlogPostID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_BlogComment] CHECK CONSTRAINT [FK_Nop_BlogComment_Nop_BlogPost]
GO
ALTER TABLE [dbo].[Nop_BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_Nop_BlogPost_Nop_Customer] FOREIGN KEY([CreatedByID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_BlogPost] CHECK CONSTRAINT [FK_Nop_BlogPost_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_BlogPost]  WITH CHECK ADD  CONSTRAINT [FK_Nop_BlogPost_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_BlogPost] CHECK CONSTRAINT [FK_Nop_BlogPost_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_Category]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Category_Nop_CategoryTemplate] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Nop_CategoryTemplate] ([CategoryTemplateId])
GO
ALTER TABLE [dbo].[Nop_Category] CHECK CONSTRAINT [FK_Nop_Category_Nop_CategoryTemplate]
GO
ALTER TABLE [dbo].[Nop_Customer_CustomerRole_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Customer_CustomerRole_Mapping_Nop_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Customer_CustomerRole_Mapping] CHECK CONSTRAINT [FK_Nop_Customer_CustomerRole_Mapping_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_Customer_CustomerRole_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Customer_CustomerRole_Mapping_Nop_CustomerRole] FOREIGN KEY([CustomerRoleID])
REFERENCES [dbo].[Nop_CustomerRole] ([CustomerRoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Customer_CustomerRole_Mapping] CHECK CONSTRAINT [FK_Nop_Customer_CustomerRole_Mapping_Nop_CustomerRole]
GO
ALTER TABLE [dbo].[Nop_CustomerAttribute]  WITH CHECK ADD  CONSTRAINT [FK_Nop_CustomerAttribute_Nop_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_CustomerAttribute] CHECK CONSTRAINT [FK_Nop_CustomerAttribute_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_Discount]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Discount_Nop_DiscountRequirement] FOREIGN KEY([DiscountRequirementID])
REFERENCES [dbo].[Nop_DiscountRequirement] ([DiscountRequirementID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Discount] CHECK CONSTRAINT [FK_Nop_Discount_Nop_DiscountRequirement]
GO
ALTER TABLE [dbo].[Nop_Discount]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Discount_Nop_DiscountType] FOREIGN KEY([DiscountTypeID])
REFERENCES [dbo].[Nop_DiscountType] ([DiscountTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Discount] CHECK CONSTRAINT [FK_Nop_Discount_Nop_DiscountType]
GO
ALTER TABLE [dbo].[Nop_Forums_Forum]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Forums_Forum_Nop_Forums_Group] FOREIGN KEY([ForumGroupID])
REFERENCES [dbo].[Nop_Forums_Group] ([ForumGroupID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Forums_Forum] CHECK CONSTRAINT [FK_Nop_Forums_Forum_Nop_Forums_Group]
GO
ALTER TABLE [dbo].[Nop_Forums_Post]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Forums_Post_Nop_Forums_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Nop_Forums_Topic] ([TopicID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Forums_Post] CHECK CONSTRAINT [FK_Nop_Forums_Post_Nop_Forums_Topic]
GO
ALTER TABLE [dbo].[Nop_Forums_Topic]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Forums_Topic_Nop_Forums_Forum] FOREIGN KEY([ForumID])
REFERENCES [dbo].[Nop_Forums_Forum] ([ForumID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Forums_Topic] CHECK CONSTRAINT [FK_Nop_Forums_Topic_Nop_Forums_Forum]
GO
ALTER TABLE [dbo].[Nop_LocaleStringResource]  WITH CHECK ADD  CONSTRAINT [FK_Nop_LocaleStringResource_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_LocaleStringResource] CHECK CONSTRAINT [FK_Nop_LocaleStringResource_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_Log]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Log_Nop_LogType] FOREIGN KEY([LogTypeID])
REFERENCES [dbo].[Nop_LogType] ([LogTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Log] CHECK CONSTRAINT [FK_Nop_Log_Nop_LogType]
GO
ALTER TABLE [dbo].[Nop_Manufacturer]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Manufacturer_Nop_ManufacturerTemplate] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Nop_ManufacturerTemplate] ([ManufacturerTemplateId])
GO
ALTER TABLE [dbo].[Nop_Manufacturer] CHECK CONSTRAINT [FK_Nop_Manufacturer_Nop_ManufacturerTemplate]
GO
ALTER TABLE [dbo].[Nop_MessageTemplateLocalized]  WITH CHECK ADD  CONSTRAINT [FK_Nop_MessageTemplateLocalized_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_MessageTemplateLocalized] CHECK CONSTRAINT [FK_Nop_MessageTemplateLocalized_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_MessageTemplateLocalized]  WITH CHECK ADD  CONSTRAINT [FK_Nop_MessageTemplateLocalized_Nop_MessageTemplate] FOREIGN KEY([MessageTemplateID])
REFERENCES [dbo].[Nop_MessageTemplate] ([MessageTemplateID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_MessageTemplateLocalized] CHECK CONSTRAINT [FK_Nop_MessageTemplateLocalized_Nop_MessageTemplate]
GO
ALTER TABLE [dbo].[Nop_News]  WITH CHECK ADD  CONSTRAINT [FK_Nop_News_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_News] CHECK CONSTRAINT [FK_Nop_News_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_NewsComment]  WITH CHECK ADD  CONSTRAINT [FK_Nop_NewsComment_Nop_News] FOREIGN KEY([NewsID])
REFERENCES [dbo].[Nop_News] ([NewsID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_NewsComment] CHECK CONSTRAINT [FK_Nop_NewsComment_Nop_News]
GO
ALTER TABLE [dbo].[Nop_Order]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Order_Nop_OrderStatus] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[Nop_OrderStatus] ([OrderStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Order] CHECK CONSTRAINT [FK_Nop_Order_Nop_OrderStatus]
GO
ALTER TABLE [dbo].[Nop_Order]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Order_Nop_PaymentStatus] FOREIGN KEY([PaymentStatusID])
REFERENCES [dbo].[Nop_PaymentStatus] ([PaymentStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Order] CHECK CONSTRAINT [FK_Nop_Order_Nop_PaymentStatus]
GO
ALTER TABLE [dbo].[Nop_Order]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Order_Nop_ShippingStatus] FOREIGN KEY([ShippingStatusID])
REFERENCES [dbo].[Nop_ShippingStatus] ([ShippingStatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Order] CHECK CONSTRAINT [FK_Nop_Order_Nop_ShippingStatus]
GO
ALTER TABLE [dbo].[Nop_OrderNote]  WITH CHECK ADD  CONSTRAINT [FK_Nop_OrderNote_Nop_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Nop_Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_OrderNote] CHECK CONSTRAINT [FK_Nop_OrderNote_Nop_Order]
GO
ALTER TABLE [dbo].[Nop_OrderProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_Nop_OrderProductVariant_Nop_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Nop_Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_OrderProductVariant] CHECK CONSTRAINT [FK_Nop_OrderProductVariant_Nop_Order]
GO
ALTER TABLE [dbo].[Nop_OrderProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_Nop_OrderProductVariant_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
GO
ALTER TABLE [dbo].[Nop_OrderProductVariant] CHECK CONSTRAINT [FK_Nop_OrderProductVariant_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_Poll]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Poll_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Poll] CHECK CONSTRAINT [FK_Nop_Poll_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_PollAnswer]  WITH CHECK ADD  CONSTRAINT [FK_Nop_PollAnswer_Nop_Poll] FOREIGN KEY([PollID])
REFERENCES [dbo].[Nop_Poll] ([PollID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_PollAnswer] CHECK CONSTRAINT [FK_Nop_PollAnswer_Nop_Poll]
GO
ALTER TABLE [dbo].[Nop_PollVotingRecord]  WITH CHECK ADD  CONSTRAINT [FK_Nop_PollVotingRecord_Nop_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_PollVotingRecord] CHECK CONSTRAINT [FK_Nop_PollVotingRecord_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_PollVotingRecord]  WITH CHECK ADD  CONSTRAINT [FK_Nop_PollVotingRecord_Nop_PollAnswer] FOREIGN KEY([PollAnswerID])
REFERENCES [dbo].[Nop_PollAnswer] ([PollAnswerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_PollVotingRecord] CHECK CONSTRAINT [FK_Nop_PollVotingRecord_Nop_PollAnswer]
GO
ALTER TABLE [dbo].[Nop_Product]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Nop_ProductTemplate] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Nop_ProductTemplate] ([ProductTemplateId])
GO
ALTER TABLE [dbo].[Nop_Product] CHECK CONSTRAINT [FK_Nop_Product_Nop_ProductTemplate]
GO
ALTER TABLE [dbo].[Nop_Product]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Nop_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[Nop_ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Nop_Product] CHECK CONSTRAINT [FK_Nop_Product_Nop_ProductType]
GO
ALTER TABLE [dbo].[Nop_Product_Category_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Category_Mapping_Nop_Category1] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Nop_Category] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_Category_Mapping] CHECK CONSTRAINT [FK_Nop_Product_Category_Mapping_Nop_Category1]
GO
ALTER TABLE [dbo].[Nop_Product_Category_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Category_Mapping_Nop_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_Category_Mapping] CHECK CONSTRAINT [FK_Nop_Product_Category_Mapping_Nop_Product1]
GO
ALTER TABLE [dbo].[Nop_Product_Manufacturer_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Manufacturer_Mapping_Nop_Manufacturer1] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Nop_Manufacturer] ([ManufacturerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_Manufacturer_Mapping] CHECK CONSTRAINT [FK_Nop_Product_Manufacturer_Mapping_Nop_Manufacturer1]
GO
ALTER TABLE [dbo].[Nop_Product_Manufacturer_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_Manufacturer_Mapping_Nop_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_Manufacturer_Mapping] CHECK CONSTRAINT [FK_Nop_Product_Manufacturer_Mapping_Nop_Product1]
GO
ALTER TABLE [dbo].[Nop_Product_SpecificationAttribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_SpecificationAttribute_Mapping_Nop_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_SpecificationAttribute_Mapping] CHECK CONSTRAINT [FK_Nop_Product_SpecificationAttribute_Mapping_Nop_Product]
GO
ALTER TABLE [dbo].[Nop_Product_SpecificationAttribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_Product_SpecificationAttribute_Mapping_Nop_SpecificationAttributeOption] FOREIGN KEY([SpecificationAttributeOptionID])
REFERENCES [dbo].[Nop_SpecificationAttributeOption] ([SpecificationAttributeOptionID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_Product_SpecificationAttribute_Mapping] CHECK CONSTRAINT [FK_Nop_Product_SpecificationAttribute_Mapping_Nop_SpecificationAttributeOption]
GO
ALTER TABLE [dbo].[Nop_ProductPicture]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductPicture_Nop_Picture] FOREIGN KEY([PictureID])
REFERENCES [dbo].[Nop_Picture] ([PictureID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductPicture] CHECK CONSTRAINT [FK_Nop_ProductPicture_Nop_Picture]
GO
ALTER TABLE [dbo].[Nop_ProductPicture]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductPicture_Nop_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductPicture] CHECK CONSTRAINT [FK_Nop_ProductPicture_Nop_Product]
GO
ALTER TABLE [dbo].[Nop_ProductRating]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductRating_Nop_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductRating] CHECK CONSTRAINT [FK_Nop_ProductRating_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_ProductRating]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductRating_Nop_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductRating] CHECK CONSTRAINT [FK_Nop_ProductRating_Nop_Product]
GO
ALTER TABLE [dbo].[Nop_ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductReview_Nop_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Nop_Customer] ([CustomerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductReview] CHECK CONSTRAINT [FK_Nop_ProductReview_Nop_Customer]
GO
ALTER TABLE [dbo].[Nop_ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductReview_Nop_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductReview] CHECK CONSTRAINT [FK_Nop_ProductReview_Nop_Product1]
GO
ALTER TABLE [dbo].[Nop_ProductReviewHelpfulness]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductReviewHelpfulness_Nop_ProductReview] FOREIGN KEY([ProductReviewID])
REFERENCES [dbo].[Nop_ProductReview] ([ProductReviewID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductReviewHelpfulness] CHECK CONSTRAINT [FK_Nop_ProductReviewHelpfulness_Nop_ProductReview]
GO
ALTER TABLE [dbo].[Nop_ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Nop_LowStockActivity] FOREIGN KEY([LowStockActivityID])
REFERENCES [dbo].[Nop_LowStockActivity] ([LowStockActivityID])
GO
ALTER TABLE [dbo].[Nop_ProductVariant] CHECK CONSTRAINT [FK_Nop_ProductVariant_Nop_LowStockActivity]
GO
ALTER TABLE [dbo].[Nop_ProductVariant]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Nop_Product1] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant] CHECK CONSTRAINT [FK_Nop_ProductVariant_Nop_Product1]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Discount_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Discount_Mapping_Nop_Discount] FOREIGN KEY([DiscountID])
REFERENCES [dbo].[Nop_Discount] ([DiscountID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Discount_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_Discount_Mapping_Nop_Discount]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Discount_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Discount_Mapping_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Discount_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_Discount_Mapping_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Pricelist_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Pricelist_Mapping_Nop_Pricelist] FOREIGN KEY([PricelistID])
REFERENCES [dbo].[Nop_Pricelist] ([PricelistID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Pricelist_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_Pricelist_Mapping_Nop_Pricelist]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Pricelist_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_Pricelist_Mapping_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_Pricelist_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_Pricelist_Mapping_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_ProductAttribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_ProductAttribute_Mapping_Nop_ProductAttribute] FOREIGN KEY([ProductAttributeID])
REFERENCES [dbo].[Nop_ProductAttribute] ([ProductAttributeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_ProductAttribute_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_ProductAttribute_Mapping_Nop_ProductAttribute]
GO
ALTER TABLE [dbo].[Nop_ProductVariant_ProductAttribute_Mapping]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariant_ProductAttribute_Mapping_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariant_ProductAttribute_Mapping] CHECK CONSTRAINT [FK_Nop_ProductVariant_ProductAttribute_Mapping_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_ProductVariantAttributeValue]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ProductVariantAttributeValue_Nop_ProductVariant_ProductAttribute_Mapping] FOREIGN KEY([ProductVariantAttributeID])
REFERENCES [dbo].[Nop_ProductVariant_ProductAttribute_Mapping] ([ProductVariantAttributeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ProductVariantAttributeValue] CHECK CONSTRAINT [FK_Nop_ProductVariantAttributeValue_Nop_ProductVariant_ProductAttribute_Mapping]
GO
ALTER TABLE [dbo].[Nop_RelatedProduct]  WITH CHECK ADD  CONSTRAINT [FK_Nop_RelatedProduct_Nop_Product] FOREIGN KEY([ProductID1])
REFERENCES [dbo].[Nop_Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_RelatedProduct] CHECK CONSTRAINT [FK_Nop_RelatedProduct_Nop_Product]
GO
ALTER TABLE [dbo].[Nop_ShippingByTotal]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingByTotal_Nop_ShippingMethod] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Nop_ShippingMethod] ([ShippingMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingByTotal] CHECK CONSTRAINT [FK_Nop_ShippingByTotal_Nop_ShippingMethod]
GO
ALTER TABLE [dbo].[Nop_ShippingByWeight]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingByWeight_Nop_ShippingMethod] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Nop_ShippingMethod] ([ShippingMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingByWeight] CHECK CONSTRAINT [FK_Nop_ShippingByWeight_Nop_ShippingMethod]
GO
ALTER TABLE [dbo].[Nop_ShippingByWeightAndCountry]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingByWeightAndCountry_Nop_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Nop_Country] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingByWeightAndCountry] CHECK CONSTRAINT [FK_Nop_ShippingByWeightAndCountry_Nop_Country]
GO
ALTER TABLE [dbo].[Nop_ShippingByWeightAndCountry]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingByWeightAndCountry_Nop_ShippingMethod] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Nop_ShippingMethod] ([ShippingMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingByWeightAndCountry] CHECK CONSTRAINT [FK_Nop_ShippingByWeightAndCountry_Nop_ShippingMethod]
GO
ALTER TABLE [dbo].[Nop_ShippingMethod_RestrictedCountries]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingMethod_RestrictedCountries_Nop_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Nop_Country] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingMethod_RestrictedCountries] CHECK CONSTRAINT [FK_Nop_ShippingMethod_RestrictedCountries_Nop_Country]
GO
ALTER TABLE [dbo].[Nop_ShippingMethod_RestrictedCountries]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShippingMethod_RestrictedCountries_Nop_ShippingMethod] FOREIGN KEY([ShippingMethodID])
REFERENCES [dbo].[Nop_ShippingMethod] ([ShippingMethodID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShippingMethod_RestrictedCountries] CHECK CONSTRAINT [FK_Nop_ShippingMethod_RestrictedCountries_Nop_ShippingMethod]
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShoppingCart_Nop_CustomerSession] FOREIGN KEY([CustomerSessionGUID])
REFERENCES [dbo].[Nop_CustomerSession] ([CustomerSessionGUID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem] CHECK CONSTRAINT [FK_Nop_ShoppingCart_Nop_CustomerSession]
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShoppingCart_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem] CHECK CONSTRAINT [FK_Nop_ShoppingCart_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem]  WITH CHECK ADD  CONSTRAINT [FK_Nop_ShoppingCart_Nop_ShoppingCartType] FOREIGN KEY([ShoppingCartTypeID])
REFERENCES [dbo].[Nop_ShoppingCartType] ([ShoppingCartTypeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_ShoppingCartItem] CHECK CONSTRAINT [FK_Nop_ShoppingCart_Nop_ShoppingCartType]
GO
ALTER TABLE [dbo].[Nop_SpecificationAttributeOption]  WITH CHECK ADD  CONSTRAINT [FK_Nop_SpecificationAttributeOption_Nop_SpecificationAttribute] FOREIGN KEY([SpecificationAttributeID])
REFERENCES [dbo].[Nop_SpecificationAttribute] ([SpecificationAttributeID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_SpecificationAttributeOption] CHECK CONSTRAINT [FK_Nop_SpecificationAttributeOption_Nop_SpecificationAttribute]
GO
ALTER TABLE [dbo].[Nop_StateProvince]  WITH CHECK ADD  CONSTRAINT [FK_Nop_StateProvince_Nop_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Nop_Country] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_StateProvince] CHECK CONSTRAINT [FK_Nop_StateProvince_Nop_Country]
GO
ALTER TABLE [dbo].[Nop_TaxRate]  WITH CHECK ADD  CONSTRAINT [FK_Nop_TaxRate_Nop_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Nop_Country] ([CountryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_TaxRate] CHECK CONSTRAINT [FK_Nop_TaxRate_Nop_Country]
GO
ALTER TABLE [dbo].[Nop_TaxRate]  WITH CHECK ADD  CONSTRAINT [FK_Nop_TaxRate_Nop_TaxCategory] FOREIGN KEY([TaxCategoryID])
REFERENCES [dbo].[Nop_TaxCategory] ([TaxCategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_TaxRate] CHECK CONSTRAINT [FK_Nop_TaxRate_Nop_TaxCategory]
GO
ALTER TABLE [dbo].[Nop_TierPrice]  WITH CHECK ADD  CONSTRAINT [FK_Nop_TierPrice_Nop_ProductVariant] FOREIGN KEY([ProductVariantID])
REFERENCES [dbo].[Nop_ProductVariant] ([ProductVariantId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_TierPrice] CHECK CONSTRAINT [FK_Nop_TierPrice_Nop_ProductVariant]
GO
ALTER TABLE [dbo].[Nop_TopicLocalized]  WITH CHECK ADD  CONSTRAINT [FK_Nop_TopicLocalized_Nop_Language] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Nop_Language] ([LanguageId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_TopicLocalized] CHECK CONSTRAINT [FK_Nop_TopicLocalized_Nop_Language]
GO
ALTER TABLE [dbo].[Nop_TopicLocalized]  WITH CHECK ADD  CONSTRAINT [FK_Nop_TopicLocalized_Nop_Topic] FOREIGN KEY([TopicID])
REFERENCES [dbo].[Nop_Topic] ([TopicID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Nop_TopicLocalized] CHECK CONSTRAINT [FK_Nop_TopicLocalized_Nop_Topic]
GO
























CREATE FUNCTION [dbo].[NOP_splitstring_to_table]
(
    @string NVARCHAR(1000),
    @delimiter CHAR(1)
)
RETURNS @output TABLE(
    data NVARCHAR(256)
)
BEGIN
    DECLARE @start INT, @end INT
    SELECT @start = 1, @end = CHARINDEX(@delimiter, @string)

    WHILE @start < LEN(@string) + 1 BEGIN
        IF @end = 0 
            SET @end = LEN(@string) + 1

        INSERT INTO @output (data) 
        VALUES(SUBSTRING(@string, @start, @end - @start))
        SET @start = @end + 1
        SET @end = CHARINDEX(@delimiter, @string, @start)
    END
    RETURN
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerUpdateCounts]
(
	@CustomerID int
)
AS
BEGIN

	DECLARE @NumPosts int

	SELECT 
		@NumPosts = COUNT(1)
	FROM
		[Nop_Forums_Post] fp
	WHERE
		fp.UserID = @CustomerID

	SET @NumPosts = isnull(@NumPosts, 0)
	
	SET NOCOUNT ON
	UPDATE 
		[Nop_Customer]
	SET
		[TotalForumPosts] = @NumPosts
	WHERE
		CustomerID = @CustomerID
END
GO





CREATE PROCEDURE [dbo].[Nop_Forums_ForumUpdateCounts]
(
	@ForumID int
)
AS
BEGIN

	DECLARE @NumTopics int
	DECLARE @NumPosts int
	DECLARE @LastTopicID int
	DECLARE @LastPostID int
	DECLARE @LastPostUserID int
	DECLARE @LastPostTime datetime

	SELECT 
		@NumTopics =COUNT(1) 
	FROM [Nop_Forums_Topic]
	WHERE [ForumID] = @ForumID

	SELECT 
		@NumPosts = COUNT(1)
	FROM
		[Nop_Forums_Topic] ft
		INNER JOIN [Nop_Forums_Post] fp on ft.TopicID=fp.TopicID
	WHERE
		ft.ForumID = @ForumID


	SELECT TOP 1
		@LastTopicID = ft.TopicID,
		@LastPostID = fp.PostID,
		@LastPostUserID = fp.UserID,
		@LastPostTime = fp.CreatedOn
	FROM
		[Nop_Forums_Topic] ft
		LEFT OUTER JOIN [Nop_Forums_Post] fp on ft.TopicID=fp.TopicID
	WHERE
		ft.ForumID = @ForumID
	ORDER BY fp.CreatedOn desc, ft.CreatedOn desc

	SET @NumTopics = isnull(@NumTopics, 0)
	SET @NumPosts = isnull(@NumPosts, 0)
	SET @LastTopicID = isnull(@LastTopicID, 0)
	SET @LastPostID = isnull(@LastPostID, 0)
	SET @LastPostUserID = isnull(@LastPostUserID, 0)

	SET NOCOUNT ON
	UPDATE 
		[Nop_Forums_Forum]
	SET
		[NumTopics] = @NumTopics,
		[NumPosts] = @NumPosts,
		[LastTopicID] = @LastTopicID,
		[LastPostID] = @LastPostID,
		[LastPostUserID] = @LastPostUserID,
		[LastPostTime] = @LastPostTime
	WHERE
		ForumID = @ForumID
END
GO







CREATE PROCEDURE [dbo].[Nop_Forums_TopicUpdateCounts]
(
	@TopicID int
)
AS
BEGIN

	DECLARE @NumPosts int
	DECLARE @LastPostID int
	DECLARE @LastPostUserID int
	DECLARE @LastPostTime datetime

	SELECT 
		@NumPosts = COUNT(1)
	FROM
		[Nop_Forums_Post] fp
	WHERE
		fp.TopicID = @TopicID


	SELECT TOP 1
		@LastPostID = fp.PostID,
		@LastPostUserID = fp.UserID,
		@LastPostTime = fp.CreatedOn
	FROM [Nop_Forums_Post] fp
	WHERE
		fp.TopicID = @TopicID
	ORDER BY fp.CreatedOn desc

	SET @NumPosts = isnull(@NumPosts, 0)
	SET @LastPostID = isnull(@LastPostID, 0)
	SET @LastPostUserID = isnull(@LastPostUserID, 0)

	SET NOCOUNT ON
	UPDATE 
		[Nop_Forums_Topic]
	SET
		[NumPosts] = @NumPosts,
		[LastPostID] = @LastPostID,
		[LastPostUserID] = @LastPostUserID,
		[LastPostTime] = @LastPostTime
	WHERE
		TopicID = @TopicID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShoppingCartItemInsert]
(
	@ShoppingCartItemID int = NULL output,
	@ShoppingCartTypeID int,
	@CustomerSessionGUID uniqueidentifier,
	@ProductVariantID int,
	@AttributesXML XML,
	@Quantity int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_ShoppingCartItem]
	(
		ShoppingCartTypeID,
		CustomerSessionGUID,
		ProductVariantID,
		AttributesXML,
		Quantity,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@ShoppingCartTypeID,
		@CustomerSessionGUID,
		@ProductVariantID,
		@AttributesXML,
		@Quantity,
		@CreatedOn,
		@UpdatedOn
	)

	set @ShoppingCartItemID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShoppingCartItemUpdate]
(
	@ShoppingCartItemID int,
	@ShoppingCartTypeID int,
	@CustomerSessionGUID uniqueidentifier,
	@ProductVariantID int,
	@AttributesXML XML,
	@Quantity int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_ShoppingCartItem]
	SET
			ShoppingCartTypeID=@ShoppingCartTypeID,
			CustomerSessionGUID=@CustomerSessionGUID,
			ProductVariantID=@ProductVariantID,	
			AttributesXML=@AttributesXML,
			Quantity=@Quantity,
			CreatedOn=@CreatedOn,
			UpdatedOn=@UpdatedOn
	WHERE
		ShoppingCartItemID = @ShoppingCartItemID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderProductVariantInsert]
(
	@OrderProductVariantID int = NULL output,
	@OrderID int,
	@ProductVariantID int,
	@UnitPriceInclTax money,
	@UnitPriceExclTax money,
	@PriceInclTax money,
	@PriceExclTax money,
	@UnitPriceInclTaxInCustomerCurrency money,
	@UnitPriceExclTaxInCustomerCurrency money,
	@PriceInclTaxInCustomerCurrency money,
	@PriceExclTaxInCustomerCurrency money,
	@AttributeDescription nvarchar(4000),
	@Quantity int,
	@DiscountAmountInclTax decimal (18, 4),
	@DiscountAmountExclTax decimal (18, 4),
	@DownloadCount int
)
AS
BEGIN
	INSERT
	INTO [Nop_OrderProductVariant]
	(
		OrderID,
		ProductVariantID,
		UnitPriceInclTax,
		UnitPriceExclTax,
		PriceInclTax,
		PriceExclTax,
		UnitPriceInclTaxInCustomerCurrency,
		UnitPriceExclTaxInCustomerCurrency,
		PriceInclTaxInCustomerCurrency,
		PriceExclTaxInCustomerCurrency,
		AttributeDescription,
		Quantity,
		DiscountAmountInclTax,
		DiscountAmountExclTax,
		DownloadCount
	)
	VALUES
	(
		@OrderID,
		@ProductVariantID,
		@UnitPriceInclTax,
		@UnitPriceExclTax,
		@PriceInclTax,
		@PriceExclTax,
		@UnitPriceInclTaxInCustomerCurrency,
		@UnitPriceExclTaxInCustomerCurrency,
		@PriceInclTaxInCustomerCurrency,
		@PriceExclTaxInCustomerCurrency,
		@AttributeDescription,
		@Quantity,
		@DiscountAmountInclTax,
		@DiscountAmountExclTax,
		@DownloadCount
	)

	set @OrderProductVariantID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderProductVariantUpdate]
(
	@OrderProductVariantID int,
	@OrderID int,
	@ProductVariantID int,
	@UnitPriceInclTax money,
	@UnitPriceExclTax money,
	@PriceInclTax money,
	@PriceExclTax money,
	@UnitPriceInclTaxInCustomerCurrency money,
	@UnitPriceExclTaxInCustomerCurrency money,
	@PriceInclTaxInCustomerCurrency money,
	@PriceExclTaxInCustomerCurrency money,
	@AttributeDescription nvarchar(4000),
	@Quantity int,
	@DiscountAmountInclTax decimal (18, 4),
	@DiscountAmountExclTax decimal (18, 4),
	@DownloadCount int
)
AS
BEGIN

	UPDATE [Nop_OrderProductVariant]
	SET		
		OrderID=@OrderID,
		ProductVariantID=@ProductVariantID,
		UnitPriceInclTax=@UnitPriceInclTax,
		UnitPriceExclTax = @UnitPriceExclTax,
		PriceInclTax=@PriceInclTax,
		PriceExclTax=@PriceExclTax,
		UnitPriceInclTaxInCustomerCurrency=@UnitPriceInclTaxInCustomerCurrency,
		UnitPriceExclTaxInCustomerCurrency=@UnitPriceExclTaxInCustomerCurrency,
		PriceInclTaxInCustomerCurrency=@PriceInclTaxInCustomerCurrency,
		PriceExclTaxInCustomerCurrency=@PriceExclTaxInCustomerCurrency,
		AttributeDescription=@AttributeDescription,
		Quantity=@Quantity,
		DiscountAmountInclTax=@DiscountAmountInclTax,
		DiscountAmountExclTax=@DiscountAmountExclTax,
		DownloadCount=@DownloadCount
	WHERE
		OrderProductVariantID = @OrderProductVariantID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_ProductAttribute_MappingInsert]
(
	@ProductVariantAttributeID int = NULL output,
	@ProductVariantID int,
	@ProductAttributeID int,
	@TextPrompt nvarchar(200),
	@IsRequired bit,
	@AttributeControlTypeID int,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductVariant_ProductAttribute_Mapping]
	(
		ProductVariantID,
		ProductAttributeID,
		TextPrompt,
		IsRequired,
		AttributeControlTypeID,
		DisplayOrder
	)
	VALUES
	(
		@ProductVariantID,
		@ProductAttributeID,
		@TextPrompt,
		@IsRequired,
		@AttributeControlTypeID,
		@DisplayOrder
	)

	set @ProductVariantAttributeID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_ProductAttribute_MappingUpdate]
(
	@ProductVariantAttributeID int,
	@ProductVariantID int,
	@ProductAttributeID int,
	@TextPrompt nvarchar(200),
	@IsRequired bit,
	@AttributeControlTypeID int,
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_ProductVariant_ProductAttribute_Mapping]
	SET
		ProductVariantID=@ProductVariantID,
		ProductAttributeID=@ProductAttributeID,
		TextPrompt=@TextPrompt,
		IsRequired=@IsRequired,
		AttributeControlTypeID=@AttributeControlTypeID,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductVariantAttributeID = @ProductVariantAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantInsert]
(
    @ProductVariantID int = NULL output,
    @ProductId int,
    @Name nvarchar(400),
    @SKU nvarchar (400),
    @Description nvarchar(4000),
    @AdminComment nvarchar(4000),
    @ManufacturerPartNumber nvarchar(100),
    @IsDownload bit,
    @DownloadID int,
	@UnlimitedDownloads bit,
	@MaxNumberOfDownloads int,
	@HasSampleDownload bit,
	@SampleDownloadID int,
    @IsShipEnabled bit,
    @IsFreeShipping bit,
	@AdditionalShippingCharge money,
    @IsTaxExempt bit,
    @TaxCategoryID int,
	@ManageInventory bit,
    @StockQuantity int,
    @MinStockQuantity int,
    @LowStockActivityID int,
	@NotifyAdminForQuantityBelow int,
	@OrderMinimumQuantity int,
	@OrderMaximumQuantity int,
    @WarehouseId int,
    @DisableBuyButton int,
    @Price money,
    @OldPrice money,
    @Weight float,
    @Length decimal(18, 4),
    @Width decimal(18, 4),
    @Height decimal(18, 4),
    @PictureID int,
	@AvailableStartDateTime datetime,
	@AvailableEndDateTime datetime,
    @Published bit,
    @Deleted bit,
    @DisplayOrder int,
	@CreatedOn datetime,
    @UpdatedOn datetime
)
AS
BEGIN
    INSERT
    INTO [Nop_ProductVariant]
    (
        ProductId,
        [Name],
        SKU,
        [Description],
        AdminComment,
        ManufacturerPartNumber,
        IsDownload,
        DownloadID,
		UnlimitedDownloads,
		MaxNumberOfDownloads,
		HasSampleDownload,
		SampleDownloadID,
        IsShipEnabled,
        IsFreeShipping,
		AdditionalShippingCharge,
        IsTaxExempt,
        TaxCategoryID,
		ManageInventory,
        StockQuantity,
        MinStockQuantity,
        LowStockActivityID,
		NotifyAdminForQuantityBelow,
		OrderMinimumQuantity,
		OrderMaximumQuantity,
        WarehouseId,
        DisableBuyButton,
        Price,
        OldPrice,
        Weight,
        [Length],
        Width,
        Height,
        PictureID,
		AvailableStartDateTime,
		AvailableEndDateTime,
        Published,
        Deleted,
        DisplayOrder,
        CreatedOn,
        UpdatedOn
    )
    VALUES
    (
        @ProductId,
        @Name,
        @SKU,
        @Description,
        @AdminComment,
        @ManufacturerPartNumber,
        @IsDownload,
        @DownloadID,
		@UnlimitedDownloads,
		@MaxNumberOfDownloads,
		@HasSampleDownload,
		@SampleDownloadID,
        @IsShipEnabled,
        @IsFreeShipping,
		@AdditionalShippingCharge,
        @IsTaxExempt,
        @TaxCategoryID,
		@ManageInventory,
        @StockQuantity,
        @MinStockQuantity,
        @LowStockActivityID,
		@NotifyAdminForQuantityBelow,
		@OrderMinimumQuantity,
		@OrderMaximumQuantity,
        @WarehouseId,
        @DisableBuyButton,
        @Price,
        @OldPrice,
        @Weight,
        @Length,
        @Width,
        @Height,
        @PictureID,
		@AvailableStartDateTime,
		@AvailableEndDateTime,
        @Published,
        @Deleted,
        @DisplayOrder,
        @CreatedOn,
        @UpdatedOn
    )

    set @ProductVariantID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantUpdate]
(
	@ProductVariantID int,
	@ProductId int,
	@Name nvarchar(400),
	@SKU nvarchar (400),
	@Description nvarchar(4000),
	@AdminComment nvarchar(4000),
	@ManufacturerPartNumber nvarchar(100),
	@IsDownload bit,
	@DownloadID int,
	@UnlimitedDownloads bit,
	@MaxNumberOfDownloads int,
	@HasSampleDownload bit,
	@SampleDownloadID int,
	@IsShipEnabled bit,
	@IsFreeShipping bit,
	@AdditionalShippingCharge money,
	@IsTaxExempt bit,
	@TaxCategoryID int,
	@ManageInventory bit,
	@StockQuantity int,
	@MinStockQuantity int,
	@LowStockActivityID int,
	@NotifyAdminForQuantityBelow int,
	@OrderMinimumQuantity int,
	@OrderMaximumQuantity int,
	@WarehouseId int,
	@DisableBuyButton bit,
	@Price money,
	@OldPrice money,
	@Weight float,
	@Length decimal(18, 4),
	@Width decimal(18, 4),
	@Height decimal(18, 4),
	@PictureID int,
	@AvailableStartDateTime datetime,
	@AvailableEndDateTime datetime,
	@Published bit,
	@Deleted bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_ProductVariant]
	SET
		ProductId=@ProductId,
		[Name]=@Name,
		[SKU]=@SKU,
		[Description]=@Description,
		AdminComment=@AdminComment,
		ManufacturerPartNumber=@ManufacturerPartNumber,
		IsDownload=@IsDownload,
		DownloadID=@DownloadID,
		UnlimitedDownloads=@UnlimitedDownloads,
		MaxNumberOfDownloads=@MaxNumberOfDownloads,
		HasSampleDownload=@HasSampleDownload,
		SampleDownloadID=@SampleDownloadID,
		IsShipEnabled=@IsShipEnabled,
		IsFreeShipping=@IsFreeShipping,
		AdditionalShippingCharge=@AdditionalShippingCharge,
		IsTaxExempt=@IsTaxExempt,
		TaxCategoryID=@TaxCategoryID,
		ManageInventory=@ManageInventory,
		StockQuantity=@StockQuantity,
		MinStockQuantity=@MinStockQuantity,
		LowStockActivityID=@LowStockActivityID,
		NotifyAdminForQuantityBelow=@NotifyAdminForQuantityBelow,
		OrderMinimumQuantity=@OrderMinimumQuantity,
		OrderMaximumQuantity=@OrderMaximumQuantity,
		WarehouseId=@WarehouseId,
		DisableBuyButton=@DisableBuyButton,
		Price=@Price,
		OldPrice=@OldPrice,
		Weight=@Weight,
		[Length]=@Length,
		Width=@Width,
		Height=@Height,
		PictureID=@PictureID,
		AvailableStartDateTime=@AvailableStartDateTime,
		AvailableEndDateTime=@AvailableEndDateTime,
		Published=@Published,
		Deleted=@Deleted,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		ProductVariantID = @ProductVariantID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderProductVariantLoadByPrimaryKey]
(
	@OrderProductVariantID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderProductVariant]
	WHERE
		OrderProductVariantID = @OrderProductVariantID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderProductVariantLoadByOrderID]
(
	@OrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderProductVariant]
	WHERE
		OrderID = @OrderID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantLoadLowStock]
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductVariant]
	WHERE
		Deleted=0 and
		MinStockQuantity >= StockQuantity
	ORDER BY MinStockQuantity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantLoadByPrimaryKey]
(
	@ProductVariantID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductVariant]
	WHERE
		(ProductVariantID = @ProductVariantID)
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantLoadByProductID]
(
	@ProductID int,
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductVariant] pv
	WHERE 
			(@ShowHidden = 1 OR pv.Published = 1) 
		AND 
			pv.Deleted=0
		AND 
			pv.ProductID = @ProductID
		AND 
			(
				@ShowHidden = 1
				OR
				(getutcdate() between isnull(pv.AvailableStartDateTime, '1/1/1900') and isnull(pv.AvailableEndDateTime, '1/1/2999'))
			)
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadByAffiliateID]
(
	@AffiliateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Customer]
	WHERE 
		AffiliateID=@AffiliateID and Deleted=0
	order by RegistrationDate desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadByUsername]
(
	@Username nvarchar(100)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Customer]
	WHERE
		([Username] = @Username)
	ORDER BY CustomerID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadByGuid]
(
	@CustomerGUID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Customer]
	WHERE
		([CustomerGUID] = @CustomerGUID)
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductLoadRecentlyAdded] 
(	
	@Number		int,
	@ShowHidden bit = 0
)
AS
BEGIN
    SET NOCOUNT ON
    IF @Number is null or @Number = 0
        SET @Number = 20

	CREATE TABLE #ProductFilter
	(
	    ProductFilterID int IDENTITY (1, 1) NOT NULL,
	    ProductID int not null
	)

	
	INSERT #ProductFilter (ProductID)
	SELECT p.ProductID
	FROM Nop_Product p with (NOLOCK)
	WHERE
			(p.Published = 1 or @ShowHidden = 1)
			  and p.Deleted = 0
	ORDER BY p.CreatedOn desc

	SELECT p.*
	FROM 
		Nop_Product p with (NOLOCK)
		inner join #ProductFilter pf	with (NOLOCK) ON p.ProductID = pf.ProductID
	WHERE pf.ProductFilterID <= @Number
	DROP TABLE #ProductFilter
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadByEmail]
(
	@Email nvarchar(255)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Customer]
	WHERE
		([Email] = @Email)
	ORDER BY CustomerID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderShipmentStatusLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderShipmentStatus]
	ORDER BY OrderShipmentStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadByPrimaryKey]
(
	@CustomerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Customer]
	WHERE
		([CustomerID] = @CustomerID)
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderShipmentStatusLoadByPrimaryKey]
(
	@OrderShipmentStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderShipmentStatus]
	WHERE
		OrderShipmentStatusID = @OrderShipmentStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionLoadAll]
(
	@UserID				int,
	@ForumID			int,
	@TopicID			int,
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		SubscriptionID int NOT NULL,
		CreatedOn datetime NOT NULL,
	)

	INSERT INTO #PageIndex (SubscriptionID, CreatedOn)
	SELECT DISTINCT
		fs.SubscriptionID, fs.CreatedOn
	FROM Nop_Forums_Subscription fs with (NOLOCK)
	WHERE   (
				@UserID IS NULL OR @UserID=0
				OR (fs.UserID=@UserID)
			)
		AND (
				@ForumID IS NULL OR @ForumID=0
				OR (fs.ForumID=@ForumID)
			)
		AND (
				@TopicID IS NULL OR @TopicID=0
				OR (fs.TopicID=@TopicID)
			)
	ORDER BY fs.CreatedOn desc, fs.SubscriptionID desc

	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		fs.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Forums_Subscription fs on fs.SubscriptionID = [pi].SubscriptionID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_TopicLoadAll]
(
	@ForumID			int,
	@UserID				int,
	@Keywords			nvarchar(MAX),	
	@SearchPosts		bit = 0,
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	
	SET @Keywords = isnull(@Keywords, '')
	SET @Keywords = '%' + rtrim(ltrim(@Keywords)) + '%'

	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		TopicID int NOT NULL,
		TopicTypeID int NOT NULL,
		LastPostTime datetime NULL,
	)

	INSERT INTO #PageIndex (TopicID, TopicTypeID, LastPostTime)
	SELECT DISTINCT
		ft.TopicID, ft.TopicTypeID, ft.LastPostTime
	FROM Nop_Forums_Topic ft with (NOLOCK) 
	LEFT OUTER JOIN Nop_Forums_Post fp with (NOLOCK) ON ft.TopicID = fp.TopicID
	WHERE  (
				@ForumID IS NULL OR @ForumID=0
				OR (ft.ForumID=@ForumID)
			)
		AND (
				@UserID IS NULL OR @UserID=0
				OR (ft.UserID=@UserID)
			)
		AND	(
				(patindex(@Keywords, isnull(ft.Subject, '')) > 0)
				or (@SearchPosts = 1 and patindex(@Keywords, isnull(fp.Text, '')) > 0)
			)		
	ORDER BY ft.TopicTypeID desc, ft.LastPostTime desc, ft.TopicID desc

	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		ft.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Forums_Topic ft on ft.TopicID = [pi].TopicID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_ProductAttribute_MappingLoadByProductVariantID]
(
	@ProductVariantID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ProductVariant_ProductAttribute_Mapping]
	WHERE ProductVariantID=@ProductVariantID
	ORDER BY [DisplayOrder]
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_ProductAttribute_MappingLoadByPrimaryKey]
(
	@ProductVariantAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductVariant_ProductAttribute_Mapping]
	WHERE
		ProductVariantAttributeID = @ProductVariantAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_PostLoadAll]
(
	@TopicID			int,
	@UserID				int,
	@Keywords			nvarchar(MAX),
	@AscSort			bit = 1,
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	
	SET @Keywords = isnull(@Keywords, '')
	SET @Keywords = '%' + rtrim(ltrim(@Keywords)) + '%'

	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		PostID int NOT NULL,
	)

	INSERT INTO #PageIndex (PostID)
	SELECT
		fp.PostID
	FROM Nop_Forums_Post fp with (NOLOCK)
	WHERE   (
				@TopicID IS NULL OR @TopicID=0
				OR (fp.TopicID=@TopicID)
			)
		AND (
				@UserID IS NULL OR @UserID=0
				OR (fp.UserID=@UserID)
			)
		AND	(
				patindex(@Keywords, isnull(fp.Text, '')) > 0
			)
	ORDER BY
		CASE @AscSort WHEN 0 THEN fp.CreatedOn END DESC,
		CASE @AscSort WHEN 1 THEN fp.CreatedOn END,
		fp.PostID


	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		fp.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Forums_Post fp on fp.PostID = [pi].PostID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_ProductAttribute_MappingDelete]
(
	@ProductVariantAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductVariant_ProductAttribute_Mapping]
	WHERE
		ProductVariantAttributeID = @ProductVariantAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_Maintenance_ReindexTables]
AS
BEGIN
	--indexing
	DECLARE @TableName sysname
	DECLARE cur_reindex CURSOR FOR
	SELECT table_name
	FROM information_schema.tables
	WHERE table_type = 'base table'
	OPEN cur_reindex
	FETCH NEXT FROM cur_reindex INTO @TableName
	WHILE @@FETCH_STATUS = 0
	BEGIN
		--PRINT 'Reindexing ' + @TableName + ' table'
		DBCC DBREINDEX (@TableName, ' ', 80)
		FETCH NEXT FROM cur_reindex INTO @TableName
		END
	CLOSE cur_reindex
	DEALLOCATE cur_reindex
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAlsoPurchasedLoadByProductID]
(
	@ProductID			int,
	@ShowHidden			bit,
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	
	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		ProductID int NOT NULL,
		ProductsPurchased int NOT NULL,
	)

	INSERT INTO #PageIndex (ProductID, ProductsPurchased)
	SELECT p.ProductID, SUM(opv.Quantity) as ProductsPurchased
	FROM    
		dbo.Nop_OrderProductVariant opv WITH (NOLOCK)
		INNER JOIN dbo.Nop_ProductVariant pv ON pv.ProductVariantId = opv.ProductVariantId
		INNER JOIN dbo.Nop_Product p ON p.ProductId = pv.ProductId
	WHERE
		opv.OrderID IN 
		(
			/* This inner query should retrieve all orders that have contained the productID */
			SELECT 
				DISTINCT OrderID
			FROM 
				dbo.Nop_OrderProductVariant opv2 WITH (NOLOCK)
				INNER JOIN dbo.Nop_ProductVariant pv2 ON pv2.ProductVariantId = opv2.ProductVariantId
				INNER JOIN dbo.Nop_Product p2 ON p2.ProductId = pv2.ProductId				
			WHERE 
				p2.ProductID = @ProductID
		)
		AND 
			(
				p.ProductId != @ProductID
			)
		AND 
			(
				@ShowHidden = 1 OR p.Published = 1
			)
		AND 
			(
				p.Deleted = 0
			)
		AND 
			(
				@ShowHidden = 1
				OR
				GETUTCDATE() BETWEEN ISNULL(pv.AvailableStartDateTime, '1/1/1900') AND ISNULL(pv.AvailableEndDateTime, '1/1/2999')
			)
	GROUP BY
		p.ProductId
	ORDER BY 
		ProductsPurchased desc


	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		p.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Product p on p.ProductID = [pi].ProductID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0

	DROP TABLE #PageIndex

END
GO



CREATE PROCEDURE [dbo].[Nop_ProductLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Product]
	WHERE (Published = 1 or @ShowHidden = 1) and Deleted=0
	order by [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductLoadDisplayedOnHomePage]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Product]
	WHERE (Published = 1 or @ShowHidden = 1) and ShowOnHomePage=1 and Deleted=0 
	order by [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductInsert]
(
	@ProductID int = NULL output,
	@Name nvarchar(400),
	@ShortDescription ntext,
	@FullDescription ntext,
	@AdminComment ntext,
	@ProductTypeID int,
	@TemplateID int,
	@ShowOnHomePage bit,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@AllowCustomerReviews bit,
	@AllowCustomerRatings bit,
	@RatingSum int,
	@TotalRatingVotes int,
	@Published bit,
	@Deleted bit,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Product]
	(
		[Name],
		ShortDescription,
		FullDescription,
		AdminComment,
		ProductTypeID,
		TemplateID,
		ShowOnHomePage,
		MetaKeywords,
		MetaDescription,
		MetaTitle,
		SEName,
		AllowCustomerReviews,
		AllowCustomerRatings,
		RatingSum,
		TotalRatingVotes,
		Published,
		Deleted,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@Name,
		@ShortDescription,
		@FullDescription,
		@AdminComment,
		@ProductTypeID,
		@TemplateID,
		@ShowOnHomePage,
		@MetaKeywords,
		@MetaDescription,
		@MetaTitle,
		@SEName,
		@AllowCustomerReviews,
		@AllowCustomerRatings,
		@RatingSum,
		@TotalRatingVotes,
		@Published,
		@Deleted,
		@CreatedOn,
		@UpdatedOn
	)

	set @ProductID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductUpdate]
(
	@ProductID int,
	@Name nvarchar(400),
	@ShortDescription ntext,
	@FullDescription ntext,
	@AdminComment ntext,
	@ProductTypeID int,
	@TemplateID int,
	@ShowOnHomePage bit,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@AllowCustomerReviews bit,
	@AllowCustomerRatings bit,
	@RatingSum int,
	@TotalRatingVotes int,
	@Published bit,
	@Deleted bit,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Product]
	SET
		[Name]=@Name,
		ShortDescription=@ShortDescription,
		FullDescription=@FullDescription,
		AdminComment=@AdminComment,
		ProductTypeID=@ProductTypeID,
		TemplateID=@TemplateID,
		ShowOnHomePage=@ShowOnHomePage,
		MetaKeywords=@MetaKeywords,
		MetaDescription=@MetaDescription,
		MetaTitle=@MetaTitle,
		SEName=@SEName,
		AllowCustomerReviews=@AllowCustomerReviews,
		AllowCustomerRatings=@AllowCustomerRatings,
		RatingSum=@RatingSum,
		TotalRatingVotes=@TotalRatingVotes,
		Published=@Published,
		Deleted=@Deleted,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		[ProductID] = @ProductID
END
GO



CREATE PROCEDURE [dbo].[Nop_DownloadInsert]
(
	@DownloadID int = NULL output,
	@UseDownloadURL bit,
	@DownloadURL nvarchar(400),
	@DownloadBinary image,	
	@ContentType nvarchar(20),
	@Extension nvarchar(20),
	@IsNew	bit
)
AS
BEGIN
	INSERT
	INTO [Nop_Download]
	(
		UseDownloadURL,
		DownloadURL,
		DownloadBinary,
		ContentType,
		Extension,
		IsNew
	)
	VALUES
	(
		@UseDownloadURL,
		@DownloadURL,
		@DownloadBinary,
		@ContentType,
		@Extension,
		@IsNew
	)

	set @DownloadID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductLoadByPrimaryKey]
(
	@ProductID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Product]
	WHERE
		(ProductID = @ProductID)
END
GO




CREATE PROCEDURE [dbo].[Nop_DownloadUpdate]
(
	@DownloadID int,
	@UseDownloadURL bit,
	@DownloadURL nvarchar(400),
	@DownloadBinary image,
	@ContentType nvarchar(20),
	@Extension nvarchar(20),
	@IsNew	bit
)
AS
BEGIN

	UPDATE [Nop_Download]
	SET		
		UseDownloadURL=@UseDownloadURL,
		DownloadURL=@DownloadURL,
		DownloadBinary=@DownloadBinary,
		ContentType = @ContentType,
		Extension=@Extension,
		IsNew=@IsNew
	WHERE
		DownloadID = @DownloadID

END
GO




CREATE PROCEDURE [dbo].[Nop_DownloadDelete]
(
	@DownloadID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Download]
	WHERE
		DownloadID = @DownloadID
END
GO




CREATE PROCEDURE [dbo].[Nop_DownloadLoadByPrimaryKey]
(
	@DownloadID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Download]
	WHERE
		DownloadID = @DownloadID
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderSearch]
(
	@StartTime datetime = NULL,
	@EndTime datetime = NULL,
	@CustomerEmail nvarchar(255) = NULL,
	@OrderStatusID int,
	@PaymentStatusID int,
	@ShippingStatusID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT
		o.*
	FROM [Nop_Order] o
	LEFT OUTER JOIN [Nop_Customer] c ON o.CustomerID = c.CustomerID
	WHERE
		(@CustomerEmail IS NULL or LEN(@CustomerEmail)=0 or (c.Email like '%' + COALESCE(@CustomerEmail,c.Email) + '%')) and
		(@StartTime is NULL or DATEDIFF(day, @StartTime, o.CreatedOn) >= 0) and
		(@EndTime is NULL or DATEDIFF(day, @EndTime, o.CreatedOn) <= 0) and 
		(@OrderStatusID IS NULL or @OrderStatusID=0 or o.OrderStatusID = @OrderStatusID) and
		(@PaymentStatusID IS NULL or @PaymentStatusID=0 or o.PaymentStatusID = @PaymentStatusID) and
		(@ShippingStatusID IS NULL OR @ShippingStatusID = 0 OR o.ShippingStatusID = @ShippingStatusID) and
		(o.Deleted=0)
	ORDER BY o.CreatedOn desc
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderInsert]
(
	@OrderID int = NULL output,
	@OrderGUID uniqueidentifier,
	@CustomerID int,
	@CustomerLanguageID int,
	@CustomerTaxDisplayTypeID int,
	@OrderSubtotalInclTax money,
	@OrderSubtotalExclTax money,
	@OrderShippingInclTax money,
	@OrderShippingExclTax money,
	@PaymentMethodAdditionalFeeInclTax money,
	@PaymentMethodAdditionalFeeExclTax money,
	@OrderTax money,
	@OrderTotal money,
	@OrderDiscount money,
	@OrderSubtotalInclTaxInCustomerCurrency money,
	@OrderSubtotalExclTaxInCustomerCurrency money,
	@OrderShippingInclTaxInCustomerCurrency money,
	@OrderShippingExclTaxInCustomerCurrency money,
	@PaymentMethodAdditionalFeeInclTaxInCustomerCurrency money,
	@PaymentMethodAdditionalFeeExclTaxInCustomerCurrency money,
	@OrderTaxInCustomerCurrency money,
	@OrderTotalInCustomerCurrency money,
	@CustomerCurrencyCode nvarchar(5),
	@OrderWeight float,
	@AffiliateID int,
	@OrderStatusID int,
	@AllowStoringCreditCardNumber bit,
	@CardType nvarchar(100),
	@CardName nvarchar(100),
	@CardNumber nvarchar(100),
	@MaskedCreditCardNumber nvarchar(100),
	@CardCVV2 nvarchar(100),
	@CardExpirationMonth nvarchar(100),
	@CardExpirationYear nvarchar(100),
	@PaymentMethodID int,
	@PaymentMethodName nvarchar(100),
	@AuthorizationTransactionID nvarchar(4000),
	@AuthorizationTransactionCode nvarchar(4000),
	@AuthorizationTransactionResult nvarchar(1000),
	@CaptureTransactionID nvarchar(4000),
	@CaptureTransactionResult nvarchar(1000),
	@PurchaseOrderNumber nvarchar(100),
	@PaymentStatusID int,
	@BillingFirstName nvarchar(100),
	@BillingLastName nvarchar(100),
	@BillingPhoneNumber nvarchar(50),
	@BillingEmail nvarchar(255),
	@BillingFaxNumber nvarchar(50),
	@BillingCompany nvarchar(100),
	@BillingAddress1 nvarchar(100),
	@BillingAddress2 nvarchar(100),
	@BillingCity nvarchar(100),
	@BillingStateProvince nvarchar(100),
	@BillingStateProvinceID int,
	@BillingZipPostalCode nvarchar(10),
	@BillingCountry nvarchar(100),
	@BillingCountryID int,
	@ShippingStatusID int,
	@ShippingFirstName nvarchar(100),
	@ShippingLastName nvarchar(100),
	@ShippingPhoneNumber nvarchar(50),
	@ShippingEmail nvarchar(255),
	@ShippingFaxNumber nvarchar(50),
	@ShippingCompany nvarchar(100),
	@ShippingAddress1 nvarchar(100),
	@ShippingAddress2 nvarchar(100),
	@ShippingCity nvarchar(100),
	@ShippingStateProvince nvarchar(100),
	@ShippingStateProvinceID int,
	@ShippingZipPostalCode nvarchar(10),
	@ShippingCountry nvarchar(100),
	@ShippingCountryID int,
	@ShippingMethod nvarchar(100),
	@ShippingRateComputationMethodID int,
	@ShippedDate datetime,
	@Deleted bit,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Order]
	(
		OrderGUID,
		CustomerID,
		CustomerLanguageID,
		CustomerTaxDisplayTypeID,
		OrderSubtotalInclTax,
		OrderSubtotalExclTax,
		OrderShippingInclTax,
		OrderShippingExclTax,
		PaymentMethodAdditionalFeeInclTax,
		PaymentMethodAdditionalFeeExclTax,
		OrderTax,
		OrderTotal,
		OrderDiscount,
		OrderSubtotalInclTaxInCustomerCurrency,
		OrderSubtotalExclTaxInCustomerCurrency,
		OrderShippingInclTaxInCustomerCurrency,
		OrderShippingExclTaxInCustomerCurrency,
		PaymentMethodAdditionalFeeInclTaxInCustomerCurrency,
		PaymentMethodAdditionalFeeExclTaxInCustomerCurrency,
		OrderTaxInCustomerCurrency,
		OrderTotalInCustomerCurrency,
		CustomerCurrencyCode,
		OrderWeight,
		AffiliateID,
		OrderStatusID,
		AllowStoringCreditCardNumber,
		CardType,
		CardName,
		CardNumber,
		MaskedCreditCardNumber,
		CardCVV2,
		CardExpirationMonth,
		CardExpirationYear,
		PaymentMethodID,
		PaymentMethodName,
		AuthorizationTransactionID,
		AuthorizationTransactionCode,
		AuthorizationTransactionResult,
		CaptureTransactionID,
		CaptureTransactionResult,
		PurchaseOrderNumber,
		PaymentStatusID,
		BillingFirstName,
		BillingLastName,
		BillingPhoneNumber,
		BillingEmail,
		BillingFaxNumber,
		BillingCompany,
		BillingAddress1,
		BillingAddress2,
		BillingCity,
		BillingStateProvince,
		BillingStateProvinceID,
		BillingZipPostalCode,
		BillingCountry,
		BillingCountryID,
		ShippingStatusID,
		ShippingFirstName,
		ShippingLastName,
		ShippingPhoneNumber,
		ShippingEmail,
		ShippingFaxNumber,
		ShippingCompany,
		ShippingAddress1,
		ShippingAddress2,
		ShippingCity,
		ShippingStateProvince,
		ShippingZipPostalCode,
		ShippingStateProvinceID,
		ShippingCountry,
		ShippingCountryID,
		ShippingMethod,
		ShippingRateComputationMethodID,
		ShippedDate,
		Deleted,
		CreatedOn
	)
	VALUES
	(
		@OrderGUID,
		@CustomerID,
		@CustomerLanguageID,		
		@CustomerTaxDisplayTypeID,
		@OrderSubtotalInclTax,
		@OrderSubtotalExclTax,		
		@OrderShippingInclTax,
		@OrderShippingExclTax,
		@PaymentMethodAdditionalFeeInclTax,
		@PaymentMethodAdditionalFeeExclTax,
		@OrderTax,
		@OrderTotal,
		@OrderDiscount,		
		@OrderSubtotalInclTaxInCustomerCurrency,
		@OrderSubtotalExclTaxInCustomerCurrency,		
		@OrderShippingInclTaxInCustomerCurrency,
		@OrderShippingExclTaxInCustomerCurrency,
		@PaymentMethodAdditionalFeeInclTaxInCustomerCurrency,
		@PaymentMethodAdditionalFeeExclTaxInCustomerCurrency,
		@OrderTaxInCustomerCurrency,
		@OrderTotalInCustomerCurrency,
		@CustomerCurrencyCode,
		@OrderWeight,
		@AffiliateID,
		@OrderStatusID,
		@AllowStoringCreditCardNumber,
		@CardType,
		@CardName,
		@CardNumber,
		@MaskedCreditCardNumber,
		@CardCVV2,
		@CardExpirationMonth,
		@CardExpirationYear,
		@PaymentMethodID,
		@PaymentMethodName,
		@AuthorizationTransactionID,
		@AuthorizationTransactionCode,
		@AuthorizationTransactionResult,
		@CaptureTransactionID,
		@CaptureTransactionResult,
		@PurchaseOrderNumber,
		@PaymentStatusID,
		@BillingFirstName,
		@BillingLastName,
		@BillingPhoneNumber,
		@BillingEmail,
		@BillingFaxNumber,
		@BillingCompany,
		@BillingAddress1,
		@BillingAddress2,
		@BillingCity,
		@BillingStateProvince,
		@BillingStateProvinceID,
		@BillingZipPostalCode,
		@BillingCountry,
		@BillingCountryID,
		@ShippingStatusID,
		@ShippingFirstName,
		@ShippingLastName,
		@ShippingPhoneNumber,
		@ShippingEmail,
		@ShippingFaxNumber,
		@ShippingCompany,
		@ShippingAddress1,
		@ShippingAddress2,
		@ShippingCity,
		@ShippingStateProvince,
		@ShippingZipPostalCode,
		@ShippingStateProvinceID,
		@ShippingCountry,
		@ShippingCountryID,
		@ShippingMethod,
		@ShippingRateComputationMethodID,
		@ShippedDate,
		@Deleted,
		@CreatedOn
	)

	set @OrderID=@@identity
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderUpdate]
(
	@OrderID int,
	@OrderGUID uniqueidentifier,
	@CustomerID int,
	@CustomerLanguageID int,
	@CustomerTaxDisplayTypeID int,
	@OrderSubtotalInclTax money,
	@OrderSubtotalExclTax money,
	@OrderShippingInclTax money,
	@OrderShippingExclTax money,
	@PaymentMethodAdditionalFeeInclTax money,
	@PaymentMethodAdditionalFeeExclTax money,
	@OrderTax money,
	@OrderTotal money,
	@OrderDiscount money,
	@OrderSubtotalInclTaxInCustomerCurrency money,
	@OrderSubtotalExclTaxInCustomerCurrency money,
	@OrderShippingInclTaxInCustomerCurrency money,
	@OrderShippingExclTaxInCustomerCurrency money,
	@PaymentMethodAdditionalFeeInclTaxInCustomerCurrency money,
	@PaymentMethodAdditionalFeeExclTaxInCustomerCurrency money,
	@OrderTaxInCustomerCurrency money,
	@OrderTotalInCustomerCurrency money,
	@CustomerCurrencyCode nvarchar(5),
	@OrderWeight float,
	@AffiliateID int,
	@OrderStatusID int,
	@AllowStoringCreditCardNumber bit,
	@CardType nvarchar(100),
	@CardName nvarchar(100),
	@CardNumber nvarchar(100),
	@MaskedCreditCardNumber nvarchar(100),
	@CardCVV2 nvarchar(100),
	@CardExpirationMonth nvarchar(100),
	@CardExpirationYear nvarchar(100),
	@PaymentMethodID int,
	@PaymentMethodName nvarchar(100),
	@AuthorizationTransactionID nvarchar(4000),
	@AuthorizationTransactionCode nvarchar(4000),
	@AuthorizationTransactionResult nvarchar(1000),
	@CaptureTransactionID nvarchar(4000),
	@CaptureTransactionResult nvarchar(1000),
	@PurchaseOrderNumber nvarchar(100),
	@PaymentStatusID int,
	@BillingFirstName nvarchar(100),
	@BillingLastName nvarchar(100),
	@BillingPhoneNumber nvarchar(50),
	@BillingEmail nvarchar(255),
	@BillingFaxNumber nvarchar(50),
	@BillingCompany nvarchar(100),
	@BillingAddress1 nvarchar(100),
	@BillingAddress2 nvarchar(100),
	@BillingCity nvarchar(100),
	@BillingStateProvince nvarchar(100),
	@BillingStateProvinceID int,
	@BillingZipPostalCode nvarchar(10),
	@BillingCountry nvarchar(100),
	@BillingCountryID int,
	@ShippingStatusID int,
	@ShippingFirstName nvarchar(100),
	@ShippingLastName nvarchar(100),
	@ShippingPhoneNumber nvarchar(50),
	@ShippingEmail nvarchar(255),
	@ShippingFaxNumber nvarchar(50),
	@ShippingCompany nvarchar(100),
	@ShippingAddress1 nvarchar(100),
	@ShippingAddress2 nvarchar(100),
	@ShippingCity nvarchar(100),
	@ShippingStateProvince nvarchar(100),
	@ShippingStateProvinceID int,
	@ShippingZipPostalCode nvarchar(10),
	@ShippingCountry nvarchar(100),
	@ShippingCountryID int,
	@ShippingMethod nvarchar(100),
	@ShippingRateComputationMethodID int,
	@ShippedDate datetime,
	@Deleted bit,
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Order]
	SET
		OrderGUID=@OrderGUID,
		CustomerID=@CustomerID,
		CustomerLanguageID=@CustomerLanguageID,		
		CustomerTaxDisplayTypeID=@CustomerTaxDisplayTypeID,
		OrderSubtotalInclTax=@OrderSubtotalInclTax,
		OrderSubtotalExclTax=@OrderSubtotalExclTax,		
		OrderShippingInclTax=@OrderShippingInclTax,
		OrderShippingExclTax=@OrderShippingExclTax,
		PaymentMethodAdditionalFeeInclTax=@PaymentMethodAdditionalFeeInclTax,
		PaymentMethodAdditionalFeeExclTax=@PaymentMethodAdditionalFeeExclTax,
		OrderTax=@OrderTax,
		OrderTotal=@OrderTotal,
		OrderDiscount=@OrderDiscount,
		OrderSubtotalInclTaxInCustomerCurrency=@OrderSubtotalInclTaxInCustomerCurrency,
		OrderSubtotalExclTaxInCustomerCurrency=@OrderSubtotalExclTaxInCustomerCurrency,
		OrderShippingInclTaxInCustomerCurrency=@OrderShippingInclTaxInCustomerCurrency,
		OrderShippingExclTaxInCustomerCurrency=@OrderShippingExclTaxInCustomerCurrency,	
		PaymentMethodAdditionalFeeInclTaxInCustomerCurrency=@PaymentMethodAdditionalFeeInclTaxInCustomerCurrency,
		PaymentMethodAdditionalFeeExclTaxInCustomerCurrency=@PaymentMethodAdditionalFeeExclTaxInCustomerCurrency,	
		OrderTaxInCustomerCurrency=@OrderTaxInCustomerCurrency,
		OrderTotalInCustomerCurrency=@OrderTotalInCustomerCurrency,
		CustomerCurrencyCode=@CustomerCurrencyCode,
		OrderWeight=@OrderWeight,
		AffiliateID=@AffiliateID,
		OrderStatusID=@OrderStatusID,
		AllowStoringCreditCardNumber=@AllowStoringCreditCardNumber,
		CardType=@CardType,
		CardName=@CardName,
		CardNumber=@CardNumber,
		MaskedCreditCardNumber=@MaskedCreditCardNumber,
		CardCVV2=@CardCVV2,
		CardExpirationMonth=@CardExpirationMonth,
		CardExpirationYear=@CardExpirationYear,
		PaymentMethodID=@PaymentMethodID,
		PaymentMethodName=@PaymentMethodName,
		AuthorizationTransactionID=@AuthorizationTransactionID,
		AuthorizationTransactionCode=@AuthorizationTransactionCode,
		AuthorizationTransactionResult=@AuthorizationTransactionResult,
		CaptureTransactionID=@CaptureTransactionID,
		CaptureTransactionResult=@CaptureTransactionResult,
		PurchaseOrderNumber=@PurchaseOrderNumber,
		PaymentStatusID=@PaymentStatusID,
		BillingFirstName=@BillingFirstName,
		BillingLastName=@BillingLastName,
		BillingPhoneNumber=@BillingPhoneNumber,
		BillingEmail=@BillingEmail,
		BillingFaxNumber=@BillingFaxNumber,
		BillingCompany=@BillingCompany,
		BillingAddress1=@BillingAddress1,
		BillingAddress2=@BillingAddress2,
		BillingCity=@BillingCity,
		BillingStateProvince=@BillingStateProvince,
		BillingStateProvinceID=@BillingStateProvinceID,
		BillingZipPostalCode=@BillingZipPostalCode,
		BillingCountry=@BillingCountry,
		BillingCountryID=@BillingCountryID,
		ShippingStatusID=@ShippingStatusID,
		ShippingFirstName=@ShippingFirstName,
		ShippingLastName=@ShippingLastName,
		ShippingPhoneNumber=@ShippingPhoneNumber,
		ShippingEmail=@ShippingEmail,
		ShippingFaxNumber=@ShippingFaxNumber,
		ShippingCompany=@ShippingCompany,
		ShippingAddress1=@ShippingAddress1,
		ShippingAddress2=@ShippingAddress2,
		ShippingCity=@ShippingCity,
		ShippingStateProvince=@ShippingStateProvince,
		ShippingStateProvinceID=@ShippingStateProvinceID,
		ShippingZipPostalCode=@ShippingZipPostalCode,
		ShippingCountry=@ShippingCountry,
		ShippingCountryID=@ShippingCountryID,
		ShippingMethod=@ShippingMethod,
		ShippingRateComputationMethodID=@ShippingRateComputationMethodID,
		ShippedDate=@ShippedDate,
		Deleted=@Deleted,
		CreatedOn=@CreatedOn
	WHERE
		OrderID = @OrderID
END
GO




CREATE PROCEDURE [dbo].[Nop_Product_SpecificationAttribute_MappingLoadByPrimaryKey]
(
	@ProductSpecificationAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Product_SpecificationAttribute_Mapping]
	WHERE
		ProductSpecificationAttributeID = @ProductSpecificationAttributeID
END
GO




CREATE PROCEDURE [dbo].[Nop_ShoppingCartItemLoadByCustomerSessionGUID]
(
	@ShoppingCartTypeID int,
	@CustomerSessionGUID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShoppingCartItem]
	WHERE ShoppingCartTypeID=@ShoppingCartTypeID and CustomerSessionGUID=@CustomerSessionGUID 
	order by CreatedOn
END
GO




CREATE PROCEDURE [dbo].[Nop_Product_SpecificationAttribute_MappingDelete]
(
	@ProductSpecificationAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Product_SpecificationAttribute_Mapping]
	WHERE
		ProductSpecificationAttributeID = @ProductSpecificationAttributeID
END
GO




CREATE PROCEDURE [dbo].[Nop_ShoppingCartItemDelete]
(
	@ShoppingCartItemID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ShoppingCartItem]
	WHERE
		[ShoppingCartItemID] = @ShoppingCartItemID
END
GO




CREATE PROCEDURE [dbo].[Nop_ShoppingCartItemLoadByPrimaryKey]
(
	@ShoppingCartItemID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShoppingCartItem]
	WHERE
		ShoppingCartItemID = @ShoppingCartItemID
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerInsert]
(
	@CustomerId int = NULL output,
	@CustomerGUID uniqueidentifier,
	@Email nvarchar(255),
	@PasswordHash nvarchar(255),
	@SaltKey nvarchar(255),
	@AffiliateID int,
	@BillingAddressID int,
	@ShippingAddressID int,
	@LastPaymentMethodID int,
	@LastAppliedCouponCode nvarchar(100),
	@LanguageID int,
	@CurrencyID int,
	@TaxDisplayTypeID int,
	@IsTaxExempt bit,
	@IsAdmin bit,
	@IsGuest bit,
	@IsForumModerator bit,
	@TotalForumPosts int,
	@Signature nvarchar(300),
	@AdminComment nvarchar(4000),
	@Active bit,
	@Deleted bit,
	@RegistrationDate datetime,
	@TimeZoneID nvarchar(200),
	@Username nvarchar(100),
	@AvatarID int
)
AS
BEGIN
	INSERT
	INTO [Nop_Customer]
	(
		CustomerGUID,
		Email,
		PasswordHash,
		SaltKey,
		AffiliateID,
		BillingAddressID,
		ShippingAddressID,
		LastPaymentMethodID,
		LastAppliedCouponCode,
		LanguageID,
		CurrencyID,
		TaxDisplayTypeID,
		IsTaxExempt,
		IsAdmin,
		IsGuest,
		IsForumModerator,
		TotalForumPosts,
		[Signature],
		AdminComment,
		Active,
		Deleted,
		RegistrationDate,
		TimeZoneID,
		Username,
		AvatarID
	)
	VALUES
	(
		@CustomerGUID,
		@Email,
		@PasswordHash,
		@SaltKey,
		@AffiliateID,
		@BillingAddressID,
		@ShippingAddressID,
		@LastPaymentMethodID,
		@LastAppliedCouponCode,
		@LanguageID,
		@CurrencyID,
		@TaxDisplayTypeID,
		@IsTaxExempt,
		@IsAdmin,
		@IsGuest,
		@IsForumModerator,
		@TotalForumPosts,
		@Signature,
		@AdminComment,
		@Active,
		@Deleted,
		@RegistrationDate,
		@TimeZoneID,
		@Username,
		@AvatarID
	)

	set @CustomerId=@@identity
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerUpdate]
(
	@CustomerId int,
	@CustomerGUID uniqueidentifier,
	@Email nvarchar(255),
	@PasswordHash nvarchar(255),
	@SaltKey nvarchar(255),
	@AffiliateID int,
	@BillingAddressID int,
	@ShippingAddressID int,
	@LastPaymentMethodID int,
	@LastAppliedCouponCode nvarchar(100),
	@LanguageID int,
	@CurrencyID int,
	@TaxDisplayTypeID int,
	@IsTaxExempt bit,
	@IsAdmin bit,
	@IsGuest bit,
	@IsForumModerator bit,
	@TotalForumPosts int,
	@Signature nvarchar(300),
	@AdminComment nvarchar(4000),
	@Active bit,
	@Deleted bit,
	@RegistrationDate datetime,
	@TimeZoneID nvarchar(200),
	@Username nvarchar(100),
	@AvatarID int
)
AS
BEGIN

	UPDATE [Nop_Customer]
	SET
		CustomerGUID=@CustomerGUID,
		Email=@Email,
		PasswordHash=@PasswordHash,
		SaltKey=@SaltKey,
		AffiliateID=@AffiliateID,
		BillingAddressID=@BillingAddressID,
		ShippingAddressID=@ShippingAddressID,
		LastPaymentMethodID=@LastPaymentMethodID,
		LastAppliedCouponCode=@LastAppliedCouponCode,
		LanguageID=@LanguageID,
		CurrencyID=@CurrencyID,
		TaxDisplayTypeID=@TaxDisplayTypeID,
		IsTaxExempt=@IsTaxExempt,
		IsAdmin=@IsAdmin,
		IsGuest=@IsGuest,
		IsForumModerator=@IsForumModerator,
		TotalForumPosts=@TotalForumPosts,
		[Signature]=@Signature,
		AdminComment=@AdminComment,
		Active=@Active,
		Deleted=@Deleted,
		RegistrationDate=@RegistrationDate,
		TimeZoneID=@TimeZoneID,
		Username=@Username,
		AvatarID=@AvatarID
	WHERE
		[CustomerId] = @CustomerId

END
GO




CREATE PROCEDURE [dbo].[Nop_OrderIncompleteReport]
(
	@OrderStatusID int,
	@PaymentStatusID int,
	@ShippingStatusID int
)
AS
BEGIN

	SELECT
		SUM(o.OrderTotal) [Total],
		COUNT(o.OrderID) [Count]
	FROM Nop_Order o
	WHERE 
		(@OrderStatusID IS NULL or @OrderStatusID=0 or o.OrderStatusID = @OrderStatusID) AND
		(@PaymentStatusID IS NULL or @PaymentStatusID=0 or o.PaymentStatusID = @PaymentStatusID) AND
		(@ShippingStatusID IS NULL or @ShippingStatusID=0 or o.ShippingStatusID = @ShippingStatusID) AND
		o.Deleted=0

END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerRegisteredReport]
(
	@Date datetime
)
AS
BEGIN

	SELECT COUNT(CustomerID) [Count]
	FROM Nop_Customer
	WHERE 
		Active = 1 
		AND Deleted = 0
		AND IsGuest = 0
		AND RegistrationDate BETWEEN @Date AND GETUTCDATE()

END
GO




CREATE PROCEDURE [dbo].[Nop_Forums_PrivateMessageDelete]
(
	@PrivateMessageID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Forums_PrivateMessage]
	WHERE
		PrivateMessageID = @PrivateMessageID
END
GO




CREATE PROCEDURE [dbo].[Nop_Forums_PrivateMessageLoadByPrimaryKey]
(
	@PrivateMessageID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_PrivateMessage]
	WHERE
		(PrivateMessageID = @PrivateMessageID)
END
GO




CREATE PROCEDURE [dbo].[Nop_SalesBestSellersReport]
(
	@LastDays int = 360,
	@RecordsToReturn int = 10,
	@OrderBy int = 1
)
AS
BEGIN
	SET NOCOUNT ON

	DECLARE @cmd varchar(500)
	
	CREATE TABLE #tmp (
		ID int not null identity,
		ProductVariantID int,
		SalesTotalCount int,
		SalesTotalAmount money)
	INSERT #tmp (
		ProductVariantID,
		SalesTotalCount,
		SalesTotalAmount)
	SELECT 
		s.ProductVariantID,
		s.SalesTotalCount, 
		s.SalesTotalAmount 
	FROM (SELECT opv.ProductVariantID, SUM(opv.Quantity) AS SalesTotalCount, SUM(opv.PriceExclTax) AS SalesTotalAmount
		  FROM [Nop_OrderProductVariant] opv
				INNER JOIN [Nop_Order] o on opv.OrderID = o.OrderID 
				WHERE o.CreatedOn >= dateadd(dy, -@LastDays, getdate())
				AND o.Deleted=0
		  GROUP BY opv.ProductVariantID 
		 ) s
		INNER JOIN [Nop_ProductVariant] pv with (nolock) on s.ProductVariantID = pv.ProductVariantID
		INNER JOIN [Nop_Product] p with (nolock) on pv.ProductID = p.ProductID
	WHERE p.Deleted = 0 
		AND p.Published = 1  
		AND pv.Published = 1 
		AND pv.Deleted = 0
	ORDER BY case @OrderBy when 1 then s.SalesTotalCount when 2 then s.SalesTotalAmount else s.SalesTotalCount end desc

	SET @cmd = 'SELECT TOP ' + convert(varchar(10), @RecordsToReturn ) + ' * FROM #tmp Order By ID'

	EXEC (@cmd)

	DROP TABLE #tmp
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderLoadByAffiliateID]
(
	@AffiliateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Order]
	WHERE
		AffiliateID=@AffiliateID and Deleted=0
	ORDER BY CreatedOn desc
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderLoadByAuthorizationTransactionIDAndPaymentMethodID]
(
	@AuthorizationTransactionID nvarchar(4000),
	@PaymentMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Order]
	WHERE
		AuthorizationTransactionID=@AuthorizationTransactionID and
		PaymentMethodID=@PaymentMethodID
	ORDER BY CreatedOn desc
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerLoadAll]
(
	@StartTime				datetime = NULL,
	@EndTime				datetime = NULL,
	@Email					nvarchar(200),
	@Username				nvarchar(200),
	@DontLoadGuestCustomers	bit = 0,
	@PageIndex				int = 0, 
	@PageSize				int = 2147483644,
	@TotalRecords			int = null OUTPUT
)
AS
BEGIN

	SET @Email = isnull(@Email, '')
	SET @Email = '%' + rtrim(ltrim(@Email)) + '%'

	SET @Username = isnull(@Username, '')
	SET @Username = '%' + rtrim(ltrim(@Username)) + '%'


	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	DECLARE @TotalThreads int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		CustomerID int NOT NULL,
		RegistrationDate datetime NOT NULL,
	)

	INSERT INTO #PageIndex (CustomerID, RegistrationDate)
	SELECT DISTINCT
		c.CustomerID, c.RegistrationDate
	FROM [Nop_Customer] c with (NOLOCK)
	WHERE 
		(@StartTime is NULL or DATEDIFF(day, @StartTime, c.RegistrationDate) >= 0) and
		(@EndTime is NULL or DATEDIFF(day, @EndTime, c.RegistrationDate) <= 0) and 
		(patindex(@Email, isnull(c.Email, '')) > 0) and
		(patindex(@Username, isnull(c.Username, '')) > 0) and
		(@DontLoadGuestCustomers = 0 or (c.IsGuest=0)) and 
		c.deleted=0
	order by c.RegistrationDate desc 

	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		c.*
	FROM
		#PageIndex [pi]
		INNER JOIN [Nop_Customer] c on c.CustomerID = [pi].CustomerID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0

	DROP TABLE #PageIndex
	
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderProductVariantReport]
(
	@StartTime datetime = NULL,
	@EndTime datetime = NULL,
	@OrderStatusID int,
	@PaymentStatusID int
)
AS
BEGIN
	SET NOCOUNT ON

	SELECT DISTINCT opv.ProductVariantID,
		(	
			select sum(opv2.PriceExclTax)
			from Nop_OrderProductVariant opv2
			INNER JOIN [Nop_Order] o2 
			on o2.OrderId = opv2.OrderID 
			where
				(@StartTime is NULL or DATEDIFF(day, @StartTime, o2.CreatedOn) >= 0) and
				(@EndTime is NULL or DATEDIFF(day, @EndTime, o2.CreatedOn) <= 0) and 
				(@OrderStatusID IS NULL or @OrderStatusID=0 or o2.OrderStatusID = @OrderStatusID) and
				(@PaymentStatusID IS NULL or @PaymentStatusID=0 or o2.PaymentStatusID = @PaymentStatusID) and
				(o2.Deleted=0) and 
				(opv2.ProductVariantID = opv.ProductVariantID)) PriceExclTax, 
		(
			select sum(opv2.Quantity)  
			from Nop_OrderProductVariant opv2 
			INNER JOIN [Nop_Order] o2 
			on o2.OrderId = opv2.OrderID 
			where
				(@StartTime is NULL or DATEDIFF(day, @StartTime, o2.CreatedOn) >= 0) and
				(@EndTime is NULL or DATEDIFF(day, @EndTime, o2.CreatedOn) <= 0) and 
				(@OrderStatusID IS NULL or @OrderStatusID=0 or o2.OrderStatusID = @OrderStatusID) and
				(@PaymentStatusID IS NULL or @PaymentStatusID=0 or o2.PaymentStatusID = @PaymentStatusID) and
				(o2.Deleted=0) and 
				(opv2.ProductVariantID = opv.ProductVariantID)) Total 
	FROM Nop_OrderProductVariant opv 
	INNER JOIN [Nop_Order] o 
	on o.OrderId = opv.OrderID
	WHERE
		(@StartTime is NULL or DATEDIFF(day, @StartTime, o.CreatedOn) >= 0) and
		(@EndTime is NULL or DATEDIFF(day, @EndTime, o.CreatedOn) <= 0) and 
		(@OrderStatusID IS NULL or @OrderStatusID=0 or o.OrderStatusID = @OrderStatusID) and
		(@PaymentStatusID IS NULL or @PaymentStatusID=0 or o.PaymentStatusID = @PaymentStatusID) and
		(o.Deleted=0)

END
GO




CREATE PROCEDURE [dbo].[Nop_OrderLoadByPrimaryKey]
(
	@OrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Order]
	WHERE
		OrderID=@OrderID
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderAverageReport]
(
	@OrderStatusID int
)
AS
BEGIN

	SET NOCOUNT ON

	SELECT 
		SUM(CASE WHEN datediff(dy, CreatedOn, getutcdate()) = 0 THEN OrderTotal ELSE 0 END) SumTodayOrders,
		SUM(CASE WHEN datediff(dy, CreatedOn, getutcdate()) = 0 THEN 1 ELSE 0 END) CountTodayOrders,
		SUM(CASE WHEN datediff(wk, CreatedOn, getutcdate()) = 0 THEN OrderTotal ELSE 0 END) SumThisWeekOrders,
		SUM(CASE WHEN datediff(wk, CreatedOn, getutcdate()) = 0 THEN 1 ELSE 0 END) CountThisWeekOrders,
		SUM(CASE WHEN datediff(mm, CreatedOn, getutcdate()) = 0 THEN OrderTotal ELSE 0 END) SumThisMonthOrders,
		SUM(CASE WHEN datediff(mm, CreatedOn, getutcdate()) = 0 THEN 1 ELSE 0 END) CountThisMonthOrders,
		SUM(CASE WHEN datediff(yy, CreatedOn, getutcdate()) = 0 THEN OrderTotal ELSE 0 END) SumThisYearOrders,
		SUM(CASE WHEN datediff(yy, CreatedOn, getutcdate()) = 0 THEN 1 ELSE 0 END) CountThisYearOrders,
		SUM(OrderTotal) SumAllTimeOrders,
		COUNT(1) CountAllTimeOrders
	FROM [Nop_Order]
	WHERE OrderTotal > 0 AND OrderStatusID=@OrderStatusID AND Deleted=0
	
END
GO




CREATE PROCEDURE [dbo].[Nop_Forums_PrivateMessageInsert]
(
	@PrivateMessageID int = NULL output,
	@FromUserID int,
	@ToUserID int,
	@Subject nvarchar(450),
	@Text nvarchar(max),
	@IsRead bit,
	@IsDeletedByAuthor bit,
	@IsDeletedByRecipient bit,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_PrivateMessage]
	(
		[FromUserID],
		[ToUserID],
		[Subject],
		[Text],
		[IsRead],
		[IsDeletedByAuthor],
		[IsDeletedByRecipient],
		[CreatedOn]
	)
	VALUES
	(
		@FromUserID,
		@ToUserID,
		@Subject,
		@Text,
		@IsRead,
		@IsDeletedByAuthor,
		@IsDeletedByRecipient,
		@CreatedOn
	)

	set @PrivateMessageID=@@identity
END
GO




CREATE PROCEDURE [dbo].[Nop_OrderLoadByCustomerID]
(
	@CustomerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Order]
	WHERE
		CustomerID=@CustomerID and Deleted=0
	ORDER BY CreatedOn desc
END
GO




CREATE PROCEDURE [dbo].[Nop_Forums_PrivateMessageLoadAll]
(
	@FromUserID			int,
	@ToUserID			int,
	@IsRead				bit = null,	--0 not read only, 1 read only, null - load all messages
	@IsDeletedByAuthor		bit = null,	--0 deleted by author only, 1 not deleted by author only, null - load all messages
	@IsDeletedByRecipient	bit = null,	--0 deleted by recipient only, 1 not deleted by recipient, null - load all messages
	@Keywords			nvarchar(MAX),
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	
	SET @Keywords = isnull(@Keywords, '')
	SET @Keywords = '%' + rtrim(ltrim(@Keywords)) + '%'

	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		PrivateMessageID int NOT NULL,
		CreatedOn datetime NOT NULL,
	)

	INSERT INTO #PageIndex (PrivateMessageID, CreatedOn)
	SELECT DISTINCT
		fpm.PrivateMessageID, fpm.CreatedOn
	FROM Nop_Forums_PrivateMessage fpm with (NOLOCK)
	WHERE   (
				@FromUserID IS NULL OR @FromUserID=0
				OR (fpm.FromUserID=@FromUserID)
			)
		AND (
				@ToUserID IS NULL OR @ToUserID=0
				OR (fpm.ToUserID=@ToUserID)
			)
		AND (
				@IsRead IS NULL OR fpm.IsRead=@IsRead
			)
		AND (
				@IsDeletedByAuthor IS NULL OR fpm.IsDeletedByAuthor=@IsDeletedByAuthor
			)
		AND (
				@IsDeletedByRecipient IS NULL OR fpm.IsDeletedByRecipient=@IsDeletedByRecipient
			)
		AND	(
				(patindex(@Keywords, isnull(fpm.Subject, '')) > 0)
				or (patindex(@Keywords, isnull(fpm.Text, '')) > 0)
			)
	ORDER BY fpm.CreatedOn desc, fpm.PrivateMessageID desc

	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	SELECT  
		fpm.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Forums_PrivateMessage fpm on fpm.PrivateMessageID = [pi].PrivateMessageID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0
END
GO




CREATE PROCEDURE [dbo].[Nop_Forums_PrivateMessageUpdate]
(
	@PrivateMessageID int,
	@FromUserID int,
	@ToUserID int,
	@Subject nvarchar(450),
	@Text nvarchar(max),
	@IsRead bit,
	@IsDeletedByAuthor bit,
	@IsDeletedByRecipient bit,
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_PrivateMessage]
	SET
		[FromUserID]=@FromUserID,
		[ToUserID]=@ToUserID,
		[Subject]=@Subject,
		[Text]=@Text,
		[IsRead]=@IsRead,
		[IsDeletedByAuthor]=@IsDeletedByAuthor,
		[IsDeletedByRecipient]=@IsDeletedByRecipient,
		[CreatedOn]=@CreatedOn
	WHERE
		PrivateMessageID = @PrivateMessageID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductLoadAllPaged]
(
	@CategoryID			int = 0,
	@ManufacturerID		int = 0,
	@FeaturedProducts	bit = null,	--0 featured only , 1 not featured only, null - load all products
	@PriceMin			money = null,
	@PriceMax			money = null,
	@Keywords			nvarchar(MAX),	
	@SearchDescriptions bit = 0,
	@ShowHidden			bit = 0,
	@PageIndex			int = 0, 
	@PageSize			int = 2147483644,
	@FilteredSpecs		nvarchar(300) = null,	--filter by attributes (comma-separated list). e.g. 14,15,16
	@TotalRecords		int = null OUTPUT
)
AS
BEGIN
	
	--init
	SET @Keywords = isnull(@Keywords, '')
	SET @Keywords = '%' + rtrim(ltrim(@Keywords)) + '%'

	SET @PriceMin = isnull(@PriceMin, 0)
	SET @PriceMax = isnull(@PriceMax, 2147483644)

	--display order
	CREATE TABLE #DisplayOrder
	(
		ProductID int not null PRIMARY KEY,
		DisplayOrder int not null
	)	

	IF @CategoryID IS NOT NULL AND @CategoryID > 0
		BEGIN
			INSERT #DisplayOrder 
			SELECT pcm.ProductID, pcm.DisplayOrder 
			FROM [Nop_Product_Category_Mapping] pcm WHERE pcm.CategoryID = @CategoryID
		END
    ELSE IF @ManufacturerID IS NOT NULL AND @ManufacturerID > 0
		BEGIN
			INSERT #DisplayOrder 
			SELECT pmm.ProductID, pmm.Displayorder 
			FROM [Nop_Product_Manufacturer_Mapping] pmm WHERE pmm.ManufacturerID = @ManufacturerID
		END
	ELSE
		BEGIN
			INSERT #DisplayOrder 
			SELECT p.ProductID, 1 
			FROM [Nop_Product] p
			ORDER BY p.[Name]
		END
	
	--filter by attributes
	SET @FilteredSpecs = isnull(@FilteredSpecs, '')
	CREATE TABLE #FilteredSpecs
	(
		SpecificationAttributeOptionID int not null
	)
	INSERT INTO #FilteredSpecs (SpecificationAttributeOptionID)
	SELECT CAST(data as int) FROM dbo.[NOP_splitstring_to_table](@FilteredSpecs, ',');
	
	DECLARE @SpecAttributesCount int	
	SELECT @SpecAttributesCount = COUNT(1) FROM #FilteredSpecs

	--paging
	DECLARE @PageLowerBound int
	DECLARE @PageUpperBound int
	DECLARE @RowsToReturn int
	
	SET @RowsToReturn = @PageSize * (@PageIndex + 1)	
	SET @PageLowerBound = @PageSize * @PageIndex
	SET @PageUpperBound = @PageLowerBound + @PageSize + 1
	
	CREATE TABLE #PageIndex 
	(
		IndexID int IDENTITY (1, 1) NOT NULL,
		ProductID int NOT NULL,
		DisplayOrder int NOT NULL,
	)
	INSERT INTO #PageIndex (ProductID, DisplayOrder)
	SELECT DISTINCT p.ProductID, do.DisplayOrder
	FROM Nop_Product p with (NOLOCK) 
	LEFT OUTER JOIN Nop_Product_Category_Mapping pcm with (NOLOCK) ON p.ProductID=pcm.ProductID
	LEFT OUTER JOIN Nop_Product_Manufacturer_Mapping pmm with (NOLOCK) ON p.ProductID=pmm.ProductID
	LEFT OUTER JOIN Nop_ProductVariant pv with (NOLOCK) ON p.ProductID = pv.ProductID
	JOIN #DisplayOrder do on p.ProductID = do.ProductID
	WHERE 
		(
			(
				@ShowHidden = 1 OR p.Published = 1
			)
		AND 
			(
				@ShowHidden = 1 OR pv.Published = 1
			)
		AND 
			(
				p.Deleted=0
			)
		AND (
				@CategoryID IS NULL OR @CategoryID=0
				OR (pcm.CategoryID=@CategoryID AND (@FeaturedProducts IS NULL OR pcm.IsFeaturedProduct=@FeaturedProducts))
			)
		AND (
				@ManufacturerID IS NULL OR @ManufacturerID=0
				OR (pmm.ManufacturerID=@ManufacturerID AND (@FeaturedProducts IS NULL OR pmm.IsFeaturedProduct=@FeaturedProducts))
			)
		AND (
				pv.Price BETWEEN @PriceMin AND @PriceMax
			)
		AND	(
				patindex(@Keywords, isnull(p.name, '')) > 0
				or patindex(@Keywords, isnull(pv.name, '')) > 0
				or patindex(@Keywords, isnull(pv.sku , '')) > 0
				or (@SearchDescriptions = 1 and patindex(@Keywords, isnull(p.ShortDescription, '')) > 0)
				or (@SearchDescriptions = 1 and patindex(@Keywords, isnull(p.FullDescription, '')) > 0)
				or (@SearchDescriptions = 1 and patindex(@Keywords, isnull(pv.Description, '')) > 0)
			)
		AND
			(
				@ShowHidden = 1
				OR
				(getutcdate() between isnull(pv.AvailableStartDateTime, '1/1/1900') and isnull(pv.AvailableEndDateTime, '1/1/2999'))
			)
		AND
			(
				--filter by specs
				@SpecAttributesCount = 0
				OR
				(
					NOT EXISTS(
						SELECT 1 
						FROM #FilteredSpecs [fs]
						WHERE [fs].SpecificationAttributeOptionID NOT IN (
							SELECT psam.SpecificationAttributeOptionID
							FROM dbo.Nop_Product_SpecificationAttribute_Mapping psam
							WHERE psam.AllowFiltering = 1 AND psam.ProductID = p.ProductID
							)
						)
					
				)
			)
		)
	ORDER BY do.DisplayOrder

	--total records
	SET @TotalRecords = @@rowcount	
	SET ROWCOUNT @RowsToReturn
	
	--return
	SELECT  
		p.*
	FROM
		#PageIndex [pi]
		INNER JOIN Nop_Product p on p.ProductID = [pi].ProductID
	WHERE
		[pi].IndexID > @PageLowerBound AND 
		[pi].IndexID < @PageUpperBound
	ORDER BY
		IndexID
	
	SET ROWCOUNT 0

	DROP TABLE #DisplayOrder
	DROP TABLE #FilteredSpecs
	DROP TABLE #PageIndex
END
GO




CREATE PROCEDURE [dbo].[Nop_ProductPictureInsert]
(
	@ProductPictureID int = NULL output,
	@ProductID int,	
	@PictureID int,	
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductPicture]
	(
		ProductID,
		PictureID,
		DisplayOrder
	)
	VALUES
	(
		@ProductID,
		@PictureID,
		@DisplayOrder
	)

	set @ProductPictureID=@@identity
END
GO




CREATE PROCEDURE [dbo].[Nop_ProductPictureLoadByPrimaryKey]
(
	@ProductPictureID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductPicture]
	WHERE
		ProductPictureID = @ProductPictureID
END
GO




CREATE PROCEDURE [dbo].[Nop_ProductPictureDelete]
(
	@ProductPictureID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductPicture]
	WHERE
		ProductPictureID = @ProductPictureID
END
GO




CREATE PROCEDURE [dbo].[Nop_ProductPictureUpdate]
(
	@ProductPictureID int,
	@ProductID int,	
	@PictureID int,	
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_ProductPicture]
	SET
		ProductID=@ProductID,
		PictureID=@PictureID,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductPictureID = @ProductPictureID

END
GO




CREATE PROCEDURE [dbo].[Nop_ProductPictureLoadAllByProductID]
(
	@ProductID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM Nop_ProductPicture
	WHERE ProductID=@ProductID
	order by DisplayOrder
END
GO




CREATE PROCEDURE [dbo].[Nop_SearchLogLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_SearchLog]
	ORDER BY CreatedOn desc
END
GO




CREATE PROCEDURE [dbo].[Nop_SearchLogInsert]
(
	@SearchLogID int = NULL output,
	@SearchTerm nvarchar(100),
	@CustomerID int,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_SearchLog]
	(
		SearchTerm,
		CustomerID,
		CreatedOn
	)
	VALUES
	(
		@SearchTerm,
		@CustomerID,
		@CreatedOn
	)

	set @SearchLogID=@@identity
END
GO




CREATE PROCEDURE [dbo].[Nop_SearchTermReport]
	@StartTime datetime = NULL,
	@EndTime datetime = NULL,
	@Count int
AS
BEGIN
	
	if (@Count > 0)
	      SET ROWCOUNT @Count

	SELECT SearchTerm, COUNT(1) as SearchCount FROM Nop_SearchLog
	WHERE
			(@StartTime is NULL or DATEDIFF(day, @StartTime, CreatedOn) >= 0) and
			(@EndTime is NULL or DATEDIFF(day, @EndTime, CreatedOn) <= 0) 
	GROUP BY SearchTerm 
	ORDER BY SearchCount desc

	SET ROWCOUNT 0
END
GO




CREATE PROCEDURE [dbo].[Nop_SearchLogLoadByPrimaryKey]
(
	@SearchLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_SearchLog]
	WHERE
		SearchLogID = @SearchLogID
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerRoleLoadByCustomerID]
	@ShowHidden bit = 0,
	@CustomerID int = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT cr.*
	FROM [Nop_CustomerRole] cr
	INNER JOIN Nop_Customer_CustomerRole_Mapping crm
	ON cr.CustomerRoleID = crm.CustomerRoleID
	WHERE (cr.Active = 1 or @ShowHidden = 1) and cr.Deleted=0 and crm.CustomerID=@CustomerID
	order by [Name]
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerLoadByCustomerRoleID]
	@ShowHidden bit = 0,
	@CustomerRoleID int = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT c.*
	FROM [Nop_Customer] c
	INNER JOIN Nop_Customer_CustomerRole_Mapping crm
	ON c.CustomerID = crm.CustomerID
	WHERE (c.Active = 1 or @ShowHidden = 1) and c.Deleted=0 and crm.CustomerRoleID=@CustomerRoleID
	order by [RegistrationDate] desc
END
GO




CREATE PROCEDURE [dbo].[Nop_Customer_CustomerRole_MappingInsert]
(
	@CustomerID int,
	@CustomerRoleID int
)
AS
BEGIN
	IF NOT EXISTS (SELECT (1) FROM [Nop_Customer_CustomerRole_Mapping] WHERE CustomerID=@CustomerID and CustomerRoleID=@CustomerRoleID)
	INSERT
		INTO [Nop_Customer_CustomerRole_Mapping]
		(
			CustomerID,
			CustomerRoleID
		)
		VALUES
		(
			@CustomerID,
			@CustomerRoleID
		)
END
GO




CREATE PROCEDURE [dbo].[Nop_Customer_CustomerRole_MappingDelete]
(
	@CustomerID int,
	@CustomerRoleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Customer_CustomerRole_Mapping]
	WHERE
		CustomerID = @CustomerID and CustomerRoleID=@CustomerRoleID
END
GO




CREATE PROCEDURE [dbo].[Nop_CustomerRoleUpdate]
(
	@CustomerRoleID int,
	@Name nvarchar(255),
	@FreeShipping bit,
	@TaxExempt bit,
	@Active bit,
	@Deleted bit
)
AS
BEGIN
	UPDATE [Nop_CustomerRole]
	SET
		[Name]=@Name,
		FreeShipping=@FreeShipping,
		TaxExempt=@TaxExempt,
		Active=@Active,
		Deleted=@Deleted

	WHERE
		CustomerRoleID = @CustomerRoleID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRoleLoadByDiscountID]
(
	@DiscountID int,
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		cr.*
	FROM [Nop_CustomerRole] cr
	INNER JOIN [Nop_CustomerRole_Discount_Mapping] crm
	ON cr.CustomerRoleID = crm.CustomerRoleID
	WHERE (cr.Active = 1 or @ShowHidden = 1) and cr.Deleted=0 and crm.DiscountID=@DiscountID
	order by cr.Name
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRoleInsert]
(
	@CustomerRoleID int = NULL output,
	@Name nvarchar(255),
	@FreeShipping bit,
	@TaxExempt bit,
	@Active bit,
	@Deleted bit
)
AS
BEGIN
	INSERT
	INTO [Nop_CustomerRole]
	(
		[Name],
		FreeShipping,
		TaxExempt,
		Active,
		Deleted	
	)
	VALUES
	(
		@Name,
		@FreeShipping,
		@TaxExempt,
		@Active,
		@Deleted
	)

	set @CustomerRoleID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRoleLoadByPrimaryKey]
(
	@CustomerRoleID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CustomerRole]
	WHERE
		CustomerRoleID = @CustomerRoleID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRoleLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_CustomerRole]
	WHERE (Active = 1 or @ShowHidden = 1) and Deleted=0
	order by [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewHelpfulnessCreate]
(
	@ProductReviewID int,
	@CustomerID int,
	@WasHelpful bit
)
AS
BEGIN

	DELETE FROM Nop_ProductReviewHelpfulness 
	WHERE ProductReviewID=@ProductReviewID AND 
			CustomerID=@CustomerID
	
	INSERT
	INTO [Nop_ProductReviewHelpfulness]
	(
		ProductReviewID,
		CustomerID,
		WasHelpful
	)
	VALUES
	(
		@ProductReviewID,
		@CustomerID,
		@WasHelpful
	)
	
	DECLARE @HelpfulYesTotal int
	SELECT @HelpfulYesTotal = COUNT(ProductReviewHelpfulnessID) 
	FROM Nop_ProductReviewHelpfulness
	WHERE ProductReviewID=@ProductReviewID and WasHelpful=1

	DECLARE @HelpfulNoTotal int
	SELECT @HelpfulNoTotal = COUNT(ProductReviewHelpfulnessID) 
	FROM Nop_ProductReviewHelpfulness
	WHERE ProductReviewID=@ProductReviewID and WasHelpful=0

	UPDATE Nop_ProductReview
	SET 
		HelpfulYesTotal=@HelpfulYesTotal,
		HelpfulNoTotal=@HelpfulNoTotal 
	WHERE ProductReviewID=@ProductReviewID
	


END
GO



CREATE PROCEDURE [dbo].[Nop_LogDelete]
(
	@LogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Log]
	WHERE
		LogID = @LogID
END
GO



CREATE PROCEDURE [dbo].[Nop_LogLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Log]
	ORDER BY CreatedOn desc
END
GO



CREATE PROCEDURE [dbo].[Nop_LogLoadByPrimaryKey]
(
	@LogID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Log]
	WHERE
		LogID=@LogID
END
GO



CREATE PROCEDURE [dbo].[Nop_LogClear]

AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Log]
END
GO



CREATE PROCEDURE [dbo].[Nop_LogInsert]
(
	@LogID int = NULL output,
	@LogTypeID int,
	@Severity int,
	@Message nvarchar(1000),
	@Exception nvarchar(4000),
	@IPAddress nvarchar(100),
	@CustomerID int,
	@PageURL nvarchar(100),
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Log]
	(
		LogTypeID,
		Severity,
		[Message],
		Exception,
		IPAddress,
		CustomerID,
		PageURL,
		CreatedOn
	)
	VALUES
	(
		@LogTypeID,
		@Severity,
		@Message,
		@Exception,
		@IPAddress,
		@CustomerID,
		@PageURL,
		@CreatedOn
	)

	set @LogID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SELECT *
	FROM [Nop_Country]
	WHERE (Published = 1 or @ShowHidden = 1)
	ORDER BY DisplayOrder, [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadAllForBilling]
	@ShowHidden bit = 0
AS
BEGIN
	SELECT *
	FROM [Nop_Country]
	WHERE (Published = 1 or @ShowHidden = 1) and AllowsBilling=1
	ORDER BY DisplayOrder, [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadAllForRegistration]
	@ShowHidden bit = 0
AS
BEGIN
	SELECT *
	FROM [Nop_Country]
	WHERE (Published = 1 or @ShowHidden = 1) and AllowsRegistration=1
	ORDER BY DisplayOrder, [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadAllForShipping]
	@ShowHidden bit = 0
AS
BEGIN
	SELECT *
	FROM [Nop_Country]
	WHERE (Published = 1 or @ShowHidden = 1) and AllowsShipping=1
	ORDER BY DisplayOrder, [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryDelete]
(
	@CountryId int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Country]
	WHERE
		[CountryId] = @CountryId
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadByThreeLetterISOCode]
(
	@ThreeLetterISOCode nvarchar(3)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Country]
	WHERE
		(ThreeLetterISOCode = @ThreeLetterISOCode)
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadByTwoLetterISOCode]
(
	@TwoLetterISOCode nvarchar(2)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Country]
	WHERE
		(TwoLetterISOCode = @TwoLetterISOCode)
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxRateLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		 tr.*
	FROM Nop_TaxRate tr
	LEFT OUTER JOIN Nop_Country c
	ON tr.CountryID = c.CountryID
	LEFT OUTER JOIN Nop_StateProvince sp
	ON tr.StateProvinceID = sp.StateProvinceID
	ORDER BY c.DisplayOrder,c.Name, sp.DisplayOrder,sp.Name, sp.StateProvinceID, Zip, TaxCategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryLoadByPrimaryKey]
(
	@CountryId int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Country]
	WHERE
		([CountryId] = @CountryId)
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryInsert]
(
	@CountryId int = NULL output,
	@Name nvarchar(100),
	@AllowsRegistration bit, 
	@AllowsBilling bit, 
	@AllowsShipping bit, 
	@TwoLetterISOCode nvarchar(2),
	@ThreeLetterISOCode nvarchar(3),
	@NumericISOCode int,
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_Country]
	(
		[Name],
		[AllowsRegistration],
		[AllowsBilling],
		[AllowsShipping],
		[TwoLetterISOCode],
		[ThreeLetterISOCode],
		[NumericISOCode],
		[Published],
		[DisplayOrder]
	)
	VALUES
	(
		@Name,
		@AllowsRegistration,
		@AllowsBilling,
		@AllowsShipping,
		@TwoLetterISOCode,
		@ThreeLetterISOCode,
		@NumericISOCode,
		@Published,
		@DisplayOrder
	)

	set @CountryId=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CountryUpdate]
(
	@CountryId int,
	@Name nvarchar(100),
	@AllowsRegistration bit, 
	@AllowsBilling bit, 
	@AllowsShipping bit, 
	@TwoLetterISOCode nvarchar(2),
	@ThreeLetterISOCode nvarchar(3),
	@NumericISOCode int,
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_Country]
	SET
		[Name] = @Name,
		[AllowsRegistration]=@AllowsRegistration,		
		[AllowsBilling]=@AllowsBilling,
		[AllowsShipping] =@AllowsShipping,
		[TwoLetterISOCode] = @TwoLetterISOCode,
		[ThreeLetterISOCode] = @ThreeLetterISOCode,
		[NumericISOCode] = @NumericISOCode,
		[Published] = @Published,
		[DisplayOrder] = @DisplayOrder
	WHERE
		[CountryId] = @CountryId
END
GO




CREATE PROCEDURE [dbo].[Nop_StateProvinceUpdate]
(
	@StateProvinceID int,
	@CountryID int,
	@Name nvarchar(100),
	@Abbreviation nvarchar (10),
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_StateProvince]
	SET
		CountryID=@CountryID,
		[Name]=@Name,
		Abbreviation=@Abbreviation,
		DisplayOrder=@DisplayOrder
	WHERE
		StateProvinceID = @StateProvinceID
END
GO




CREATE PROCEDURE [dbo].[Nop_StateProvinceLoadByPrimaryKey]
(
	@StateProvinceID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_StateProvince]
	WHERE
		StateProvinceID = @StateProvinceID
END
GO



CREATE PROCEDURE [dbo].[Nop_StateProvinceInsert]
(
	@StateProvinceID int = NULL output,
	@CountryID int,
	@Name nvarchar(100),
	@Abbreviation nvarchar (10),
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_StateProvince]
	(
		CountryID,
		[Name],
		Abbreviation,
		[DisplayOrder]
	)
	VALUES
	(
		@CountryID,
		@Name,
		@Abbreviation,
		@DisplayOrder
	)

	set @StateProvinceID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_StateProvinceDelete]
(
	@StateProvinceID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_StateProvince]
	WHERE
		StateProvinceID = @StateProvinceID

	DELETE 
	FROM Nop_TaxRate
	WHERE
		StateProvinceID = @StateProvinceID
END
GO



CREATE PROCEDURE [dbo].[Nop_StateProvinceLoadAllByCountryID]
	@CountryID int
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT *
	FROM [Nop_StateProvince]
	WHERE CountryID=@CountryID 
	ORDER BY DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_StateProvinceLoadByAbbreviation]
(
	@Abbreviation nvarchar(10)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_StateProvince]
	WHERE
		Abbreviation = @Abbreviation
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxRateLoadByPrimaryKey]
(
	@TaxRateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TaxRate]
	WHERE
		TaxRateID = @TaxRateID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxRateUpdate]
(
	@TaxRateID int,
	@TaxCategoryID int,
	@CountryID int,
	@StateProvinceID int,
	@Zip nvarchar(50),
	@Percentage decimal(18,4)
)
AS
BEGIN
	UPDATE [Nop_TaxRate]
	SET
		TaxCategoryID=@TaxCategoryID,
		CountryID=@CountryID,
		StateProvinceID=@StateProvinceID,
		Zip=@Zip,
		Percentage=@Percentage
	WHERE
		TaxRateID = @TaxRateID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxRateDelete]
(
	@TaxRateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_TaxRate]
	WHERE
		TaxRateID = @TaxRateID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxRateInsert]
(
	@TaxRateID int = NULL output,
	@TaxCategoryID int,
	@CountryID int,
	@StateProvinceID int,
	@Zip nvarchar(50),
	@Percentage decimal(18,4)
)
AS
BEGIN
	INSERT
	INTO [Nop_TaxRate]
	(
		[TaxCategoryID],
		[CountryID],
		[StateProvinceID],
		[Zip],
		[Percentage]
	)
	VALUES
	(
		@TaxCategoryID,
		@CountryID,
		@StateProvinceID,
		@Zip,
		@Percentage
	)

	set @TaxRateID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_WarehouseInsert]
(
	@WarehouseID int = NULL output,
	@Name nvarchar(255),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvince nvarchar(100),
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@Deleted bit,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Warehouse]
	(
		[Name],
		PhoneNumber,
		Email,
		FaxNumber,
		Address1,
		Address2,
		City,
		StateProvince,
		ZipPostalCode,
		CountryID,
		Deleted,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@Name,
		@PhoneNumber,
		@Email,
		@FaxNumber,
		@Address1,
		@Address2,
		@City,
		@StateProvince,
		@ZipPostalCode,
		@CountryID,
		@Deleted,
		@CreatedOn,
		@UpdatedOn
	)

	set @WarehouseID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_WarehouseLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Warehouse]
	WHERE Deleted=0
END
GO



CREATE PROCEDURE [dbo].[Nop_WarehouseUpdate]
(
	@WarehouseID int,
	@Name nvarchar(255),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvince nvarchar(100),
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@Deleted bit,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Warehouse]
	SET
	[Name]=@Name,
	PhoneNumber=@PhoneNumber,
	Email=@Email,
	FaxNumber=@FaxNumber,
	Address1=@Address1,
	Address2=@Address2,
	City=@City,
	StateProvince=@StateProvince,
	ZipPostalCode=@ZipPostalCode,
	CountryID=@CountryID,
	Deleted=@Deleted,
	CreatedOn=@CreatedOn,
	UpdatedOn=@UpdatedOn
	WHERE
		[WarehouseID] = @WarehouseID
END
GO



CREATE PROCEDURE [dbo].[Nop_WarehouseLoadByPrimaryKey]
(
	@WarehouseID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Warehouse]
	WHERE
		(WarehouseID = @WarehouseID)
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryInsert]
(
	@ShippingByWeightAndCountryID int = NULL output,
	@ShippingMethodID int,
	@CountryID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	INSERT
	INTO [Nop_ShippingByWeightAndCountry]
	(
		ShippingMethodID,
		CountryID,
		[From],
		[To],
		UsePercentage,
		ShippingChargePercentage,
		ShippingChargeAmount
	)
	VALUES
	(
		@ShippingMethodID,
		@CountryID,
		@From,
		@To,
		@UsePercentage,
		@ShippingChargePercentage,
		@ShippingChargeAmount
	)

	set @ShippingByWeightAndCountryID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryLoadByPrimaryKey]
(
	@ShippingByWeightAndCountryID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByWeightAndCountry]
	WHERE
		ShippingByWeightAndCountryID = @ShippingByWeightAndCountryID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ShippingByWeightAndCountry]
	ORDER BY CountryID, ShippingMethodID, [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryUpdate]
(
	@ShippingByWeightAndCountryID int,
	@ShippingMethodID int,
	@CountryID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	UPDATE [Nop_ShippingByWeightAndCountry]
	SET
		ShippingMethodID=@ShippingMethodID,
		CountryID=@CountryID,
		[From]=@From,
		[To]=@To,
		UsePercentage=@UsePercentage,
		ShippingChargePercentage=@ShippingChargePercentage,
		ShippingChargeAmount=@ShippingChargeAmount
	WHERE
		ShippingByWeightAndCountryID = @ShippingByWeightAndCountryID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryLoadByShippingMethodIDAndCountryID]
(
	@ShippingMethodID int,
	@CountryID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByWeightAndCountry]
	WHERE
		ShippingMethodID=@ShippingMethodID and CountryID=@CountryID
	ORDER BY [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightAndCountryDelete]
(
	@ShippingByWeightAndCountryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ShippingByWeightAndCountry]
	WHERE
		ShippingByWeightAndCountryID = @ShippingByWeightAndCountryID
END
GO



CREATE PROCEDURE [dbo].[Nop_AffiliateInsert]
(
	@AffiliateID int = NULL output,
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@MiddleName nvarchar(100),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Company nvarchar(100),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvince nvarchar(100),
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@Deleted bit,
	@Active bit
)
AS
BEGIN
	INSERT
	INTO [Nop_Affiliate]
	(
		FirstName,
		LastName,
		MiddleName,
		PhoneNumber,
		Email,
		FaxNumber,
		Company,
		Address1,
		Address2,
		City,
		StateProvince,
		ZipPostalCode,
		CountryID,
		Deleted,
		Active
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@MiddleName,
		@PhoneNumber,
		@Email,
		@FaxNumber,
		@Company,
		@Address1,
		@Address2,
		@City,
		@StateProvince,
		@ZipPostalCode,
		@CountryID,
		@Deleted,
		@Active
	)

	set @AffiliateID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_AffiliateUpdate]
(
	@AffiliateID int,
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@MiddleName nvarchar(100),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Company nvarchar(100),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvince nvarchar(100),
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@Deleted bit,
	@Active bit
)
AS
BEGIN

	UPDATE [Nop_Affiliate]
	SET
		FirstName=@FirstName,
		LastName=@LastName,
		MiddleName=@MiddleName,
		PhoneNumber=@PhoneNumber,
		Email=@Email,
		FaxNumber=@FaxNumber,
		Company=@Company,
		Address1=@Address1,
		Address2=@Address2,
		City=@City,
		StateProvince=@StateProvince,
		ZipPostalCode=@ZipPostalCode,
		CountryID=@CountryID,
		Deleted=@Deleted,
		Active=@Active
	WHERE
		AffiliateID = @AffiliateID

END
GO



CREATE PROCEDURE [dbo].[Nop_AffiliateLoadByPrimaryKey]
(
	@AffiliateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Affiliate]
	WHERE
		AffiliateID = @AffiliateID
END
GO



CREATE PROCEDURE [dbo].[Nop_AffiliateLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Affiliate]
	WHERE Deleted=0
	ORDER BY LastName
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxCategoryLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_TaxCategory]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxCategoryUpdate]
(
	@TaxCategoryID int,
	@Name nvarchar(100),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_TaxCategory]
	SET
		[Name]=@Name,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		TaxCategoryID = @TaxCategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxCategoryDelete]
(
	@TaxCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_TaxCategory]
	WHERE
		TaxCategoryID = @TaxCategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxCategoryLoadByPrimaryKey]
(
	@TaxCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TaxCategory]
	WHERE
		(TaxCategoryID = @TaxCategoryID)
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxCategoryInsert]
(
	@TaxCategoryID int = NULL output,
	@Name nvarchar(100),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_TaxCategory]
	(
		[Name],
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @TaxCategoryID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAttributeInsert]
(
	@ProductAttributeID int = NULL output,
	@Name nvarchar(100),
	@Description nvarchar(4000)
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductAttribute]
	(
		[Name],
		[Description]
	)
	VALUES
	(
		@Name,
		@Description
	)

	set @ProductAttributeID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAttributeLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ProductAttribute]
	order by [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAttributeDelete]
(
	@ProductAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductAttribute]
	WHERE
		ProductAttributeID = @ProductAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAttributeLoadByPrimaryKey]
(
	@ProductAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductAttribute]
	WHERE
		ProductAttributeID = @ProductAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductAttributeUpdate]
(
	@ProductAttributeID int,
	@Name nvarchar(100),
	@Description nvarchar(4000)
)
AS
BEGIN

	UPDATE [Nop_ProductAttribute]
	SET
		[Name]=@Name,
		[Description]=@Description
	WHERE
		ProductAttributeID = @ProductAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxProviderDelete]
(
	@TaxProviderID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM Nop_TaxProvider
	WHERE
		 TaxProviderID = @TaxProviderID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxProviderLoadByPrimaryKey]
(
	@TaxProviderID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TaxProvider]
	WHERE
		TaxProviderID = @TaxProviderID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxProviderLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_TaxProvider]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxProviderUpdate]
(
	@TaxProviderID int,
	@Name nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_TaxProvider]
	SET
		[Name]=@Name,
		[Description]=@Description,
		ConfigureTemplatePath=@ConfigureTemplatePath,
		ClassName=@ClassName,
		DisplayOrder=@DisplayOrder

	WHERE
		TaxProviderID = @TaxProviderID
END
GO



CREATE PROCEDURE [dbo].[Nop_TaxProviderInsert]
(
	@TaxProviderID int = NULL output,
	@Name nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_TaxProvider]
	(
		[Name],
		[Description],
		ConfigureTemplatePath,
		ClassName,
		DisplayOrder
	)
	VALUES
	(
		@Name,
		@Description,
		@ConfigureTemplatePath,
		@ClassName,
		@DisplayOrder
	)

	set @TaxProviderID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_QueuedEmailLoadAll]
(	
	@FromEmail nvarchar(255) = NULL,
	@ToEmail nvarchar(255) = NULL,
	@StartTime datetime = NULL,
	@EndTime datetime = NULL,
	@QueuedEmailCount int,
	@LoadNotSentItemsOnly bit,
	@MaxSendTries int
)
AS
BEGIN
	IF (@QueuedEmailCount > 0)
	SET ROWCOUNT @QueuedEmailCount

	SELECT qu.*
	FROM [Nop_QueuedEmail] qu
	WHERE 
		(@FromEmail IS NULL or LEN(@FromEmail)=0 or (qu.[From] like '%' + COALESCE(@FromEmail,qu.[From]) + '%')) AND
		(@ToEmail IS NULL or LEN(@ToEmail)=0 or (qu.[To] like '%' + COALESCE(@ToEmail,qu.[To]) + '%')) AND
		(@StartTime is NULL or DATEDIFF(day, @StartTime, qu.CreatedOn) >= 0) AND
		(@EndTime is NULL or DATEDIFF(day, @EndTime, qu.CreatedOn) <= 0) AND 
		((@LoadNotSentItemsOnly IS NULL OR @LoadNotSentItemsOnly=0) OR (qu.SentOn IS NULL)) AND
		(qu.SendTries < @MaxSendTries)
	ORDER BY qu.Priority desc, qu.CreatedOn ASC
	
	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_QueuedEmailInsert]
(
	@QueuedEmailID int = NULL output,
	@Priority int,
	@From nvarchar(500),
	@FromName nvarchar(500),
	@To nvarchar(500),
	@ToName nvarchar(500),
	@Cc nvarchar(500),
	@Bcc nvarchar(500),
	@Subject nvarchar(500),
	@Body nvarchar(MAX),
	@CreatedOn datetime,
	@SendTries int,
	@SentOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_QueuedEmail]
	(
		[Priority],
		[From],
		[FromName],
		[To],
		[ToName],
		[Cc],
		[Bcc],
		[Subject],
		[Body],
		[CreatedOn],
		[SendTries],
		[SentOn]
	)
	VALUES
	(
		@Priority,
		@From,
		@FromName,
		@To,
		@ToName,
		@Cc,
		@Bcc,
		@Subject,
		@Body,
		@CreatedOn,
		@SendTries,
		@SentOn
	)

	set @QueuedEmailID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_QueuedEmailDelete]
(
	@QueuedEmailID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_QueuedEmail]
	WHERE
		[QueuedEmailID] = @QueuedEmailID
END
GO



CREATE PROCEDURE [dbo].[Nop_QueuedEmailLoadByPrimaryKey]
(
	@QueuedEmailID int
)
AS
BEGIN
SET NOCOUNT ON
SELECT
*
FROM [Nop_QueuedEmail]
WHERE
	QueuedEmailID=@QueuedEmailID
END
GO



CREATE PROCEDURE [dbo].[Nop_QueuedEmailUpdate]
(
	@QueuedEmailID int,
	@Priority int,
	@From nvarchar(500),
	@FromName nvarchar(500),
	@To nvarchar(500),
	@ToName nvarchar(500),
	@Cc nvarchar(500),
	@Bcc nvarchar(500),
	@Subject nvarchar(500),
	@Body nvarchar(MAX),
	@CreatedOn datetime,
	@SendTries int,
	@SentOn datetime
)
AS
BEGIN
UPDATE [Nop_QueuedEmail]
SET
	[Priority]=@Priority,
	[From]=@From,
	[FromName]=@FromName,
	[To]=@To,
	[ToName]=@ToName,
	[Cc]=@Cc,
	[Bcc]=@Bcc,
	[Subject]=@Subject,
	[Body]=@Body,
	[CreatedOn]=@CreatedOn,
	[SendTries]=@SendTries,
	[SentOn]=@SentOn
WHERE
	QueuedEmailID= @QueuedEmailID

END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpAddressUpdate]
	@BannedIpAddressID int,
	@Address nvarchar(50),
	@Comment nvarchar(500),
	@CreatedOn datetime,
	@UpdatedOn datetime
AS
BEGIN

	UPDATE Nop_BannedIpAddress 
	SET
		[Address] = @Address,
		[Comment] = @Comment,
		[CreatedOn] = @CreatedOn,
		[UpdatedOn] = @UpdatedOn
	WHERE 
		BannedIpAddressID = @BannedIpAddressID

END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpAddressLoadByPrimaryKey]
	@BannedIpAddressID int
AS
BEGIN
	SET NOCOUNT ON

	SELECT * 
	FROM Nop_BannedIpAddress
	WHERE BannedIpAddressID = @BannedIpAddressID
	ORDER BY BannedIpAddressID
	
END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpAddressLoadAll]
AS
BEGIN
	SET NOCOUNT ON

	SELECT *
	FROM Nop_BannedIpAddress
	ORDER BY BannedIpAddressID
	
END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpAddressDelete]
	@BannedIpAddressID int
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM Nop_BannedIpAddress 
	WHERE BannedIpAddressID = @BannedIpAddressID
	
END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpAddressInsert]
	@BannedIpAddressID int = NULL output,
	@Address nvarchar(50),
	@Comment nvarchar(500),
	@CreatedOn datetime,
	@UpdatedOn datetime
AS
BEGIN

	INSERT 
	INTO Nop_BannedIpAddress 
	(
		[Address],
		[Comment], 
		[CreatedOn],
		[UpdatedOn]
	)
	VALUES 
	(
		@Address,
		@Comment,
		@CreatedOn,
		@UpdatedOn
	)
	
	SET @BannedIpAddressID = SCOPE_IDENTITY()

END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingMethodLoadByPrimaryKey]
(
	@ShippingMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingMethod]
	WHERE
		ShippingMethodID = @ShippingMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingMethodUpdate]
(
	@ShippingMethodID int,
	@Name nvarchar(100),
	@Description nvarchar(2000),
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_ShippingMethod]
	SET
		[Name]=@Name,
		[Description]=@Description,
		DisplayOrder=@DisplayOrder
	WHERE
		ShippingMethodID = @ShippingMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingMethodInsert]
(
	@ShippingMethodID int = NULL output,
	@Name nvarchar(100),
	@Description nvarchar(2000),
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_ShippingMethod]
	(
		[Name],
		[Description],
		DisplayOrder
	)
	VALUES
	(
		@Name,
		@Description,
		@DisplayOrder
	)

	set @ShippingMethodID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingMethodLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ShippingMethod]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingMethodDelete]
(
	@ShippingMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ShippingMethod]
	WHERE
		ShippingMethodID = @ShippingMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingStatusLoadByPrimaryKey]
(
	@ShippingStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingStatus]
	WHERE
		ShippingStatusID = @ShippingStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingStatusLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingStatus]
	ORDER BY ShippingStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingRateComputationMethodInsert]
(
	@ShippingRateComputationMethodID int = NULL output,
	@Name nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_ShippingRateComputationMethod]
	(
		[Name],
		[Description],
		ConfigureTemplatePath,
		ClassName,
		DisplayOrder
	)
	VALUES
	(
		@Name,
		@Description,
		@ConfigureTemplatePath,
		@ClassName,
		@DisplayOrder
	)

	set @ShippingRateComputationMethodID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingRateComputationMethodUpdate]
(
	@ShippingRateComputationMethodID int,
	@Name nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_ShippingRateComputationMethod]
	SET
		[Name]=@Name,
		[Description]=@Description,
		ConfigureTemplatePath=@ConfigureTemplatePath,
		ClassName=@ClassName,
		DisplayOrder=@DisplayOrder

	WHERE
		ShippingRateComputationMethodID = @ShippingRateComputationMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingRateComputationMethodDelete]
(
	@ShippingRateComputationMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM Nop_ShippingRateComputationMethod
	WHERE
		 ShippingRateComputationMethodID = @ShippingRateComputationMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingRateComputationMethodLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ShippingRateComputationMethod]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingRateComputationMethodLoadByPrimaryKey]
(
	@ShippingRateComputationMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingRateComputationMethod]
	WHERE
		ShippingRateComputationMethodID = @ShippingRateComputationMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Discount_MappingInsert]
(
	@ProductVariantID int,
	@DiscountID int
)
AS
BEGIN
	IF NOT EXISTS (SELECT (1) FROM [Nop_ProductVariant_Discount_Mapping] WHERE ProductVariantID=@ProductVariantID and DiscountID=@DiscountID)
	INSERT
		INTO [Nop_ProductVariant_Discount_Mapping]
		(
			ProductVariantID,
			DiscountID
		)
		VALUES
		(
			@ProductVariantID,
			@DiscountID
		)
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Discount_MappingDelete]
(
	@ProductVariantID int,
	@DiscountID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductVariant_Discount_Mapping]
	WHERE
		ProductVariantID = @ProductVariantID and DiscountID=@DiscountID
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountLoadByProductVariantID]
(
	@ProductVariantID int,
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		d.*
	FROM [Nop_Discount] d
	INNER JOIN Nop_ProductVariant_Discount_Mapping pdm
	ON d.DiscountID = pdm.DiscountID
	WHERE ((getutcdate() between d.StartDate and d.EndDate) or @ShowHidden = 1) and d.Deleted=0 and pdm.ProductVariantID=@ProductVariantID
	order by d.StartDate desc
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderStatusLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderStatus]
	ORDER BY OrderStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderStatusLoadByPrimaryKey]
(
	@OrderStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderStatus]
	WHERE
		OrderStatusID = @OrderStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_TierPriceLoadAllByProductVariantID]
(
	@ProductVariantID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TierPrice]
	WHERE
		ProductVariantID=@ProductVariantID
	ORDER BY Quantity
END
GO



CREATE PROCEDURE [dbo].[Nop_TierPriceUpdate]
(
	@TierPriceID int,
	@ProductVariantID int,
	@Quantity int,
	@Price money
)
AS
BEGIN
	UPDATE [Nop_TierPrice]
	SET
	ProductVariantID=@ProductVariantID,
	[Quantity]=@Quantity,
	[Price]=@Price
	WHERE
		TierPriceID = @TierPriceID
END

IF NOT EXISTS (
		SELECT 1
		FROM [dbo].[Nop_LocaleStringResource]
		WHERE [LanguageID]=7 and [ResourceName] = N'Products.BuyNforX')
BEGIN
	INSERT [dbo].[Nop_LocaleStringResource] ([LanguageID], [ResourceName], [ResourceValue])
	VALUES (7, N'Products.BuyNforX', N'Buy {0} for {1} each')
END
GO



CREATE PROCEDURE [dbo].[Nop_TierPriceInsert]
(
	@TierPriceID int = NULL output,
	@ProductVariantID int,
	@Quantity int,
	@Price money
)
AS
BEGIN
	INSERT
	INTO [Nop_TierPrice]
	(
		[ProductVariantID],
		[Quantity],
		[Price]
	)
	VALUES
	(
		@ProductVariantID,
		@Quantity,
		@Price
	)

	set @TierPriceID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_TierPriceDelete]
(
	@TierPriceID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_TierPrice]
	WHERE
		TierPriceID = @TierPriceID
END
GO



CREATE PROCEDURE [dbo].[Nop_TierPriceLoadByPrimaryKey]
(
	@TierPriceID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TierPrice]
	WHERE
		TierPriceID = @TierPriceID
END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpNetworkLoadByPrimaryKey]
	@BannedIpNetworkID int
AS
BEGIN
	SET NOCOUNT ON

	SELECT * 
	FROM Nop_BannedIpNetwork
	WHERE BannedIpNetworkID = @BannedIpNetworkID
	ORDER BY BannedIpNetworkID

END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpNetworkLoadAll]
AS
BEGIN
	SET NOCOUNT ON

	SELECT *
	FROM Nop_BannedIpNetwork 
	ORDER BY BannedIpNetworkID

END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpNetworkInsert]
	@BannedIpNetworkID int = NULL output,
	@StartAddress nvarchar(50),
	@EndAddress nvarchar(50),
	@Comment nvarchar(500),
	@IpException nvarchar(max),
	@CreatedOn datetime,
	@UpdatedOn datetime
AS
BEGIN

	INSERT 
	INTO Nop_BannedIpNetwork 
	(
		StartAddress,
		EndAddress,
		Comment,
		IpException,
		CreatedOn,
		UpdatedOn
	)
	VALUES 
	(
		@StartAddress,
		@EndAddress,
		@Comment,
		@IpException,
		@CreatedOn,
		@UpdatedOn
	)
	
	SET @BannedIpNetworkID = SCOPE_IDENTITY()
	
END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpNetworkUpdate]
	@BannedIpNetworkID int,
	@StartAddress nvarchar(50),
	@EndAddress nvarchar(50),
	@Comment nvarchar(500),
	@IpException nvarchar(max),
	@CreatedOn datetime,
	@UpdatedOn datetime
AS
BEGIN

	UPDATE Nop_BannedIpNetwork
	 SET
		StartAddress = @StartAddress,
		EndAddress = @EndAddress,
		Comment = @Comment,
		IpException = @IpException,
		CreatedOn = @CreatedOn,
		UpdatedOn = @UpdatedOn
	WHERE 
		BannedIpNetworkID = @BannedIpNetworkID

END
GO



CREATE PROCEDURE [dbo].[Nop_BannedIpNetworkDelete]
	@BannedIpNetworkID int
AS
BEGIN
	SET NOCOUNT ON

	DELETE FROM Nop_BannedIpNetwork
	WHERE BannedIpNetworkID = @BannedIpNetworkID

END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantAttributeValueDelete]
(
	@ProductVariantAttributeValueID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductVariantAttributeValue]
	WHERE
		ProductVariantAttributeValueID = @ProductVariantAttributeValueID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantAttributeValueInsert]
(
	@ProductVariantAttributeValueID int = NULL output,
	@ProductVariantAttributeID int,
	@Name nvarchar (100),
	@PriceAdjustment money,
	@WeightAdjustment decimal(18, 4),
	@IsPreSelected bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductVariantAttributeValue]
	(
		[ProductVariantAttributeID],
		[Name],
		[PriceAdjustment],
		[WeightAdjustment],
		[IsPreSelected],
		[DisplayOrder]
	)
	VALUES
	(
		@ProductVariantAttributeID,
		@Name,
		@PriceAdjustment,
		@WeightAdjustment,
		@IsPreSelected,
		@DisplayOrder
	)

	set @ProductVariantAttributeValueID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantAttributeValueUpdate]
(
	@ProductVariantAttributeValueID int,
	@ProductVariantAttributeID int,
	@Name nvarchar (100),
	@PriceAdjustment money,
	@WeightAdjustment decimal(18, 4),
	@IsPreSelected bit,
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_ProductVariantAttributeValue]
	SET
		ProductVariantAttributeID=@ProductVariantAttributeID,
		[Name]=@Name,
		PriceAdjustment=@PriceAdjustment,
		WeightAdjustment=@WeightAdjustment,
		IsPreSelected=@IsPreSelected,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductVariantAttributeValueID = @ProductVariantAttributeValueID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantAttributeValueLoadByPrimaryKey]
(
	@ProductVariantAttributeValueID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductVariantAttributeValue]
	WHERE
		ProductVariantAttributeValueID = @ProductVariantAttributeValueID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantAttributeValueLoadByProductVariantAttributeID]
(
	@ProductVariantAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ProductVariantAttributeValue]
	WHERE ProductVariantAttributeID=@ProductVariantAttributeID
	ORDER BY [DisplayOrder]
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_MessageTemplate]
	ORDER BY [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLoadByPrimaryKey]
(
	@MessageTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_MessageTemplate]
	WHERE
		MessageTemplateID = @MessageTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedLoadByNameAndLanguageID]
(
	@Name nvarchar(200),
	@LanguageID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		mtl.*
	FROM [Nop_MessageTemplateLocalized] mtl
	INNER JOIN [Nop_MessageTemplate] mt
	ON mtl.MessageTemplateID = mt.MessageTemplateID
	WHERE mtl.LanguageID=@LanguageID and mt.[Name] = @Name
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedLoadAllByName]
(
	@Name nvarchar(200)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT mtl.*
	FROM [Nop_MessageTemplateLocalized] mtl
	INNER JOIN [Nop_MessageTemplate] mt
	ON mtl.MessageTemplateID = mt.MessageTemplateID
	WHERE mt.[Name] = @Name
	ORDER BY mtl.LanguageID
END
GO



CREATE PROCEDURE [dbo].[Nop_CreditCardTypeInsert]
(
	@CreditCardTypeID int = NULL output,
	@Name nvarchar(100),
	@SystemKeyword nvarchar(100),
	@DisplayOrder int,
	@Deleted bit
)
AS
BEGIN
	INSERT
	INTO [Nop_CreditCardType]
	(
		[Name],
		SystemKeyword,
		DisplayOrder,
		Deleted
	)
	VALUES
	(
		@Name,
		@SystemKeyword,
		@DisplayOrder,
		@Deleted
	)

	set @CreditCardTypeID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CreditCardTypeUpdate]
(
	@CreditCardTypeID int,
	@Name nvarchar(100),
	@SystemKeyword nvarchar(100),
	@DisplayOrder int,
	@Deleted bit
)
AS
BEGIN
	UPDATE [Nop_CreditCardType]
	SET
		[Name]=@Name,
		SystemKeyword=@SystemKeyword,
		DisplayOrder=@DisplayOrder,
		Deleted=@Deleted
	WHERE
		CreditCardTypeID = @CreditCardTypeID
END
GO



CREATE PROCEDURE [dbo].[Nop_CreditCardTypeLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_CreditCardType]
	where Deleted=0
	order by DisplayOrder
END
GO


CREATE PROCEDURE [dbo].[Nop_CreditCardTypeLoadByPrimaryKey]
(
	@CreditCardTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CreditCardType]
	WHERE
		CreditCardTypeID=@CreditCardTypeID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalUpdate]
(
	@ShippingByTotalID int,
	@ShippingMethodID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	UPDATE [Nop_ShippingByTotal]
	SET
		ShippingMethodID=@ShippingMethodID,
		[From]=@From,
		[To]=@To,
		UsePercentage=@UsePercentage,
		ShippingChargePercentage=@ShippingChargePercentage,
		ShippingChargeAmount=@ShippingChargeAmount
	WHERE
		ShippingByTotalID = @ShippingByTotalID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalDelete]
(
	@ShippingByTotalID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ShippingByTotal]
	WHERE
		ShippingByTotalID = @ShippingByTotalID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalLoadByPrimaryKey]
(
	@ShippingByTotalID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByTotal]
	WHERE
		ShippingByTotalID = @ShippingByTotalID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalLoadByShippingMethodID]
(
	@ShippingMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByTotal]
	WHERE
		ShippingMethodID=@ShippingMethodID
	ORDER BY [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalInsert]
(
	@ShippingByTotalID int = NULL output,
	@ShippingMethodID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	INSERT
	INTO [Nop_ShippingByTotal]
	(
		ShippingMethodID,
		[From],
		[To],
		UsePercentage,
		ShippingChargePercentage,
		ShippingChargeAmount
	)
	VALUES
	(
		@ShippingMethodID,
		@From,
		@To,
		@UsePercentage,
		@ShippingChargePercentage,
		@ShippingChargeAmount
	)

	set @ShippingByTotalID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByTotalLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ShippingByTotal]
	ORDER BY ShippingMethodID, [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ShippingByWeight]
	ORDER BY ShippingMethodID, [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightLoadByShippingMethodID]
(
	@ShippingMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByWeight]
	WHERE
		ShippingMethodID=@ShippingMethodID
	ORDER BY [From]
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightLoadByPrimaryKey]
(
	@ShippingByWeightID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ShippingByWeight]
	WHERE
		ShippingByWeightID = @ShippingByWeightID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightInsert]
(
	@ShippingByWeightID int = NULL output,
	@ShippingMethodID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	INSERT
	INTO [Nop_ShippingByWeight]
	(
		ShippingMethodID,
		[From],
		[To],
		UsePercentage,
		ShippingChargePercentage,
		ShippingChargeAmount
	)
	VALUES
	(
		@ShippingMethodID,
		@From,
		@To,
		@UsePercentage,
		@ShippingChargePercentage,
		@ShippingChargeAmount
	)

	set @ShippingByWeightID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightUpdate]
(
	@ShippingByWeightID int,
	@ShippingMethodID int,
	@From decimal(18, 2),
	@To decimal(18, 2),
	@UsePercentage bit,
	@ShippingChargePercentage decimal(18, 2),
	@ShippingChargeAmount decimal(18, 2)
)
AS
BEGIN
	UPDATE [Nop_ShippingByWeight]
	SET
		ShippingMethodID=@ShippingMethodID,
		[From]=@From,
		[To]=@To,
		UsePercentage=@UsePercentage,
		ShippingChargePercentage=@ShippingChargePercentage,
		ShippingChargeAmount=@ShippingChargeAmount
	WHERE
		ShippingByWeightID = @ShippingByWeightID
END
GO



CREATE PROCEDURE [dbo].[Nop_ShippingByWeightDelete]
(
	@ShippingByWeightID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ShippingByWeight]
	WHERE
		ShippingByWeightID = @ShippingByWeightID
END
GO



CREATE PROCEDURE [dbo].[Nop_SettingInsert]
(
	@SettingId int = NULL output,
	@Name nvarchar(200),
	@Value nvarchar(2000),	
	@Description ntext
)
AS
BEGIN
	INSERT
	INTO [Nop_Setting]
	(
			[Name],
			[Value],	
			[Description]
	)
	VALUES
	(
			@Name,
			@Value,	
			@Description
	)

	set @SettingId=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_SettingLoadByPrimaryKey]
(
	@SettingId int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Setting]
	WHERE
		([SettingId] = @SettingId)
END
GO



CREATE PROCEDURE [dbo].[Nop_SettingLoadAll]
	
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Setting]
	ORDER BY [name]
END
GO



CREATE PROCEDURE [dbo].[Nop_SettingDelete]
(
	@SettingId int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Setting]
	WHERE
		[SettingId] = @SettingId
END
GO



CREATE PROCEDURE [dbo].[Nop_SettingUpdate]
(
	@SettingID int,
	@Name nvarchar(200),
	@Value nvarchar(2000),	
	@Description ntext
)
AS
BEGIN
	UPDATE [Nop_Setting]
	SET
			[Name]=@Name,
			[Value]=@Value,	
			[Description]=@Description
	WHERE
		[SettingID] = @SettingID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTemplateLoadByPrimaryKey]
(
	@ProductTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductTemplate]
	WHERE
		(ProductTemplateID = @ProductTemplateID)
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTemplateDelete]
(
	@ProductTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductTemplate]
	WHERE
		[ProductTemplateID] = @ProductTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTemplateUpdate]
(
	@ProductTemplateID int,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_ProductTemplate]
	SET
		[Name]=@Name,
		TemplatePath=@TemplatePath,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		ProductTemplateID = @ProductTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTemplateLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ProductTemplate]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTemplateInsert]
(
	@ProductTemplateID int = NULL output,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductTemplate]
	(
		[Name],
		TemplatePath,
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@TemplatePath,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @ProductTemplateID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryTemplateUpdate]
(
	@CategoryTemplateID int,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_CategoryTemplate]
	SET
		[Name]=@Name,
		TemplatePath=@TemplatePath,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		CategoryTemplateID = @CategoryTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryTemplateLoadByPrimaryKey]
(
	@CategoryTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CategoryTemplate]
	WHERE
		(CategoryTemplateID = @CategoryTemplateID)
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryTemplateDelete]
(
	@CategoryTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_CategoryTemplate]
	WHERE
		[CategoryTemplateID] = @CategoryTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryTemplateLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_CategoryTemplate]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryTemplateInsert]
(
	@CategoryTemplateID int = NULL output,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_CategoryTemplate]
	(
		[Name],
		TemplatePath,
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@TemplatePath,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @CategoryTemplateID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerTemplateLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ManufacturerTemplate]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerTemplateLoadByPrimaryKey]
(
	@ManufacturerTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ManufacturerTemplate]
	WHERE
		(ManufacturerTemplateID = @ManufacturerTemplateID)
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerTemplateDelete]
(
	@ManufacturerTemplateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ManufacturerTemplate]
	WHERE
		[ManufacturerTemplateID] = @ManufacturerTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerTemplateInsert]
(
	@ManufacturerTemplateID int = NULL output,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_ManufacturerTemplate]
	(
		[Name],
		TemplatePath,
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@TemplatePath,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @ManufacturerTemplateID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerTemplateUpdate]
(
	@ManufacturerTemplateID int,
	@Name nvarchar(100),
	@TemplatePath nvarchar(200),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_ManufacturerTemplate]
	SET
		[Name]=@Name,
		TemplatePath=@TemplatePath,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		ManufacturerTemplateID = @ManufacturerTemplateID
END
GO



CREATE PROCEDURE [dbo].[Nop_MeasureWeightLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_MeasureWeight]
	order by [DisplayOrder]
END
GO



CREATE PROCEDURE [dbo].[Nop_MeasureWeightLoadByPrimaryKey]
(
	@MeasureWeightID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_MeasureWeight]
	WHERE
		MeasureWeightID = @MeasureWeightID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTypeLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_ProductType]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductTypeLoadByPrimaryKey]
(
	@ProductTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductType]
	WHERE
		(ProductTypeID = @ProductTypeID)
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicDelete]
(
	@TopicID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Topic]
	WHERE
		[TopicID] = @TopicID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicInsert]
(
	@TopicID int = NULL output,
	@Name nvarchar(200)
)
AS
BEGIN
	INSERT
	INTO [Nop_Topic]
	(
		[Name]
	)
	VALUES
	(
		@Name
	)

	set @TopicID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLoadByPrimaryKey]
(
	@TopicID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Topic]
	WHERE
		TopicID = @TopicID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Topic]
	ORDER BY [Name]
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicUpdate]
(
	@TopicID int,
	@Name nvarchar(200)
)
AS
BEGIN
	UPDATE [Nop_Topic]
	SET
		[Name]=@Name
	WHERE
		TopicID = @TopicID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedLoadAllByName]
(
	@Name nvarchar(200)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT tl.*
	FROM [Nop_TopicLocalized] tl
	INNER JOIN [Nop_Topic] t
	ON tl.TopicID = t.TopicID
	WHERE t.[Name] = @Name
	ORDER BY tl.LanguageID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedLoadByNameAndLanguageID]
(
	@Name nvarchar(200),
	@LanguageID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		tl.*
	FROM [Nop_TopicLocalized] tl
	INNER JOIN [Nop_Topic] t
	ON tl.TopicID = t.TopicID
	WHERE tl.LanguageID=@LanguageID and t.[Name] = @Name
END
GO



CREATE PROCEDURE [dbo].[Nop_CampaignDelete]
(
	@CampaignID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Campaign]
	WHERE
		CampaignID = @CampaignID
END
GO



CREATE PROCEDURE [dbo].[Nop_CampaignUpdate]
(
	@CampaignID int,
	@Name nvarchar(200),	
	@Subject nvarchar(200),
	@Body nvarchar(MAX),
	@CreatedOn datetime
)
AS
BEGIN

	UPDATE [Nop_Campaign]
	SET
		[Name]=@Name,
		[Subject]=@Subject,
		Body=@Body,
		CreatedOn=@CreatedOn
	WHERE
		CampaignID = @CampaignID

END
GO



CREATE PROCEDURE [dbo].[Nop_CampaignLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Campaign]
	ORDER BY [CreatedOn] desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CampaignLoadByPrimaryKey]
(
	@CampaignID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Campaign]
	WHERE
		CampaignID = @CampaignID
END
GO



CREATE PROCEDURE [dbo].[Nop_CampaignInsert]
(
	@CampaignID int = NULL output,
	@Name nvarchar(200),
	@Subject nvarchar(200),
	@Body nvarchar(MAX),
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Campaign]
	(
		[Name],
		[Subject],
		Body,
		CreatedOn
	)
	VALUES
	(
		@Name,
		@Subject,
		@Body,
		@CreatedOn
	)

	set @CampaignID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderNoteDelete]
(
	@OrderNoteID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_OrderNote]
	WHERE
		OrderNoteID = @OrderNoteID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderNoteInsert]
(
	@OrderNoteID int = NULL output,
	@OrderID int,
	@Note nvarchar(4000),
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_OrderNote]
	(
		OrderID,
		Note,
		CreatedOn
	)
	VALUES
	(
		@OrderID,
		@Note,
		@CreatedOn
	)

	set @OrderNoteID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderNoteLoadByPrimaryKey]
(
	@OrderNoteID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderNote]
	WHERE
		OrderNoteID = @OrderNoteID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderNoteUpdate]
(
	@OrderNoteID int,
	@OrderID int,
	@Note nvarchar(4000),
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_OrderNote]
	SET
	OrderID=@OrderID,
	Note=@Note,
	CreatedOn=@CreatedOn
	WHERE
		OrderNoteID = @OrderNoteID
END
GO



CREATE PROCEDURE [dbo].[Nop_OrderNoteLoadByOrderID]
(
	@OrderID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_OrderNote]
	WHERE
		OrderID=@OrderID
	ORDER BY CreatedOn desc, OrderNoteID
END
GO



CREATE PROCEDURE [dbo].[Nop_MeasureDimensionLoadByPrimaryKey]
(
	@MeasureDimensionID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_MeasureDimension]
	WHERE
		MeasureDimensionID = @MeasureDimensionID
END
GO



CREATE PROCEDURE [dbo].[Nop_MeasureDimensionLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_MeasureDimension]
	order by [DisplayOrder]
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedLoadByPrimaryKey]
(
	@MessageTemplateLocalizedID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_MessageTemplateLocalized]
	WHERE
		MessageTemplateLocalizedID = @MessageTemplateLocalizedID
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedUpdate]
(
	@MessageTemplateLocalizedID int,
	@MessageTemplateID int,
	@LanguageID int,	
	@Subject nvarchar(200),
	@Body nvarchar(MAX)
)
AS
BEGIN

	UPDATE [Nop_MessageTemplateLocalized]
	SET
		MessageTemplateID=@MessageTemplateID,
		LanguageID=@LanguageID,
		[Subject]=@Subject,
		Body=@Body
	WHERE
		MessageTemplateLocalizedID = @MessageTemplateLocalizedID

END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedDelete]
(
	@MessageTemplateLocalizedID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_MessageTemplateLocalized]
	WHERE
		MessageTemplateLocalizedID = @MessageTemplateLocalizedID
END
GO



CREATE PROCEDURE [dbo].[Nop_MessageTemplateLocalizedInsert]
(
	@MessageTemplateLocalizedID int = NULL output,
	@MessageTemplateID int,
	@LanguageID int,
	@Subject nvarchar(200),
	@Body nvarchar(MAX)
)
AS
BEGIN
	INSERT
	INTO [Nop_MessageTemplateLocalized]
	(
		MessageTemplateID,
		LanguageID,
		[Subject],
		Body
	)
	VALUES
	(
		@MessageTemplateID,
		@LanguageID,
		@Subject,
		@Body
	)

	set @MessageTemplateLocalizedID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PictureDelete]
(
	@PictureID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Picture]
	WHERE
		PictureID = @PictureID
END
GO



CREATE PROCEDURE [dbo].[Nop_PictureUpdate]
(
	@PictureID int,
	@PictureBinary image,
	@Extension nvarchar(20),
	@IsNew	bit
)
AS
BEGIN

	UPDATE [Nop_Picture]
	SET
		PictureBinary=@PictureBinary,
		Extension=@Extension,
		IsNew=@IsNew
	WHERE
		PictureID = @PictureID

END
GO



CREATE PROCEDURE [dbo].[Nop_PictureInsert]
(
	@PictureID int = NULL output,
	@PictureBinary image,	
	@Extension nvarchar(20),
	@IsNew	bit
)
AS
BEGIN
	INSERT
	INTO [Nop_Picture]
	(
		PictureBinary,
		Extension,
		IsNew
	)
	VALUES
	(
		@PictureBinary,
		@Extension,
		@IsNew
	)

	set @PictureID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PictureLoadByPrimaryKey]
(
	@PictureID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Picture]
	WHERE
		PictureID = @PictureID
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryInsert]
(
	@CategoryID int = NULL output,
	@Name nvarchar(400),
	@Description ntext,
	@TemplateID int,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@ParentCategoryID int,	
	@PictureID int,
	@PageSize int,
	@PriceRanges nvarchar(400),
	@Published bit,
	@Deleted bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Category]
	(
		[Name],
		[Description],
		TemplateID,
		MetaKeywords,
		MetaDescription,
		MetaTitle,
		SEName,
		ParentCategoryID,
		PictureID,
		PageSize,
		PriceRanges,
		Published,
		Deleted,
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@Description,
		@TemplateID,
		@MetaKeywords,
		@MetaDescription,
		@MetaTitle,
		@SEName,
		@ParentCategoryID,
		@PictureID,
		@PageSize,
		@PriceRanges,
		@Published,
		@Deleted,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @CategoryID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryUpdate]
(
	@CategoryID int,
	@Name nvarchar(400),
	@Description ntext,
	@TemplateID int,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@ParentCategoryID int,
	@PictureID int,
	@PageSize int,
	@PriceRanges nvarchar(400),
	@Published bit,
	@Deleted bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Category]
	SET
		[Name]=@Name,
		[Description]=@Description,
		TemplateID=@TemplateID,
		MetaKeywords=@MetaKeywords,
		MetaDescription=@MetaDescription,
		MetaTitle=@MetaTitle,
		SEName=@SEName,
		ParentCategoryID=@ParentCategoryID,
		PictureID=@PictureID,
		PageSize=@PageSize,
		PriceRanges=@PriceRanges,
		Published=@Published,
		Deleted=@Deleted,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		CategoryID = @CategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryLoadByPrimaryKey]
(
	@CategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Category]
	WHERE
		([CategoryID] = @CategoryID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingLoadByProductID]
(
	@ProductID int,
	@ShowHidden bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		pcm.*
	FROM Nop_Product_Category_Mapping pcm
	INNER JOIN Nop_Category c ON pcm.CategoryID=c.CategoryID	
	WHERE pcm.ProductID=@ProductID
		AND (c.Published = 1 or @ShowHidden = 1) and c.Deleted=0
	ORDER BY pcm.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_CategoryLoadAll]
	@ShowHidden bit = 0,
	@ParentCategoryID int = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Category]
	WHERE (Published = 1 or @ShowHidden = 1) and Deleted=0 and ParentCategoryID=@ParentCategoryID
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_GroupUpdate]
(
	@ForumGroupID int,
	@Name nvarchar(200),
	@Description nvarchar(MAX),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_Group]
	SET
		[Name]=@Name,
		[Description]=@Description,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		ForumGroupID = @ForumGroupID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_GroupInsert]
(
	@ForumGroupID int = NULL output,
	@Name nvarchar(200),
	@Description nvarchar(MAX),
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_Group]
	(
		[Name],
		[Description],
		DisplayOrder,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@Name,
		@Description,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @ForumGroupID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_GroupDelete]
(
	@ForumGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Forums_Group]
	WHERE
		ForumGroupID = @ForumGroupID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_GroupLoadByPrimaryKey]
(
	@ForumGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_Group]
	WHERE
		(ForumGroupID = @ForumGroupID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_GroupLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Forums_Group]
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingLoadByProductID]
(
	@ProductID int,
	@ShowHidden bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		pmm.*
	FROM Nop_Product_Manufacturer_Mapping pmm
	INNER JOIN Nop_Manufacturer m ON pmm.ManufacturerID=m.ManufacturerID	
	WHERE pmm.ProductID=@ProductID	
		AND (m.Published = 1 or @ShowHidden = 1) and m.Deleted=0
	ORDER BY pmm.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerLoadAll]
	@ShowHidden bit
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Manufacturer]
	WHERE (Published = 1 or @ShowHidden = 1) and Deleted=0
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerInsert]
(
	@ManufacturerID int = NULL output,
	@Name nvarchar(400),
	@Description ntext,
	@TemplateID int,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@PictureID int,
	@PageSize int,
	@PriceRanges nvarchar(400),
	@Published bit,
	@Deleted bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Manufacturer]
	(
		[Name],
		[Description],
		TemplateID,
		MetaKeywords,
		MetaDescription,
		MetaTitle,
		SEName,
		PictureID,
		PageSize,
		PriceRanges,
		Published,
		Deleted,
		DisplayOrder,
		CreatedOn,
		UpdatedOn	
	)
	VALUES
	(
		@Name,
		@Description,
		@TemplateID,
		@MetaKeywords,
		@MetaDescription,
		@MetaTitle,
		@SEName,
		@PictureID,
		@PageSize,
		@PriceRanges,
		@Published,
		@Deleted,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @ManufacturerID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerUpdate]
(
	@ManufacturerID int,
	@Name nvarchar(400),
	@Description ntext,
	@TemplateID int,
	@MetaKeywords nvarchar(400),
	@MetaDescription nvarchar(4000),
	@MetaTitle nvarchar(400),
	@SEName nvarchar(100),
	@PictureID int,
	@PageSize int,
	@PriceRanges nvarchar(400),
	@Published bit,
	@Deleted bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Manufacturer]
	SET
		[Name]=@Name,
		[Description]=@Description,
		TemplateID=@TemplateID,
		MetaKeywords=@MetaKeywords,
		MetaDescription=@MetaDescription,
		MetaTitle=@MetaTitle,
		SEName=@SEName,
		PictureID=@PictureID,
		PageSize=@PageSize,
		PriceRanges=@PriceRanges,
		Published=@Published,
		Deleted=@Deleted,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn

	WHERE
		ManufacturerID = @ManufacturerID
END
GO



CREATE PROCEDURE [dbo].[Nop_ManufacturerLoadByPrimaryKey]
(
	@ManufacturerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Manufacturer]
	WHERE
		([ManufacturerID] = @ManufacturerID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_ForumDelete]
(
	@ForumID int
)
AS
BEGIN
	SET NOCOUNT ON

	DELETE
	FROM [Nop_Forums_Subscription]	
	WHERE
		TopicID in (	SELECT ft.TopicID 
						FROM [Nop_Forums_Topic] ft
						WHERE ft.ForumID=@ForumID)

	DELETE
	FROM [Nop_Forums_Subscription]
	WHERE
		ForumID = @ForumID

	DELETE
	FROM [Nop_Forums_Forum]
	WHERE
		ForumID = @ForumID
	
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionLoadByGUID]
(
	@SubscriptionGUID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_Subscription]
	WHERE
		(SubscriptionGUID = @SubscriptionGUID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionUpdate]
(
	@SubscriptionID int,
	@SubscriptionGUID uniqueidentifier,
	@UserID int,
	@ForumID int,
	@TopicID int,
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_Subscription]
	SET
		[SubscriptionGUID]=@SubscriptionGUID,
		[UserID]=@UserID,
		[ForumID]=@ForumID,
		[TopicID]=@TopicID,
		[CreatedOn]=@CreatedOn
	WHERE
		SubscriptionID = @SubscriptionID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionLoadByPrimaryKey]
(
	@SubscriptionID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_Subscription]
	WHERE
		(SubscriptionID = @SubscriptionID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionInsert]
(
	@SubscriptionID int = NULL output,
	@SubscriptionGUID uniqueidentifier,
	@UserID int,
	@ForumID int,
	@TopicID int,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_Subscription]
	(
		[SubscriptionGUID],
		[UserID],
		[ForumID],
		[TopicID],
		[CreatedOn]
	)
	VALUES
	(
		@SubscriptionGUID,
		@UserID,
		@ForumID,
		@TopicID,
		@CreatedOn
	)

	set @SubscriptionID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_SubscriptionDelete]
(
	@SubscriptionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Forums_Subscription]
	WHERE
		SubscriptionID = @SubscriptionID
END
GO



CREATE PROCEDURE [dbo].[Nop_CurrencyLoadByPrimaryKey]
(
	@CurrencyID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Currency]
	WHERE
		CurrencyID = @CurrencyID
END
GO



CREATE PROCEDURE [dbo].[Nop_CurrencyDelete]
(
	@CurrencyID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Currency]
	WHERE
		CurrencyID = @CurrencyID
END
GO



CREATE PROCEDURE [dbo].[Nop_CurrencyLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Currency]
	WHERE (Published = 1 or @ShowHidden = 1)
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_CurrencyUpdate]
(
	@CurrencyID int,
	@Name nvarchar(50),
	@CurrencyCode nvarchar(5),
	@Rate decimal (18, 4),
	@DisplayLocale nvarchar(50),
	@CustomFormatting nvarchar(50),
	@Published bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN

	UPDATE [Nop_Currency]
	SET
		[Name]=@Name,
		CurrencyCode=@CurrencyCode,
		Rate=@Rate,
		DisplayLocale=@DisplayLocale,
		CustomFormatting=@CustomFormatting,
		Published=@Published,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		CurrencyID = @CurrencyID

END
GO



CREATE PROCEDURE [dbo].[Nop_CurrencyInsert]
(
	@CurrencyID int = NULL output,
	@Name nvarchar(50),
	@CurrencyCode nvarchar(5),
	@Rate decimal (18, 4),
	@DisplayLocale nvarchar(50),
	@CustomFormatting nvarchar(50),
	@Published bit,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Currency]
	(
		[Name],
		CurrencyCode,
		Rate,
		DisplayLocale,
		CustomFormatting,
		Published,
		DisplayOrder,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@Name,
		@CurrencyCode,
		@Rate,
		@DisplayLocale,
		@CustomFormatting,
		@Published,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @CurrencyID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedInsert]
(
	@TopicLocalizedID int = NULL output,
	@TopicID int,
	@LanguageID int,
	@Title nvarchar(200),
	@Body nvarchar(MAX),
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_TopicLocalized]
	(
		TopicID,
		LanguageID,
		[Title],
		Body,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@TopicID,
		@LanguageID,
		@Title,
		@Body,
		@CreatedOn,
		@UpdatedOn
	)

	set @TopicLocalizedID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedLoadByPrimaryKey]
(
	@TopicLocalizedID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TopicLocalized]
	WHERE
		TopicLocalizedID = @TopicLocalizedID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedLoadByTopicIDAndLanguageID]
(
	@TopicID int,
	@LanguageID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_TopicLocalized]
	WHERE (TopicID = @TopicID) AND (LanguageID = @LanguageID)
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedUpdate]
(
	@TopicLocalizedID int,
	@TopicID int,
	@LanguageID int,	
	@Title nvarchar(200),
	@Body nvarchar(MAX),
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN

	UPDATE [Nop_TopicLocalized]
	SET
		TopicID=@TopicID,
		LanguageID=@LanguageID,
		[Title]=@Title,
		Body=@Body,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		TopicLocalizedID = @TopicLocalizedID
END
GO



CREATE PROCEDURE [dbo].[Nop_TopicLocalizedDelete]
(
	@TopicLocalizedID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_TopicLocalized]
	WHERE
		TopicLocalizedID = @TopicLocalizedID
END
GO



CREATE PROCEDURE [dbo].[Nop_LanguageLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Language]
	WHERE (Published = 1 or @ShowHidden = 1)
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_LanguageLoadByPrimaryKey]
(
	@LanguageId int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Language]
	WHERE
		([LanguageId] = @LanguageId)
END
GO



CREATE PROCEDURE [dbo].[Nop_LanguageDelete]
(
	@LanguageId int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Language]
	WHERE
		[LanguageId] = @LanguageId
END
GO



CREATE PROCEDURE [dbo].[Nop_LanguageInsert]
(
	@LanguageId int = NULL output,
	@Name nvarchar(100),
	@LanguageCulture nvarchar(20),
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_Language]
	(
		[Name],
		[LanguageCulture],
		[Published],
		[DisplayOrder]
	)
	VALUES
	(
		@Name,
		@LanguageCulture,
		@Published,
		@DisplayOrder
	)

	set @LanguageId=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_LanguageUpdate]
(
	@LanguageId int,
	@Name nvarchar(100),
	@LanguageCulture nvarchar(20),
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_Language]
	SET
		[Name] = @Name,
		[LanguageCulture] = @LanguageCulture,
		[Published] = @Published,
		[DisplayOrder] = @DisplayOrder
	WHERE
		[LanguageId] = @LanguageId
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_ForumUpdate]
(
	@ForumID int,	
	@ForumGroupID int,
	@Name nvarchar(200),
	@Description nvarchar(MAX),
	@NumTopics int,
	@NumPosts int,
	@LastTopicID int,
	@LastPostID int,
	@LastPostUserID int,
	@LastPostTime datetime,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_Forum]
	SET
		ForumGroupID=@ForumGroupID,
		[Name]=@Name,
		[Description]=@Description,
		NumTopics=@NumTopics,
		NumPosts=@NumPosts,
		LastTopicID=@LastTopicID,
		LastPostID=@LastPostID,
		LastPostUserID=@LastPostUserID,
		LastPostTime=@LastPostTime,
		DisplayOrder=@DisplayOrder,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		ForumID = @ForumID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_ForumLoadByPrimaryKey]
(
	@ForumID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_Forum]
	WHERE
		(ForumID = @ForumID)
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_ForumInsert]
(
	@ForumID int = NULL output,	
	@ForumGroupID int,
	@Name nvarchar(200),
	@Description nvarchar(MAX),
	@NumTopics int,
	@NumPosts int,
	@LastTopicID int,
	@LastPostID int,
	@LastPostUserID int,
	@LastPostTime datetime,
	@DisplayOrder int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_Forum]
	(
		[ForumGroupID],
		[Name],
		[Description],
		[NumTopics],
		[NumPosts],
		[LastTopicID],
		[LastPostID],
		[LastPostUserID],
		[LastPostTime],
		[DisplayOrder],
		[CreatedOn],
		[UpdatedOn]
	)
	VALUES
	(
		@ForumGroupID,
		@Name,
		@Description,
		@NumTopics,
		@NumPosts,
		@LastTopicID,
		@LastPostID,
		@LastPostUserID,
		@LastPostTime,
		@DisplayOrder,
		@CreatedOn,
		@UpdatedOn
	)

	set @ForumID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_ForumLoadAllByForumGroupID]
(
	@ForumGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Forums_Forum]
	where ForumGroupID=@ForumGroupID
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentStatusLoadByPrimaryKey]
(
	@PaymentStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PaymentStatus]
	WHERE
		PaymentStatusID = @PaymentStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentStatusLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PaymentStatus]
	ORDER BY PaymentStatusID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_TopicLoadActive]
(
	@ForumID			int,
	@TopicCount			int
)
AS
BEGIN
	if (@TopicCount > 0)
	      SET ROWCOUNT @TopicCount

	SELECT ft2.* FROM Nop_Forums_Topic ft2 with (NOLOCK) 
	WHERE ft2.TopicID IN 
	(
		SELECT DISTINCT
			ft.TopicID
		FROM Nop_Forums_Topic ft with (NOLOCK)
		WHERE  (
					@ForumID IS NULL OR @ForumID=0
					OR (ft.ForumID=@ForumID)
				)
				AND
				(
					ft.LastPostTime is not null
				)
	)
	ORDER BY ft2.LastPostTime desc

	SET ROWCOUNT 0
END
GO
CREATE PROCEDURE [dbo].[Nop_Forums_TopicLoadByPrimaryKey]
(
	@TopicID int,
	@IncreaseViews bit = 0
)
AS
BEGIN
	SET NOCOUNT ON

	IF (@IncreaseViews = 1)
	BEGIN
		UPDATE [Nop_Forums_Topic]
		SET 
			[Views]=[Views]+1
		WHERE
			TopicID = @TopicID 
	END

	SELECT
		*
	FROM [Nop_Forums_Topic]
	WHERE
		(TopicID = @TopicID)
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodUpdate]
(
	@PaymentMethodID int,
	@Name nvarchar(100),
	@VisibleName nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@UserTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@SystemKeyword nvarchar(500),
	@IsActive bit,
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_PaymentMethod]
	SET
		[Name]=@Name,
		[Description]=@Description,
		VisibleName=@VisibleName,
		ConfigureTemplatePath=@ConfigureTemplatePath,
		UserTemplatePath=@UserTemplatePath,
		ClassName=@ClassName,
		SystemKeyword=@SystemKeyword,
		IsActive=@IsActive,
		DisplayOrder=@DisplayOrder

	WHERE
		PaymentMethodID = @PaymentMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodDelete]
(
	@PaymentMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM Nop_PaymentMethod
	WHERE
		 PaymentMethodID = @PaymentMethodID
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodLoadBySystemKeyword]
(
	@SystemKeyword nvarchar(500)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PaymentMethod]
	WHERE
		SystemKeyword = @SystemKeyword
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodLoadAll]
	@ShowHidden bit = 0
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_PaymentMethod]
	WHERE (IsActive = 1 or @ShowHidden = 1)
	order by DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodInsert]
(
	@PaymentMethodID int = NULL output,
	@Name nvarchar(100),
	@VisibleName nvarchar(100),
	@Description nvarchar(4000),
	@ConfigureTemplatePath nvarchar(500),
	@UserTemplatePath nvarchar(500),
	@ClassName nvarchar(500),
	@SystemKeyword nvarchar(500),
	@IsActive bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_PaymentMethod]
	(
		[Name],
		VisibleName,
		[Description],
		ConfigureTemplatePath,
		UserTemplatePath,
		ClassName,
		SystemKeyword,
		IsActive,
		DisplayOrder
	)
	VALUES
	(
		@Name,
		@VisibleName,
		@Description,
		@ConfigureTemplatePath,
		@UserTemplatePath,
		@ClassName,
		@SystemKeyword,
		@IsActive,
		@DisplayOrder
	)

	set @PaymentMethodID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PaymentMethodLoadByPrimaryKey]
(
	@PaymentMethodID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PaymentMethod]
	WHERE
		PaymentMethodID = @PaymentMethodID
END
GO






CREATE PROCEDURE [dbo].[Nop_Forums_PostLoadByPrimaryKey]
(
	@PostID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Forums_Post]
	WHERE
		(PostID = @PostID)
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountTypeLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_DiscountType]
	ORDER BY DiscountTypeID
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogPostLoadAll]
	@LanguageID	int
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_BlogPost]
	WHERE (@LanguageID IS NULL or @LanguageID=0 or LanguageID = @LanguageID)
	ORDER BY CreatedOn desc
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogPostUpdate]
(
	@BlogPostID int,
	@LanguageID int,
	@BlogPostTitle nvarchar(200),
	@BlogPostBody nvarchar(MAX),
	@BlogPostAllowComments bit,
	@CreatedByID int,
	@CreatedOn datetime
)
AS
BEGIN

	UPDATE [Nop_BlogPost]
	SET
		LanguageID=@LanguageID,
		BlogPostTitle=@BlogPostTitle,
		BlogPostBody=@BlogPostBody,
		BlogPostAllowComments=@BlogPostAllowComments,
		CreatedByID=@CreatedByID
	WHERE
		BlogPostID = @BlogPostID

END
GO



CREATE PROCEDURE [dbo].[Nop_BlogPostInsert]
(
	@BlogPostID int = NULL output,
	@LanguageID int,
	@BlogPostTitle nvarchar(200),
	@BlogPostBody nvarchar(MAX),
	@BlogPostAllowComments bit,
	@CreatedByID int,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_BlogPost]
	(
		LanguageID,
		BlogPostTitle,
		BlogPostBody,
		BlogPostAllowComments,
		CreatedByID,
		CreatedOn
	)
	VALUES
	(
		@LanguageID,
		@BlogPostTitle,
		@BlogPostBody,
		@BlogPostAllowComments,
		@CreatedByID,
		@CreatedOn
	)

	set @BlogPostID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogPostLoadByPrimaryKey]
(
	@BlogPostID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_BlogPost]
	WHERE
		BlogPostID = @BlogPostID
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogPostDelete]
(
	@BlogPostID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_BlogPost]
	WHERE
		BlogPostID = @BlogPostID
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountRequirementLoadAll]

AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_DiscountRequirement]
	ORDER BY DiscountRequirementID
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsInsert]
(
	@NewsID int = NULL output,
	@LanguageID	int,
	@Title nvarchar(1000),
	@Short nvarchar(4000),
	@Full nvarchar (max),
	@Published bit,
	@AllowComments bit,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_News]
	(
		LanguageID,
		Title,
		Short,
		[Full],
		Published,
		AllowComments,
		CreatedOn
	)
	VALUES
	(
		@LanguageID,
		@Title,
		@Short,
		@Full,
		@Published,
		@AllowComments,
		@CreatedOn
	)

	set @NewsID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsLoadByPrimaryKey]
(
	@NewsID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_News]
	WHERE
		NewsID=@NewsID
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsDelete]
(
	@NewsID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_News]
	WHERE
		[NewsID] = @NewsID
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsLoadAll]
	@LanguageID	int,
	@NewsCount int,
	@ShowHidden bit
AS
BEGIN
	
	if (@NewsCount > 0)
	      SET ROWCOUNT @NewsCount

	SELECT *
	FROM [Nop_News]
	where (Published = 1 or @ShowHidden = 1)
	and (@LanguageID IS NULL or @LanguageID=0 or LanguageID = @LanguageID)
	order by CreatedOn desc

	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsUpdate]
(
	@NewsID int,
	@LanguageID	int,
	@Title nvarchar(1000),
	@Short nvarchar(4000),
	@Full nvarchar (max),
	@Published bit,
	@AllowComments bit,
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_News]
	SET
		LanguageID=@LanguageID,
		Title=@Title,
		Short=@Short,
		[Full]=@Full,
		Published=@Published,
		AllowComments=@AllowComments,
		CreatedOn=@CreatedOn
	WHERE
		NewsID= @NewsID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRole_Discount_MappingInsert]
(
	@CustomerRoleID int,
	@DiscountID int
)
AS
BEGIN
	IF NOT EXISTS (SELECT (1) FROM [Nop_CustomerRole_Discount_Mapping] WHERE CustomerRoleID=@CustomerRoleID and DiscountID=@DiscountID)
	INSERT
		INTO [Nop_CustomerRole_Discount_Mapping]
		(
			CustomerRoleID,
			DiscountID
		)
		VALUES
		(
			@CustomerRoleID,
			@DiscountID
		)
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerRole_Discount_MappingDelete]
(
	@CustomerRoleID int,
	@DiscountID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_CustomerRole_Discount_Mapping]
	WHERE
		CustomerRoleID = @CustomerRoleID and DiscountID=@DiscountID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollUpdate]
(
	@PollID int,
	@LanguageID int,
	@Name nvarchar(400),
	@SystemKeyword nvarchar(400),
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_Poll]
	SET
	LanguageID=@LanguageID,
	[Name]=@Name,
	SystemKeyword=@SystemKeyword,
	Published=@Published,
	DisplayOrder=@DisplayOrder
	WHERE
		PollID = @PollID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollInsert]
(
	@PollID int = NULL output,
	@LanguageID int,
	@Name nvarchar(400),
	@SystemKeyword nvarchar(400),
	@Published bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_Poll]
	(
		LanguageID,
		[Name],
		SystemKeyword,
		Published,
		DisplayOrder		
	)
	VALUES
	(
		@LanguageID,
		@Name,
		@SystemKeyword,
		@Published,
		@DisplayOrder
	)

	set @PollID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PollLoadBySystemKeyword]
(
	@SystemKeyword nvarchar(400)
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Poll]
	WHERE
		SystemKeyword = @SystemKeyword
END
GO



CREATE PROCEDURE [dbo].[Nop_PollDelete]
(
	@PollID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Poll]
	WHERE
		PollID = @PollID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollLoadByPrimaryKey]
(
	@PollID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Poll]
	WHERE
		PollID = @PollID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollLoadAll]
	@LanguageID	int,
	@PollCount int,
	@ShowHidden bit
AS
BEGIN
	
	if (@PollCount > 0)
	      SET ROWCOUNT @PollCount

	SELECT *
	FROM [Nop_Poll]
	where (Published = 1 or @ShowHidden = 1)
	and (@LanguageID IS NULL or @LanguageID=0 or LanguageID = @LanguageID)
	order by DisplayOrder

	SET ROWCOUNT 0
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountLoadByCategoryID]
(
	@CategoryID int,
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		d.*
	FROM [Nop_Discount] d
	INNER JOIN Nop_Category_Discount_Mapping cdm
	ON d.DiscountID = cdm.DiscountID
	WHERE ((getutcdate() between d.StartDate and d.EndDate) or @ShowHidden = 1) and d.Deleted=0 and cdm.CategoryID=@CategoryID
	order by d.StartDate desc
END
GO



CREATE PROCEDURE [dbo].[Nop_Category_Discount_MappingDelete]
(
	@CategoryID int,
	@DiscountID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Category_Discount_Mapping]
	WHERE
		CategoryID = @CategoryID and DiscountID=@DiscountID
END
GO



CREATE PROCEDURE [dbo].[Nop_Category_Discount_MappingInsert]
(
	@CategoryID int,
	@DiscountID int
)
AS
BEGIN
	IF NOT EXISTS (SELECT (1) FROM [Nop_Category_Discount_Mapping] WHERE CategoryID=@CategoryID and DiscountID=@DiscountID)
	INSERT
		INTO [Nop_Category_Discount_Mapping]
		(
			CategoryID,
			DiscountID
		)
		VALUES
		(
			@CategoryID,
			@DiscountID
		)
END
GO



CREATE PROCEDURE [dbo].[Nop_LocaleStringResourceDelete]
(
	@LocaleStringResourceID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_LocaleStringResource]
	WHERE
		LocaleStringResourceID = @LocaleStringResourceID
END
GO



CREATE PROCEDURE [dbo].[Nop_LocaleStringResourceLoadAllByLanguageID]
(
	@LanguageID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_LocaleStringResource]
	WHERE
		(LanguageID = @LanguageID)
	ORDER BY ResourceName
END
GO



CREATE PROCEDURE [dbo].[Nop_LocaleStringResourceInsert]
(
	@LocaleStringResourceID int = NULL output,
	@LanguageID int,
	@ResourceName nvarchar(200),
	@ResourceValue nvarchar(MAX)
)
AS
BEGIN
	INSERT
	INTO [Nop_LocaleStringResource]
	(
		[LanguageID],
		[ResourceName],
		[ResourceValue]
	)
	VALUES
	(
		@LanguageID,
		@ResourceName,
		@ResourceValue
	)

	set @LocaleStringResourceID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_LocaleStringResourceLoadByPrimaryKey]
(
	@LocaleStringResourceID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_LocaleStringResource]
	WHERE
		(LocaleStringResourceID = @LocaleStringResourceID)
END
GO



CREATE PROCEDURE [dbo].[Nop_LocaleStringResourceUpdate]
(
	@LocaleStringResourceID int,
	@LanguageID int,
	@ResourceName nvarchar(200),
	@ResourceValue nvarchar(MAX)
)
AS
BEGIN
	UPDATE [Nop_LocaleStringResource]
	SET
		LanguageID=@LanguageID,
		ResourceName = @ResourceName,
		ResourceValue = @ResourceValue
	WHERE
		LocaleStringResourceID= @LocaleStringResourceID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollAnswerLoadByPrimaryKey]
(
	@PollAnswerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PollAnswer]
	WHERE
		PollAnswerID = @PollAnswerID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollAnswerLoadByPollID]
(
	@PollID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_PollAnswer]
	WHERE
		PollID=@PollID
	ORDER BY DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_PollAnswerInsert]
(
	@PollAnswerID int = NULL output,
	@PollID int,
	@Name nvarchar(100),
	@Count int,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_PollAnswer]
	(
		PollID,
		[Name],
		[Count],
		DisplayOrder
	)
	VALUES
	(
		@PollID,
		@Name,
		@Count,
		@DisplayOrder
	)

	set @PollAnswerID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PollAnswerUpdate]
(
	@PollAnswerID int,
	@PollID int,
	@Name nvarchar(100),
	@Count int,
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_PollAnswer]
	SET
	PollID=@PollID,
	[Name]=@Name,
	[Count]=@Count,
	DisplayOrder=@DisplayOrder
	WHERE
		PollAnswerID = @PollAnswerID
END
GO



CREATE PROCEDURE [dbo].[Nop_PollVotingRecordCreate]
(
	@PollAnswerID int,
	@CustomerID int
)
AS
BEGIN

	DELETE FROM Nop_PollVotingRecord WHERE PollAnswerID=@PollAnswerID AND CustomerID=@CustomerID
	
	INSERT
	INTO [Nop_PollVotingRecord]
	(
		PollAnswerID,
		CustomerID
	)
	VALUES
	(
		@PollAnswerID,
		@CustomerID
	)
	
	DECLARE @TotalVotingRecords int
	SELECT @TotalVotingRecords = COUNT(*) FROM [Nop_PollVotingRecord] WHERE PollAnswerID=@PollAnswerID 
	UPDATE Nop_PollAnswer SET [Count]=@TotalVotingRecords WHERE PollAnswerID=@PollAnswerID
	


END
GO



CREATE PROCEDURE [dbo].[Nop_PollVotingRecordExists]
(
	@PollID int,
	@CustomerID int
)
AS
BEGIN
	SELECT COUNT(1) FROM Nop_PollVotingRecord pvr
	INNER JOIN Nop_PollAnswer pa ON pvr.PollAnswerID = pa.PollAnswerID
    WHERE pa.PollID=@PollID AND pvr.CustomerID=@CustomerID	
END
GO



CREATE PROCEDURE [dbo].[Nop_PollAnswerDelete]
(
	@PollAnswerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_PollAnswer]
	WHERE
		PollAnswerID = @PollAnswerID
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionUpdate]

	@SpecificationAttributeOptionID int,
	@SpecificationAttributeID int,
	@Name nvarchar(500),
	@DisplayOrder int

AS
BEGIN

	UPDATE Nop_SpecificationAttributeOption SET
		SpecificationAttributeID = @SpecificationAttributeID,
		Name = @Name,
		DisplayOrder = @DisplayOrder
	WHERE SpecificationAttributeOptionID = @SpecificationAttributeOptionID

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionDelete]

	@SpecificationAttributeOptionID int

AS
BEGIN

	DELETE 
	FROM Nop_SpecificationAttributeOption
	WHERE SpecificationAttributeOptionID = @SpecificationAttributeOptionID

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionLoadBySpecificationAttributeID]

	@SpecificationAttributeID int

AS
BEGIN

	SELECT *
	FROM Nop_SpecificationAttributeOption 
	WHERE SpecificationAttributeID = @SpecificationAttributeID
	ORDER BY DisplayOrder

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionInsert]

	@SpecificationAttributeOptionID int = NULL OUTPUT,
	@SpecificationAttributeID int,
	@Name nvarchar(500),
	@DisplayOrder int

AS
BEGIN

	INSERT INTO [Nop_SpecificationAttributeOption] (SpecificationAttributeID, Name, DisplayOrder)
	VALUES (@SpecificationAttributeID, @Name, @DisplayOrder)
	
	SET @SpecificationAttributeOptionID = SCOPE_IDENTITY()

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionLoadByPrimaryKey]

	@SpecificationAttributeOptionID int

AS
BEGIN

	SELECT *
	FROM Nop_SpecificationAttributeOption
	WHERE SpecificationAttributeOptionID = @SpecificationAttributeOptionID

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionLoadAll]

AS
BEGIN

	SELECT *
	FROM Nop_SpecificationAttributeOption
	ORDER BY DisplayOrder
	
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeOptionFilter_LoadByFilter]
(
	@CategoryID int
)
AS
BEGIN
	SELECT 
		sa.SpecificationAttributeID,
		sa.Name 'SpecificationAttributeName',
		sa.DisplayOrder,
		sao.SpecificationAttributeOptionID,
		sao.Name 'SpecificationAttributeOptionName'
	FROM Nop_Product_SpecificationAttribute_Mapping psam with (NOLOCK)
		INNER JOIN Nop_SpecificationAttributeOption sao with (NOLOCK) ON
			sao.SpecificationAttributeOptionID = psam.SpecificationAttributeOptionID
		INNER JOIN Nop_SpecificationAttribute sa with (NOLOCK) ON
			sa.SpecificationAttributeID = sao.SpecificationAttributeID	
		INNER JOIN Nop_Product_Category_Mapping pcm with (NOLOCK) ON 
			pcm.ProductID = psam.ProductID	
		INNER JOIN Nop_Product p ON 
			psam.ProductID = p.ProductID
		LEFT OUTER JOIN Nop_ProductVariant pv with (NOLOCK) ON 
			p.ProductID = pv.ProductID
	WHERE 
			p.Published = 1
		AND 
			pv.Published = 1
		AND 
			p.Deleted=0
		AND
			pcm.CategoryID = @CategoryID
		AND
			psam.AllowFiltering = 1
		AND
			getutcdate() between isnull(pv.AvailableStartDateTime, '1/1/1900') and isnull(pv.AvailableEndDateTime, '1/1/2999')
	GROUP BY
		sa.SpecificationAttributeID, 
		sa.Name,
		sa.DisplayOrder,
		sao.SpecificationAttributeOptionID,
		sao.Name
	ORDER BY sa.DisplayOrder, sao.Name
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentInsert]
(
	@BlogCommentID int = NULL output,
	@BlogPostID int,
	@CustomerID int,
	@CommentText nvarchar(MAX),
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_BlogComment]
	(
		BlogPostID,
		CustomerID,
		CommentText,
		CreatedOn
	)
	VALUES
	(
		@BlogPostID,
		@CustomerID,
		@CommentText,
		@CreatedOn
	)

	set @BlogCommentID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_BlogComment]
	ORDER BY CreatedOn
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentDelete]
(
	@BlogCommentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_BlogComment]
	WHERE
		BlogCommentID = @BlogCommentID
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentUpdate]
(
	@BlogCommentID int,
	@BlogPostID int,
	@CustomerID int,
	@CommentText nvarchar(MAX),
	@CreatedOn datetime
)
AS
BEGIN

	UPDATE [Nop_BlogComment]
	SET
		BlogPostID=@BlogPostID,
		CustomerID=@CustomerID,
		CommentText=@CommentText,
		CreatedOn=@CreatedOn
	WHERE
		BlogCommentID = @BlogCommentID

END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentLoadByBlogPostID]
(
	@BlogPostID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_BlogComment]
	WHERE
		BlogPostID=@BlogPostID
	ORDER BY CreatedOn
END
GO



CREATE PROCEDURE [dbo].[Nop_BlogCommentLoadByPrimaryKey]
(
	@BlogCommentID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_BlogComment]
	WHERE
		BlogCommentID = @BlogCommentID
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_SpecificationAttribute_MappingUpdate]
(
	@ProductSpecificationAttributeID int,
	@ProductID int,	
	@SpecificationAttributeOptionID int,
	@AllowFiltering bit,
	@ShowOnProductPage bit,
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_Product_SpecificationAttribute_Mapping]
	SET
		ProductID = @ProductID,
		SpecificationAttributeOptionID = @SpecificationAttributeOptionID,
		AllowFiltering = @AllowFiltering,
		ShowOnProductPage = @ShowOnProductPage,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductSpecificationAttributeID = @ProductSpecificationAttributeID

END
GO



CREATE PROCEDURE [dbo].[Nop_Product_SpecificationAttribute_MappingInsert]
(
	@ProductSpecificationAttributeID int = NULL output,
	@ProductID int,	
	@SpecificationAttributeOptionID int,
	@AllowFiltering bit,
	@ShowOnProductPage bit,
	@DisplayOrder int
)
AS
BEGIN

	INSERT	
	INTO [Nop_Product_SpecificationAttribute_Mapping]
	(
		ProductID,
		SpecificationAttributeOptionID,
		AllowFiltering,
		ShowOnProductPage,
		DisplayOrder
	)
	VALUES
	(
		@ProductID,
		@SpecificationAttributeOptionID,
		@AllowFiltering,
		@ShowOnProductPage,
		@DisplayOrder
	)

	SET @ProductSpecificationAttributeID = SCOPE_IDENTITY()
	
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_SpecificationAttribute_MappingLoadByProductID]
(
	@ProductID int,
	@AllowFiltering bit,
	@ShowOnProductPage bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		psam.*
	FROM Nop_Product_SpecificationAttribute_Mapping psam
	WHERE psam.ProductID = @ProductID
		AND (@AllowFiltering IS NULL OR psam.AllowFiltering=@AllowFiltering)
		AND (@ShowOnProductPage IS NULL OR psam.ShowOnProductPage=@ShowOnProductPage)
	ORDER BY psam.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentUpdate]
(
	@NewsCommentID int,
	@NewsID int,
	@CustomerID int,
	@Title nvarchar(1000),
	@Comment nvarchar(max),
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_NewsComment]
	SET
		NewsID=@NewsID,
		CustomerID=@CustomerID,
		Title=@Title,
		Comment=@Comment,
		CreatedOn=@CreatedOn
	WHERE
		NewsCommentID = @NewsCommentID
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentInsert]
(
	@NewsCommentID int = NULL output,
	@NewsID int,
	@CustomerID int,
	@Title nvarchar(1000),
	@Comment nvarchar(max),
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_NewsComment]
	(
		NewsID,
		CustomerID,
		Title,
		Comment,
		CreatedOn
	)
	VALUES
	(
		@NewsID,
		@CustomerID,
		@Title,
		@Comment,
		@CreatedOn
	)

	set @NewsCommentID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentDelete]
(
	@NewsCommentID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_NewsComment]
	WHERE
		[NewsCommentID] = @NewsCommentID
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_NewsComment]
	order by CreatedOn
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentLoadByNewsID]
(
	@NewsID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_NewsComment]
	WHERE
		NewsID=@NewsID
	ORDER BY CreatedOn
END
GO



CREATE PROCEDURE [dbo].[Nop_NewsCommentLoadByPrimaryKey]
(
	@NewsCommentID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_NewsComment]
	WHERE
		NewsCommentID=@NewsCommentID
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountLoadAll]
(
	@ShowHidden bit = 0,	
	@DiscountTypeID int		/*null or 0 to load all discounts*/
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_Discount] d
	WHERE ((getutcdate() between d.StartDate and d.EndDate) or @ShowHidden = 1)
	and (@DiscountTypeID IS NULL or @DiscountTypeID=0 or d.DiscountTypeID = @DiscountTypeID) 
	and d.Deleted=0
	order by d.StartDate desc
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountInsert]
(
	@DiscountID int = NULL output,
	@DiscountTypeID int,
	@DiscountRequirementID int,
	@Name nvarchar(100),
	@UsePercentage bit, 
	@DiscountPercentage decimal (18, 4),
	@DiscountAmount decimal (18, 4),
	@StartDate datetime,
	@EndDate datetime,
	@RequiresCouponCode bit,
	@CouponCode nvarchar(100),
	@Deleted bit
)
AS
BEGIN
	INSERT
	INTO [Nop_Discount]
	(
		DiscountTypeID,
		DiscountRequirementID,
		[Name],
		UsePercentage,
		DiscountPercentage,
		DiscountAmount,
		StartDate,
		EndDate,
		RequiresCouponCode,
		CouponCode,
		Deleted
	)
	VALUES
	(
		@DiscountTypeID,
		@DiscountRequirementID,
		@Name,
		@UsePercentage,
		@DiscountPercentage,
		@DiscountAmount,
		@StartDate,
		@EndDate,
		@RequiresCouponCode,
		@CouponCode,
		@Deleted
	)

	set @DiscountID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountUpdate]
(
	@DiscountID int,
	@DiscountTypeID int,
	@DiscountRequirementID int,
	@Name nvarchar(100),
	@UsePercentage bit, 
	@DiscountPercentage decimal (18, 4),
	@DiscountAmount decimal (18, 4),
	@StartDate datetime,
	@EndDate datetime,
	@RequiresCouponCode bit,
	@CouponCode nvarchar(100),
	@Deleted bit
)
AS
BEGIN
	UPDATE [Nop_Discount]
	SET
		DiscountTypeID=@DiscountTypeID,
		DiscountRequirementID=@DiscountRequirementID,
		[Name]=@Name,
		UsePercentage=@UsePercentage,
		DiscountPercentage=@DiscountPercentage,
		DiscountAmount=@DiscountAmount,
		StartDate=@StartDate,
		EndDate=@EndDate,
		RequiresCouponCode=@RequiresCouponCode,
		CouponCode=@CouponCode,
		Deleted=@Deleted
	WHERE
		DiscountID = @DiscountID
END
GO



CREATE PROCEDURE [dbo].[Nop_DiscountLoadByPrimaryKey]
(
	@DiscountID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Discount]
	WHERE
		DiscountID=@DiscountID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerAttributeUpdate]
(
	@CustomerAttributeID int,
	@CustomerID int,
	@Key nvarchar(100),
	@Value nvarchar(1000)
)
AS
BEGIN
	UPDATE [Nop_CustomerAttribute]
	SET
	CustomerID=@CustomerID,
	[Key]=@Key,
	[Value]=@Value
	WHERE
		CustomerAttributeID = @CustomerAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerAttributeDelete]
(
	@CustomerAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_CustomerAttribute]
	WHERE
		CustomerAttributeID = @CustomerAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerAttributeInsert]
(
	@CustomerAttributeID int = NULL output,
	@CustomerID int,
	@Key nvarchar(100),
	@Value nvarchar(1000)
)
AS
BEGIN
	INSERT
	INTO [Nop_CustomerAttribute]
	(
		CustomerID,
		[Key],
		[Value]
	)
	VALUES
	(
		@CustomerID,
		@Key,
		@Value
	)

	set @CustomerAttributeID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerAttributeLoadByPrimaryKey]
(
	@CustomerAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CustomerAttribute]
	WHERE
		CustomerAttributeID = @CustomerAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerLoadAllForNewsLetters]

AS
BEGIN
	SET NOCOUNT ON
	SELECT c.*
	FROM [Nop_Customer] c
	LEFT OUTER JOIN Nop_CustomerAttribute ca
	ON c.CustomerID = ca.CustomerID
	WHERE c.deleted=0 and c.active=1 and ca.[key] = 'Newsletter' and ca.value = 'true'
	order by c.RegistrationDate desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerAttributeLoadAllByCustomerID]
(
	@CustomerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CustomerAttribute]
	WHERE
		(CustomerID = @CustomerID)
END
GO



CREATE PROCEDURE [dbo].[Nop_AddressUpdate]
(
	@AddressId int,
	@CustomerID int,
	@IsBillingAddress bit,
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Company nvarchar(100),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvinceID int,
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Address]
	SET
	CustomerID=@CustomerID,
	IsBillingAddress=@IsBillingAddress,
	FirstName=@FirstName,
	LastName=@LastName,
	PhoneNumber=@PhoneNumber,
	Email=@Email,
	FaxNumber=@FaxNumber,
	Company=@Company,
	Address1=@Address1,
	Address2=@Address2,
	City=@City,
	StateProvinceID=@StateProvinceID,
	ZipPostalCode=@ZipPostalCode,
	CountryID=@CountryID,
	CreatedOn=@CreatedOn,
	UpdatedOn=@UpdatedOn
	WHERE
		[AddressId] = @AddressId
END
GO



CREATE PROCEDURE [dbo].[Nop_AddressInsert]
(
	@AddressId int = NULL output,
	@CustomerID int,
	@IsBillingAddress bit,
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@PhoneNumber nvarchar(50),
	@Email nvarchar(255),
	@FaxNumber nvarchar(50),
	@Company nvarchar(100),
	@Address1 nvarchar(100),
	@Address2 nvarchar(100),
	@City nvarchar(100),
	@StateProvinceID int,
	@ZipPostalCode nvarchar(10),
	@CountryID int,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Address]
	(
		CustomerID,
		IsBillingAddress,
		FirstName,
		LastName,
		PhoneNumber,
		Email,
		FaxNumber,
		Company,
		Address1,
		Address2,
		City,
		StateProvinceID,
		ZipPostalCode,
		CountryID,
		CreatedOn,
		UpdatedOn
	)
	VALUES
	(
		@CustomerID,
		@IsBillingAddress,
		@FirstName,
		@LastName,
		@PhoneNumber,
		@Email,
		@FaxNumber,
		@Company,
		@Address1,
		@Address2,
		@City,
		@StateProvinceID,
		@ZipPostalCode,
		@CountryID,
		@CreatedOn,
		@UpdatedOn
	)

	set @AddressId=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_AddressLoadByCustomerID]
(
	@CustomerID int,
	@GetBillingAddresses bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Address]
	WHERE
		CustomerID=@CustomerID and IsBillingAddress= @GetBillingAddresses
	ORDER BY CreatedOn desc
END
GO



CREATE PROCEDURE [dbo].[Nop_AddressLoadByPrimaryKey]
(
	@AddressId int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Address]
	WHERE
		([AddressId] = @AddressId)
END
GO



CREATE PROCEDURE [dbo].[Nop_AddressDelete]
(
	@AddressID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Address]
	WHERE
		AddressID = @AddressID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariantLoadByPricelistID]
(
	@PricelistID int
)
AS
BEGIN
	SELECT pv.*
	FROM
		[dbo].[Nop_ProductVariant] pv
		INNER JOIN [dbo].[Nop_ProductVariant_Pricelist_Mapping] plm
		ON pv.ProductVariantID = plm.ProductVariantID
	WHERE
		plm.[PricelistID] = @PricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Pricelist_MappingDelete]
(
	@ProductVariantPricelistID int
)
AS
BEGIN
	DELETE 
	FROM [dbo].[Nop_ProductVariant_Pricelist_Mapping]
	WHERE
		[ProductVariantPricelistID] = @ProductVariantPricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Pricelist_MappingLoadByPrimaryKey]
(
	@ProductVariantPricelistID int
)
AS
BEGIN
	SELECT *
	FROM
		[dbo].[Nop_ProductVariant_Pricelist_Mapping]
	WHERE
		[ProductVariantPricelistID] = @ProductVariantPricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Pricelist_MappingUpdate]
(
	@ProductVariantPricelistID int,
	@ProductVariantID int,
	@PricelistID int,
	@PriceAdjustmentTypeID int,
	@PriceAdjustment money,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [dbo].[Nop_ProductVariant_Pricelist_Mapping] 
	SET
		[ProductVariantID] = @ProductVariantID,
		[PricelistID] = @PricelistID,
		[PriceAdjustmentTypeID] = @PriceAdjustmentTypeID,
		[PriceAdjustment] = @PriceAdjustment,
		[UpdatedOn] = @UpdatedOn
	WHERE
		[ProductVariantPricelistID] = @ProductVariantPricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Pricelist_MappingLoadByProductVariantIDAndPricelistID]
(
	@ProductVariantID int, 
	@PricelistID int
)
AS
BEGIN
	SELECT *
	FROM
		[dbo].[Nop_ProductVariant_Pricelist_Mapping]
	WHERE
		[ProductVariantID] = @ProductVariantID
		AND
		[PricelistID] = @PricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductVariant_Pricelist_MappingInsert]
(
	@ProductVariantID int,
	@PricelistID int,
	@PriceAdjustmentTypeID int,
	@PriceAdjustment money,
	@UpdatedOn datetime,
	@ProductVariantPricelistID int OUTPUT
)
AS
BEGIN
	INSERT INTO [dbo].[Nop_ProductVariant_Pricelist_Mapping] 
	(
		[ProductVariantID],
		[PricelistID],
		[PriceAdjustmentTypeID],
		[PriceAdjustment],
		[UpdatedOn]
	) 
	VALUES 
	(
		@ProductVariantID,
		@PricelistID,
		@PriceAdjustmentTypeID,
		@PriceAdjustment,
		@UpdatedOn
	)

	SET @ProductVariantPricelistID = SCOPE_IDENTITY()
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingUpdate]
(
	@ProductManufacturerID int,
	@ProductID int,	
	@ManufacturerID int,
	@IsFeaturedProduct	bit,
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_Product_Manufacturer_Mapping]
	SET
		ProductID=@ProductID,
		ManufacturerID=@ManufacturerID,
		IsFeaturedProduct=@IsFeaturedProduct,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductManufacturerID = @ProductManufacturerID

END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingDelete]
(
	@ProductManufacturerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Product_Manufacturer_Mapping]
	WHERE
		ProductManufacturerID = @ProductManufacturerID
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingInsert]
(
	@ProductManufacturerID int = NULL output,
	@ProductID int,	
	@ManufacturerID int,
	@IsFeaturedProduct	bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_Product_Manufacturer_Mapping]
	(
		ProductID,
		ManufacturerID,
		IsFeaturedProduct,
		DisplayOrder
	)
	VALUES
	(
		@ProductID,
		@ManufacturerID,
		@IsFeaturedProduct,
		@DisplayOrder
	)

	set @ProductManufacturerID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingLoadByPrimaryKey]
(
	@ProductManufacturerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Product_Manufacturer_Mapping]
	WHERE
		ProductManufacturerID = @ProductManufacturerID
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Manufacturer_MappingLoadByManufacturerID]
(
	@ManufacturerID int,
	@ShowHidden bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		pmm.*
	FROM Nop_Product_Manufacturer_Mapping pmm
	INNER JOIN Nop_Product p ON pmm.ProductID=p.ProductID
	WHERE pmm.ManufacturerID=@ManufacturerID
		AND (p.Published = 1 or @ShowHidden = 1) and p.Deleted=0
	ORDER BY pmm.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingLoadByCategoryID]
(
	@CategoryID int,
	@ShowHidden bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		pcm.*
	FROM Nop_Product_Category_Mapping pcm
	INNER JOIN Nop_Product p ON pcm.ProductID=p.ProductID
	WHERE pcm.CategoryID=@CategoryID
		AND (p.Published = 1 or @ShowHidden = 1) and p.Deleted=0
	ORDER BY pcm.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingUpdate]
(
	@ProductCategoryID int,
	@ProductID int,	
	@CategoryID int,
	@IsFeaturedProduct	bit,
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_Product_Category_Mapping]
	SET
		ProductID=@ProductID,
		CategoryID=@CategoryID,
		IsFeaturedProduct=@IsFeaturedProduct,
		DisplayOrder=@DisplayOrder
	WHERE
		ProductCategoryID = @ProductCategoryID

END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingInsert]
(
	@ProductCategoryID int = NULL output,
	@ProductID int,	
	@CategoryID int,
	@IsFeaturedProduct	bit,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_Product_Category_Mapping]
	(
		ProductID,
		CategoryID,
		IsFeaturedProduct,
		DisplayOrder
	)
	VALUES
	(
		@ProductID,
		@CategoryID,
		@IsFeaturedProduct,
		@DisplayOrder
	)

	set @ProductCategoryID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingDelete]
(
	@ProductCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Product_Category_Mapping]
	WHERE
		ProductCategoryID = @ProductCategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_Product_Category_MappingLoadByPrimaryKey]
(
	@ProductCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_Product_Category_Mapping]
	WHERE
		ProductCategoryID = @ProductCategoryID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductRatingCreate]
(
	@ProductID int,
	@CustomerID int,
	@Rating int,
	@RatedOn datetime
)
AS
BEGIN

	DELETE FROM Nop_ProductRating WHERE ProductID=@ProductID AND CustomerID=@CustomerID
	
	INSERT
	INTO [Nop_ProductRating]
	(
		ProductID,
		CustomerID,
		Rating,
		RatedOn
	)
	VALUES
	(
		@ProductID,
		@CustomerID,
		@Rating,
		@RatedOn
	)
	
	DECLARE @RatingSum int
	DECLARE @TotalRatingVotes int
	SELECT @RatingSum = SUM(Rating), @TotalRatingVotes = COUNT(ProductRatingID) FROM Nop_ProductRating WHERE ProductID=@ProductID
	UPDATE Nop_Product SET RatingSum=@RatingSum, TotalRatingVotes=@TotalRatingVotes WHERE ProductID=@ProductID
	


END
GO



CREATE PROCEDURE [dbo].[Nop_RelatedProductLoadByProductID1]
(
	@ProductID1 int,
	@ShowHidden bit
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		rp.*
	FROM Nop_RelatedProduct rp
	INNER JOIN Nop_Product p ON rp.ProductID2=p.ProductID
	WHERE rp.ProductID1=@ProductID1
		AND (p.Published = 1 or @ShowHidden = 1) and p.Deleted=0
	ORDER BY rp.DisplayOrder
END
GO



CREATE PROCEDURE [dbo].[Nop_RelatedProductInsert]
(
	@RelatedProductID int = NULL output,
	@ProductID1 int,	
	@ProductID2 int,
	@DisplayOrder int
)
AS
BEGIN
	INSERT
	INTO [Nop_RelatedProduct]
	(
		ProductID1,
		ProductID2,
		DisplayOrder
	)
	VALUES
	(
		@ProductID1,
		@ProductID2,
		@DisplayOrder
	)

	set @RelatedProductID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_RelatedProductDelete]
(
	@RelatedProductID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_RelatedProduct]
	WHERE
		RelatedProductID = @RelatedProductID
END
GO



CREATE PROCEDURE [dbo].[Nop_RelatedProductLoadByPrimaryKey]
(
	@RelatedProductID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_RelatedProduct]
	WHERE
		RelatedProductID = @RelatedProductID
END
GO



CREATE PROCEDURE [dbo].[Nop_RelatedProductUpdate]
(
	@RelatedProductID int,
	@ProductID1 int,
	@ProductID2 int,	
	@DisplayOrder int
)
AS
BEGIN

	UPDATE [Nop_RelatedProduct]
	SET
		ProductID1=@ProductID1,
		ProductID2=@ProductID2,
		DisplayOrder=@DisplayOrder
	WHERE
		RelatedProductID = @RelatedProductID

END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeUpdate]
(
	@SpecificationAttributeID int,
	@Name nvarchar(400),
	@DisplayOrder int
)
AS
BEGIN
	UPDATE [Nop_SpecificationAttribute] SET
		[Name] = @Name,
		DisplayOrder = @DisplayOrder
	WHERE
		SpecificationAttributeID = @SpecificationAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeInsert]
(
	@SpecificationAttributeID int = NULL output,
	@Name nvarchar(400),
	@DisplayOrder int
)
AS
BEGIN
	
	INSERT
	INTO [Nop_SpecificationAttribute]
	(
		[Name],
		DisplayOrder
	)
	VALUES
	(
		@Name,
		@DisplayOrder
	)

	SET @SpecificationAttributeID = SCOPE_IDENTITY()
	
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeLoadAll]

AS
BEGIN

	SET NOCOUNT ON
	
	SELECT *
	FROM [Nop_SpecificationAttribute]
	ORDER BY DisplayOrder
	
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeDelete]
(
	@SpecificationAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_SpecificationAttribute]
	WHERE
		SpecificationAttributeID = @SpecificationAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_SpecificationAttributeLoadByPrimaryKey]
(
	@SpecificationAttributeID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_SpecificationAttribute]
	WHERE
		SpecificationAttributeID = @SpecificationAttributeID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionLoadByCustomerID]
(
	@CustomerID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CustomerSession]
	WHERE
		([CustomerID] = @CustomerID)
	order by LastAccessed desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionLoadByPrimaryKey]
(
	@CustomerSessionGUID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_CustomerSession]
	WHERE
		CustomerSessionGUID =  @CustomerSessionGUID
	order by LastAccessed desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionLoadAll]
AS
BEGIN
	SET NOCOUNT ON
	SELECT *
	FROM [Nop_CustomerSession]
	order by LastAccessed desc
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionUpdate]
(
	@CustomerSessionGUID uniqueidentifier,
	@CustomerID int,
	@LastAccessed datetime,
	@IsExpired bit
)
AS
BEGIN
	UPDATE [Nop_CustomerSession]
	SET
		CustomerID=@CustomerID,
		LastAccessed=@LastAccessed,
		IsExpired=@IsExpired
	WHERE
		[CustomerSessionGUID] = @CustomerSessionGUID
END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionInsert]
(
	@CustomerSessionGUID uniqueidentifier,
	@CustomerID int,
	@LastAccessed datetime,
	@IsExpired bit
)
AS
BEGIN
	INSERT
	INTO [Nop_CustomerSession]
	(
		CustomerSessionGUID,
		CustomerID,
		LastAccessed,
		IsExpired
	)
	VALUES
	(
		@CustomerSessionGUID,
		@CustomerID,
		@LastAccessed,
		@IsExpired
	)

END
GO



CREATE PROCEDURE [dbo].[Nop_CustomerSessionDelete]
(
	@CustomerSessionGUID uniqueidentifier
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_CustomerSession]
	WHERE
		CustomerSessionGUID = @CustomerSessionGUID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewLoadByProductID]
(
	@ProductID int,
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductReview]
	WHERE
		ProductID=@ProductID
		AND (IsApproved = 1 or @ShowHidden = 1)
	ORDER BY CreatedOn desc
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewLoadAll]
(
	@ShowHidden bit = 0
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductReview]
	WHERE IsApproved = 1 or @ShowHidden = 1
	ORDER BY CreatedOn desc
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewLoadByPrimaryKey]
(
	@ProductReviewID int
)
AS
BEGIN
	SET NOCOUNT ON
	SELECT
		*
	FROM [Nop_ProductReview]
	WHERE
		[ProductReviewID] = @ProductReviewID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewUpdate]
(
	@ProductReviewID int,
	@ProductID int,
	@CustomerID int,
	@Title nvarchar(1000),
	@ReviewText nvarchar(max),
	@Rating int,
	@HelpfulYesTotal int,
	@HelpfulNoTotal int,
	@IsApproved bit,
	@CreatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_ProductReview]
	SET
		ProductID=@ProductID,
		CustomerID=@CustomerID,
		Title=@Title,
		ReviewText=@ReviewText,
		Rating=@Rating,
		HelpfulYesTotal=@HelpfulYesTotal,
		HelpfulNoTotal=@HelpfulNoTotal,
		IsApproved=@IsApproved,
		CreatedOn=@CreatedOn
	WHERE
		ProductReviewID = @ProductReviewID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewDelete]
(
	@ProductReviewID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_ProductReview]
	WHERE
		ProductReviewID = @ProductReviewID
END
GO



CREATE PROCEDURE [dbo].[Nop_ProductReviewInsert]
(
	@ProductReviewID int = NULL output,
	@ProductID int,
	@CustomerID int,
	@Title nvarchar(1000),
	@ReviewText nvarchar(max),
	@Rating int,
	@HelpfulYesTotal int,
	@HelpfulNoTotal int,
	@IsApproved bit,
	@CreatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_ProductReview]
	(
		ProductID,
		CustomerID,
		Title,
		ReviewText,
		Rating,
		HelpfulYesTotal,
		HelpfulNoTotal,
		IsApproved,
		CreatedOn
	)
	VALUES
	(
		@ProductID,
		@CustomerID,
		@Title,
		@ReviewText,
		@Rating,
		@HelpfulYesTotal,
		@HelpfulNoTotal,
		@IsApproved,
		@CreatedOn
	)

	set @ProductReviewID=@@identity
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistDelete]
(
	@PricelistID int
)
AS
BEGIN
	SET NOCOUNT ON
	DELETE
	FROM [Nop_Pricelist]
	WHERE
		PricelistID = @PricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistLoadAll]
AS
BEGIN
	SELECT
		 *
	FROM
		[dbo].[Nop_Pricelist]
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistInsert]
(
	@ExportModeID int,
	@ExportTypeID int,
	@AffiliateID int,
	@DisplayName nvarchar(100),
	@ShortName nvarchar(20),
	@PricelistGuid nvarchar(40),
	@CacheTime int,
	@FormatLocalization nvarchar(5),
	@Description nvarchar(500),
	@AdminNotes nvarchar(500),
	@Header nvarchar(500),
	@Body nvarchar(500),
	@Footer nvarchar(500),
	@PriceAdjustmentTypeID int,
	@PriceAdjustment money,
	@OverrideIndivAdjustment bit,
	@CreatedOn datetime,
	@UpdatedOn datetime,
	@PricelistID int OUTPUT
)
AS
BEGIN
	INSERT 
	INTO [dbo].[Nop_Pricelist] 
	(
		[ExportModeID],
		[ExportTypeID],
		[AffiliateID],
		[DisplayName],
		[ShortName],
		[PricelistGuid],
		[CacheTime],
		[FormatLocalization],
		[Description],
		[AdminNotes],
		[Header],
		[Body],
		[Footer],
		[PriceAdjustmentTypeID],
		[PriceAdjustment],
		[OverrideIndivAdjustment],
		[CreatedOn],
		[UpdatedOn]
	) 
	VALUES 
	(
		@ExportModeID,
		@ExportTypeID,
		@AffiliateID,
		@DisplayName,
		@ShortName,
		@PricelistGuid,
		@CacheTime,
		@FormatLocalization,
		@Description,
		@AdminNotes,
		@Header,
		@Body,
		@Footer,
		@PriceAdjustmentTypeID,
		@PriceAdjustment,
		@OverrideIndivAdjustment,
		@CreatedOn,
		@UpdatedOn
	)

	SET @PricelistID = SCOPE_IDENTITY()
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistUpdate]
(
	@PricelistID int,
	@ExportModeID int,
	@ExportTypeID int,
	@AffiliateID int,
	@DisplayName nvarchar(100),
	@ShortName nvarchar(20),
	@PricelistGuid nvarchar(40),
	@CacheTime int,
	@FormatLocalization nvarchar(5),
	@Description nvarchar(500),
	@AdminNotes nvarchar(500),
	@Header nvarchar(500),
	@Body nvarchar(500),
	@Footer nvarchar(500),
	@PriceAdjustmentTypeID int,
	@PriceAdjustment money,
	@OverrideIndivAdjustment bit,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [dbo].[Nop_Pricelist] 
	SET
		[ExportModeID] = @ExportModeID,
		[ExportTypeID] = @ExportTypeID,
		[AffiliateID] = @AffiliateID,
		[DisplayName] = @DisplayName,
		[ShortName] = @ShortName,
		[PricelistGuid] = @PricelistGuid,
		[CacheTime] = @CacheTime,
		[FormatLocalization] = @FormatLocalization,
		[Description] = @Description,
		[AdminNotes] = @AdminNotes,
		[Header] = @Header,
		[Body] = @Body,
		[Footer] = @Footer,
		[PriceAdjustmentTypeID] = @PriceAdjustmentTypeID,
		[PriceAdjustment] = @PriceAdjustment,
		[OverrideIndivAdjustment] = @OverrideIndivAdjustment,
		[CreatedOn] = @CreatedOn,
		[UpdatedOn] = @UpdatedOn
	WHERE
		[PricelistID] = @PricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistLoadByGuid]
(
	@PricelistGuid nvarchar(40)
)
AS
BEGIN
	SELECT *
	FROM
		[dbo].[Nop_Pricelist]
	WHERE
		[PricelistGuid] = @PricelistGuid
END
GO



CREATE PROCEDURE [dbo].[Nop_PricelistLoadByPrimaryKey]
(
	@PricelistID int
)
AS
BEGIN
	SELECT *
	FROM
		[dbo].[Nop_Pricelist]
	WHERE
		[PricelistID] = @PricelistID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_TopicDelete]
(
	@TopicID int
)
AS
BEGIN
	SET NOCOUNT ON

	declare @UserID int
	declare @ForumID int
	SELECT 
		@UserID = UserID,
		@ForumID = ForumID
	FROM
		[Nop_Forums_Topic]
	WHERE
		TopicID = @TopicID 

	DELETE
	FROM [Nop_Forums_Topic]
	WHERE
		TopicID = @TopicID

	DELETE
	FROM [Nop_Forums_Subscription]
	WHERE
		TopicID = @TopicID

	--update stats/info
	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
	exec [dbo].[Nop_CustomerUpdateCounts] @UserID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_PostUpdate]
(
	@PostID int,
	@TopicID int,
	@UserID int,
	@Text nvarchar(max),
	@IPAddress nvarchar(100),
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_Post]
	SET
		[TopicID]=@TopicID,
		[UserID]=@UserID,
		[Text]=@Text,
		[IPAddress]=@IPAddress,
		[CreatedOn]=@CreatedOn,
		[UpdatedOn]=@UpdatedOn
	WHERE
		PostID = @PostID

	--update stats/info
	exec [dbo].[Nop_Forums_TopicUpdateCounts] @TopicID
	
	declare @ForumID int
	SELECT 
		@ForumID = ft.ForumID
	FROM
		[Nop_Forums_Topic] ft
	WHERE
		ft.TopicID = @TopicID 
		
	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
	
	exec [dbo].[Nop_CustomerUpdateCounts] @UserID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_PostDelete]
(
	@PostID int
)
AS
BEGIN
	SET NOCOUNT ON

	declare @UserID int
	declare @ForumID int
	declare @TopicID int
	SELECT 
		@UserID = ft.UserID,
		@ForumID = ft.ForumID,
		@TopicID = ft.TopicID
	FROM
		[Nop_Forums_Topic] ft
		INNER JOIN 
		[Nop_Forums_Post] fp
		ON ft.TopicID=fp.TopicID
	WHERE
		fp.PostID = @PostID 
	
	DELETE
	FROM [Nop_Forums_Post]
	WHERE
		PostID = @PostID

	--update stats/info
	exec [dbo].[Nop_Forums_TopicUpdateCounts] @TopicID
	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
	exec [dbo].[Nop_CustomerUpdateCounts] @UserID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_TopicUpdate]
(
	@TopicID int,
	@ForumID int,
	@UserID int,
	@TopicTypeID int,
	@Subject nvarchar(450),
	@NumPosts int,
	@Views int,
	@LastPostID int,
	@LastPostUserID int,
	@LastPostTime datetime,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	UPDATE [Nop_Forums_Topic]
	SET
		[ForumID]=@ForumID,
		[UserID]=@UserID,
		[TopicTypeID]=@TopicTypeID,
		[Subject]=@Subject,
		[NumPosts]=@NumPosts,
		[Views]=@Views,
		LastPostID=@LastPostID,
		LastPostUserID=@LastPostUserID,
		LastPostTime=@LastPostTime,
		CreatedOn=@CreatedOn,
		UpdatedOn=@UpdatedOn
	WHERE
		TopicID = @TopicID
	
	--update stats/info
	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_TopicInsert]
(
	@TopicID int = NULL output,
	@ForumID int,
	@UserID int,
	@TopicTypeID int,
	@Subject nvarchar(450),
	@NumPosts int,
	@Views int,
	@LastPostID int,
	@LastPostUserID int,
	@LastPostTime datetime,
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_Topic]
	(
		[ForumID],
		[UserID],
		[TopicTypeID],
		[Subject],
		[NumPosts],
		[Views],
		[LastPostID],
		[LastPostUserID],
		[LastPostTime],
		[CreatedOn],
		[UpdatedOn]
	)
	VALUES
	(
		@ForumID,
		@UserID,
		@TopicTypeID,
		@Subject,
		@NumPosts,
		@Views,
		@LastPostID,
		@LastPostUserID,
		@LastPostTime,
		@CreatedOn,
		@UpdatedOn
	)

	set @TopicID=@@identity

	--update stats/info
	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
END
GO



CREATE PROCEDURE [dbo].[Nop_Forums_PostInsert]
(
	@PostID int = NULL output,
	@TopicID int,
	@UserID int,
	@Text nvarchar(max),
	@IPAddress nvarchar(100),
	@CreatedOn datetime,
	@UpdatedOn datetime
)
AS
BEGIN
	INSERT
	INTO [Nop_Forums_Post]
	(
		[TopicID],
		[UserID],
		[Text],
		[IPAddress],
		[CreatedOn],
		[UpdatedOn]
	)
	VALUES
	(
		@TopicID,
		@UserID,
		@Text,
		@IPAddress,
		@CreatedOn,
		@UpdatedOn
	)

	set @PostID=@@identity

	--update stats/info
	exec [dbo].[Nop_Forums_TopicUpdateCounts] @TopicID
	
	declare @ForumID int
	SELECT 
		@ForumID = ft.ForumID
	FROM
		[Nop_Forums_Topic] ft
	WHERE
		ft.TopicID = @TopicID 

	exec [dbo].[Nop_Forums_ForumUpdateCounts] @ForumID
	
	exec [dbo].[Nop_CustomerUpdateCounts] @UserID
END
GO
