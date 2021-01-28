CREATE PROC [dbo].[load_wodata]
@deviceid varchar(80) ,
@installerid int = 0,
@projectid int = 0 --New
AS

set nocount OFF
BEGIN TRY
  SELECT a.AccountNumber, a.Address, a.City, a.Phone, a.AltPhone, a.Name, a.Route,
		 s.ScheduleDate, h.Hours, s.Note1,
		 w.WorkType, w.CurrentSerial, w.CurrentSize, w.WorkOrderId, w.PrevRead, w.CurrentLatitude, w.CurrentLongitude
	FROM Account a
	INNER JOIN AccountMeter m ON m.AccountId = a.AccountId
	INNER JOIN WorkOrder w ON w.AccountMeterId = m.AccountMeterId
	INNER JOIN WorkOrderType t ON t.WorkOrderTypeId = w.WorkOrderTypeId
	INNER JOIN Project p ON p.ProjectId = a.ProjectId
	INNER JOIN Device d on d.Device = @deviceid
	LEFT JOIN Schedule s ON s.ScheduleId = w.ScheduleId
	LEFT JOIN ProjectHours h ON h.ProjectHoursId = s.ProjectHoursId
	WHERE p.ProjectId = @projectid
	  AND w.JobComplete = 0 --Ensures only uncomplete Work Orders are returned
	  AND t.SystemNumber = 10 --Ensures only certain Work Order Types are returned
   RETURN 1
END TRY
BEGIN CATCH
    SELECT ERROR_MESSAGE() AS ErrorMessage;
    RETURN 0
END CATCH



