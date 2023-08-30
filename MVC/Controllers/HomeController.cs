using MVC.Models;
using System;
using System.Collections.Generic;
using System.Web.Mvc;
using System.Web.UI;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        // GET: Home
        public ActionResult Index()
        {
            ViewData["Message"] = "Message from View Data !!";
            ViewData["CurrentTime"] = DateTime.Now.ToLongTimeString();

            string[] Fruits = { "Apple", "Banana", "Grapes", "Orange" };
            ViewData["FruitsArray"] = Fruits;
            ViewData["SportsList"] = new List<string>()//List is a Generic Class
            {
                "Cricket",
                "Hockey",
                "Football",
                "Volley Ball"
            };

            Employee Gulshan = new Employee();//Model has no data so, I provided static
            Gulshan.EmployeeId = 1;
            Gulshan.EmployeeName = "Gulshan";
            Gulshan.EmployeeEmail = "gulshankumar.mailid01@gmail.com";
            ViewData["Employee"] = Gulshan;//object passing in ViewData
            //---------------------------------------------------------------------------------------------
            return View();
        }
    }
}