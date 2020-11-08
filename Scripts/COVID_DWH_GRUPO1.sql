USE COVID_GRUPO1_DWH
GO
--Enteros
 --User Defined Type _ Surrogate Key
	--Tipo para SK entero: Surrogate Key
	CREATE TYPE [UDT_SK] FROM INT
	GO

	--Tipo para PK entero
	CREATE TYPE [UDT_PK] FROM INT
	GO

	--Tipo para entero
	CREATE TYPE [UDT_Entero] FROM INT
	GO
	--Tipo para enteros grandes
	CREATE TYPE [UDT_Entero_grande] FROM BIGINT
	GO

--Cadenas
	--Tipo para cadenas largas
	CREATE TYPE [UDT_VarcharLargo] FROM VARCHAR(200)
	GO

	--Tipo para cadenas medianas
	CREATE TYPE [UDT_VarcharMediano] FROM VARCHAR(100)
	GO

	--Tipo para cadenas cortas
	CREATE TYPE [UDT_VarcharCorto] FROM VARCHAR(50)
	GO

	--Tipo para cadenas cortas
	CREATE TYPE [UDT_UnCaracter] FROM CHAR(1)
	GO

--Decimal

	--Tipo Decimal 9,6
	CREATE TYPE [UDT_Decimal9.6] FROM DECIMAL(9,6)
	GO

	--Tipo Decimal 7,6
	CREATE TYPE [UDT_Decimal7.6] FROM DECIMAL(7,6)
	GO

	--Tipo Decimal 6,5
	CREATE TYPE [UDT_Decimal6.5] FROM DECIMAL(6,5)
	GO

	--Tipo Decimal 5,5
	CREATE TYPE [UDT_Decimal5.5] FROM DECIMAL(5,5)
	GO

	--Tipo Decimal 5,
	CREATE TYPE [UDT_Decimal5.4] FROM DECIMAL(5,4)
	GO

	--Tipo Decimal 5,3
	CREATE TYPE [UDT_Decimal5.3] FROM DECIMAL(5,3)
	GO

	--Tipo Decimal 5,2
	CREATE TYPE [UDT_Decimal5.2] FROM DECIMAL(5,2)
	GO

	--Tipo Decimal 5,1
	CREATE TYPE [UDT_Decimal5.1] FROM DECIMAL(5,1)
	GO

	--Tipo Decimal 3,3
	CREATE TYPE [UDT_Decimal3.3] FROM DECIMAL(3,3)
	GO

	--Tipo Decimal 3,1
	CREATE TYPE [UDT_Decimal3.1] FROM DECIMAL(3,1)
	GO

	--Tipo Decimal 2,1
	CREATE TYPE [UDT_Decimal2.1] FROM DECIMAL(2,1)
	GO

--Fechas
	CREATE TYPE [UDT_Date] FROM DATE
	GO

--Schemas para separar objetos
	CREATE SCHEMA Fact
	GO

	CREATE SCHEMA Dimension
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





CREATE or alter PROCEDURE USP_FillDimDate @CurrentDate DATE = '2020-01-01', 
									 @EndDate     DATE = '2020-12-31'
	AS
		BEGIN
			SET NOCOUNT ON;
			DELETE FROM Dimension.Fecha;

			WHILE @CurrentDate < @EndDate
				BEGIN
					INSERT INTO Dimension.Fecha
					(DateKey, 
					 Date, 
					 Day, 
					 DaySuffix, 
					 Weekday, 
					 WeekDayName, 
					 WeekDayName_Short, 
					 WeekDayName_FirstLetter, 
					 DOWInMonth, 
					 DayOfYear, 
					 WeekOfMonth, 
					 WeekOfYear, 
					 Month, 
					 MonthName, 
					 MonthName_Short, 
					 MonthName_FirstLetter, 
					 Quarter, 
					 QuarterName, 
					 Year, 
					 MMYYYY, 
					 MonthYear, 
					 IsWeekend
					)
						   SELECT DateKey = YEAR(@CurrentDate) * 10000 + MONTH(@CurrentDate) * 100 + DAY(@CurrentDate), 
								  DATE = @CurrentDate, 
								  Day = DAY(@CurrentDate), 
								  DaySuffix = CASE
													WHEN DAY(@CurrentDate) = 1
														 OR DAY(@CurrentDate) = 21
														 OR DAY(@CurrentDate) = 31
													THEN 'st'
													WHEN DAY(@CurrentDate) = 2
														 OR DAY(@CurrentDate) = 22
													THEN 'nd'
													WHEN DAY(@CurrentDate) = 3
														 OR DAY(@CurrentDate) = 23
													THEN 'rd'
													ELSE 'th'
												END, 
								  WEEKDAY = DATEPART(dw, @CurrentDate), 
								  WeekDayName = DATENAME(dw, @CurrentDate), 
								  WeekDayName_Short = UPPER(LEFT(DATENAME(dw, @CurrentDate), 3)), 
								  WeekDayName_FirstLetter = LEFT(DATENAME(dw, @CurrentDate), 1), 
								  DOWInMonth = DAY(@CurrentDate), 
								  DayOfYear = DATENAME(dy, @CurrentDate), 
								  WeekOfMonth = DATEPART(WEEK, @CurrentDate) - DATEPART(WEEK, DATEADD(MM, DATEDIFF(MM, 0, @CurrentDate), 0)) + 1, 
								  WeekOfYear = DATEPART(wk, @CurrentDate), 
								  Month = MONTH(@CurrentDate), 
								  MonthName = DATENAME(mm, @CurrentDate), 
								  MonthName_Short = UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)), 
								  MonthName_FirstLetter = LEFT(DATENAME(mm, @CurrentDate), 1), 
								  Quarter = DATEPART(q, @CurrentDate), 
								  QuarterName = CASE
													  WHEN DATENAME(qq, @CurrentDate) = 1
													  THEN 'First'
													  WHEN DATENAME(qq, @CurrentDate) = 2
													  THEN 'second'
													  WHEN DATENAME(qq, @CurrentDate) = 3
													  THEN 'third'
													  WHEN DATENAME(qq, @CurrentDate) = 4
													  THEN 'fourth'
												  END, 
								  Year = YEAR(@CurrentDate), 
								  MMYYYY = RIGHT('0' + CAST(MONTH(@CurrentDate) AS VARCHAR(2)), 2) + CAST(YEAR(@CurrentDate) AS VARCHAR(4)), 
								  MonthYear = CAST(YEAR(@CurrentDate) AS VARCHAR(4)) + UPPER(LEFT(DATENAME(mm, @CurrentDate), 3)), 
								  IsWeekend = CASE
													WHEN DATENAME(dw, @CurrentDate) = 'Sunday'
														 OR DATENAME(dw, @CurrentDate) = 'Saturday'
													THEN 1
													ELSE 0
												END     ;
					SET @CurrentDate = DATEADD(DD, 1, @CurrentDate);
				END;
		END;
	GO

	
	--Insert Dimensiones fechas
	EXEC USP_FillDimDate
	GO


--Insert Dimension Demographics
insert into Dimension.Demographics
select 
	[key],
	isnull(CAST([Population] as bigint ),0) as [Population],
	isnull(CAST(population_male AS bigint),0) as population_male,
	isnull(CAST(population_female AS bigint),0) as population_female,
	isnull(CAST(rural_population AS bigint),0) as rural_population,
	isnull(CAST(urban_population AS bigint),0) as urban_population,
	isnull(CAST(largest_city_population AS bigint),0) as largest_city_population,
	isnull(CAST(clustered_population AS bigint),0) as clustered_population,
	population_density,	human_development_index,
	isnull(CAST(population_age_00_09 as bigint),0) as population_age_00_09,
	isnull(CAST(population_age_10_19 AS bigint),0) as population_age_10_19,
	isnull(CAST(population_age_20_29 AS bigint),0) as population_age_20_29,
	isnull(CAST(population_age_30_39 AS bigint),0) as population_age_30_39,
	isnull(CAST(population_age_40_49 AS bigint),0) as population_age_40_49,
	isnull(CAST(population_age_50_59 AS bigint),0) as population_age_50_59,
	isnull(CAST(population_age_60_69 AS bigint),0) as population_age_60_69,
	isnull(CAST(population_age_70_79 AS bigint),0) as population_age_70_79,
	isnull(CAST(population_age_80_89 AS bigint),0) as population_age_80_89,
	isnull(CAST(population_age_90_99 AS bigint),0) as population_age_90_99,	
	isnull(CAST(population_age_80_and_older AS bigint),0) as population_age_80_and_older ,		
	cast([date] as date) as ID_Demographics,
	cast('2014-01-01' as datetime) as FechaInicioValidez,null AS FechaFinValidez,GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,GETDATE() AS FechaModificacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioModificacion,'2-ETL' as ID_Batch,'Demographics' as ID_SourceSystem
	from COVID_GRUPO1.dbo.Main
	GO		

--Insert Dimension Economy
 insert into Dimension.Economy
 select
 	[key],
	ISNULL(CAST(gdp as bigint),0) as gdp,
	ISNULL(CAST(gdp_per_capita as bigint),0) as gdp_per_capita,			
	case when human_capital_index = null or human_capital_index = '' then 0
	else CAST(human_capital_index as DECIMAL(5,2)) end as human_capital_index,
	cast([date] as date) as ID_Economy,
	cast('2015-01-01' as datetime) as FechaInicioValidez,null AS FechaFinValidez,GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,GETDATE() AS FechaModificacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioModificacion,'2-ETL' as ID_Batch,'Economy' as ID_SourceSystem
	from COVID_GRUPO1.dbo.Main
	GO
	
--Insert Dimension Geography
insert into Dimension.[Geography] 
select
    [key],
    latitude ,Longitude,
    isnull(cast(elevation as bigint),0) as elevation,
    isnull(cast(Area as bigint),0) as Area,
    isnull(cast(rural_area as bigint),0) as rural_area,
    isnull(cast(urban_area as bigint),0) as urban_area,
    isnull(cast(open_street_maps as bigint),0) as open_street_maps,	
	country_code ,
	country_name ,
	subregion1_code,
	subregion1_name,
	subregion2_code,
	subregion2_name,
	cast([date] as date) as ID_Geography,
    cast('2016-01-01' as datetime) as FechaInicioValidez,null AS FechaFinValidez,GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,GETDATE() AS FechaModificacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioModificacion,'2-ETL' as ID_Batch,'Geography' as ID_SourceSystem
from COVID_GRUPO1.dbo.Main
GO

--Insert Dimension Health
insert into Dimension.Health
select
	[key],
	life_expectancy ,
	smoking_prevalence,diabetes_prevalence,infant_mortality_rate,adult_male_mortality_rate,
	adult_female_mortality_rate,pollution_mortality_rate,comorbidity_mortality_rate,
	hospital_beds,nurses,physicians,health_expenditure,out_of_pocket_health_expenditure,
	cast([date] as date) as ID_Health,
	cast('2017-01-01' as datetime) as FechaInicioValidez,null AS FechaFinValidez,GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,GETDATE() AS FechaModificacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioModificacion,'2-ETL' as ID_Batch,'Health' as ID_SourceSystem
from COVID_GRUPO1.dbo.Main
GO

--Insert Fact Epidemilogy
insert into Fact.Epidemilogy
select 
d.SK_Demographics,
e.SK_Economy,
g.SK_Geography,
h.SK_Health,
f.DateKey,
cast(m.[date] as date) as [date],
m.[key],
isnull(cast(m.new_confirmed as int),0) as new_confirmed,
isnull(cast(m.new_deceased as int),0) as new_deceased,
isnull(cast(m.new_recovered as int),0) as new_recovered,
isnull(cast(m.new_tested as int),0) as new_tested,
isnull(cast(m.total_confirmed as int),0) as total_confirmed,
isnull(cast(m.total_deceased as int),0) as total_deceased,
isnull(cast(m.total_tested as int),0) as total_tested,
isnull( cast(new_hospitalized as int),0) as new_hospitalized,
isnull( cast(new_intensive_care as int),0) as new_intensive_care,
isnull( cast(new_ventilator as int),0) as new_ventilator,
isnull( cast(total_hospitalized as int),0) as total_hospitalized,
isnull( cast(total_intensive_care as int),0) as total_intensive_care,
isnull( cast(total_ventilator as int),0) as total_ventilator,
isnull( cast(current_hospitalized as int),0) as current_hospitalized,
isnull( cast(current_intensive_care as int),0) as current_intensive_care,
isnull( cast(current_ventilator as int),0) as current_ventilator,
GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,NULL AS FechaModificacion,NULL AS UsuarioModificacion,null as ID_Batch,'Epidemilogy' as ID_SourceSystem
from 
COVID_GRUPO1.dbo.Main m
INNER JOIN Dimension.Demographics d on (m.[key] = d.[key] and m.[Date] = d.ID_Demographics)
INNER JOIN Dimension.Economy e on (m.[key] = e.[key] and m.[Date] = e.ID_Economy)
INNER JOIN Dimension.[Geography] g on (m.[key] = g.[key] and m.[Date] = g.ID_Geography)
INNER JOIN Dimension.Health h on (m.[key] = h.[key] and m.[Date] = h.ID_Health)
LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(m.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(m.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(m.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey);
GO

--Insert Fact Sex
insert into Fact.Sex
select
d.SK_Demographics,
e.SK_Economy,
g.SK_Geography,
h.SK_Health,
f.DateKey,
cast(s.[date] as date) as 'date',s.[key],
isnull( CAST(s.new_confirmed_male AS INT),0) as new_confirmed_male,isnull( CAST(s.new_confirmed_female AS INT),0) as new_confirmed_female,isnull( CAST(s.total_confirmed_male AS INT),0) as total_confirmed_male,isnull( CAST(s.total_confirmed_female AS INT),0) as total_confirmed_female,isnull( CAST(s.new_deceased_male AS INT),0) as new_deceased_male,isnull( CAST(s.new_deceased_female AS INT),0) as new_deceased_female,isnull( CAST(s.total_deceased_male AS INT),0) as total_deceased_male, isnull( CAST(s.total_deceased_female AS INT),0) as  total_deceased_female,isnull( CAST(s.new_recovered_male AS INT),0) as new_recovered_male,isnull( CAST(s.new_recovered_female AS INT),0) as new_recovered_female,isnull( CAST(s.total_recovered_male AS INT),0) as total_recovered_male,isnull( CAST(s.total_recovered_female AS INT),0) as total_recovered_female,isnull( CAST(s.new_tested_male AS INT),0) as new_tested_male,isnull( CAST(s.new_tested_female AS INT),0) as new_tested_female,isnull( CAST(s.total_tested_male AS INT),0) as total_tested_male,isnull( CAST(s.total_tested_female AS INT),0) total_tested_female,isnull( CAST(s.new_hospitalized_male AS INT),0) new_hospitalized_male,isnull( CAST(s.new_hospitalized_female AS INT),0) new_hospitalized_female,isnull( CAST(s.total_hospitalized_male AS INT),0) total_hospitalized_male,isnull( CAST(s.total_hospitalized_female AS INT),0) total_hospitalized_female,isnull( CAST(s.current_hospitalized_male AS INT),0) as current_hospitalized_male,isnull( CAST(s.current_hospitalized_female AS INT),0) as current_hospitalized_female,isnull( CAST(s.new_intensive_care_male AS INT),0) as new_intensive_care_male,isnull( CAST(s.new_intensive_care_female AS INT),0) as new_intensive_care_female,isnull( CAST(s.total_intensive_care_male AS INT),0) as total_intensive_care_male,isnull( CAST(s.total_intensive_care_female AS INT),0) as total_intensive_care_female,isnull( CAST(s.current_intensive_care_male AS INT),0) as current_intensive_care_male,isnull( CAST(s.current_intensive_care_female AS INT),0) as current_intensive_care_female,isnull( CAST(s.new_ventilator_male AS INT),0) as new_ventilator_male,isnull( CAST(s.new_ventilator_female AS INT),0) as new_ventilator_female,isnull( CAST(s.total_ventilator_male AS INT),0) as total_ventilator_male,isnull( CAST(s.total_ventilator_female AS INT),0) as total_ventilator_female,isnull( CAST(s.current_ventilator_male AS INT),0) as current_ventilator_male,isnull( CAST(s.current_ventilator_female AS INT),0) as current_ventilator_female,   
GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,NULL AS FechaModificacion,NULL AS UsuarioModificacion,null as ID_Batch,'sex' as ID_SourceSystem
from COVID_GRUPO1.dbo.sex s
INNER JOIN Dimension.Demographics d on (s.[key] = d.[key] and s.[date] = d.id_demographics)
INNER JOIN Dimension.Economy e on (s.[key] = e.[key] and s.[date] =e.id_Economy)
INNER JOIN Dimension.[Geography] g on (s.[key] = g.[key] and s.[date] =g.id_Geography)
INNER JOIN Dimension.Health h on (s.[key] = h.[key] and s.[date] = h.id_Health)
LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(s.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(s.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(s.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey);
GO
	
--Insert Fact Age
insert into Fact.Age
select
d.SK_Demographics,
e.SK_Economy,
g.SK_Geography,
h.SK_Health,
f.DateKey,
 cast(a.[date] as date) as'date',a.[key] ,
  isnull( cast( a.new_confirmed_age_00  AS int),0) as new_confirmed_age_00,isnull( cast( a.new_confirmed_age_01 AS int),0)as new_confirmed_age_01 ,isnull( cast( a.new_confirmed_age_02  AS int),0)as new_confirmed_age_02,isnull( cast( a.new_confirmed_age_03 AS int),0) as new_confirmed_age_03 ,isnull( cast( a.new_confirmed_age_04 AS int),0)as new_confirmed_age_04 ,isnull( cast( a.new_confirmed_age_05 AS int),0) as new_confirmed_age_05 ,isnull( cast( a.new_confirmed_age_06  AS int),0) as new_confirmed_age_06
,isnull( cast( a.new_confirmed_age_07 AS int),0) as new_confirmed_age_07 ,isnull( cast( a.new_confirmed_age_08 AS int),0) as new_confirmed_age_08 ,isnull( cast( a.new_confirmed_age_09 AS int),0) as new_confirmed_age_09 ,isnull( cast( a.total_confirmed_age_00 AS int),0) as  total_confirmed_age_00 ,isnull( cast( a.total_confirmed_age_01 AS int),0)  as total_confirmed_age_01,isnull( cast( a.total_confirmed_age_02  AS int),0) as total_confirmed_age_02
,isnull( cast( a.total_confirmed_age_03  AS int),0) as  total_confirmed_age_03,isnull( cast( a.total_confirmed_age_04 AS int),0) as total_confirmed_age_04 ,isnull( cast( a.total_confirmed_age_05  AS int),0) as total_confirmed_age_05,isnull( cast( a.total_confirmed_age_06 AS int),0) as total_confirmed_age_06 ,isnull( cast( a.total_confirmed_age_07  AS int),0) as total_confirmed_age_07,isnull( cast( a.total_confirmed_age_08 AS int),0) as total_confirmed_age_08
,isnull( cast( a.total_confirmed_age_09 AS int),0) as total_confirmed_age_09 ,isnull( cast( a.new_deceased_age_00 AS int),0)as new_deceased_age_00 ,isnull( cast( a.new_deceased_age_01 AS int),0) as new_deceased_age_01 ,isnull( cast( a.new_deceased_age_02 AS int),0) as new_deceased_age_02,isnull( cast( a.new_deceased_age_03 AS int),0) as new_deceased_age_03,isnull( cast( a.new_deceased_age_04 AS int),0)as new_deceased_age_04
,isnull( cast( a.new_deceased_age_05 AS int),0)as new_deceased_age_05 ,isnull( cast( a.new_deceased_age_06 AS int),0)as new_deceased_age_06 ,isnull( cast( a.new_deceased_age_07 AS int),0) as new_deceased_age_07 ,isnull( cast( a.new_deceased_age_08 AS int),0) as new_deceased_age_08 ,isnull( cast( a.new_deceased_age_09 AS int),0) as new_deceased_age_09 ,isnull( cast( a.total_deceased_age_00 AS int),0)as total_deceased_age_00  ,isnull( cast( a.total_deceased_age_01 AS int),0) as total_deceased_age_01
,isnull( cast( a.total_deceased_age_02 AS int),0) as total_deceased_age_02  ,isnull( cast( a.total_deceased_age_03 AS int),0)total_deceased_age_03 ,isnull( cast( a.total_deceased_age_04 AS int),0) as total_deceased_age_04 ,isnull( cast( a.total_deceased_age_05 AS int),0) as total_deceased_age_05 ,isnull( cast( a.total_deceased_age_06 AS int),0)as total_deceased_age_06 ,isnull( cast( a.total_deceased_age_07 AS int),0) as total_deceased_age_07
,isnull( cast( a.total_deceased_age_08 AS int),0) as total_deceased_age_08 ,isnull( cast( a.total_deceased_age_09 AS int),0) as total_deceased_age_09 ,isnull( cast( a.new_recovered_age_00 AS int),0) as new_recovered_age_00 ,isnull( cast( a.new_recovered_age_01 AS int),0) new_recovered_age_01,isnull( cast( a.new_recovered_age_02 AS int),0) as new_recovered_age_02 ,isnull( cast( a.new_recovered_age_03 AS int),0) as new_recovered_age_03 ,isnull( cast( a.new_recovered_age_04  AS int),0)as new_recovered_age_04
,isnull( cast( a.new_recovered_age_05 AS int),0) as new_recovered_age_05 ,isnull( cast( a.new_recovered_age_06 AS int),0) as new_recovered_age_06 ,isnull( cast( a.new_recovered_age_07 AS int),0) as new_recovered_age_07 ,isnull( cast( a.new_recovered_age_08 AS int),0) as new_recovered_age_08,isnull( cast( a.new_recovered_age_09 AS int),0) as new_recovered_age_09 ,isnull( cast( a.total_recovered_age_00 AS int),0) as total_recovered_age_00 ,isnull( cast( a.total_recovered_age_01 AS int),0) as total_recovered_age_01
,isnull( cast( a.total_recovered_age_02 AS int),0) as total_recovered_age_02,isnull( cast( a.total_recovered_age_03 AS int),0)as total_recovered_age_03 ,isnull( cast( a.total_recovered_age_04  AS int),0)as total_recovered_age_04,isnull( cast( a.total_recovered_age_05 AS int),0)as total_recovered_age_05 ,isnull( cast( a.total_recovered_age_06 AS int),0) as total_recovered_age_06 ,isnull( cast( a.total_recovered_age_07 AS int),0) as total_recovered_age_07
,isnull( cast( a.total_recovered_age_08 AS int),0)as total_recovered_age_08 ,isnull( cast( a.total_recovered_age_09 AS int),0) as total_recovered_age_09,isnull( cast( a.new_tested_age_00 AS int),0)as new_tested_age_00 ,isnull( cast( a.new_tested_age_01 AS int),0)as new_tested_age_01 ,isnull( cast( a.new_tested_age_02 AS int),0) as new_tested_age_02 ,isnull( cast( a.new_tested_age_03 AS int),0) as new_tested_age_03 ,isnull( cast( a.new_tested_age_04 AS int),0)as new_tested_age_04 ,
isnull( cast( a.new_tested_age_05 AS int),0) as new_tested_age_05,isnull( cast( a.new_tested_age_06 AS int),0) as new_tested_age_06 ,isnull( cast( a.new_tested_age_07 AS int),0)as new_tested_age_07 ,isnull( cast( a.new_tested_age_08 AS int),0)as new_tested_age_08 ,isnull( cast( a.new_tested_age_09 AS int),0) as new_tested_age_09,isnull( cast( a.total_tested_age_00 AS int),0) as total_tested_age_00 ,isnull( cast( a.total_tested_age_01 AS int),0) as  total_tested_age_01
,isnull( cast( a.total_tested_age_02 AS int),0) as total_tested_age_02 ,isnull( cast( a.total_tested_age_03 AS int),0) as total_tested_age_03,isnull( cast( a.total_tested_age_04 AS int),0) as total_tested_age_04 ,isnull( cast( a.total_tested_age_05 AS int),0) as total_tested_age_05,isnull( cast( a.total_tested_age_06 AS int),0)  as total_tested_age_06,isnull( cast( a.total_tested_age_07 AS int),0) as total_tested_age_07,isnull( cast( a.total_tested_age_08 AS int),0) as total_tested_age_08
,isnull( cast( a.total_tested_age_09 AS int),0) as total_tested_age_09,isnull( cast( a.new_hospitalized_age_00 AS int),0) as new_hospitalized_age_00,isnull( cast( a.new_hospitalized_age_01 AS int),0) as  new_hospitalized_age_01,isnull( cast( a.new_hospitalized_age_02 AS int),0) as new_hospitalized_age_02,isnull( cast( a.new_hospitalized_age_03 AS int),0) as new_hospitalized_age_03,isnull( cast( a.new_hospitalized_age_04 AS int),0) new_hospitalized_age_04,
isnull( cast( a.new_hospitalized_age_05 AS int),0) as new_hospitalized_age_05,isnull( cast( a.new_hospitalized_age_06 AS int),0) as new_hospitalized_age_06,isnull( cast( a.new_hospitalized_age_07 AS int),0) as new_hospitalized_age_07,isnull( cast( a.new_hospitalized_age_08 AS int),0) as new_hospitalized_age_08,isnull( cast( a.new_hospitalized_age_09 AS int),0) as new_hospitalized_age_09,isnull( cast( a.total_hospitalized_age_00 AS int),0) as total_hospitalized_age_00
,isnull( cast( a.total_hospitalized_age_01  AS int),0) as total_hospitalized_age_01,isnull( cast( a.total_hospitalized_age_02 AS int),0) as total_hospitalized_age_02,isnull( cast( a.total_hospitalized_age_03 AS int),0) as total_hospitalized_age_03,isnull( cast( a.total_hospitalized_age_04 AS int),0) as total_hospitalized_age_04,isnull( cast( a.total_hospitalized_age_05 AS int),0) as total_hospitalized_age_05
,isnull( cast( a.total_hospitalized_age_06 AS int),0) as total_hospitalized_age_06,isnull( cast( a.total_hospitalized_age_07 AS int),0) as total_hospitalized_age_07,isnull( cast( a.total_hospitalized_age_08 AS int),0) as total_hospitalized_age_08,isnull( cast( a.total_hospitalized_age_09 AS int),0) as total_hospitalized_age_09,isnull( cast( a.current_hospitalized_age_00 AS int),0) as current_hospitalized_age_00,isnull( cast( a.current_hospitalized_age_01 AS int),0) as current_hospitalized_age_01
,isnull( cast( a.current_hospitalized_age_02 AS int),0) as current_hospitalized_age_02, isnull( cast( a.current_hospitalized_age_03 AS int),0) as current_hospitalized_age_03,isnull( cast( a.current_hospitalized_age_04 AS int),0) as current_hospitalized_age_04,isnull( cast( a.current_hospitalized_age_05 AS int),0) as current_hospitalized_age_05 ,isnull( cast( a.current_hospitalized_age_06 AS int),0) as current_hospitalized_age_06,isnull( cast( a.current_hospitalized_age_07 AS int),0) as current_hospitalized_age_07
,isnull( cast( a.current_hospitalized_age_08 AS int),0) as current_hospitalized_age_08,isnull( cast( a.current_hospitalized_age_09 AS int),0) as current_hospitalized_age_09,isnull( cast( a.new_intensive_care_age_00 AS int),0) as new_intensive_care_age_00, isnull( cast( a.new_intensive_care_age_01 AS int),0) as new_intensive_care_age_01,isnull( cast( a.new_intensive_care_age_02 AS int),0) as new_intensive_care_age_02,isnull( cast( a.new_intensive_care_age_03 AS int),0) as new_intensive_care_age_03,
isnull( cast( a.new_intensive_care_age_04 AS int),0) as new_intensive_care_age_04,isnull( cast( a.new_intensive_care_age_05 AS int),0) as new_intensive_care_age_05,isnull( cast( a.new_intensive_care_age_06 AS int),0) as new_intensive_care_age_06,isnull( cast( a.new_intensive_care_age_07 AS int),0) as new_intensive_care_age_07,isnull( cast( a.new_intensive_care_age_08 AS int),0) as new_intensive_care_age_08,isnull( cast( a.new_intensive_care_age_09 AS int),0) as new_intensive_care_age_09,
isnull( cast( a.total_intensive_care_age_00 AS int),0) as total_intensive_care_age_00,isnull( cast( a.total_intensive_care_age_01 AS int),0) as total_intensive_care_age_01,isnull( cast( a.total_intensive_care_age_02 AS int),0) as total_intensive_care_age_02,isnull( cast( a.total_intensive_care_age_03 AS int),0) as total_intensive_care_age_03,isnull( cast( a.total_intensive_care_age_04 AS int),0) as total_intensive_care_age_04,isnull( cast( a.total_intensive_care_age_05 AS int),0) as total_intensive_care_age_05
,isnull( cast( a.total_intensive_care_age_06 AS int),0) as total_intensive_care_age_06,isnull( cast( a.total_intensive_care_age_07 AS int),0) as total_intensive_care_age_07,isnull( cast( a.total_intensive_care_age_08 AS int),0) as total_intensive_care_age_08,isnull( cast( a.total_intensive_care_age_09 AS int),0) as total_intensive_care_age_09,isnull( cast( a.current_intensive_care_age_00 AS int),0) as current_intensive_care_age_00,isnull( cast( a.current_intensive_care_age_01 AS int),0) as current_intensive_care_age_01,
isnull( cast( a.current_intensive_care_age_02 AS int),0) as current_intensive_care_age_02,isnull( cast( a.current_intensive_care_age_03 AS int),0) as current_intensive_care_age_03,isnull( cast( a.current_intensive_care_age_04 AS int),0) as current_intensive_care_age_04,isnull( cast( a.current_intensive_care_age_05 AS int),0) as current_intensive_care_age_05,isnull( cast( a.current_intensive_care_age_06 AS int),0) as current_intensive_care_age_06
,isnull( cast( a.current_intensive_care_age_07 AS int),0) as current_intensive_care_age_07 ,isnull( cast( a.current_intensive_care_age_08 AS int),0) as current_intensive_care_age_08,isnull( cast( a.current_intensive_care_age_09 AS int),0) as current_intensive_care_age_09,isnull( cast( a.new_ventilator_age_00 AS int),0) as new_ventilator_age_00,isnull( cast( a.new_ventilator_age_01 AS int),0) as new_ventilator_age_01 ,isnull( cast( a.new_ventilator_age_02 AS int),0) as new_ventilator_age_02,
isnull( cast( a.new_ventilator_age_03 AS int),0) as new_ventilator_age_03,isnull( cast( a.new_ventilator_age_04 AS int),0) as new_ventilator_age_04,isnull( cast( a.new_ventilator_age_05 AS int),0) as  new_ventilator_age_05,isnull( cast( a.new_ventilator_age_06 AS int),0) as new_ventilator_age_06,isnull( cast( a.new_ventilator_age_07 AS int),0) as new_ventilator_age_07,isnull( cast( a.new_ventilator_age_08 AS int),0) as new_ventilator_age_08,isnull( cast( a.new_ventilator_age_09 AS int),0) as new_ventilator_age_09,
isnull( cast( a.total_ventilator_age_00 AS int),0) as total_ventilator_age_00,isnull( cast( a.total_ventilator_age_01 AS int),0) as total_ventilator_age_01,isnull( cast( a.total_ventilator_age_02 AS int),0) as total_ventilator_age_02,isnull( cast( a.total_ventilator_age_03 AS int),0) as total_ventilator_age_03,isnull( cast( a.total_ventilator_age_04 AS int),0) as total_ventilator_age_04,isnull( cast( a.total_ventilator_age_05 AS int),0) as total_ventilator_age_05,
isnull( cast( a.total_ventilator_age_06 AS int),0) as total_ventilator_age_06,isnull( cast( a.total_ventilator_age_07 AS int),0) as total_ventilator_age_07,isnull( cast( a.total_ventilator_age_08 AS int),0) as total_ventilator_age_08,isnull( cast( a.total_ventilator_age_09 AS int),0) as total_ventilator_age_09,isnull( cast( a.current_ventilator_age_00 AS int),0) current_ventilator_age_00 ,isnull( cast( a.current_ventilator_age_01 AS int),0) as current_ventilator_age_01
,isnull( cast( a.current_ventilator_age_02 AS int),0) as current_ventilator_age_02,isnull( cast( a.current_ventilator_age_03 AS int),0) as current_ventilator_age_03,isnull( cast( a.current_ventilator_age_04 AS int),0) as current_ventilator_age_04,isnull( cast( a.current_ventilator_age_05 AS int),0) as current_ventilator_age_05,isnull( cast( a.current_ventilator_age_06 AS int),0) as current_ventilator_age_06,isnull( cast( a.current_ventilator_age_07 AS int),0) as current_ventilator_age_07 ,
isnull( cast( a.current_ventilator_age_08 AS int),0) as current_ventilator_age_08,isnull( cast( a.current_ventilator_age_09 AS int),0) as current_ventilator_age_09,isnull(age_bin_00,'0') as age_bin_00,isnull(a.age_bin_01 ,'0') as age_bin_01,isnull(a.age_bin_02 ,'0') as age_bin_02,isnull(a.age_bin_03 ,'0') as age_bin_03,isnull(a.age_bin_04 ,'0') as age_bin_04,isnull(a.age_bin_05 ,'0') as age_bin_05,isnull(a.age_bin_06 ,'0') as age_bin_06,
isnull(a.age_bin_07 ,'0') as age_bin_07,isnull(  age_bin_08 ,'0') as age_bin_08,isnull(a.age_bin_09 ,'0') as age_bin_09,
GETDATE() AS FechaCreacion,CAST(SUSER_NAME() AS varchar(100)) AS UsuarioCreacion,NULL AS FechaModificacion,NULL AS UsuarioModificacion,null as ID_Batch,'Age' as ID_SourceSystem
from 
COVID_GRUPO1.dbo.age a
INNER JOIN Dimension.Demographics d on (a.[key] = d.[key] and a.[date] = d.id_demographics)
INNER JOIN Dimension.Economy e on (a.[key] = e.[key] and a.[date] =e.id_Economy)
INNER JOIN Dimension.[Geography] g on (a.[key] = g.[key] and a.[date] =g.id_Geography)
INNER JOIN Dimension.Health h on (a.[key] = h.[key] and a.[date] = h.id_Health)
LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(a.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(a.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(a.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey);
go


--#########################################################################  STAGING & FACT.LOG   ###########################################################################################
USE COVID_GRUPO1_DWH
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

--Actualizamos nuestra columna de ID_batch para nuestras tablas de hechos.
update Fact.Epidemilogy
set ID_Batch = newid()
go  

update Fact.Sex
set ID_Batch = newid()
go  

update Fact.Age
set ID_Batch = newid()
go  

--Insertamos el entry en factlog para el registro que ya existe
insert into FactLog_Epidemilogy select ID_BATCH, GETDATE(), 1 from fact.Epidemilogy
go

insert into FactLog_Age select ID_BATCH, GETDATE(), 1 from fact.Age
go

insert into FactLog_Sex select ID_BATCH, GETDATE(), 1 from fact.Sex
go

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

create schema [staging]
go

DROP TABLE IF EXISTS [staging].[Epidemilogy]
GO

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
----Query para llenar datos en Staging [Epidemilogy]
--SELECT 
--cast(m.[date] as date) as [date],
--m.[key],
--isnull(cast(m.new_confirmed as int),0) as new_confirmed,
--isnull(cast(m.new_deceased as int),0) as new_deceased,
--isnull(cast(m.new_recovered as int),0) as new_recovered,
--isnull(cast(m.new_tested as int),0) as new_tested,
--isnull(cast(m.total_confirmed as int),0) as total_confirmed,
--isnull(cast(m.total_deceased as int),0) as total_deceased,
--isnull(cast(m.total_tested as int),0) as total_tested,
--isnull( cast(new_hospitalized as int),0) as new_hospitalized,
--isnull( cast(new_intensive_care as int),0) as new_intensive_care,
--isnull( cast(new_ventilator as int),0) as new_ventilator,
--isnull( cast(total_hospitalized as int),0) as total_hospitalized,
--isnull( cast(total_intensive_care as int),0) as total_intensive_care,
--isnull( cast(total_ventilator as int),0) as total_ventilator,
--isnull( cast(current_hospitalized as int),0) as current_hospitalized,
--isnull( cast(current_intensive_care as int),0) as current_intensive_care,
--isnull( cast(current_ventilator as int),0) as current_ventilator
--FROM COVID_GRUPO1.dbo.Main m
--GO



----Query para llenar datos en Staging [Age]
--select 
--cast(a.[date] as date) as'date',a.[key] ,
--  isnull( cast( a.new_confirmed_age_00  AS int),0) as new_confirmed_age_00,isnull( cast( a.new_confirmed_age_01 AS int),0)as new_confirmed_age_01 ,isnull( cast( a.new_confirmed_age_02  AS int),0)as new_confirmed_age_02,isnull( cast( a.new_confirmed_age_03 AS int),0) as new_confirmed_age_03 ,isnull( cast( a.new_confirmed_age_04 AS int),0)as new_confirmed_age_04 ,isnull( cast( a.new_confirmed_age_05 AS int),0) as new_confirmed_age_05 ,isnull( cast( a.new_confirmed_age_06  AS int),0) as new_confirmed_age_06
--,isnull( cast( a.new_confirmed_age_07 AS int),0) as new_confirmed_age_07 ,isnull( cast( a.new_confirmed_age_08 AS int),0) as new_confirmed_age_08 ,isnull( cast( a.new_confirmed_age_09 AS int),0) as new_confirmed_age_09 ,isnull( cast( a.total_confirmed_age_00 AS int),0) as  total_confirmed_age_00 ,isnull( cast( a.total_confirmed_age_01 AS int),0)  as total_confirmed_age_01,isnull( cast( a.total_confirmed_age_02  AS int),0) as total_confirmed_age_02
--,isnull( cast( a.total_confirmed_age_03  AS int),0) as  total_confirmed_age_03,isnull( cast( a.total_confirmed_age_04 AS int),0) as total_confirmed_age_04 ,isnull( cast( a.total_confirmed_age_05  AS int),0) as total_confirmed_age_05,isnull( cast( a.total_confirmed_age_06 AS int),0) as total_confirmed_age_06 ,isnull( cast( a.total_confirmed_age_07  AS int),0) as total_confirmed_age_07,isnull( cast( a.total_confirmed_age_08 AS int),0) as total_confirmed_age_08
--,isnull( cast( a.total_confirmed_age_09 AS int),0) as total_confirmed_age_09 ,isnull( cast( a.new_deceased_age_00 AS int),0)as new_deceased_age_00 ,isnull( cast( a.new_deceased_age_01 AS int),0) as new_deceased_age_01 ,isnull( cast( a.new_deceased_age_02 AS int),0) as new_deceased_age_02,isnull( cast( a.new_deceased_age_03 AS int),0) as new_deceased_age_03,isnull( cast( a.new_deceased_age_04 AS int),0)as new_deceased_age_04
--,isnull( cast( a.new_deceased_age_05 AS int),0)as new_deceased_age_05 ,isnull( cast( a.new_deceased_age_06 AS int),0)as new_deceased_age_06 ,isnull( cast( a.new_deceased_age_07 AS int),0) as new_deceased_age_07 ,isnull( cast( a.new_deceased_age_08 AS int),0) as new_deceased_age_08 ,isnull( cast( a.new_deceased_age_09 AS int),0) as new_deceased_age_09 ,isnull( cast( a.total_deceased_age_00 AS int),0)as total_deceased_age_00  ,isnull( cast( a.total_deceased_age_01 AS int),0) as total_deceased_age_01
--,isnull( cast( a.total_deceased_age_02 AS int),0) as total_deceased_age_02  ,isnull( cast( a.total_deceased_age_03 AS int),0)total_deceased_age_03 ,isnull( cast( a.total_deceased_age_04 AS int),0) as total_deceased_age_04 ,isnull( cast( a.total_deceased_age_05 AS int),0) as total_deceased_age_05 ,isnull( cast( a.total_deceased_age_06 AS int),0)as total_deceased_age_06 ,isnull( cast( a.total_deceased_age_07 AS int),0) as total_deceased_age_07
--,isnull( cast( a.total_deceased_age_08 AS int),0) as total_deceased_age_08 ,isnull( cast( a.total_deceased_age_09 AS int),0) as total_deceased_age_09 ,isnull( cast( a.new_recovered_age_00 AS int),0) as new_recovered_age_00 ,isnull( cast( a.new_recovered_age_01 AS int),0) new_recovered_age_01,isnull( cast( a.new_recovered_age_02 AS int),0) as new_recovered_age_02 ,isnull( cast( a.new_recovered_age_03 AS int),0) as new_recovered_age_03 ,isnull( cast( a.new_recovered_age_04  AS int),0)as new_recovered_age_04
--,isnull( cast( a.new_recovered_age_05 AS int),0) as new_recovered_age_05 ,isnull( cast( a.new_recovered_age_06 AS int),0) as new_recovered_age_06 ,isnull( cast( a.new_recovered_age_07 AS int),0) as new_recovered_age_07 ,isnull( cast( a.new_recovered_age_08 AS int),0) as new_recovered_age_08,isnull( cast( a.new_recovered_age_09 AS int),0) as new_recovered_age_09 ,isnull( cast( a.total_recovered_age_00 AS int),0) as total_recovered_age_00 ,isnull( cast( a.total_recovered_age_01 AS int),0) as total_recovered_age_01
--,isnull( cast( a.total_recovered_age_02 AS int),0) as total_recovered_age_02,isnull( cast( a.total_recovered_age_03 AS int),0)as total_recovered_age_03 ,isnull( cast( a.total_recovered_age_04  AS int),0)as total_recovered_age_04,isnull( cast( a.total_recovered_age_05 AS int),0)as total_recovered_age_05 ,isnull( cast( a.total_recovered_age_06 AS int),0) as total_recovered_age_06 ,isnull( cast( a.total_recovered_age_07 AS int),0) as total_recovered_age_07
--,isnull( cast( a.total_recovered_age_08 AS int),0)as total_recovered_age_08 ,isnull( cast( a.total_recovered_age_09 AS int),0) as total_recovered_age_09,isnull( cast( a.new_tested_age_00 AS int),0)as new_tested_age_00 ,isnull( cast( a.new_tested_age_01 AS int),0)as new_tested_age_01 ,isnull( cast( a.new_tested_age_02 AS int),0) as new_tested_age_02 ,isnull( cast( a.new_tested_age_03 AS int),0) as new_tested_age_03 ,isnull( cast( a.new_tested_age_04 AS int),0)as new_tested_age_04 ,
--isnull( cast( a.new_tested_age_05 AS int),0) as new_tested_age_05,isnull( cast( a.new_tested_age_06 AS int),0) as new_tested_age_06 ,isnull( cast( a.new_tested_age_07 AS int),0)as new_tested_age_07 ,isnull( cast( a.new_tested_age_08 AS int),0)as new_tested_age_08 ,isnull( cast( a.new_tested_age_09 AS int),0) as new_tested_age_09,isnull( cast( a.total_tested_age_00 AS int),0) as total_tested_age_00 ,isnull( cast( a.total_tested_age_01 AS int),0) as  total_tested_age_01
--,isnull( cast( a.total_tested_age_02 AS int),0) as total_tested_age_02 ,isnull( cast( a.total_tested_age_03 AS int),0) as total_tested_age_03,isnull( cast( a.total_tested_age_04 AS int),0) as total_tested_age_04 ,isnull( cast( a.total_tested_age_05 AS int),0) as total_tested_age_05,isnull( cast( a.total_tested_age_06 AS int),0)  as total_tested_age_06,isnull( cast( a.total_tested_age_07 AS int),0) as total_tested_age_07,isnull( cast( a.total_tested_age_08 AS int),0) as total_tested_age_08
--,isnull( cast( a.total_tested_age_09 AS int),0) as total_tested_age_09,isnull( cast( a.new_hospitalized_age_00 AS int),0) as new_hospitalized_age_00,isnull( cast( a.new_hospitalized_age_01 AS int),0) as  new_hospitalized_age_01,isnull( cast( a.new_hospitalized_age_02 AS int),0) as new_hospitalized_age_02,isnull( cast( a.new_hospitalized_age_03 AS int),0) as new_hospitalized_age_03,isnull( cast( a.new_hospitalized_age_04 AS int),0) new_hospitalized_age_04,
--isnull( cast( a.new_hospitalized_age_05 AS int),0) as new_hospitalized_age_05,isnull( cast( a.new_hospitalized_age_06 AS int),0) as new_hospitalized_age_06,isnull( cast( a.new_hospitalized_age_07 AS int),0) as new_hospitalized_age_07,isnull( cast( a.new_hospitalized_age_08 AS int),0) as new_hospitalized_age_08,isnull( cast( a.new_hospitalized_age_09 AS int),0) as new_hospitalized_age_09,isnull( cast( a.total_hospitalized_age_00 AS int),0) as total_hospitalized_age_00
--,isnull( cast( a.total_hospitalized_age_01  AS int),0) as total_hospitalized_age_01,isnull( cast( a.total_hospitalized_age_02 AS int),0) as total_hospitalized_age_02,isnull( cast( a.total_hospitalized_age_03 AS int),0) as total_hospitalized_age_03,isnull( cast( a.total_hospitalized_age_04 AS int),0) as total_hospitalized_age_04,isnull( cast( a.total_hospitalized_age_05 AS int),0) as total_hospitalized_age_05
--,isnull( cast( a.total_hospitalized_age_06 AS int),0) as total_hospitalized_age_06,isnull( cast( a.total_hospitalized_age_07 AS int),0) as total_hospitalized_age_07,isnull( cast( a.total_hospitalized_age_08 AS int),0) as total_hospitalized_age_08,isnull( cast( a.total_hospitalized_age_09 AS int),0) as total_hospitalized_age_09,isnull( cast( a.current_hospitalized_age_00 AS int),0) as current_hospitalized_age_00,isnull( cast( a.current_hospitalized_age_01 AS int),0) as current_hospitalized_age_01
--,isnull( cast( a.current_hospitalized_age_02 AS int),0) as current_hospitalized_age_02, isnull( cast( a.current_hospitalized_age_03 AS int),0) as current_hospitalized_age_03,isnull( cast( a.current_hospitalized_age_04 AS int),0) as current_hospitalized_age_04,isnull( cast( a.current_hospitalized_age_05 AS int),0) as current_hospitalized_age_05 ,isnull( cast( a.current_hospitalized_age_06 AS int),0) as current_hospitalized_age_06,isnull( cast( a.current_hospitalized_age_07 AS int),0) as current_hospitalized_age_07
--,isnull( cast( a.current_hospitalized_age_08 AS int),0) as current_hospitalized_age_08,isnull( cast( a.current_hospitalized_age_09 AS int),0) as current_hospitalized_age_09,isnull( cast( a.new_intensive_care_age_00 AS int),0) as new_intensive_care_age_00, isnull( cast( a.new_intensive_care_age_01 AS int),0) as new_intensive_care_age_01,isnull( cast( a.new_intensive_care_age_02 AS int),0) as new_intensive_care_age_02,isnull( cast( a.new_intensive_care_age_03 AS int),0) as new_intensive_care_age_03,
--isnull( cast( a.new_intensive_care_age_04 AS int),0) as new_intensive_care_age_04,isnull( cast( a.new_intensive_care_age_05 AS int),0) as new_intensive_care_age_05,isnull( cast( a.new_intensive_care_age_06 AS int),0) as new_intensive_care_age_06,isnull( cast( a.new_intensive_care_age_07 AS int),0) as new_intensive_care_age_07,isnull( cast( a.new_intensive_care_age_08 AS int),0) as new_intensive_care_age_08,isnull( cast( a.new_intensive_care_age_09 AS int),0) as new_intensive_care_age_09,
--isnull( cast( a.total_intensive_care_age_00 AS int),0) as total_intensive_care_age_00,isnull( cast( a.total_intensive_care_age_01 AS int),0) as total_intensive_care_age_01,isnull( cast( a.total_intensive_care_age_02 AS int),0) as total_intensive_care_age_02,isnull( cast( a.total_intensive_care_age_03 AS int),0) as total_intensive_care_age_03,isnull( cast( a.total_intensive_care_age_04 AS int),0) as total_intensive_care_age_04,isnull( cast( a.total_intensive_care_age_05 AS int),0) as total_intensive_care_age_05
--,isnull( cast( a.total_intensive_care_age_06 AS int),0) as total_intensive_care_age_06,isnull( cast( a.total_intensive_care_age_07 AS int),0) as total_intensive_care_age_07,isnull( cast( a.total_intensive_care_age_08 AS int),0) as total_intensive_care_age_08,isnull( cast( a.total_intensive_care_age_09 AS int),0) as total_intensive_care_age_09,isnull( cast( a.current_intensive_care_age_00 AS int),0) as current_intensive_care_age_00,isnull( cast( a.current_intensive_care_age_01 AS int),0) as current_intensive_care_age_01,
--isnull( cast( a.current_intensive_care_age_02 AS int),0) as current_intensive_care_age_02,isnull( cast( a.current_intensive_care_age_03 AS int),0) as current_intensive_care_age_03,isnull( cast( a.current_intensive_care_age_04 AS int),0) as current_intensive_care_age_04,isnull( cast( a.current_intensive_care_age_05 AS int),0) as current_intensive_care_age_05,isnull( cast( a.current_intensive_care_age_06 AS int),0) as current_intensive_care_age_06
--,isnull( cast( a.current_intensive_care_age_07 AS int),0) as current_intensive_care_age_07 ,isnull( cast( a.current_intensive_care_age_08 AS int),0) as current_intensive_care_age_08,isnull( cast( a.current_intensive_care_age_09 AS int),0) as current_intensive_care_age_09,isnull( cast( a.new_ventilator_age_00 AS int),0) as new_ventilator_age_00,isnull( cast( a.new_ventilator_age_01 AS int),0) as new_ventilator_age_01 ,isnull( cast( a.new_ventilator_age_02 AS int),0) as new_ventilator_age_02,
--isnull( cast( a.new_ventilator_age_03 AS int),0) as new_ventilator_age_03,isnull( cast( a.new_ventilator_age_04 AS int),0) as new_ventilator_age_04,isnull( cast( a.new_ventilator_age_05 AS int),0) as  new_ventilator_age_05,isnull( cast( a.new_ventilator_age_06 AS int),0) as new_ventilator_age_06,isnull( cast( a.new_ventilator_age_07 AS int),0) as new_ventilator_age_07,isnull( cast( a.new_ventilator_age_08 AS int),0) as new_ventilator_age_08,isnull( cast( a.new_ventilator_age_09 AS int),0) as new_ventilator_age_09,
--isnull( cast( a.total_ventilator_age_00 AS int),0) as total_ventilator_age_00,isnull( cast( a.total_ventilator_age_01 AS int),0) as total_ventilator_age_01,isnull( cast( a.total_ventilator_age_02 AS int),0) as total_ventilator_age_02,isnull( cast( a.total_ventilator_age_03 AS int),0) as total_ventilator_age_03,isnull( cast( a.total_ventilator_age_04 AS int),0) as total_ventilator_age_04,isnull( cast( a.total_ventilator_age_05 AS int),0) as total_ventilator_age_05,
--isnull( cast( a.total_ventilator_age_06 AS int),0) as total_ventilator_age_06,isnull( cast( a.total_ventilator_age_07 AS int),0) as total_ventilator_age_07,isnull( cast( a.total_ventilator_age_08 AS int),0) as total_ventilator_age_08,isnull( cast( a.total_ventilator_age_09 AS int),0) as total_ventilator_age_09,isnull( cast( a.current_ventilator_age_00 AS int),0) current_ventilator_age_00 ,isnull( cast( a.current_ventilator_age_01 AS int),0) as current_ventilator_age_01
--,isnull( cast( a.current_ventilator_age_02 AS int),0) as current_ventilator_age_02,isnull( cast( a.current_ventilator_age_03 AS int),0) as current_ventilator_age_03,isnull( cast( a.current_ventilator_age_04 AS int),0) as current_ventilator_age_04,isnull( cast( a.current_ventilator_age_05 AS int),0) as current_ventilator_age_05,isnull( cast( a.current_ventilator_age_06 AS int),0) as current_ventilator_age_06,isnull( cast( a.current_ventilator_age_07 AS int),0) as current_ventilator_age_07 ,
--isnull( cast( a.current_ventilator_age_08 AS int),0) as current_ventilator_age_08,isnull( cast( a.current_ventilator_age_09 AS int),0) as current_ventilator_age_09,isnull(age_bin_00,'0') as age_bin_00,isnull(a.age_bin_01 ,'0') as age_bin_01,isnull(a.age_bin_02 ,'0') as age_bin_02,isnull(a.age_bin_03 ,'0') as age_bin_03,isnull(a.age_bin_04 ,'0') as age_bin_04,isnull(a.age_bin_05 ,'0') as age_bin_05,isnull(a.age_bin_06 ,'0') as age_bin_06,
--isnull(a.age_bin_07 ,'0') as age_bin_07,isnull(  age_bin_08 ,'0') as age_bin_08,isnull(a.age_bin_09 ,'0') as age_bin_09
--from COVID_GRUPO1.dbo.Age a
--go

----Query para llenar datos en Staging [Sex]
--select
--cast(s.[date] as date) as 'date',s.[key],
--isnull( CAST(s.new_confirmed_male AS INT),0) as new_confirmed_male,isnull( CAST(s.new_confirmed_female AS INT),0) as new_confirmed_female,isnull( CAST(s.total_confirmed_male AS INT),0) as total_confirmed_male,isnull( CAST(s.total_confirmed_female AS INT),0) as total_confirmed_female,isnull( CAST(s.new_deceased_male AS INT),0) as new_deceased_male,isnull( CAST(s.new_deceased_female AS INT),0) as new_deceased_female,isnull( CAST(s.total_deceased_male AS INT),0) as total_deceased_male, isnull( CAST(s.total_deceased_female AS INT),0) as  total_deceased_female,isnull( CAST(s.new_recovered_male AS INT),0) as new_recovered_male,isnull( CAST(s.new_recovered_female AS INT),0) as new_recovered_female,isnull( CAST(s.total_recovered_male AS INT),0) as total_recovered_male,isnull( CAST(s.total_recovered_female AS INT),0) as total_recovered_female,isnull( CAST(s.new_tested_male AS INT),0) as new_tested_male,isnull( CAST(s.new_tested_female AS INT),0) as new_tested_female,isnull( CAST(s.total_tested_male AS INT),0) as total_tested_male,isnull( CAST(s.total_tested_female AS INT),0) total_tested_female,isnull( CAST(s.new_hospitalized_male AS INT),0) new_hospitalized_male,isnull( CAST(s.new_hospitalized_female AS INT),0) new_hospitalized_female,isnull( CAST(s.total_hospitalized_male AS INT),0) total_hospitalized_male,isnull( CAST(s.total_hospitalized_female AS INT),0) total_hospitalized_female,isnull( CAST(s.current_hospitalized_male AS INT),0) as current_hospitalized_male,isnull( CAST(s.current_hospitalized_female AS INT),0) as current_hospitalized_female,isnull( CAST(s.new_intensive_care_male AS INT),0) as new_intensive_care_male,isnull( CAST(s.new_intensive_care_female AS INT),0) as new_intensive_care_female,isnull( CAST(s.total_intensive_care_male AS INT),0) as total_intensive_care_male,isnull( CAST(s.total_intensive_care_female AS INT),0) as total_intensive_care_female,isnull( CAST(s.current_intensive_care_male AS INT),0) as current_intensive_care_male,isnull( CAST(s.current_intensive_care_female AS INT),0) as current_intensive_care_female,isnull( CAST(s.new_ventilator_male AS INT),0) as new_ventilator_male,isnull( CAST(s.new_ventilator_female AS INT),0) as new_ventilator_female,isnull( CAST(s.total_ventilator_male AS INT),0) as total_ventilator_male,isnull( CAST(s.total_ventilator_female AS INT),0) as total_ventilator_female,isnull( CAST(s.current_ventilator_male AS INT),0) as current_ventilator_male,isnull( CAST(s.current_ventilator_female AS INT),0) as current_ventilator_female
--from COVID_GRUPO1.dbo.sex s
--go

--Script de SP para MERGE Epidemilogy
CREATE OR ALTER PROCEDURE USP_MergeFact_Epidemilogy
as
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
		DECLARE @NuevoGUIDInsert UNIQUEIDENTIFIER = NEWID()

		INSERT INTO FactLog_Epidemilogy
		VALUES (@NuevoGUIDInsert,getdate(),NULL)
		
		MERGE Fact.Epidemilogy AS T
		USING (
			 SELECT  			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			f.DateKey,
			r.[date],
			r.[key],
			r.new_confirmed,
			r.new_deceased,
			r.new_recovered,
			r.new_tested,
			r.total_confirmed,
			r.total_deceased,
			r.total_tested,
			r.new_hospitalized ,
			r.new_intensive_care ,
			r.new_ventilator ,
			r.total_hospitalized ,
			r.total_intensive_care ,
			r.total_ventilator ,
			r.current_hospitalized ,
			r.current_intensive_care ,
			r.current_ventilator
			  --Columnas Auditoria
			,GETDATE() AS FechaCreacion,
			'ETL' as UsuarioCreacion, 
			NULL as FechaModificacion, 
			NULL as UsuarioModificacion, 
			@NuevoGUIDINsert as ID_Batch,
			'ssis' as ID_SourceSystem
		FROM Staging.Epidemilogy R		
		INNER JOIN Dimension.Demographics d on (r.[key] = d.[key] and r.[Date] = d.ID_Demographics and R.[date] BETWEEN d.FechaInicioValidez AND ISNULL(d.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Economy e on (r.[key] = e.[key] and r.[Date] = e.ID_Economy and R.[date] BETWEEN e.FechaInicioValidez AND ISNULL(e.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Geography g on (r.[key] = g.[key] and r.[Date] = g.ID_Geography and R.[date] BETWEEN g.FechaInicioValidez AND ISNULL(g.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Health h on (r.[key] = h.[key] and r.[Date] = h.ID_Health and R.[date] BETWEEN h.FechaInicioValidez AND ISNULL(h.FechaFinValidez, '9999-12-31')) 		
		LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(r.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(r.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(r.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey)
		) AS S ON (S.[key] = T.[key] and S.[date] = T.[date])

		WHEN NOT MATCHED BY TARGET THEN --No existe en Fact
		INSERT (			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			DateKey,
			[date],
			[key],
			new_confirmed,
			new_deceased,
			new_recovered,
			new_tested,
			total_confirmed,
			total_deceased,
			total_tested,
			new_hospitalized ,
			new_intensive_care ,
			new_ventilator ,
			total_hospitalized ,
			total_intensive_care ,
			total_ventilator ,
			current_hospitalized ,
			current_intensive_care ,
			current_ventilator,
			FechaCreacion,
			UsuarioCreacion,
			FechaModificacion, 
			UsuarioModificacion, 
			ID_Batch, 
			ID_SourceSystem)

		VALUES (			
			S.SK_Demographics,
			S.SK_Economy,
			S.SK_Geography,
			S.SK_Health,			
			S.DateKey,
			S.[date],
			S.[key],
			S.new_confirmed,
			S.new_deceased,
			S.new_recovered,
			S.new_tested,
			S.total_confirmed,
			S.total_deceased,
			S.total_tested,
			S.new_hospitalized ,
			S.new_intensive_care ,
			S.new_ventilator ,
			S.total_hospitalized ,
			S.total_intensive_care ,
			S.total_ventilator ,
			S.current_hospitalized ,
			S.current_intensive_care ,
			S.current_ventilator,
			S.FechaCreacion,
			S.UsuarioCreacion,
			S.FechaModificacion, 
			S.UsuarioModificacion, 
			S.ID_Batch, 
			S.ID_SourceSystem);

		UPDATE FactLog_Epidemilogy
		SET RegistrosImportados=@@ROWCOUNT
		WHERE ID_Batch = @NuevoGUIDInsert

		COMMIT
	END TRY
	BEGIN CATCH
		SELECT @@ERROR,'Ocurrio el siguiente error: '+ERROR_MESSAGE()
		IF (@@TRANCOUNT>0)
			ROLLBACK;
	END CATCH

END
go

--Script de SP para MERGE Sex
CREATE OR ALTER PROCEDURE USP_MergeFact_Sex
as
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
		DECLARE @NuevoGUIDInsert UNIQUEIDENTIFIER = NEWID()

		INSERT INTO FactLog_Sex
		VALUES (@NuevoGUIDInsert,getdate(),NULL)
		
		MERGE Fact.Sex AS T
		USING (
			 SELECT  			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			f.DateKey,
			r.[date],
			r.[key],
			r.new_confirmed_male ,
			r.new_confirmed_female , 
			r.total_confirmed_male ,
			r.total_confirmed_female , 
			r.new_deceased_male , 
			r.new_deceased_female , 
			r.total_deceased_male , 
			r.total_deceased_female , 
			r.new_recovered_male , 
			r.new_recovered_female , 
			r.total_recovered_male , 
			r.total_recovered_female , 
			r.new_tested_male , 
			r.new_tested_female , 
			r.total_tested_male , 
			r.total_tested_female , 
			r.new_hospitalized_male , 
			r.new_hospitalized_female , 
			r.total_hospitalized_male , 
			r.total_hospitalized_female , 
			r.current_hospitalized_male ,
			r.current_hospitalized_female , 
			r.new_intensive_care_male , 
			r.new_intensive_care_female , 
			r.total_intensive_care_male , 
			r.total_intensive_care_female , 
			r.current_intensive_care_male , 
			r.current_intensive_care_female , 
			r.new_ventilator_male , 
			r.new_ventilator_female , 
			r.total_ventilator_male , 
			r.total_ventilator_female , 
			r.current_ventilator_male , 
			r.current_ventilator_female 
			  --Columnas Auditoria
			,GETDATE() AS FechaCreacion,
			'ETL' as UsuarioCreacion, 
			NULL as FechaModificacion, 
			NULL as UsuarioModificacion, 
			@NuevoGUIDINsert as ID_Batch,
			'ssis' as ID_SourceSystem
		from staging.sex R		
		INNER JOIN Dimension.Demographics d on (r.[key] = d.[key] and r.[Date] = d.ID_Demographics and R.[date] BETWEEN d.FechaInicioValidez AND ISNULL(d.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Economy e on (r.[key] = e.[key] and r.[Date] = e.ID_Economy and R.[date] BETWEEN e.FechaInicioValidez AND ISNULL(e.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Geography g on (r.[key] = g.[key] and r.[Date] = g.ID_Geography and R.[date] BETWEEN g.FechaInicioValidez AND ISNULL(g.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Health h on (r.[key] = h.[key] and r.[Date] = h.ID_Health and R.[date] BETWEEN h.FechaInicioValidez AND ISNULL(h.FechaFinValidez, '9999-12-31')) 		
		LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(r.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(r.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(r.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey)
		) AS S ON (S.[key] = T.[key] and S.[date] = T.[date])

		WHEN NOT MATCHED BY TARGET THEN --No existe en Fact
		INSERT (			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			DateKey,
			[date],
			[key],
			new_confirmed_male ,
			new_confirmed_female , 
			total_confirmed_male ,
			total_confirmed_female , 
			new_deceased_male , 
			new_deceased_female , 
			total_deceased_male , 
			total_deceased_female , 
			new_recovered_male , 
			new_recovered_female , 
			total_recovered_male , 
			total_recovered_female , 
			new_tested_male , 
			new_tested_female , 
			total_tested_male , 
			total_tested_female , 
			new_hospitalized_male , 
			new_hospitalized_female , 
			total_hospitalized_male , 
			total_hospitalized_female , 
			current_hospitalized_male ,
			current_hospitalized_female , 
			new_intensive_care_male , 
			new_intensive_care_female , 
			total_intensive_care_male , 
			total_intensive_care_female , 
			current_intensive_care_male , 
			current_intensive_care_female , 
			new_ventilator_male , 
			new_ventilator_female , 
			total_ventilator_male , 
			total_ventilator_female , 
			current_ventilator_male , 
			current_ventilator_female,
			FechaCreacion,
			UsuarioCreacion,
			FechaModificacion, 
			UsuarioModificacion, 
			ID_Batch, 
			ID_SourceSystem)

		VALUES (			
			S.SK_Demographics,
			S.SK_Economy,
			S.SK_Geography,
			S.SK_Health,			
			S.DateKey,
			S.[date],
			S.[key],
				S.new_confirmed_male ,
			S.new_confirmed_female , 
			S.total_confirmed_male ,
			S.total_confirmed_female , 
			S.new_deceased_male , 
			S.new_deceased_female , 
			S.total_deceased_male , 
			S.total_deceased_female , 
			S.new_recovered_male , 
			S.new_recovered_female , 
			S.total_recovered_male , 
			S.total_recovered_female , 
			S.new_tested_male , 
			S.new_tested_female , 
			S.total_tested_male , 
			S.total_tested_female , 
			S.new_hospitalized_male , 
			S.new_hospitalized_female , 
			S.total_hospitalized_male , 
			S.total_hospitalized_female , 
			S.current_hospitalized_male ,
			S.current_hospitalized_female , 
			S.new_intensive_care_male , 
			S.new_intensive_care_female , 
			S.total_intensive_care_male , 
			S.total_intensive_care_female , 
			S.current_intensive_care_male , 
			S.current_intensive_care_female , 
			S.new_ventilator_male , 
			S.new_ventilator_female , 
			S.total_ventilator_male , 
			S.total_ventilator_female , 
			S.current_ventilator_male , 
			S.current_ventilator_female,
			S.FechaCreacion,
			S.UsuarioCreacion,
			S.FechaModificacion, 
			S.UsuarioModificacion, 
			S.ID_Batch, 
			S.ID_SourceSystem);

		UPDATE FactLog_Sex
		SET RegistrosImportados=@@ROWCOUNT
		WHERE ID_Batch = @NuevoGUIDInsert

		COMMIT
	END TRY
	BEGIN CATCH
		SELECT @@ERROR,'Ocurrio el siguiente error: '+ERROR_MESSAGE()
		IF (@@TRANCOUNT>0)
			ROLLBACK;
	END CATCH

END
go

--Script de SP para MERGE Age
CREATE OR ALTER PROCEDURE USP_MergeFact_Age
as
BEGIN

	SET NOCOUNT ON;
	BEGIN TRY
		BEGIN TRAN
		DECLARE @NuevoGUIDInsert UNIQUEIDENTIFIER = NEWID()

		INSERT INTO FactLog_Age
		VALUES (@NuevoGUIDInsert,getdate(),NULL)
		
		MERGE Fact.age AS T
		USING (
			 SELECT  			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			f.DateKey,
			r.[date],
			r.[key],
			r.new_confirmed_age_00 ,
			r.new_confirmed_age_01 , 
			r.new_confirmed_age_02 , 
			r.new_confirmed_age_03 , 
			r.new_confirmed_age_04 , 
			r.new_confirmed_age_05 , 
			r.new_confirmed_age_06 , 
			r.new_confirmed_age_07 , 
			r.new_confirmed_age_08 , 
			r.new_confirmed_age_09 , 
			r.total_confirmed_age_00 , 
			r.total_confirmed_age_01 , 
			r.total_confirmed_age_02 , 
			r.total_confirmed_age_03 , 
			r.total_confirmed_age_04 , 
			r.total_confirmed_age_05 , 
			r.total_confirmed_age_06 , 
			r.total_confirmed_age_07 , 
			r.total_confirmed_age_08 , 
			r.total_confirmed_age_09 , 
			r.new_deceased_age_00 , 
			r.new_deceased_age_01 , 
			r.new_deceased_age_02 , 
			r.new_deceased_age_03 , 
			r.new_deceased_age_04 , 
			r.new_deceased_age_05 , 
			r.new_deceased_age_06 , 
			r.new_deceased_age_07 , 
			r.new_deceased_age_08 , 
			r.new_deceased_age_09 , 
			r.total_deceased_age_00 , 
			r.total_deceased_age_01 , 
			r.total_deceased_age_02 , 
			r.total_deceased_age_03 , 
			r.total_deceased_age_04 , 
			r.total_deceased_age_05 , 
			r.total_deceased_age_06 , 
			r.total_deceased_age_07 , 
			r.total_deceased_age_08 , 
			r.total_deceased_age_09 , 
			r.new_recovered_age_00 , 
			r.new_recovered_age_01 , 
			r.new_recovered_age_02 , 
			r.new_recovered_age_03 , 
			r.new_recovered_age_04 , 
			r.new_recovered_age_05 , 
			r.new_recovered_age_06 , 
			r.new_recovered_age_07 , 
			r.new_recovered_age_08 , 
			r.new_recovered_age_09 , 
			r.total_recovered_age_00 , 
			r.total_recovered_age_01 , 
			r.total_recovered_age_02 , 
			r.total_recovered_age_03 , 
			r.total_recovered_age_04 , 
			r.total_recovered_age_05 , 
			r.total_recovered_age_06 , 
			r.total_recovered_age_07 , 
			r.total_recovered_age_08 , 
			r.total_recovered_age_09 , 
			r.new_tested_age_00 , 
			r.new_tested_age_01 , 
			r.new_tested_age_02 , 
			r.new_tested_age_03 , 
			r.new_tested_age_04 , 
			r.new_tested_age_05 , 
			r.new_tested_age_06 , 
			r.new_tested_age_07 , 
			r.new_tested_age_08 , 
			r.new_tested_age_09 , 
			r.total_tested_age_00 , 
			r.total_tested_age_01 , 
			r.total_tested_age_02 , 
			r.total_tested_age_03 , 
			r.total_tested_age_04 , 
			r.total_tested_age_05 , 
			r.total_tested_age_06 , 
			r.total_tested_age_07 , 
			r.total_tested_age_08 , 
			r.total_tested_age_09 , 
			r.new_hospitalized_age_00 , 
			r.new_hospitalized_age_01 , 
			r.new_hospitalized_age_02 , 
			r.new_hospitalized_age_03 , 
			r.new_hospitalized_age_04 , 
			r.new_hospitalized_age_05 , 
			r.new_hospitalized_age_06 , 
			r.new_hospitalized_age_07 , 
			r.new_hospitalized_age_08 , 
			r.new_hospitalized_age_09 , 
			r.total_hospitalized_age_00 , 
			r.total_hospitalized_age_01 , 
			r.total_hospitalized_age_02 , 
			r.total_hospitalized_age_03 , 
			r.total_hospitalized_age_04 , 
			r.total_hospitalized_age_05 , 
			r.total_hospitalized_age_06 , 
			r.total_hospitalized_age_07 , 
			r.total_hospitalized_age_08 ,
			r.total_hospitalized_age_09 ,
			r.current_hospitalized_age_00 ,
			r.current_hospitalized_age_01 ,
			r.current_hospitalized_age_02 ,
			r.current_hospitalized_age_03 ,
			r.current_hospitalized_age_04 ,
			r.current_hospitalized_age_05 ,
			r.current_hospitalized_age_06 ,
			r.current_hospitalized_age_07 ,
			r.current_hospitalized_age_08 ,
			r.current_hospitalized_age_09 ,
			r.new_intensive_care_age_00 ,
			r.new_intensive_care_age_01 ,
			r.new_intensive_care_age_02 ,
			r.new_intensive_care_age_03 ,
			r.new_intensive_care_age_04 ,
			r.new_intensive_care_age_05 ,
			r.new_intensive_care_age_06 ,
			r.new_intensive_care_age_07 ,
			r.new_intensive_care_age_08 ,
			r.new_intensive_care_age_09 ,
			r.total_intensive_care_age_00 , 
			r.total_intensive_care_age_01 ,
			r.total_intensive_care_age_02 ,
			r.total_intensive_care_age_03 ,
			r.total_intensive_care_age_04 ,
			r.total_intensive_care_age_05 , 
			r.total_intensive_care_age_06 ,
			r.total_intensive_care_age_07 ,
			r.total_intensive_care_age_08 ,
			r.total_intensive_care_age_09 ,
			r.current_intensive_care_age_00 ,
			r.current_intensive_care_age_01 ,
			r.current_intensive_care_age_02 ,
			r.current_intensive_care_age_03 ,
			r.current_intensive_care_age_04 ,
			r.current_intensive_care_age_05 ,
			r.current_intensive_care_age_06 ,
			r.current_intensive_care_age_07 ,
			r.current_intensive_care_age_08 ,
			r.current_intensive_care_age_09 ,
			r.new_ventilator_age_00 ,
			r.new_ventilator_age_01 ,
			r.new_ventilator_age_02 ,
			r.new_ventilator_age_03 ,
			r.new_ventilator_age_04 ,
			r.new_ventilator_age_05 ,
			r.new_ventilator_age_06 ,
			r.new_ventilator_age_07 ,
			r.new_ventilator_age_08 ,
			r.new_ventilator_age_09 ,
			r.total_ventilator_age_00 ,
			r.total_ventilator_age_01 ,
			r.total_ventilator_age_02 ,
			r.total_ventilator_age_03 ,
			r.total_ventilator_age_04 ,
			r.total_ventilator_age_05 ,
			r.total_ventilator_age_06 ,
			r.total_ventilator_age_07 ,
			r.total_ventilator_age_08 ,
			r.total_ventilator_age_09 ,
			r.current_ventilator_age_00 ,
			r.current_ventilator_age_01 ,
			r.current_ventilator_age_02 ,
			r.current_ventilator_age_03 , 
			r.current_ventilator_age_04 , 
			r.current_ventilator_age_05 , 
			r.current_ventilator_age_06 , 
			r.current_ventilator_age_07 , 
			r.current_ventilator_age_08 , 
			r.current_ventilator_age_09 , 
			r.age_bin_00  , 
			r.age_bin_01  , 
			r.age_bin_02  ,
			r.age_bin_03  , 
			r.age_bin_04  , 
			r.age_bin_05  , 
			r.age_bin_06  , 
			r.age_bin_07  , 
			r.age_bin_08  , 
			r.age_bin_09  
			  --Columnas Auditoria
			,GETDATE() AS FechaCreacion,
			'ETL' as UsuarioCreacion, 
			NULL as FechaModificacion, 
			NULL as UsuarioModificacion, 
			@NuevoGUIDINsert as ID_Batch,
			'ssis' as ID_SourceSystem
		FROM Staging.age R		
		INNER JOIN Dimension.Demographics d on (r.[key] = d.[key] and r.[Date] = d.ID_Demographics and R.[date] BETWEEN d.FechaInicioValidez AND ISNULL(d.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Economy e on (r.[key] = e.[key] and r.[Date] = e.ID_Economy and R.[date] BETWEEN e.FechaInicioValidez AND ISNULL(e.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Geography g on (r.[key] = g.[key] and r.[Date] = g.ID_Geography and R.[date] BETWEEN g.FechaInicioValidez AND ISNULL(g.FechaFinValidez, '9999-12-31')) 
		INNER JOIN Dimension.Health h on (r.[key] = h.[key] and r.[Date] = h.ID_Health and R.[date] BETWEEN h.FechaInicioValidez AND ISNULL(h.FechaFinValidez, '9999-12-31')) 		
		LEFT JOIN Dimension.Fecha F ON(CAST( (CAST(YEAR(r.[date]) AS VARCHAR(4)))+left('0'+CAST(MONTH(r.[date]) AS VARCHAR(4)),2)+left('0'+(CAST(DAY(r.[date]) AS VARCHAR(4))),2) AS INT)  = F.DateKey)
		) AS S ON (S.[key] = T.[key] and S.[date] = T.[date])

		WHEN NOT MATCHED BY TARGET THEN --No existe en Fact
		INSERT (			
			SK_Demographics,
			SK_Economy,
			SK_Geography,
			SK_Health,			
			DateKey,
			[date],
			[key],
			new_confirmed_age_00 ,
			new_confirmed_age_01 , 
			new_confirmed_age_02 , 
			new_confirmed_age_03 , 
			new_confirmed_age_04 , 
			new_confirmed_age_05 , 
			new_confirmed_age_06 , 
			new_confirmed_age_07 , 
			new_confirmed_age_08 , 
			new_confirmed_age_09 , 
			total_confirmed_age_00 , 
			total_confirmed_age_01 , 
			total_confirmed_age_02 , 
			total_confirmed_age_03 , 
			total_confirmed_age_04 , 
			total_confirmed_age_05 , 
			total_confirmed_age_06 , 
			total_confirmed_age_07 , 
			total_confirmed_age_08 , 
			total_confirmed_age_09 , 
			new_deceased_age_00 , 
			new_deceased_age_01 , 
			new_deceased_age_02 , 
			new_deceased_age_03 , 
			new_deceased_age_04 , 
			new_deceased_age_05 , 
			new_deceased_age_06 , 
			new_deceased_age_07 , 
			new_deceased_age_08 , 
			new_deceased_age_09 , 
			total_deceased_age_00 , 
			total_deceased_age_01 , 
			total_deceased_age_02 , 
			total_deceased_age_03 , 
			total_deceased_age_04 , 
			total_deceased_age_05 , 
			total_deceased_age_06 , 
			total_deceased_age_07 , 
			total_deceased_age_08 , 
			total_deceased_age_09 , 
			new_recovered_age_00 , 
			new_recovered_age_01 , 
			new_recovered_age_02 , 
			new_recovered_age_03 , 
			new_recovered_age_04 , 
			new_recovered_age_05 , 
			new_recovered_age_06 , 
			new_recovered_age_07 , 
			new_recovered_age_08 , 
			new_recovered_age_09 , 
			total_recovered_age_00 , 
			total_recovered_age_01 , 
			total_recovered_age_02 , 
			total_recovered_age_03 , 
			total_recovered_age_04 , 
			total_recovered_age_05 , 
			total_recovered_age_06 , 
			total_recovered_age_07 , 
			total_recovered_age_08 , 
			total_recovered_age_09 , 
			new_tested_age_00 , 
			new_tested_age_01 , 
			new_tested_age_02 , 
			new_tested_age_03 , 
			new_tested_age_04 , 
			new_tested_age_05 , 
			new_tested_age_06 , 
			new_tested_age_07 , 
			new_tested_age_08 , 
			new_tested_age_09 , 
			total_tested_age_00 , 
			total_tested_age_01 , 
			total_tested_age_02 , 
			total_tested_age_03 , 
			total_tested_age_04 , 
			total_tested_age_05 , 
			total_tested_age_06 , 
			total_tested_age_07 , 
			total_tested_age_08 , 
			total_tested_age_09 , 
			new_hospitalized_age_00 , 
			new_hospitalized_age_01 , 
			new_hospitalized_age_02 , 
			new_hospitalized_age_03 , 
			new_hospitalized_age_04 , 
			new_hospitalized_age_05 , 
			new_hospitalized_age_06 , 
			new_hospitalized_age_07 , 
			new_hospitalized_age_08 , 
			new_hospitalized_age_09 , 
			total_hospitalized_age_00 , 
			total_hospitalized_age_01 , 
			total_hospitalized_age_02 , 
			total_hospitalized_age_03 , 
			total_hospitalized_age_04 , 
			total_hospitalized_age_05 , 
			total_hospitalized_age_06 , 
			total_hospitalized_age_07 , 
			total_hospitalized_age_08 ,
			total_hospitalized_age_09 ,
			current_hospitalized_age_00 ,
			current_hospitalized_age_01 ,
			current_hospitalized_age_02 ,
			current_hospitalized_age_03 ,
			current_hospitalized_age_04 ,
			current_hospitalized_age_05 ,
			current_hospitalized_age_06 ,
			current_hospitalized_age_07 ,
			current_hospitalized_age_08 ,
			current_hospitalized_age_09 ,
			new_intensive_care_age_00 ,
			new_intensive_care_age_01 ,
			new_intensive_care_age_02 ,
			new_intensive_care_age_03 ,
			new_intensive_care_age_04 ,
			new_intensive_care_age_05 ,
			new_intensive_care_age_06 ,
			new_intensive_care_age_07 ,
			new_intensive_care_age_08 ,
			new_intensive_care_age_09 ,
			total_intensive_care_age_00 , 
			total_intensive_care_age_01 ,
			total_intensive_care_age_02 ,
			total_intensive_care_age_03 ,
			total_intensive_care_age_04 ,
			total_intensive_care_age_05 , 
			total_intensive_care_age_06 ,
			total_intensive_care_age_07 ,
			total_intensive_care_age_08 ,
			total_intensive_care_age_09 ,
			current_intensive_care_age_00 ,
			current_intensive_care_age_01 ,
			current_intensive_care_age_02 ,
			current_intensive_care_age_03 ,
			current_intensive_care_age_04 ,
			current_intensive_care_age_05 ,
			current_intensive_care_age_06 ,
			current_intensive_care_age_07 ,
			current_intensive_care_age_08 ,
			current_intensive_care_age_09 ,
			new_ventilator_age_00 ,
			new_ventilator_age_01 ,
			new_ventilator_age_02 ,
			new_ventilator_age_03 ,
			new_ventilator_age_04 ,
			new_ventilator_age_05 ,
			new_ventilator_age_06 ,
			new_ventilator_age_07 ,
			new_ventilator_age_08 ,
			new_ventilator_age_09 ,
			total_ventilator_age_00 ,
			total_ventilator_age_01 ,
			total_ventilator_age_02 ,
			total_ventilator_age_03 ,
			total_ventilator_age_04 ,
			total_ventilator_age_05 ,
			total_ventilator_age_06 ,
			total_ventilator_age_07 ,
			total_ventilator_age_08 ,
			total_ventilator_age_09 ,
			current_ventilator_age_00 ,
			current_ventilator_age_01 ,
			current_ventilator_age_02 ,
			current_ventilator_age_03 , 
			current_ventilator_age_04 , 
			current_ventilator_age_05 , 
			current_ventilator_age_06 , 
			current_ventilator_age_07 , 
			current_ventilator_age_08 , 
			current_ventilator_age_09 , 
			age_bin_00  , 
			age_bin_01  , 
			age_bin_02  ,
			age_bin_03  , 
			age_bin_04  , 
			age_bin_05  , 
			age_bin_06  , 
			age_bin_07  , 
			age_bin_08  , 
			age_bin_09  ,
			FechaCreacion,
			UsuarioCreacion,
			FechaModificacion, 
			UsuarioModificacion, 
			ID_Batch, 
			ID_SourceSystem)

		VALUES (			
			S.SK_Demographics,
			S.SK_Economy,
			S.SK_Geography,
			S.SK_Health,			
			S.DateKey,
			S.[date],
			S.[key],
			S.new_confirmed_age_00 ,
			S.new_confirmed_age_01 , 
			S.new_confirmed_age_02 , 
			S.new_confirmed_age_03 , 
			S.new_confirmed_age_04 , 
			S.new_confirmed_age_05 , 
			S.new_confirmed_age_06 , 
			S.new_confirmed_age_07 , 
			S.new_confirmed_age_08 , 
			S.new_confirmed_age_09 , 
			S.total_confirmed_age_00 , 
			S.total_confirmed_age_01 , 
			S.total_confirmed_age_02 , 
			S.total_confirmed_age_03 , 
			S.total_confirmed_age_04 , 
			S.total_confirmed_age_05 , 
			S.total_confirmed_age_06 , 
			S.total_confirmed_age_07 , 
			S.total_confirmed_age_08 , 
			S.total_confirmed_age_09 , 
			S.new_deceased_age_00 , 
			S.new_deceased_age_01 , 
			S.new_deceased_age_02 , 
			S.new_deceased_age_03 , 
			S.new_deceased_age_04 , 
			S.new_deceased_age_05 , 
			S.new_deceased_age_06 , 
			S.new_deceased_age_07 , 
			S.new_deceased_age_08 , 
			S.new_deceased_age_09 , 
			S.total_deceased_age_00 , 
			S.total_deceased_age_01 , 
			S.total_deceased_age_02 , 
			S.total_deceased_age_03 , 
			S.total_deceased_age_04 , 
			S.total_deceased_age_05 , 
			S.total_deceased_age_06 , 
			S.total_deceased_age_07 , 
			S.total_deceased_age_08 , 
			S.total_deceased_age_09 , 
			S.new_recovered_age_00 , 
			S.new_recovered_age_01 , 
			S.new_recovered_age_02 , 
			S.new_recovered_age_03 , 
			S.new_recovered_age_04 , 
			S.new_recovered_age_05 , 
			S.new_recovered_age_06 , 
			S.new_recovered_age_07 , 
			S.new_recovered_age_08 , 
			S.new_recovered_age_09 , 
			S.total_recovered_age_00 , 
			S.total_recovered_age_01 , 
			S.total_recovered_age_02 , 
			S.total_recovered_age_03 , 
			S.total_recovered_age_04 , 
			S.total_recovered_age_05 , 
			S.total_recovered_age_06 , 
			S.total_recovered_age_07 , 
			S.total_recovered_age_08 , 
			S.total_recovered_age_09 , 
			S.new_tested_age_00 , 
			S.new_tested_age_01 , 
			S.new_tested_age_02 , 
			S.new_tested_age_03 , 
			S.new_tested_age_04 , 
			S.new_tested_age_05 , 
			S.new_tested_age_06 , 
			S.new_tested_age_07 , 
			S.new_tested_age_08 , 
			S.new_tested_age_09 , 
			S.total_tested_age_00 , 
			S.total_tested_age_01 , 
			S.total_tested_age_02 , 
			S.total_tested_age_03 , 
			S.total_tested_age_04 , 
			S.total_tested_age_05 , 
			S.total_tested_age_06 , 
			S.total_tested_age_07 , 
			S.total_tested_age_08 , 
			S.total_tested_age_09 , 
			S.new_hospitalized_age_00 , 
			S.new_hospitalized_age_01 , 
			S.new_hospitalized_age_02 , 
			S.new_hospitalized_age_03 , 
			S.new_hospitalized_age_04 , 
			S.new_hospitalized_age_05 , 
			S.new_hospitalized_age_06 , 
			S.new_hospitalized_age_07 , 
			S.new_hospitalized_age_08 , 
			S.new_hospitalized_age_09 , 
			S.total_hospitalized_age_00 , 
			S.total_hospitalized_age_01 , 
			S.total_hospitalized_age_02 , 
			S.total_hospitalized_age_03 , 
			S.total_hospitalized_age_04 , 
			S.total_hospitalized_age_05 , 
			S.total_hospitalized_age_06 , 
			S.total_hospitalized_age_07 , 
			S.total_hospitalized_age_08 ,
			S.total_hospitalized_age_09 ,
			S.current_hospitalized_age_00 ,
			S.current_hospitalized_age_01 ,
			S.current_hospitalized_age_02 ,
			S.current_hospitalized_age_03 ,
			S.current_hospitalized_age_04 ,
			S.current_hospitalized_age_05 ,
			S.current_hospitalized_age_06 ,
			S.current_hospitalized_age_07 ,
			S.current_hospitalized_age_08 ,
			S.current_hospitalized_age_09 ,
			S.new_intensive_care_age_00 ,
			S.new_intensive_care_age_01 ,
			S.new_intensive_care_age_02 ,
			S.new_intensive_care_age_03 ,
			S.new_intensive_care_age_04 ,
			S.new_intensive_care_age_05 ,
			S.new_intensive_care_age_06 ,
			S.new_intensive_care_age_07 ,
			S.new_intensive_care_age_08 ,
			S.new_intensive_care_age_09 ,
			S.total_intensive_care_age_00 , 
			S.total_intensive_care_age_01 ,
			S.total_intensive_care_age_02 ,
			S.total_intensive_care_age_03 ,
			S.total_intensive_care_age_04 ,
			S.total_intensive_care_age_05 , 
			S.total_intensive_care_age_06 ,
			S.total_intensive_care_age_07 ,
			S.total_intensive_care_age_08 ,
			S.total_intensive_care_age_09 ,
			S.current_intensive_care_age_00 ,
			S.current_intensive_care_age_01 ,
			S.current_intensive_care_age_02 ,
			S.current_intensive_care_age_03 ,
			S.current_intensive_care_age_04 ,
			S.current_intensive_care_age_05 ,
			S.current_intensive_care_age_06 ,
			S.current_intensive_care_age_07 ,
			S.current_intensive_care_age_08 ,
			S.current_intensive_care_age_09 ,
			S.new_ventilator_age_00 ,
			S.new_ventilator_age_01 ,
			S.new_ventilator_age_02 ,
			S.new_ventilator_age_03 ,
			S.new_ventilator_age_04 ,
			S.new_ventilator_age_05 ,
			S.new_ventilator_age_06 ,
			S.new_ventilator_age_07 ,
			S.new_ventilator_age_08 ,
			S.new_ventilator_age_09 ,
			S.total_ventilator_age_00 ,
			S.total_ventilator_age_01 ,
			S.total_ventilator_age_02 ,
			S.total_ventilator_age_03 ,
			S.total_ventilator_age_04 ,
			S.total_ventilator_age_05 ,
			S.total_ventilator_age_06 ,
			S.total_ventilator_age_07 ,
			S.total_ventilator_age_08 ,
			S.total_ventilator_age_09 ,
			S.current_ventilator_age_00 ,
			S.current_ventilator_age_01 ,
			S.current_ventilator_age_02 ,
			S.current_ventilator_age_03 , 
			S.current_ventilator_age_04 , 
			S.current_ventilator_age_05 , 
			S.current_ventilator_age_06 , 
			S.current_ventilator_age_07 , 
			S.current_ventilator_age_08 , 
			S.current_ventilator_age_09 , 
			S.age_bin_00  , 
			S.age_bin_01  , 
			S.age_bin_02  ,
			S.age_bin_03  , 
			S.age_bin_04  , 
			S.age_bin_05  , 
			S.age_bin_06  , 
			S.age_bin_07  , 
			S.age_bin_08  , 
			S.age_bin_09  ,
			S.FechaCreacion,
			S.UsuarioCreacion,
			S.FechaModificacion, 
			S.UsuarioModificacion, 
			S.ID_Batch, 
			S.ID_SourceSystem);

		UPDATE FactLog_Age
		SET RegistrosImportados=@@ROWCOUNT
		WHERE ID_Batch = @NuevoGUIDInsert

		COMMIT
	END TRY
	BEGIN CATCH
		SELECT @@ERROR,'Ocurrio el siguiente error: '+ERROR_MESSAGE()
		IF (@@TRANCOUNT>0)
			ROLLBACK;
	END CATCH

END
go


--Query para SQL Execution para variable FechaEjecucion
SELECT TOP 1 FechaEjecucion 
FROM FactLog_Epidemilogy
ORDER BY FechaEjecucion DESC

SELECT TOP 1 FechaEjecucion 
FROM FactLog_Sex
ORDER BY FechaEjecucion DESC

SELECT TOP 1 FechaEjecucion 
FROM FactLog_Age
ORDER BY FechaEjecucion DESC



