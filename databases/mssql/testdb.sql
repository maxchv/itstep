CREATE DATABASE [testdb]

GO

USE [testdb]

CREATE TABLE [dbo].[test_table](
	[id] [int] IDENTITY(1,1) PRIMARY KEY,
	[data] [varchar](255) NOT NULL
)
GO



CREATE PROCEDURE generate_random_data
	@count int = 10000
AS
BEGIN
	
	declare @i int = 0;
	declare @rnd varchar(255);
	
	delete from dbo.test_table;
	while @i < @count
	begin		
		set @rnd = convert(varchar(255), newid());
		insert into test_table([data]) values (@rnd);
		set @i = @i + 1;
	end
END
GO

exec generate_random_data 20000

GO