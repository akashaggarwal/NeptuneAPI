using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace NeptuneWeb.Controllers
{
    public class HomeController : Controller
    {
        //
        // GET: /Home/
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ShowSchedules()
        {
            
            return View();
        }

        public ActionResult CreateWorkOrder()
        {
            return View();
        }


	}
}