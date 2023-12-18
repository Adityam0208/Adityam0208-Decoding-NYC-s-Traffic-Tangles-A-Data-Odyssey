ALTER TABLE [dbo].[DIm_Contributing_Factor] DROP CONSTRAINT [fk_DIm_Contributing_Factor_Dim_Person_1]
GO
ALTER TABLE [dbo].[DIm_Contributing_Factor] DROP CONSTRAINT [fk_DIm_Contributing_Factor_Dim_Vehicle_1]
GO
ALTER TABLE [dbo].[Dim_Borough] DROP CONSTRAINT [fk_Dim_Borough_Fct_Collision_1]
GO
ALTER TABLE [dbo].[Dim_Date] DROP CONSTRAINT [fk_Dim_Date_Fct_Vehicle_Collision_1]
GO
ALTER TABLE [dbo].[Dim_Location] DROP CONSTRAINT [fk_Dim_Location_Fct_Collision_1]
GO
ALTER TABLE [dbo].[Dim_Time] DROP CONSTRAINT [fk_Dim_Time_Fct_Vehicle_Collision_1]
GO
ALTER TABLE [dbo].[Dim_Vehicle] DROP CONSTRAINT [fk_Dim_Vehicle_Fct_Vehicle_Collision_1]
GO
ALTER TABLE [dbo].[Fct_Vehicle_Collision] DROP CONSTRAINT [fk_Fct_Vehicle_Collision_Fct_Collision_1]
GO

DROP TABLE IF EXISTS [dbo].[DIm_Contributing_Factor]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Borough]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Date]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Location]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Person]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Time]
GO
DROP TABLE IF EXISTS [dbo].[Dim_Vehicle]
GO
DROP TABLE IF EXISTS [dbo].[Fct_Collision]
GO
DROP TABLE IF EXISTS [dbo].[Fct_Vehicle_Collision]
GO

CREATE TABLE [dbo].[DIm_Contributing_Factor] (
  [CONTRIBUTING_FACTOR_SK] int,
  [CONTRIBUTING_FACTOR] varchar(255),
  [DI_PID] varchar(20),
  [DI_Create_Date] datetime
)
GO

CREATE TABLE [dbo].[Dim_Borough] (
  [Borough_SK] int NOT NULL,
  [borough] varchar(40),
  [DI_PID] varchar(40),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([Borough_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Dim_Date] (
  [DATE_SK] int NOT NULL,
  [CRASH_DATE] datetime,
  [DI_PID] varchar(40),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([DATE_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Dim_Location] (
  [location_SK] int NOT NULL,
  [off_street_name] varchar(40),
  [on_street_name] varchar(40),
  [cross_street_name] varchar(40),
  [latitude] numeric(24,6),
  [longitude] numeric(24,6),
  [location] varchar(256),
  PRIMARY KEY CLUSTERED ([location_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Dim_Person] (
  [PERSON_SK] int NOT NULL,
  [PERSON_ID] varchar(80),
  [PERSON_TYPE] varchar(80),
  [PERSON_INJURY] varchar(80),
  [PERSON_AGE] int,
  [EJECTION] varchar(80),
  [EMOTIONAL_STATUS] varchar(80),
  [BODILY_INJURY] varchar(80),
  [POSITION_IN_VEHICLE] varchar(255),
  [SAFETY_EQUIPMENT] varchar(255),
  [PED_LOCATION] varchar(255),
  [PED_ACTION_COMPLAINT] varchar(255),
  [PED_ROLE] varchar(255),
  [CONTRIBUTING_FACTOR_SK] varchar(255),
  [PERSON_SEX] varchar(10),
  [DI_PID] varchar(20),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([PERSON_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Dim_Time] (
  [TIME_SK] int NOT NULL,
  [CRASH_TIME] datetime,
  [DI_PID] varchar(40),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([TIME_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Dim_Vehicle] (
  [VEHICLE_SK] int NOT NULL,
  [VEHICLE_ID] varchar(80),
  [STATE_REGISTRATION] varchar(80),
  [VEHICLE_TYPE] varchar(80),
  [VEHICLE_MAKE] varchar(80),
  [VEHICLE_MODEL] varchar(80),
  [VEHICLE_YEAR] varchar(80),
  [TRAVEL_DIRECTION] varchar(255),
  [VEHICLE_OCCUPANTS] int,
  [DRIVER_SEX] varchar(80),
  [DRIVER_LICENSE_STATUS] varchar(255),
  [DRIVER_LICENSE_JURISDICTION] varchar(255),
  [PRE_CRASH] varchar(255),
  [POINT_OF_IMPACT] varchar(255),
  [VEHICLE_DAMAGE] varchar(255),
  [VEHICLE_DAMAGE_1] varchar(255),
  [VEHICLE_DAMAGE_2] varchar(255),
  [VEHICLE_DAMAGE_3] varchar(255),
  [PUBLIC_PROPERTY_DAMAGE] varchar(1024),
  [PUBLIC_PROPERTY DAMAGE_TYPE] varchar(1024),
  [CONTRIBUTING_FACTOR_SK] int,
  [DI_PID] varchar(20),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([VEHICLE_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Fct_Collision] (
  [COLLISION_SK] int NOT NULL,
  [COLLISION_ID] bigint,
  [location_SK] int,
  [Borough_SK] int,
  [number_of_cyclist_injured] int,
  [number_of_cyclist_killed] int,
  [number_of_motoris_injured] int,
  [number_of_motorist_killed] int,
  [number_of_pedestrians_injured] int,
  [number_of_pedestrians_killed] int,
  [number_of_persons_injured] int,
  [number_of_persons_killed] int,
  [vehicle_type_code1] varchar(80),
  [vehicle_type_code2] varchar(80),
  [vehicle_type_code3] varchar(80),
  [vehicle_type_code4] varchar(80),
  [vehicle_type_code5] varchar(80),
  [DI_JobID] varchar(20),
  [DI_Create_Date] datetime,
  PRIMARY KEY CLUSTERED ([COLLISION_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

CREATE TABLE [dbo].[Fct_Vehicle_Collision] (
  [VEHICLE_COLLISION_SK] int NOT NULL,
  [COLLISION_SK] bigint,
  [DATE_SK] datetime,
  [VEHICLE_SK] int,
  [DATE_SK] int,
  [TIME_SK] int,
  PRIMARY KEY CLUSTERED ([VEHICLE_COLLISION_SK])
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)
GO

ALTER TABLE [dbo].[DIm_Contributing_Factor] ADD CONSTRAINT [fk_DIm_Contributing_Factor_Dim_Person_1] FOREIGN KEY ([CONTRIBUTING_FACTOR_SK]) REFERENCES [dbo].[Dim_Person] ([CONTRIBUTING_FACTOR_SK])
GO
ALTER TABLE [dbo].[DIm_Contributing_Factor] ADD CONSTRAINT [fk_DIm_Contributing_Factor_Dim_Vehicle_1] FOREIGN KEY ([CONTRIBUTING_FACTOR_SK]) REFERENCES [dbo].[Dim_Vehicle] ([CONTRIBUTING_FACTOR_SK])
GO
ALTER TABLE [dbo].[Dim_Borough] ADD CONSTRAINT [fk_Dim_Borough_Fct_Collision_1] FOREIGN KEY ([Borough_SK]) REFERENCES [dbo].[Fct_Collision] ([Borough_SK])
GO
ALTER TABLE [dbo].[Dim_Date] ADD CONSTRAINT [fk_Dim_Date_Fct_Vehicle_Collision_1] FOREIGN KEY ([DATE_SK]) REFERENCES [dbo].[Fct_Vehicle_Collision] ([DATE_SK])
GO
ALTER TABLE [dbo].[Dim_Location] ADD CONSTRAINT [fk_Dim_Location_Fct_Collision_1] FOREIGN KEY ([location_SK]) REFERENCES [dbo].[Fct_Collision] ([location_SK])
GO
ALTER TABLE [dbo].[Dim_Time] ADD CONSTRAINT [fk_Dim_Time_Fct_Vehicle_Collision_1] FOREIGN KEY ([TIME_SK]) REFERENCES [dbo].[Fct_Vehicle_Collision] ([TIME_SK])
GO
ALTER TABLE [dbo].[Dim_Vehicle] ADD CONSTRAINT [fk_Dim_Vehicle_Fct_Vehicle_Collision_1] FOREIGN KEY ([VEHICLE_SK]) REFERENCES [dbo].[Fct_Vehicle_Collision] ([VEHICLE_SK])
GO
ALTER TABLE [dbo].[Fct_Vehicle_Collision] ADD CONSTRAINT [fk_Fct_Vehicle_Collision_Fct_Collision_1] FOREIGN KEY ([COLLISION_SK]) REFERENCES [dbo].[Fct_Collision] ([COLLISION_SK])
GO

