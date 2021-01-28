using NeptuneDAL;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace NeptuneTestDAL
{
    class Program
    {
        static void Main(string[] args)
        {
            int i = -1;
           using( NeptuneEntities context = new NeptuneEntities())
           {
               var schedules = context.GetSchedules("1234", 1,1);

               foreach (GetSchedules_Result s in schedules)
               {
                   Console.WriteLine(s.accountnumber);
               }

               try
               {
                   context.Database.Log = Logger;
                   WorkOrder w = context.WorkOrders.Where(a => a.ScheduleID == 2).FirstOrDefault();

                   Console.WriteLine(context.ChangeTracker.HasChanges().ToString());
                   //w.ScheduleID = 1234;
                   w.InstallDate = DateTime.Now;
                   w.InstallerID = 1;
                   w.DeviceID = "1234";
                   w.OldPhoto = File.ReadAllBytes(@"d:\junk\A16.jpg");
                   Console.WriteLine(context.ChangeTracker.HasChanges().ToString());
                   var a1 = context.SaveWorkOrder(w.DeviceID, w.ProjectInventoryID,  w.ScheduleID, w.InstallerID, w.InstallDate, w.NewSerial, w.CorrectSerial, w.PrevRead, w.OldRead, w.NewRead, w.AltRead, w.PlumbingTime,w.WiringTime, w.NewRemoteID, w.OldSize, w.NewSize, w.OldPhoto, w.NewPhoto, w.Photo3,w.Photo4, w.Photo5, w.Sig1,w.Notes,  w.SkipReason, w.JobComplete, w.JobSkipped, w.CompoundMeter, w.Photo6, w.Photo7,w.OldPhotoLatitude, w.OldPhotoLongitude , w.NewPhotoLatitude, w.NewPhotoLongitude, w.Photo3Latitude, w.Photo3Longitude, w.Photo4Latitude, w.Photo4Longitude, w.Photo5Latitude, w.Photo5Longitude, w.Photo6Latitude, w.Photo6Longitude, w.Photo7Latitude, w.Photo7Longitude, w.JobSubmissionLatitude, w.JobSubmissionLongitude);
                   //i = context.SaveChanges();
                   SaveWorkOrder_Result i1 = a1.FirstOrDefault();
                   Console.WriteLine("number of records updated->" + i1.RESULT);
                   i = i1.RESULT;
                   foreach( var e in context.GetValidationErrors())
                   {
                       Console.WriteLine(   e.ValidationErrors.ToString());
                   }
               }    
               catch(Exception ex)
               {
                   Console.WriteLine(   ex.ToString());
               }
                   
              
            //Console.WriteLine("value returned is " + i);
        }
            if (i == 1)
            {
                Console.WriteLine("succces");

            }
            else
            {
                Console.WriteLine("failure");
            }
           //using (NeptuneEntities context = new NeptuneEntities())
           //{
           //    WorkOrder w = context.WorkOrders.Where(a => a.ScheduleID == 2).FirstOrDefault();
           //    Console.WriteLine(w.InstallerID.ToString());
           //}

            Console.ReadLine();
        }
        private static  void Logger(string logString)
        {
            Console.WriteLine(logString);
        }
    }

}
