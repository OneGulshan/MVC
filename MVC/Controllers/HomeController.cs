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
            if (id == 0)
            {
                return View(db.Employees.ToList());
            }
            else if (id == 1)
            {
                return Json(new { rows = db.Employees.ToList<Employee>() }, JsonRequestBehavior.AllowGet);
            }
            return null;
        }

        public ActionResult Create(int id)
        {
            ViewBag.BT = "Create";
            if (id > 0)
            {
                ViewBag.BT = "Update";
                return View(db.Employees.Where(_ => _.EmployeeId == id).FirstOrDefault());
            }
            else
            {
                return View();
            }
        }
        [HttpPost]
        public ActionResult Create(Employee e, int id = 0)
        {
            if (ModelState.IsValid == true)
            {
                e.EmpOrganisationName = "ABC Organisation";
                if (id == 0)
                {
                    db.Employees.Add(e);
                    int a = db.SaveChanges();
                    if (a > 0)
                    {
                        TempData["InsertMessage"] = "Data has been Inserted Successfuly !!";
                        return RedirectToAction("Index");
                    }
                }
                else
                {
                    db.Entry(e).State = System.Data.Entity.EntityState.Modified;
                    int a = db.SaveChanges();
                    if (a > 0)
                    {
                        TempData["InsertMessage"] = "Data has been Updated Successfuly !!";
                        return RedirectToAction("Index");
                    }
                }
            }
            else if (e.EmployeeId > 0)
            {
                ViewBag.BT = "Update";
                ViewData["ErrorMessage"] = "<script>alert('Model is Not Valid !!')</script>";
            }
            return View(e);
        }
        public ActionResult Delete(int id)
        {
            var row = db.Employees.Where(_ => _.EmployeeId == id).FirstOrDefault();
            db.Employees.Remove(row);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}