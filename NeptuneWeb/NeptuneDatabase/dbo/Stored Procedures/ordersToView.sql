-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ordersToView]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
update 
  ordersview
Set 
  sig1 = orders.sig1,       
  outread = orders.outread,
  altread = orders.altread,
  oldmiuert = orders.oldmiuert,
  oldphoto = orders.oldphoto,
  newread = orders.newread,
  newmeternum = orders.newmeternum,
  newmiuert = orders.newmiuert,
  newphoto = orders.newphoto,
  plumbingtime = orders.plumbingtime,
  photo3 = orders.photo3,
  newlat = orders.newlat,
  newlong = orders.newlong,
  starttime = orders.starttime,
  endtime = orders.endtime,
  newmetersize = orders.newmetersize,
  jobcomplete = orders.jobcomplete,
  jobskipped = orders.jobskipped,
  skipreason = orders.skipreason,
  correctmtrnum = orders.correctmtrnum,
  InstallDate = orders.InstallDate,
  Installer = orders.Installer  
from 
  ordersview
INNER JOIN  
  orders 
ON 
  ordersview.orderid = orders.orderid 
END
