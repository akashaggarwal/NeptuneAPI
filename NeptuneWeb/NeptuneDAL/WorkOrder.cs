//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NeptuneDAL
{
    using System;
    using System.Collections.Generic;
    
    public partial class WorkOrder
    {
        public int ScheduleID { get; set; }
        public double PremiseKey { get; set; }
        public Nullable<int> ProjectInventoryID { get; set; }
        public Nullable<int> InstallerID { get; set; }
        public string OrderType { get; set; }
        public Nullable<System.DateTime> InstallDate { get; set; }
        public Nullable<System.DateTime> StartTime { get; set; }
        public Nullable<System.DateTime> EndTime { get; set; }
        public Nullable<int> OldSerial { get; set; }
        public Nullable<int> NewSerial { get; set; }
        public Nullable<int> CorrectSerial { get; set; }
        public Nullable<int> PrevRead { get; set; }
        public Nullable<int> OldRead { get; set; }
        public Nullable<int> NewRead { get; set; }
        public Nullable<int> AltRead { get; set; }
        public Nullable<int> PlumbingTime { get; set; }
        public Nullable<int> WiringTime { get; set; }
        public Nullable<int> OldRemoteID { get; set; }
        public Nullable<int> NewRemoteID { get; set; }
        public string OldSize { get; set; }
        public string NewSize { get; set; }
        public Nullable<decimal> Latitude { get; set; }
        public Nullable<decimal> Longitude { get; set; }
        public byte[] OldPhoto { get; set; }
        public byte[] NewPhoto { get; set; }
        public byte[] Photo3 { get; set; }
        public byte[] Sig1 { get; set; }
        public string SkipReason { get; set; }
        public bool JobComplete { get; set; }
        public bool JobSkipped { get; set; }
        public bool JobReviewed { get; set; }
        public bool JobInspected { get; set; }
        public Nullable<int> Dials { get; set; }
        public Nullable<bool> CompoundMeter { get; set; }
        public string DeviceID { get; set; }
        public System.DateTime DateTimeModified { get; set; }
        public byte[] Photo4 { get; set; }
        public byte[] Photo5 { get; set; }
        public string Notes { get; set; }
        public byte[] Photo6 { get; set; }
        public byte[] Photo7 { get; set; }
        public Nullable<double> OldPhotoLatitude { get; set; }
        public Nullable<double> OldPhotoLongitude { get; set; }
        public Nullable<double> NewPhotoLatitude { get; set; }
        public Nullable<double> NewPhotoLongitude { get; set; }
        public Nullable<double> Photo3Latitude { get; set; }
        public Nullable<double> Photo3Longitude { get; set; }
        public Nullable<double> Photo4Latitude { get; set; }
        public Nullable<double> Photo4Longitude { get; set; }
        public Nullable<double> Photo5Latitude { get; set; }
        public Nullable<double> Photo5Longitude { get; set; }
        public Nullable<double> Photo6Latitude { get; set; }
        public Nullable<double> Photo6Longitude { get; set; }
        public Nullable<double> Photo7Latitude { get; set; }
        public Nullable<double> Photo7Longitude { get; set; }
        public Nullable<double> JobSubmissionLatitude { get; set; }
        public Nullable<double> JobSubmissionLongitude { get; set; }
    }
}
