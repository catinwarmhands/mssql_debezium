PRINT N'Создаем базу, если её ещё нет';

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'test_db')
BEGIN
    CREATE DATABASE test_db;
END;

GO

PRINT N'Переключаемся на созданную базу';
USE test_db;

GO

PRINT N'Создаем таблицу';
DROP TABLE IF EXISTS persons;
CREATE TABLE persons(
    person_id int IDENTITY(1,1) PRIMARY KEY,
    last_name varchar(255),
    first_name varchar(255)
);

PRINT N'Вставляем данные в таблицу';
INSERT INTO persons(last_name, first_name) VALUES
('Ivanov', 'Ivan'),
('Petrov', 'Petr');

-- PRINT N'Проверяем, что таблица создалась, и в ней есть данные';
-- SELECT * FROM persons;

-- PRINT N'Проверяем, что SQL Server Agent работает';
-- EXEC xp_servicecontrol N'querystate', N'SQLServerAGENT';

PRINT N'Включаем CDC для базы test_db';
EXEC sys.sp_cdc_enable_db;

PRINT N'Проверяем, что CDC включился';
SELECT is_cdc_enabled FROM sys.databases WHERE name = 'test_db';

PRINT N'Включаем CDC для таблицы dbo.persons';
EXEC sys.sp_cdc_enable_table
@source_schema = N'dbo',
@source_name = N'persons',
@role_name = NULL,
@filegroup_name = NULL,
@supports_net_changes = 0,
@capture_instance = NULL;