USE final_db
GO

CREATE OR ALTER PROC CreateSQLServerlessView @ViewName nvarchar(100)
AS
BEGIN

DECLARE @Statement VARCHAR(MAX)
	SET @statement = N'CREATE OR ALTER VIEW ' + @ViewName + ' As
		SELECT
    			*
		FROM
    		OPENROWSET(
        		BULK ''https://dwfinalprojectdata.dfs.core.windows.net/gold/' + @ViewName + '/'',
        		FORMAT = ''DELTA''
    		) AS [result]
	'
EXEC (@statement)

END
GO