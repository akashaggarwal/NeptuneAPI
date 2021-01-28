using log4net;
using log4net.Config;
using NeptuneDAL;
using NeptuneWeb.Models;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

namespace NeptuneWeb.Controllers
{
    public class WorkOrderController : ApiController
    {
        private static ILog Log = LogManager.GetLogger(typeof(WorkOrderController));
        // GET api/schedule
        public async Task<HttpResponseMessage> Post()
        {

            Log.InfoFormat("Received the POST request");

            try
            {
            
            // Check if the request contains multipart/form-data.
            if (!Request.Content.IsMimeMultipartContent())
            {
                throw new HttpResponseException(HttpStatusCode.UnsupportedMediaType);
            }

            string root = ConfigurationManager.AppSettings["ImageFileFolder"];
        
            string rootbyDate = root + "/" + DateTime.Now.ToString("Mddyyyy");

            DirectoryInfo d = new DirectoryInfo(rootbyDate);
            if (!d.Exists)
            {
                Log.InfoFormat("Creating directory->{0}", d.FullName);
                d.Create();
            }

               
            var provider = new MultipartFormDataStreamProvider(rootbyDate);

                // Read the form data.
                await Request.Content.ReadAsMultipartAsync(provider);
                
                Log.InfoFormat("Now connecting to database");
                using (NeptuneEntities context = new NeptuneEntities())
                {

                    int? ScheduleID = null ;
                    int? InstallerID = null;
                    int? ProjectID = null;
                    string DeviceID = "";

                    getKeyValues(provider, ref ScheduleID, ref InstallerID, ref DeviceID, ref ProjectID);

                    if (String.IsNullOrEmpty(DeviceID))
                    {
                        Log.ErrorFormat("Missing DeviceID");
                        throw new ApplicationException("Missing DeviceID");
                        
                    }
                    if (InstallerID == null)
                    {
                        Log.ErrorFormat("Missing InstallerID");
                        throw new ApplicationException("Missing InstallerID");
                    }
                    if (ScheduleID == null)
                    {
                        Log.ErrorFormat("Missing ScheduleID");
                        throw new ApplicationException("Missing ScheduleID");
                    }
                    if (ProjectID == null)
                    {
                        Log.ErrorFormat("Missing ProjectID");
                        throw new ApplicationException("Missing ProjectID");
                    }

                    Log.InfoFormat("Key data elements found");
                    
                    Log.ErrorFormat("initializing Workorder");                       
                    //NeptuneDAL.WorkOrder w = context.WorkOrders.Where(a => a.ScheduleID == ScheduleID).FirstOrDefault();
                    NeptuneDAL.WorkOrder w = new NeptuneDAL.WorkOrder();
                    w.ScheduleID = ScheduleID.Value;
                    w.DeviceID = DeviceID;
                    w.InstallerID = InstallerID;
                    w.ProjectInventoryID = ProjectID;
                    Log.ErrorFormat("default Workorder");                       
                    //if (w == null)
                    //{
                    //    Log.ErrorFormat("Missing Workorder for this ScheduleID->{0}", ScheduleID);
                    //    throw new ApplicationException("Missing WorkOrder ID");
                    //}
                    
                    foreach (MultipartFileData file in provider.FileData)
                    {
                        Log.InfoFormat(file.Headers.ContentDisposition.Name);
                        string name = file.Headers.ContentDisposition.Name.Replace("\"","");
                        //string filename = file.Headers.ContentDisposition.FileName;
                        Log.InfoFormat(file.Headers.ContentDisposition.FileName);
                        Log.InfoFormat("Server file path: " + file.LocalFileName);
                        string filename = file.LocalFileName;
                        switch (name.ToUpper())
                        {
                            case "OLDPHOTO":
                                w.OldPhoto = File.ReadAllBytes(filename);
                                break;
                            case "NEWPHOTO":
                                w.NewPhoto= File.ReadAllBytes(filename);
                                break;
                            case "PHOTO3":
                                w.Photo3= File.ReadAllBytes(filename);
                                break;
                            case "PHOTO4":
                                w.Photo4 = File.ReadAllBytes(filename);
                                break;
                            case "PHOTO5":
                                w.Photo5 = File.ReadAllBytes(filename);
                                break;
                            case "PHOTO6":
                                w.Photo6 = File.ReadAllBytes(filename);
                                break;
                            case "PHOTO7":
                                w.Photo7 = File.ReadAllBytes(filename);
                                break;

                            case "SIG1":
                                w.Sig1= File.ReadAllBytes(filename);
                                break;

                            default:
                                break;
                   
                        }
                    
                    }
                    
                
                    foreach (var key in provider.FormData.AllKeys)
                    {
                        foreach (var val in provider.FormData.GetValues(key))
                        {
                            Log.InfoFormat(string.Format("Reading Form Data {0}: {1}", key, val));
                            try
                            {
                                switch (key.ToUpper())
                                {
                                    case "DEVICEID": w.DeviceID = val;
                                        break;
                                    case "INSTALLERID": w.InstallerID = Int32.Parse(val);
                                        break;
                                    case "PROJECTID": w.ProjectInventoryID = Int32.Parse(val);
                                        break;
                                    
                                    case "JOBCOMPLETE": w.JobComplete = GetCheckBox(val);
                                        break;
                                    case "JOBSKIPPED": w.JobSkipped = GetCheckBox(val);
                                        break;
                                    case "COMPOUNDMETER": w.CompoundMeter = GetCheckBox(val);
                                        break;
                                    case "SKIPREASON": w.SkipReason= val;
                                        break;
                                    case "OLDSIZE": w.OldSize = val;
                                        break;
                                    case "NEWSIZE": w.NewSize = val;
                                        break;
                                    case "PREVREAD": w.PrevRead = Int32.Parse(val);
                                        break;
                                    case "NEWREAD": w.NewRead = Int32.Parse(val);
                                        break;
                                    case "OLDREAD": w.OldRead = Int32.Parse(val);
                                        break;
                                    case "ALTREAD": w.AltRead = Int32.Parse(val);
                                        break;
                                    case "NEWSERIAL": w.NewSerial = Int32.Parse(val);
                                        break;
                                    case "CORRECTSERIAL": w.CorrectSerial = Int32.Parse(val);
                                        break;
                                    case "PLUMBINGTIME": w.PlumbingTime = Int32.Parse(val);
                                        break;
                                    case "WIRINGTIME": w.WiringTime = Int32.Parse(val);
                                        break;
                                    case "NOTES": w.Notes= val;
                                        break;
                                    case "NEWREMOTEID": w.NewRemoteID = Int32.Parse(val);
                                        break;
                                    case "OLD_GPS":
                                        {
                                           Log.InfoFormat( val.Split(',')[0]);
                                           Log.InfoFormat(val.Split(',')[1]);

                                            w.OldPhotoLatitude = Double.Parse(val.Split(',')[0]);
                                            w.OldPhotoLongitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "NEW_GPS":
                                        {
                                            w.NewPhotoLatitude = Double.Parse(val.Split(',')[0]);
                                            w.NewPhotoLongitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "P3_GPS":
                                        {
                                            w.Photo3Latitude = Double.Parse(val.Split(',')[0]);
                                            w.Photo3Longitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "P4_GPS":
                                        {
                                            w.Photo4Latitude = Double.Parse(val.Split(',')[0]);
                                            w.Photo4Longitude = Double.Parse(val.Split(',')[1]);

                                        }

                                        break;
                                    case "P5_GPS":
                                        {
                                            w.Photo5Latitude = Double.Parse(val.Split(',')[0]);
                                            w.Photo5Longitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "P6_GPS":
                                        {
                                            w.Photo6Latitude = Double.Parse(val.Split(',')[0]);
                                            w.Photo6Longitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "P7_GPS":
                                        {
                                            w.Photo7Latitude = Double.Parse(val.Split(',')[0]);
                                            w.Photo7Longitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;
                                    case "SUBMIT_GPS":
                                        {

                                            w.JobSubmissionLatitude = Double.Parse(val.Split(',')[0]);
                                            w.JobSubmissionLongitude = Double.Parse(val.Split(',')[1]);

                                        }
                                        break;



                                    default:
                                        break;
                                }
                            }
                            catch(Exception ex)
                            {
                                Log.ErrorFormat("Error occured while parsing form data\n {0}",ex.ToString());
                            }

                        }
                    }
                    
                        
                         
                    w.InstallDate = DateTime.Now ;
                    Log.InfoFormat("Now calling Save");
                    var saveResultSet = context.SaveWorkOrder(w.DeviceID, w.ProjectInventoryID,  w.ScheduleID,w.InstallerID, DateTime.Now, w.NewSerial, w.CorrectSerial, w.PrevRead, w.OldRead, w.NewRead, w.AltRead, w.PlumbingTime,w.WiringTime, w.NewRemoteID, w.OldSize, w.NewSize, w.OldPhoto, w.NewPhoto, w.Photo3, w.Photo4, w.Photo5, w.Sig1, w.Notes , w.SkipReason, w.JobComplete, w.JobSkipped, w.CompoundMeter, w.Photo6, w.Photo7,w.OldPhotoLatitude, w.OldPhotoLongitude , w.NewPhotoLatitude, w.NewPhotoLongitude, w.Photo3Latitude, w.Photo3Longitude, w.Photo4Latitude, w.Photo4Longitude, w.Photo5Latitude, w.Photo5Longitude, w.Photo6Latitude, w.Photo6Longitude, w.Photo7Latitude, w.Photo7Longitude, w.JobSubmissionLatitude, w.JobSubmissionLongitude);
                   // int recordsAffected = context.SaveChanges();
                    Log.InfoFormat("Save called successfully");
                    SaveWorkOrder_Result i1 = saveResultSet.FirstOrDefault();
                    int recordsAffected = i1.RESULT;
                    Log.InfoFormat("number of records updated->" + recordsAffected);
                    foreach (var e in context.GetValidationErrors())
                    {
                        Log.ErrorFormat(e.ValidationErrors.ToString());
                    }
                    if (recordsAffected == 1)
                    {
                        return Request.CreateResponse(HttpStatusCode.Created);
                    }
                    else
                    {
                        return Request.CreateResponse(HttpStatusCode.NotFound);
                    }
                   
                }
              
            }
            catch (System.Exception e)
            {
                Log.ErrorFormat(e.ToString());
                return Request.CreateErrorResponse(HttpStatusCode.InternalServerError, e);
            }
        }

        private Boolean GetCheckBox(string val)
        {
            if (val == "1")
                return true;
            else
                return false;
        }


        private static void getKeyValues
(MultipartFormDataStreamProvider provider, ref int? ScheduleID, ref int? InstallerID, ref string DeviceID, ref int? ProjectID)
        {
            foreach (var key in provider.FormData.AllKeys)
            {
                foreach (var val in provider.FormData.GetValues(key))
                {
                    Log.InfoFormat(string.Format("{0}: {1}", key, val));
                    try
                    {
                        switch (key.ToUpper())
                        {
                            case "INSTALLERID": InstallerID = Int32.Parse(val);
                                break;
                            case "SCHEDULEID": ScheduleID = Int32.Parse(val);
                                break;
                            case "DEVICEID": DeviceID = val;
                                break;
                            case "PROJECTID": ProjectID = Int32.Parse(val); ;
                                break;

                            default:
                                break;
                        }
                    }
                    catch (Exception ex)
                    {
                        Log.ErrorFormat("Error occured while parsing form data\n {0}", ex.ToString());
                    }

                }
            }
        }

      
    }
}
