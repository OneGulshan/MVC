using MVC.Data;
using MVC.Models;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataContext db = new DataContext();
        public ActionResult Index()
        {
            return View(db.Employees.ToList());
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
                e.EmpOrganisationName = "ABC Organisation";
                db.Employees.Add(e);
                int a = db.SaveChanges();
                if(a > 0)
                {
                    TempData["InsertMessage"] = "Data has been Inserted !!";
                    //ModelState.Clear();
                    return RedirectToAction("Index");
                }                
            }
            else
            {
                ViewData["ErrorMessage"] = "<script>alert('Model is Not Valid !!')</script>";
            }
            return View();
        }
    }
}