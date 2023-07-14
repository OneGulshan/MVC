using MVC.Data;
using MVC.Models;
using System;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataContext db = new DataContext();
        public ActionResult Index()
        {
            var result = db.Employees.ToList();
            return View(result);
        }
        public ActionResult Create()
        {
            return View();
        }
        [HttpPost]
        public ActionResult Create(Employee e)
        {
            if (ModelState.IsValid == true)
            {
                db.Employees.Add(e);
                int a = db.SaveChanges();
                if(a > 0)
                {
                    TempData["SuccessMessage"] = "<script>alert('Data has been submitted !!')</script>";//mot Worked Recheck
                    //ModelState.Clear();//NoReq When Redirect to Another View
                    return RedirectToAction("Index");
                }
                else
                {
                    ViewData["ErrorMessage"] = "<script>alert('Model is Not Valid !!')</script>";
                }
            }
            return View();
        }
    }
}