using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace NeptuneWeb.Models
{
    public class Schedule
    {
        public string ScheduleID { get; set; }
        public string AccountNumber { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string City { get; set; }
        public string Route { get; set; }
        public string Phone { get; set; }
        public string AltPhone { get; set; }
        public string ScheduleDate { get; set; }
        public string ScheduleTime { get; set; }
        public string Note { get; set; }
        public string OrderType { get; set; }
        public string OldSerial { get; set; }
        public string OldSize{ get; set; }
        public string PrevRead { get; set; }
        public string Latitude { get; set; }
        public string Longitude { get; set; }


    }
}