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
            ViewData["CurrentTime"] = DateTime.Now.ToLongTimeString();//7:18:54 PM

            string[] Fruits = { "Apple", "Banana", "Grapes", "Orange" };
            ViewData["FruitsArray"] = Fruits;
            ViewData["SportsList"] = new List<string>()//List is a Generic Class
            {
                "Cricket",
                "Hockey",
                "Football",
                "Volley Ball"
            };

            Employee Gulshan = new Employee//Model has no data so, I provided static
            {
                EmployeeId = 1,
                EmployeeName = "Gulshan",
                EmployeeEmail = "gulshankumar.mailid01@gmail.com"
            };
            ViewData["Employee"] = Gulshan;//object passing in ViewData
            //---------------------------------------------------------------------------------------------

            ViewBag.Message = "Message from View Bag !!";
            ViewBag.CurrentTime = DateTime.Now.ToLocalTime();//8/30/2023 7:19:25 PM
            ViewBag.FruitsArray = Fruits;
            ViewBag.SportsList = new List<string>()
            {
                "Cricket",
                "Hockey",
                "Football",
                "Volley Ball"
            };
            ViewBag.Employee = Gulshan;
            //---------------------------------------------------------------------------------------------

            TempData["Data"] = "Message from Temp Data !!";
            string[] games = { "Cricket", "Hockey", "Football", "Volley Ball" };
            TempData["GamesArrays"] = games;
            return RedirectToAction(nameof(About));
            //return View();
        }
        public ActionResult About()
        {
            if (TempData["Data"] != null)
            {
                TempData["Data"].ToString();
            }
            TempData.Keep();
            return View();
        }
        public ActionResult Contact()
        {
            return View();
        }
    }
}