using MVC.Data;
using MVC.Models;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class HomeController : Controller
    {
        private readonly DataContext db = new DataContext();
        public ActionResult Index(int id = 0)
        {
            if(id == 0)
            {
                return View(db.Employees.ToList());
            }
            else if(id == 1)
            {
                return Json(new { rows = db.Employees.ToList<Employee>() }, JsonRequestBehavior.AllowGet);
            }
            return null;
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