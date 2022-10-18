IF NOT EXISTS(SELECT 1
FROM sys.databases
WHERE name = 'ProGet')
BEGIN
    CREATE DATABASE [ProGet] COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO

IF NOT EXISTS(SELECT 1
FROM sys.databases
WHERE name = 'BuildMaster')
BEGIN
    CREATE DATABASE [BuildMaster] COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO

IF NOT EXISTS(SELECT 1
FROM sys.databases
WHERE name = 'Otter')
BEGIN
    CREATE DATABASE [Otter] COLLATE SQL_Latin1_General_CP1_CI_AS
END
GO