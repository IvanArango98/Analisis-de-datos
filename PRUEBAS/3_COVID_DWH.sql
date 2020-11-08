USE COVID_GRUPO1_DWH
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Dimension].[Demographics](
	[SK_Demographics] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,	
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	[Population] [dbo].[UDT_Entero_grande] NULL,
	population_male [dbo].[UDT_Entero_grande] NULL,
	population_female [dbo].[UDT_Entero_grande] NULL,
	rural_population [dbo].[UDT_Entero_grande] NULL,
	urban_population [dbo].[UDT_Entero_grande] NULL,
	largest_city_population [dbo].[UDT_Entero_grande] NULL,
	clustered_population [dbo].[UDT_Entero_grande] NULL,
	population_density [dbo].[UDT_VarcharCorto] NULL,	
	human_development_index [dbo].[UDT_VarcharCorto] NULL,	
	population_age_00_09 [dbo].[UDT_Entero_grande] NULL,
	population_age_10_19 [dbo].[UDT_Entero_grande] NULL,
	population_age_20_29 [dbo].[UDT_Entero_grande] null,
	population_age_30_39 [dbo].[UDT_Entero_grande] NULL,
	population_age_40_49 [dbo].[UDT_Entero_grande] NULL,
	population_age_50_59 [dbo].[UDT_Entero_grande] NULL,
	population_age_60_69 [dbo].[UDT_Entero_grande] NULL,
	population_age_70_79 [dbo].[UDT_Entero_grande] NULL,
	population_age_80_89 [dbo].[UDT_Entero_grande] NULL,
	population_age_90_99 [dbo].[UDT_Entero_grande] NULL,
	population_age_80_and_older [dbo].[UDT_Entero_grande] NULL,	
	ID_Demographics [dbo].[UDT_Date] NOT NULL,
	--Columnas SCD Tipo 2
	[FechaInicioValidez] DATETIME NOT NULL DEFAULT(GETDATE()),
	[FechaFinValidez] DATETIME NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion varchar(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion varchar(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(20) NULL,
	ID_SourceSystem VARCHAR(20)	
	PRIMARY KEY CLUSTERED 
	(
		[SK_Demographics] ASC
	)
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Dimension].[Economy](
	[SK_Economy] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,	
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	Gdp [dbo].[UDT_Entero_grande] NULL,
	gdp_per_capita [dbo].[UDT_Entero_grande] NULL,
	human_capital_index [dbo].[UDT_Decimal5.2] NULL,
	ID_Economy [dbo].[UDT_Date] NOT NULL,
	--Columnas SCD Tipo 2
	[FechaInicioValidez] DATETIME NOT NULL DEFAULT(GETDATE()),
	[FechaFinValidez] DATETIME NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion varchar(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion varchar(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(20) NULL,
	ID_SourceSystem VARCHAR(20)	
	PRIMARY KEY CLUSTERED 
	(
		[SK_Economy] ASC
	)
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Could not allocate a new page for database 'COVID_DWH_GRUPO1' because of insufficient disk space in filegroup 'PRIMARY'. Create the necessary space by dropping objects in the filegroup, adding additional files to the filegroup, or setting autogrowth on for existing files in the filegroup.
    
CREATE TABLE [Dimension].[Geography](
    [SK_Geography] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,    
    [key] [dbo].[UDT_VarcharCorto] NOT NULL,
    latitude [dbo].[UDT_VarcharCorto] NULL,
    Longitude [dbo].[UDT_VarcharCorto] NULL,
    Elevation [dbo].[UDT_Entero_grande] NULL,
    Area [dbo].[UDT_Entero_grande] NULL,
    rural_area [dbo].[UDT_Entero_grande] NULL,
    urban_area [dbo].[UDT_Entero_grande] NULL,
    open_street_maps [dbo].[UDT_Entero_grande] NULL,
	country_code [dbo].[UDT_VarcharCorto] NULL,
	country_name [dbo].[UDT_VarcharCorto] NULL,
	subregion1_code [dbo].[UDT_VarcharCorto] NULL,
	subregion1_name [dbo].[UDT_VarcharCorto] NULL,
	subregion2_code [dbo].[UDT_VarcharCorto] NULL,
	subregion2_name [dbo].[UDT_VarcharLargo] NULL,
	ID_Geography [dbo].[UDT_Date] NOT NULL,
    --Columnas SCD Tipo 2
    [FechaInicioValidez] DATETIME NOT NULL DEFAULT(GETDATE()),
    [FechaFinValidez] DATETIME NULL,
    --Columnas Auditoria
    FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
    UsuarioCreacion varchar(100) NOT NULL DEFAULT(SUSER_NAME()),
    FechaModificacion DATETIME NULL,
    UsuarioModificacion varchar(100) NULL,
    --Columnas Linaje
    ID_Batch VARCHAR(20) NULL,
    ID_SourceSystem VARCHAR(20)   
    PRIMARY KEY CLUSTERED
    (
        [SK_Geography] ASC
    )
    ) ON [PRIMARY]
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Health](
	[SK_Health] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,	
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	life_expectancy [dbo].[UDT_VarcharCorto] NULL,
	smoking_prevalence [dbo].[UDT_VarcharCorto] NULL,
	diabetes_prevalence [dbo].[UDT_VarcharCorto] NULL,
	infant_mortality_rate [dbo].[UDT_VarcharCorto] NULL,
	adult_male_mortality_rate [dbo].[UDT_VarcharCorto] NULL,
	adult_female_mortality_rate [dbo].[UDT_VarcharCorto] NULL,
	pollution_mortality_rate [dbo].[UDT_VarcharCorto] NULL,
	comorbidity_mortality_rate [dbo].[UDT_VarcharCorto] NULL,
	hospital_beds [dbo].[UDT_VarcharCorto] NULL,
	nurses [dbo].[UDT_VarcharCorto] NULL,
	physicians [dbo].[UDT_VarcharCorto] NULL,
	health_expenditure [dbo].[UDT_VarcharCorto] NULL,
	out_of_pocket_health_expenditure [dbo].[UDT_VarcharCorto] NULL,
	ID_Health [dbo].[UDT_Date] NOT NULL,
	--Columnas SCD Tipo 2
	[FechaInicioValidez] DATETIME NOT NULL DEFAULT(GETDATE()),
	[FechaFinValidez] DATETIME NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion varchar(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion varchar(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(20) NULL,
	ID_SourceSystem VARCHAR(20)	
	PRIMARY KEY CLUSTERED 
	(
		[SK_Health] ASC
	)
	) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Fecha](
    [DateKey] [int] NOT NULL,
	[Date] [date] NOT NULL,
	[Day] [tinyint] NOT NULL,
	[DaySuffix] [char](2) NOT NULL,
	[Weekday] [tinyint] NOT NULL,
	[WeekDayName] [varchar](10) NOT NULL,
	[WeekDayName_Short] [char](3) NOT NULL,
	[WeekDayName_FirstLetter] [char](1) NOT NULL,
	[DOWInMonth] [tinyint] NOT NULL,
	[DayOfYear] [smallint] NOT NULL,
	[WeekOfMonth] [tinyint] NOT NULL,
	[WeekOfYear] [tinyint] NOT NULL,
	[Month] [tinyint] NOT NULL,
	[MonthName] [varchar](10) NOT NULL,
	[MonthName_Short] [char](3) NOT NULL,
	[MonthName_FirstLetter] [char](1) NOT NULL,
	[Quarter] [tinyint] NOT NULL,
	[QuarterName] [varchar](6) NOT NULL,
	[Year] [int] NOT NULL,
	[MMYYYY] [char](6) NOT NULL,
	[MonthYear] [char](7) NOT NULL,
	[IsWeekend] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DateKey] ASC
)
) ON [PRIMARY]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Fact].[Sex](
	[SK_Sex] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,
	[SK_Demographics] [dbo].[UDT_SK] NULL,
	[SK_Economy] [dbo].[UDT_SK] NULL,
	[SK_Geography] [dbo].[UDT_SK] NULL,
	[SK_Health] [dbo].[UDT_SK] NULL,	
	DateKey  [dbo].[UDT_SK] NULL,
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed_male [dbo].[UDT_Entero] NULL,
	new_confirmed_female [dbo].[UDT_Entero] NULL, 
	total_confirmed_male [dbo].[UDT_Entero] NULL,
	total_confirmed_female [dbo].[UDT_Entero] NULL, 
	new_deceased_male [dbo].[UDT_Entero] NULL, 
	new_deceased_female [dbo].[UDT_Entero] NULL, 
	total_deceased_male [dbo].[UDT_Entero] NULL, 
	total_deceased_female [dbo].[UDT_Entero] NULL, 
	new_recovered_male [dbo].[UDT_Entero] NULL, 
	new_recovered_female [dbo].[UDT_Entero] NULL, 
	total_recovered_male [dbo].[UDT_Entero] NULL, 
	total_recovered_female [dbo].[UDT_Entero] NULL, 
	new_tested_male [dbo].[UDT_Entero] NULL, 
	new_tested_female [dbo].[UDT_Entero] NULL, 
	total_tested_male [dbo].[UDT_Entero] NULL, 
	total_tested_female [dbo].[UDT_Entero] NULL, 
	new_hospitalized_male [dbo].[UDT_Entero] NULL, 
	new_hospitalized_female [dbo].[UDT_Entero] NULL, 
	total_hospitalized_male [dbo].[UDT_Entero] NULL, 
	total_hospitalized_female [dbo].[UDT_Entero] NULL, 
	current_hospitalized_male [dbo].[UDT_Entero] NULL,
	current_hospitalized_female [dbo].[UDT_Entero] NULL, 
	new_intensive_care_male [dbo].[UDT_Entero] NULL, 
	new_intensive_care_female [dbo].[UDT_Entero] NULL, 
	total_intensive_care_male [dbo].[UDT_Entero] NULL, 
	total_intensive_care_female [dbo].[UDT_Entero] NULL, 
	current_intensive_care_male [dbo].[UDT_Entero] NULL, 
	current_intensive_care_female [dbo].[UDT_Entero] NULL, 
	new_ventilator_male [dbo].[UDT_Entero] NULL, 
	new_ventilator_female [dbo].[UDT_Entero] NULL, 
	total_ventilator_male [dbo].[UDT_Entero] NULL, 
	total_ventilator_female [dbo].[UDT_Entero] NULL, 
	current_ventilator_male [dbo].[UDT_Entero] NULL, 
	current_ventilator_female [dbo].[UDT_Entero] NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion VARCHAR(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion VARCHAR(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(50) NULL,
	ID_SourceSystem VARCHAR(50)
	PRIMARY KEY CLUSTERED 
	(
		[SK_Sex] ASC
	)
	) ON [PRIMARY]
GO


ALTER TABLE [Fact].[Sex] WITH CHECK ADD FOREIGN KEY([SK_Demographics])
REFERENCES [Dimension].[Demographics] ([SK_Demographics])
GO
ALTER TABLE [Fact].[Sex]  WITH CHECK ADD FOREIGN KEY([SK_Economy])
REFERENCES [Dimension].[Economy] ([SK_Economy])
GO
ALTER TABLE [Fact].[Sex]  WITH CHECK ADD FOREIGN KEY([SK_Geography])
REFERENCES [Dimension].[Geography] ([SK_Geography])
GO
ALTER TABLE [Fact].[Sex]  WITH CHECK ADD FOREIGN KEY([SK_Health])
REFERENCES [Dimension].[Health] ([SK_Health])
GO
ALTER TABLE [Fact].[Sex]  WITH CHECK ADD FOREIGN KEY(Datekey)
REFERENCES [Dimension].[Fecha] ([Datekey])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [Fact].[Age](
	[SK_Age] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,	
	[SK_Demographics] [dbo].[UDT_SK] NULL,
	[SK_Economy] [dbo].[UDT_SK] NULL,
	[SK_Geography] [dbo].[UDT_SK] NULL,
	[SK_Health] [dbo].[UDT_SK] NULL,	
	DateKey  [dbo].[UDT_SK] NULL,
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed_age_00 [dbo].[UDT_Entero] NULL,
	new_confirmed_age_01 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_02 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_03 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_04 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_05 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_06 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_07 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_08 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_09 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_00 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_01 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_02 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_03 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_04 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_05 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_06 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_07 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_08 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_09 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_00 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_01 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_02 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_03 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_04 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_05 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_06 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_07 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_08 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_09 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_00 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_01 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_02 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_03 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_04 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_05 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_06 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_07 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_08 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_09 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_00 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_01 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_02 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_03 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_04 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_05 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_06 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_07 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_08 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_09 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_00 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_01 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_02 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_03 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_04 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_05 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_06 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_07 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_08 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_09 [dbo].[UDT_Entero] NULL, 
	new_tested_age_00 [dbo].[UDT_Entero] NULL, 
	new_tested_age_01 [dbo].[UDT_Entero] NULL, 
	new_tested_age_02 [dbo].[UDT_Entero] NULL, 
	new_tested_age_03 [dbo].[UDT_Entero] NULL, 
	new_tested_age_04 [dbo].[UDT_Entero] NULL, 
	new_tested_age_05 [dbo].[UDT_Entero] NULL, 
	new_tested_age_06 [dbo].[UDT_Entero] NULL, 
	new_tested_age_07 [dbo].[UDT_Entero] NULL, 
	new_tested_age_08 [dbo].[UDT_Entero] NULL, 
	new_tested_age_09 [dbo].[UDT_Entero] NULL, 
	total_tested_age_00 [dbo].[UDT_Entero] NULL, 
	total_tested_age_01 [dbo].[UDT_Entero] NULL, 
	total_tested_age_02 [dbo].[UDT_Entero] NULL, 
	total_tested_age_03 [dbo].[UDT_Entero] NULL, 
	total_tested_age_04 [dbo].[UDT_Entero] NULL, 
	total_tested_age_05 [dbo].[UDT_Entero] NULL, 
	total_tested_age_06 [dbo].[UDT_Entero] NULL, 
	total_tested_age_07 [dbo].[UDT_Entero] NULL, 
	total_tested_age_08 [dbo].[UDT_Entero] NULL, 
	total_tested_age_09 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_00 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_01 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_02 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_03 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_04 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_05 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_06 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_07 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_08 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_09 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_00 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_01 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_02 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_03 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_04 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_05 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_06 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_07 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_08 [dbo].[UDT_Entero] NULL,
	total_hospitalized_age_09 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_00 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_01 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_02 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_03 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_04 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_05 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_06 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_07 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_08 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_09 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_00 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_05 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_00 [dbo].[UDT_Entero] NULL, 
	total_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_05 [dbo].[UDT_Entero] NULL, 
	total_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_00 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_05 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_03 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_04 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_05 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_06 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_07 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_08 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_09 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_03 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_04 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_05 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_06 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_07 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_08 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_09 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_03 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_04 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_05 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_06 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_07 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_08 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_09 [dbo].[UDT_Entero] NULL, 
	age_bin_00 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_01 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_02 [dbo].[UDT_VarcharCorto]  NULL,
	age_bin_03 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_04 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_05 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_06 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_07 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_08 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_09 [dbo].[UDT_VarcharCorto]  NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion VARCHAR(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion VARCHAR(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(50) NULL,
	ID_SourceSystem VARCHAR(50)
	PRIMARY KEY CLUSTERED 
	(
		[SK_Age] ASC
	)
	) ON [PRIMARY]
GO

ALTER TABLE [Fact].[Age] WITH CHECK ADD FOREIGN KEY([SK_Demographics])
REFERENCES [Dimension].[Demographics] ([SK_Demographics])
GO
ALTER TABLE [Fact].[Age]  WITH CHECK ADD FOREIGN KEY([SK_Economy])
REFERENCES [Dimension].[Economy] ([SK_Economy])
GO
ALTER TABLE [Fact].[Age]  WITH CHECK ADD FOREIGN KEY([SK_Geography])
REFERENCES [Dimension].[Geography] ([SK_Geography])
GO
ALTER TABLE [Fact].[Age]  WITH CHECK ADD FOREIGN KEY([SK_Health])
REFERENCES [Dimension].[Health] ([SK_Health])
GO
ALTER TABLE [Fact].[Age]  WITH CHECK ADD FOREIGN KEY(Datekey)
REFERENCES [Dimension].[Fecha] ([Datekey])
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Epidemilogy](
	[SK_Epidemilogy] [dbo].[UDT_SK] IDENTITY(1,1) NOT NULL,	
	[SK_Demographics] [dbo].[UDT_SK] NULL,
	[SK_Economy] [dbo].[UDT_SK] NULL,
	[SK_Geography] [dbo].[UDT_SK] NULL,
	[SK_Health] [dbo].[UDT_SK] NULL,	
	DateKey  [dbo].[UDT_SK] NULL,
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed [dbo].[UDT_Entero] NULL,
	new_deceased [dbo].[UDT_Entero] NULL,
	new_recovered [dbo].[UDT_Entero] NULL,
	new_tested [dbo].[UDT_Entero] NULL,
	total_confirmed [dbo].[UDT_Entero] NULL,
	total_deceased [dbo].[UDT_Entero],
	total_tested [dbo].[UDT_Entero] NULL,
	new_hospitalized [dbo].[UDT_Entero] NULL,
	new_intensive_care [dbo].[UDT_Entero] NULL,
	new_ventilator [dbo].[UDT_Entero] NULL,
	total_hospitalized [dbo].[UDT_Entero] NULL,
	total_intensive_care [dbo].[UDT_Entero] NULL,
	total_ventilator [dbo].[UDT_Entero] NULL,
	current_hospitalized [dbo].[UDT_Entero] NULL,
	current_intensive_care [dbo].[UDT_Entero] NULL,
	current_ventilator [dbo].[UDT_Entero] NULL,
	--Columnas Auditoria
	FechaCreacion DATETIME NOT NULL DEFAULT(GETDATE()),
	UsuarioCreacion VARCHAR(100) NOT NULL DEFAULT(SUSER_NAME()),
	FechaModificacion DATETIME NULL,
	UsuarioModificacion VARCHAR(100) NULL,
	--Columnas Linaje
	ID_Batch VARCHAR(50) NULL,
	ID_SourceSystem VARCHAR(50)
	PRIMARY KEY CLUSTERED 
	(
		[SK_Epidemilogy] ASC
	)
	) ON [PRIMARY]
GO

ALTER TABLE [Fact].[Epidemilogy]  WITH CHECK ADD FOREIGN KEY([SK_Demographics])
REFERENCES [Dimension].[Demographics] ([SK_Demographics])
GO
ALTER TABLE [Fact].[Epidemilogy]  WITH CHECK ADD FOREIGN KEY([SK_Economy])
REFERENCES [Dimension].[Economy] ([SK_Economy])
GO
ALTER TABLE [Fact].[Epidemilogy]  WITH CHECK ADD FOREIGN KEY([SK_Geography])
REFERENCES [Dimension].[Geography] ([SK_Geography])
GO
ALTER TABLE [Fact].[Epidemilogy]  WITH CHECK ADD FOREIGN KEY([SK_Health])
REFERENCES [Dimension].[Health] ([SK_Health])
GO
ALTER TABLE [Fact].[Epidemilogy]  WITH CHECK ADD FOREIGN KEY(Datekey)
REFERENCES [Dimension].[Fecha] ([Datekey])
GO



--Creamos tabla para log de fact batches
CREATE TABLE FactLog_Epidemilogy
(
	ID_Batch UNIQUEIDENTIFIER DEFAULT(NEWID()),
	FechaEjecucion DATETIME DEFAULT(GETDATE()),
	RegistrosImportados INT,
	CONSTRAINT [PK_FactLogEpidemilogy] PRIMARY KEY
	(
		ID_Batch
	)
)
GO

CREATE TABLE FactLog_Age
(
	ID_Batch UNIQUEIDENTIFIER DEFAULT(NEWID()),
	FechaEjecucion DATETIME DEFAULT(GETDATE()),
	RegistrosImportados INT,
	CONSTRAINT [PK_FactLogAge] PRIMARY KEY
	(
		ID_Batch
	)
)
GO

CREATE TABLE FactLog_Sex
(
	ID_Batch UNIQUEIDENTIFIER DEFAULT(NEWID()),
	FechaEjecucion DATETIME DEFAULT(GETDATE()),
	RegistrosImportados INT,
	CONSTRAINT [PK_FactLogSex] PRIMARY KEY
	(
		ID_Batch
	)
)
GO


--Transformamos nuestra columna a UNIQUEID del Fact Epidemilogy
ALTER TABLE Fact.Epidemilogy
ALTER COLUMN ID_Batch UNIQUEIDENTIFIER
GO

--Transformamos nuestra columna a UNIQUEID del Fact Age
ALTER TABLE Fact.Age
ALTER COLUMN ID_Batch UNIQUEIDENTIFIER
GO

--Transformamos nuestra columna a UNIQUEID del Fact Sex
ALTER TABLE Fact.Sex
ALTER COLUMN ID_Batch UNIQUEIDENTIFIER
GO


--Agregamos FK Fact Epidemilogy
ALTER TABLE Fact.Epidemilogy ADD CONSTRAINT [FK_IDBatchEpidemilogy] FOREIGN KEY (ID_Batch) 
REFERENCES FactLog_Epidemilogy (ID_Batch)
go

--Agregamos FK Fact Age
ALTER TABLE Fact.Age ADD CONSTRAINT [FK_IDBatchAge] FOREIGN KEY (ID_Batch) 
REFERENCES FactLog_Age (ID_Batch)
go

--Agregamos FK Fact Sex
ALTER TABLE Fact.Sex ADD CONSTRAINT [FK_IDBatchSex] FOREIGN KEY (ID_Batch) 
REFERENCES FactLog_Sex (ID_Batch)
go


CREATE TABLE [staging].[Epidemilogy](
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed [dbo].[UDT_Entero] NULL,
	new_deceased [dbo].[UDT_Entero] NULL,
	new_recovered [dbo].[UDT_Entero] NULL,
	new_tested [dbo].[UDT_Entero] NULL,
	total_confirmed [dbo].[UDT_Entero] NULL,
	total_deceased [dbo].[UDT_Entero],
	total_tested [dbo].[UDT_Entero] NULL,
	new_hospitalized [dbo].[UDT_Entero] NULL,
	new_intensive_care [dbo].[UDT_Entero] NULL,
	new_ventilator [dbo].[UDT_Entero] NULL,
	total_hospitalized [dbo].[UDT_Entero] NULL,
	total_intensive_care [dbo].[UDT_Entero] NULL,
	total_ventilator [dbo].[UDT_Entero] NULL,
	current_hospitalized [dbo].[UDT_Entero] NULL,
	current_intensive_care [dbo].[UDT_Entero] NULL,
	current_ventilator [dbo].[UDT_Entero] NULL,	
) ON [PRIMARY]
GO

DROP TABLE IF EXISTS [staging].[Age]
GO

CREATE TABLE [staging].[Age]
(
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed_age_00 [dbo].[UDT_Entero] NULL,
	new_confirmed_age_01 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_02 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_03 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_04 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_05 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_06 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_07 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_08 [dbo].[UDT_Entero] NULL, 
	new_confirmed_age_09 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_00 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_01 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_02 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_03 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_04 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_05 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_06 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_07 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_08 [dbo].[UDT_Entero] NULL, 
	total_confirmed_age_09 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_00 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_01 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_02 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_03 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_04 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_05 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_06 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_07 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_08 [dbo].[UDT_Entero] NULL, 
	new_deceased_age_09 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_00 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_01 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_02 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_03 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_04 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_05 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_06 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_07 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_08 [dbo].[UDT_Entero] NULL, 
	total_deceased_age_09 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_00 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_01 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_02 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_03 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_04 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_05 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_06 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_07 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_08 [dbo].[UDT_Entero] NULL, 
	new_recovered_age_09 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_00 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_01 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_02 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_03 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_04 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_05 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_06 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_07 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_08 [dbo].[UDT_Entero] NULL, 
	total_recovered_age_09 [dbo].[UDT_Entero] NULL, 
	new_tested_age_00 [dbo].[UDT_Entero] NULL, 
	new_tested_age_01 [dbo].[UDT_Entero] NULL, 
	new_tested_age_02 [dbo].[UDT_Entero] NULL, 
	new_tested_age_03 [dbo].[UDT_Entero] NULL, 
	new_tested_age_04 [dbo].[UDT_Entero] NULL, 
	new_tested_age_05 [dbo].[UDT_Entero] NULL, 
	new_tested_age_06 [dbo].[UDT_Entero] NULL, 
	new_tested_age_07 [dbo].[UDT_Entero] NULL, 
	new_tested_age_08 [dbo].[UDT_Entero] NULL, 
	new_tested_age_09 [dbo].[UDT_Entero] NULL, 
	total_tested_age_00 [dbo].[UDT_Entero] NULL, 
	total_tested_age_01 [dbo].[UDT_Entero] NULL, 
	total_tested_age_02 [dbo].[UDT_Entero] NULL, 
	total_tested_age_03 [dbo].[UDT_Entero] NULL, 
	total_tested_age_04 [dbo].[UDT_Entero] NULL, 
	total_tested_age_05 [dbo].[UDT_Entero] NULL, 
	total_tested_age_06 [dbo].[UDT_Entero] NULL, 
	total_tested_age_07 [dbo].[UDT_Entero] NULL, 
	total_tested_age_08 [dbo].[UDT_Entero] NULL, 
	total_tested_age_09 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_00 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_01 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_02 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_03 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_04 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_05 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_06 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_07 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_08 [dbo].[UDT_Entero] NULL, 
	new_hospitalized_age_09 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_00 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_01 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_02 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_03 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_04 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_05 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_06 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_07 [dbo].[UDT_Entero] NULL, 
	total_hospitalized_age_08 [dbo].[UDT_Entero] NULL,
	total_hospitalized_age_09 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_00 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_01 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_02 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_03 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_04 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_05 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_06 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_07 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_08 [dbo].[UDT_Entero] NULL,
	current_hospitalized_age_09 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_00 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_05 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	new_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_00 [dbo].[UDT_Entero] NULL, 
	total_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_05 [dbo].[UDT_Entero] NULL, 
	total_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	total_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_00 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_01 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_02 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_03 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_04 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_05 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_06 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_07 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_08 [dbo].[UDT_Entero] NULL,
	current_intensive_care_age_09 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_03 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_04 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_05 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_06 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_07 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_08 [dbo].[UDT_Entero] NULL,
	new_ventilator_age_09 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_03 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_04 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_05 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_06 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_07 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_08 [dbo].[UDT_Entero] NULL,
	total_ventilator_age_09 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_00 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_01 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_02 [dbo].[UDT_Entero] NULL,
	current_ventilator_age_03 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_04 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_05 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_06 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_07 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_08 [dbo].[UDT_Entero] NULL, 
	current_ventilator_age_09 [dbo].[UDT_Entero] NULL, 
	age_bin_00 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_01 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_02 [dbo].[UDT_VarcharCorto]  NULL,
	age_bin_03 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_04 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_05 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_06 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_07 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_08 [dbo].[UDT_VarcharCorto]  NULL, 
	age_bin_09 [dbo].[UDT_VarcharCorto]  NULL,	
) ON [PRIMARY]
go

DROP TABLE IF EXISTS [staging].[Sex]
GO

CREATE TABLE [staging].[Sex]
(
	[date] [dbo].[UDT_Date] NOT NULL,
	[key] [dbo].[UDT_VarcharCorto] NOT NULL,
	new_confirmed_male [dbo].[UDT_Entero] NULL,
	new_confirmed_female [dbo].[UDT_Entero] NULL, 
	total_confirmed_male [dbo].[UDT_Entero] NULL,
	total_confirmed_female [dbo].[UDT_Entero] NULL, 
	new_deceased_male [dbo].[UDT_Entero] NULL, 
	new_deceased_female [dbo].[UDT_Entero] NULL, 
	total_deceased_male [dbo].[UDT_Entero] NULL, 
	total_deceased_female [dbo].[UDT_Entero] NULL, 
	new_recovered_male [dbo].[UDT_Entero] NULL, 
	new_recovered_female [dbo].[UDT_Entero] NULL, 
	total_recovered_male [dbo].[UDT_Entero] NULL, 
	total_recovered_female [dbo].[UDT_Entero] NULL, 
	new_tested_male [dbo].[UDT_Entero] NULL, 
	new_tested_female [dbo].[UDT_Entero] NULL, 
	total_tested_male [dbo].[UDT_Entero] NULL, 
	total_tested_female [dbo].[UDT_Entero] NULL, 
	new_hospitalized_male [dbo].[UDT_Entero] NULL, 
	new_hospitalized_female [dbo].[UDT_Entero] NULL, 
	total_hospitalized_male [dbo].[UDT_Entero] NULL, 
	total_hospitalized_female [dbo].[UDT_Entero] NULL, 
	current_hospitalized_male [dbo].[UDT_Entero] NULL,
	current_hospitalized_female [dbo].[UDT_Entero] NULL, 
	new_intensive_care_male [dbo].[UDT_Entero] NULL, 
	new_intensive_care_female [dbo].[UDT_Entero] NULL, 
	total_intensive_care_male [dbo].[UDT_Entero] NULL, 
	total_intensive_care_female [dbo].[UDT_Entero] NULL, 
	current_intensive_care_male [dbo].[UDT_Entero] NULL, 
	current_intensive_care_female [dbo].[UDT_Entero] NULL, 
	new_ventilator_male [dbo].[UDT_Entero] NULL, 
	new_ventilator_female [dbo].[UDT_Entero] NULL, 
	total_ventilator_male [dbo].[UDT_Entero] NULL, 
	total_ventilator_female [dbo].[UDT_Entero] NULL, 
	current_ventilator_male [dbo].[UDT_Entero] NULL, 
	current_ventilator_female [dbo].[UDT_Entero] NULL,	
) ON [PRIMARY]
GO

insert into FactLog_Sex(ID_Batch,FechaEjecucion,RegistrosImportados) values(NEWID(),GETDATE(),1) 
go
insert into FactLog_Epidemilogy(ID_Batch,FechaEjecucion,RegistrosImportados) values(NEWID(),GETDATE(),1)
go
insert into FactLog_Age(ID_Batch,FechaEjecucion,RegistrosImportados) values(NEWID(),GETDATE(),1)
go





