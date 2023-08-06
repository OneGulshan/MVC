using MVC.Data;
using MVC.Models;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;

namespace MVC.Controllers
{
    public class StudentController : Controller
    {
        readonly DataContext _db = new DataContext();
        public ActionResult Index()
        {
            var result = (from a in _db.Student
                          join b in _db.Country
                          on a.Country equals b.Cid
                          join c in _db.State
                          on a.State equals c.Sid
                          select new
                          {
                              a.Id,
                              b.CName,
                              c.SName
                          }).ToList();

            List<Student> vm = new List<Student>();

            foreach (var i in result)
            {
                vm.Add(new Student
                {
                    Id = i.Id,
                    CountryName = i.CName,
                    StateName = i.SName
                });
            }
            return View(vm);
        }

        public ActionResult Create(Student std)
        {
            if (std.Id > 0)
            {
                ViewBag.Bt = "Update";
                var result = _db.Student.Where(_ => _.Id == std.Id).ToList();
                std.State = result[0].State;
                std.Country = result[0].Country;
                std.Countries = _db.Country.ToList();
                std.States = _db.State.Where(_ => _.Cid == std.Country).ToList();
                return View(std);
            }
            else
            {
                ViewBag.Bt = "Create";
                Student _std = new Student
                {
                    Countries = _db.Country.ToList(),
                    States = _db.State.Where(_ => _.Cid == std.Country).ToList()
                };
                return View(_std);
            }
        }

        [HttpPost]
        [ActionName("Create")]
        public ActionResult CreateUpdate(Student std)
        {
            if (std.Id > 0)
            {
                _db.Entry(std).State = System.Data.Entity.EntityState.Modified;
            }
            else
            {
                _db.Student.Add(std);
            }
            _db.SaveChanges();
            return RedirectToAction("Index");
        }

        public JsonResult GetStatesByCountry(int id)
        {
            var result = _db.State.Where(_ => _.Cid == id).ToList();
            return Json(result, JsonRequestBehavior.AllowGet);
        }

        public ActionResult Delete(int id)
        {
            var result = _db.Student.Where(_ => _.Id == id).FirstOrDefault();
            _db.Student.Remove(result);
            _db.SaveChanges();
            return RedirectToAction("Index");
        }
    }
}