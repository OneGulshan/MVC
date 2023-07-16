using MVC.ADO.Net;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class EmployeeController : Controller
    {
        readonly MVC_DBEntities1 db = new MVC_DBEntities1();
        public ActionResult Index()
        {
            return View(db.Employees_ADO.ToList());
        }
        public ActionResult Create(int id = 0)
        {
            ViewBag.Bt = "Create";
            if (id > 0)
            {
                ViewBag.Bt = "Update";
                return View(db.Employees_ADO.Where(_ => _.EmployeeId == id).FirstOrDefault());
            }
            else
            {
                return View();
            }
        }

        [HttpPost]
        public ActionResult Create(Employees_ADO e, int id)
        {
            e.EmpOrganisationName = "ABC Organization";
            if (id > 0)
            {
                db.Entry(e).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                db.Employees_ADO.Add(e);
            }
            db.SaveChanges();
            return RedirectToAction(nameof(Index));
        }

        public ActionResult Delete(int id)
        {
            var row = db.Employees_ADO.Where(_ => _.EmployeeId == id).FirstOrDefault();
            db.Employees_ADO.Remove(row);
            db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}