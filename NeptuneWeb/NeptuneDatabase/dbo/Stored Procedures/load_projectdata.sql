CREATE PROC load_projectdata
@deviceid varchar(80) ,
@installerid int = 0

AS


set nocount OFF
BEGIN TRY
SELECT	p.ProjectId,
		p.ProjectName
FROM Project p
WHERE p.InactiveYesNo = 0	--Filter out projects that are done

   RETURN 1
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
    RETURN 0
END CATCH

