CREATE PROC [dbo].[unload_wodata_gps]
@deviceid varchar(80),
@ProjectId int = 0, --New
@ScheduleID int = 0,
@installerID int = 0,
@InstallDate date,
@NewSerial int = 0,
@CorrectSerial int = 0,
@PrevRead int = 0,
@OldRead int = 0,
@NewRead int = 0,
@AltRead int = 0,
@PlumbingTime int = 0,
@WiringTime int = 0, 
@NewRemoteID int = 0,
@OldSize nvarchar(10),
@NewSize nvarchar(10),
@OldPhoto image,
@NewPhoto image,
@Photo3 image,
@Photo4 image,
@Photo5 image, 
@Sig1 image,
@Notes nvarchar(1000), 
@SkipReason nvarchar(50),
@JobComplete bit,
@JobSkipped bit,
@CompoundMeter bit,
@Photo6                 IMAGE          , 
@Photo7                 IMAGE          ,
@OldPhotoLatitude       float ,
@OldPhotoLongitude      float ,
@NewPhotoLatitude       float ,
@NewPhotoLongitude      float ,
@Photo3Latitude         float ,
@Photo3Longitude        float ,
@Photo4Latitude         float ,
@Photo4Longitude        float ,
@Photo5Latitude         float ,
@Photo5Longitude        float ,
@Photo6Latitude         float ,
@Photo6Longitude        float ,
@Photo7Latitude         float ,
@Photo7Longitude        float ,
@JobSubmissionLatitude  float ,
@JobSubmissionLongitude float 




AS
SET NOCOUNT OFF

DECLARE @UserId int = 0
DECLARE @rowsaffected int = 0
-- RESULT CODES

-- NEGATIVE VALUES INDICATE CUSTOM FAILURE / MISSING DATA
-- 0 MEANS CRITICAL FAILURE
-- 1 IS SUCCESS

IF NOT EXISTS (select * FROM [User] WHERE EmpId = @installerid)
BEGIN
	--set @result = 0
	SELECT -1 as RESULT
	RETURN 0
END
IF NOT EXISTS (select * from Device WHERE Device = @deviceID)
BEGIN
	--set @result = 0
	SELECT -2 as RESULT
	RETURN 0
END

IF @ScheduleID IS NULL OR @ScheduleID = 0
BEGIN
	SELECT -3 as RESULT
	RETURN 0
END

SELECT @UserId = [ID] From [User]
	WHERE EmpId = @InstallerID


BEGIN TRY
												
	UPDATE WorkOrder SET User5 = @deviceid,
									UserId = @UserId,
									CompleteDate = @InstallDate,
									NewSerial = @NewSerial,
									CorrectSerial = @CorrectSerial,
									PrevRead = @PrevRead,
									OldRead = @OldRead,
									NewRead = @NewRead,
									AltRead = @AltRead,
									PlumbingTime = ISNULL(@PlumbingTime,0),
									WiringTime = ISNULL(@WiringTime,0),
									NewRemoteID= @NewRemoteID,
									CurrentSize = @OldSize,
									NewSize = @NewSize,
									CurrentPhoto = @OldPhoto,
									NewPhoto = @NewPhoto,
									Photo3 = @Photo3,
									Photo4 = @Photo4,
									Photo5 = @Photo5, 
									Sig1 = @Sig1,
									Notes = @Notes, 
									SkipReason = @SkipReason,
									JobComplete = @JobComplete,
									JobSkipped = @JobSkipped,
									CompoundMeter = @CompoundMeter,
									EmpID = @InstallerID,
									UserPhoto1 = @Photo6,
									UserPhoto2 = @Photo7,
									NewPhotoLatitude = @NewPhotoLatitude,
									NewPhotoLongitude = @NewPhotoLongitude,
									OldPhotoLatitude = @OldPhotoLatitude,
									OldPhotoLongitude = @OldPhotoLongitude,
									Photo3Latitude = @Photo3Latitude,
									Photo3Longitude = @Photo3Longitude,
									Photo4Latitude = @Photo4Latitude,
									Photo4Longitude = @Photo4Longitude,
									Photo5Latitude = @Photo5Latitude,
									Photo5Longitude = @Photo5Longitude,
									UserPhoto1Latitude = @Photo6Latitude,
									UserPhoto1Longitude = @Photo6Longitude,
									UserPhoto2Latitude = @Photo7Latitude,
									UserPhoto2Longitude = @Photo7Longitude,
									NewLatitude = @JobSubmissionLatitude ,
									NewLongitude = @JobSubmissionLongitude,
									datetimemodified  = getdate()
									
	WHERE WorkOrderId = @ScheduleID
	
	set  @rowsaffected = @@ROWCOUNT
	
	DECLARE @AccountMeterId int
	SET @AccountMeterId = (SELECT AccountMeterId FROM WorkOrder
												WHERE WorkOrderId = @ScheduleID);
												
	UPDATE AccountMeter SET PreviousSerialNumber = SerialNumber,
										SerialNumber = @NewSerial,
										PreviousRemoteId = RemoteId,
										RemoteId = @NewRemoteID,
										PreviousSize = Size, 
										Size = @NewSize
			WHERE AccountMeterId = @AccountMeterId;
	
	UPDATE InventoryDetail SET CheckedIn = 0,
											InstallDate = @InstallDate,
											InstallerId = @UserId,
											PrevInstaller = (SELECT CASE 
															WHEN ISNULL(PrevInstaller,0) = 0 THEN NULL
															WHEN ISNULL(PrevInstaller,0) <> 0 AND 
																ISNULL(PrevInstaller,0) <> @UserId THEN PrevInstaller
															END)
															--FROM InventoryDetail
															--WHERE SerialNumber = @NewSerial)
					WHERE SerialNumber = @NewSerial;
					
	UPDATE InventoryDetail SET CheckedIn = 0,
											InstallDate = @InstallDate,
											InstallerId = @UserId,
											PrevInstaller = (SELECT CASE 
															WHEN ISNULL(PrevInstaller,0) = 0 THEN NULL
															WHEN ISNULL(PrevInstaller,0) <> 0 AND 
																ISNULL(PrevInstaller,0) <> @UserId THEN PrevInstaller
															END)
					WHERE SerialNumber = @NewRemoteID;
					
	UPDATE Inventory SET Qty = Qty - 1
	WHERE InventoryId = (SELECT InventoryId FROM InventoryDetail
	                WHERE SerialNumber = @NewSerial);
	
	SELECT 1 as RESULT
	
	RETURN 1
	
END TRY

BEGIN CATCH
    SELECT 0 as RESULT
    RETURN 0
END CATCH



