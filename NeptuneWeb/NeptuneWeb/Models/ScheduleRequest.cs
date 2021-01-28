using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NeptuneWeb.Models
{
    public class ScheduleRequest
    {
        public string DeviceID { get; set; }
        public int InstallerID { get; set; }
    }
}