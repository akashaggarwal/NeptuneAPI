CREATE PROC [dbo].[unload_wodata]
@deviceid varchar(80),
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
@WiringTime int = 0, --New 05062014
@NewRemoteID int = 0,
@OldSize nvarchar(10),
@NewSize nvarchar(10),
@OldPhoto image,
@NewPhoto image,
@Photo3 image,
@Photo4 image, --New 05062014
@Photo5 image, --New 05062014
@Sig1 image,
@Notes nvarchar(1000), --New 05062014
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


-- RESULT CODES

-- NEGATIVE VALUES INDICATE CUSTOM FAILURE / MISSING DATA
-- 0 MEANS CRITICAL FAILURE
-- 1 IS SUCCESS

IF NOT EXISTS (select * FROM Installers WHERE InstallerID = @installerid)
BEGIN
	--set @result = 0
	SELECT -1 as RESULT
	RETURN 0
END
IF NOT EXISTS (select * from Devices WHERE DeviceID = @deviceID)
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

BEGIN TRY
    UPDATE WorkOrders SET deviceid = @deviceid,
			  installerID = @installerID,
			  InstallDate = @InstallDate,
			  NewSerial = @NewSerial,
			  CorrectSerial = @CorrectSerial,
			  PrevRead = @PrevRead,
			  OldRead = @OldRead,
			  NewRead = @NewRead,
			  AltRead = @AltRead,
			  PlumbingTime = @PlumbingTime,
			  WiringTime = @WiringTime, --New 05062014
			  NewRemoteID= @NewRemoteID,
			  OldSize = @OldSize,
			  NewSize = @NewSize,
			  OldPhoto = @OldPhoto,
			  NewPhoto = @NewPhoto,
			  Photo3 = @Photo3,
			  Photo4 = @Photo4, --New 05062014
			  Photo5 = @Photo5, --New 05062014
			  Sig1 = @Sig1,
			  Notes = @Notes, --New 05062014
			  SkipReason = @SkipReason,
			  JobComplete = @JobComplete,
			  JobSkipped = @JobSkipped,
			  CompoundMeter = @CompoundMeter,
			  Photo6                 = @Photo6                 , 
			  Photo7 = @Photo7                 ,
			  OldPhotoLatitude =  @OldPhotoLatitude       ,
			  OldPhotoLongitude =  @OldPhotoLongitude     ,
			  NewPhotoLatitude =   @NewPhotoLatitude      ,
			  NewPhotoLongitude =  @NewPhotoLongitude     ,
			  Photo3Latitude=  @Photo3Latitude        ,
			Photo3Longitude =  @Photo3Longitude       ,
			Photo4Latitude =  @Photo4Latitude        ,
			Photo4Longitude =  @Photo4Longitude       ,
			Photo5Latitude =  @Photo5Latitude        ,
			Photo5Longitude = @Photo5Longitude       ,
			Photo6Latitude =  @Photo6Latitude        ,
			Photo6Longitude = @Photo6Longitude       ,
			Photo7Latitude =  @Photo7Latitude        ,
			Photo7Longitude = @Photo7Longitude       ,
			JobSubmissionLatitude  =  @JobSubmissionLatitude ,
			JobSubmissionLongitude = @JobSubmissionLongitude,

		  datetimemodified  = getdate()







	WHERE ScheduleID = @ScheduleID
	declare @rowsaffected int
	set  @rowsaffected = @@ROWCOUNT
	
	
	SELECT 1 as RESULT
	
	RETURN 1
END TRY
BEGIN CATCH
    SELECT 0 as RESULT
    RETURN 0
END CATCH



