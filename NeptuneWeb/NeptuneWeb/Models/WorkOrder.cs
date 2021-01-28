using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NeptuneWeb.Models
{
    public class WorkOrder
    {
        public string ScheduleID { get; set; }
        public int InstallerID { get; set; }
        public string InstallDate { get; set; }
        // entered by installer
        public int NewSerial{ get; set; }
        // entered by installer
        public int CorrectSerial { get; set; }
        // get from getscheduleresponse
        // show old read and altread on first page
        public int PrevRead { get; set; }
        public int OldRead { get; set; }
       
        // altread needed occasionally depending on job
        public int AltRead { get; set; }
        public int NewRead { get; set; }
        public int PlumbingTime { get; set; }
        public int NewRemoteID { get; set; }
        public string OldSize { get; set; }
        public string NewSize { get; set; }
        public byte[] OldPhoto { get; set; }
        public byte[] NewPhoto { get; set; }
        public byte[] Photo3 { get; set; }
        public byte[] Signature { get; set; }
        public string SkipReason { get; set; }
        public bool JobComplete { get; set; }
        public bool JobSkipped { get; set; }
        public bool CompundMeter { get; set; }
        public string DeviceID { get; set; }

    }
}