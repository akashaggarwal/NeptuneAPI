using NeptuneWeb.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using NeptuneDAL;
using log4net;
using log4net.Config;
[assembly: XmlConfigurator]
namespace NeptuneWeb.Controllers
{
    public class ScheduleController : ApiController
    {

        private static ILog Log = LogManager.GetLogger(typeof(ScheduleController));
        // GET api/schedule
        public List<GetSchedules_Result> Get(String DeviceID, String InstallerID, int ProjectID)
        {

            Log.InfoFormat("Received the get Request->deviceid->[{0}], installerid ->[{1}, projectid ->[{2}]", DeviceID, InstallerID, ProjectID);
            try
            {
                int installerid = 0;
                if (DeviceID == null || InstallerID == null || !Int32.TryParse(InstallerID, out installerid))
                    throw new HttpResponseException(HttpStatusCode.BadRequest);

                using (NeptuneEntities context = new NeptuneEntities())
                {
                    List<GetSchedules_Result> schedules = context.GetSchedules(DeviceID, installerid, ProjectID).ToList();
                    Log.InfoFormat("Schedules Retrieved->[{0}]", schedules.Count);

                    return schedules;
                }
            }
            catch(Exception ex)
            {
                Log.ErrorFormat(ex.ToString());
                throw new HttpResponseException(HttpStatusCode.InternalServerError);
            }

        }

        public List<GetProjects_Result> GetProjects(String DeviceID, String InstallerID)
        {

            Log.InfoFormat("Received the get Request->deviceid->[{0}], installerid ->[{1}]", DeviceID, InstallerID);
            try
            {
                int installerid = 0;
                if (DeviceID == null || InstallerID == null || !Int32.TryParse(InstallerID, out installerid))
                    throw new HttpResponseException(HttpStatusCode.BadRequest);

                using (NeptuneEntities context = new NeptuneEntities())
                {
                    List<GetProjects_Result> projects = context.GetProjects(DeviceID, installerid).ToList();
                    Log.InfoFormat("Projects Retrieved->[{0}]", projects.Count);

                    return projects;
                }
            }
            catch (Exception ex)
            {
                Log.ErrorFormat(ex.ToString());
                throw new HttpResponseException(HttpStatusCode.InternalServerError);
            }

        }


   
    }
}
