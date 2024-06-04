using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Mvc;
using MVC.Models;
using Newtonsoft.Json;

namespace MVC.Controllers
{
    public class JQueryController : Controller
    {
        private readonly SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Conn"].ConnectionString);
        public ActionResult Create()
        {
            return View();
        }

        public void InsertUpdate(Emp obj)
        {
            if (obj.Empid > 0)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@mode", 5);
                cmd.Parameters.AddWithValue("@empid", obj.Empid);
                cmd.Parameters.AddWithValue("@name", obj.Name);
                cmd.Parameters.AddWithValue("@address", obj.Address);
                cmd.Parameters.AddWithValue("@age", obj.Age);
                cmd.Parameters.AddWithValue("@country", obj.Country);
                cmd.Parameters.AddWithValue("@state", obj.State);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("sp_Employee", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                cmd.Parameters.AddWithValue("@mode", 1);
                cmd.Parameters.AddWithValue("@name", obj.Name);
                cmd.Parameters.AddWithValue("@address", obj.Address);
                cmd.Parameters.AddWithValue("@age", obj.Age);
                cmd.Parameters.AddWithValue("@country", obj.Country);
                cmd.Parameters.AddWithValue("@state", obj.State);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        public JsonResult GetAllData()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 2);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string pp = JsonConvert.SerializeObject(dt);
            return Json(pp, JsonRequestBehavior.AllowGet); // JsonRequestBehavior.AllowGet karne se hamara data direct json formate me hi parse ho rha hai serialize karne ke baad ab hamein sirf string data type pp variable ko hi sirf parse karna hoga jQuery wale func me ander ke data ko nahi
        }

        public void DeleteData(Emp obj)
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 3);
            cmd.Parameters.AddWithValue("@empid", obj.Empid);
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public JsonResult EditData(Emp obj)
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 4);
            cmd.Parameters.AddWithValue("@empid", obj.Empid);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string pp = JsonConvert.SerializeObject(dt);
            return Json(pp, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetAllCountry()
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 6);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string pp = JsonConvert.SerializeObject(dt);
            return Json(pp, JsonRequestBehavior.AllowGet);
        }

        public JsonResult GetStatebyCountry(int A)
        {
            SqlCommand cmd = new SqlCommand("sp_Employee", con)
            {
                CommandType = CommandType.StoredProcedure
            };
            cmd.Parameters.AddWithValue("@mode", 7);
            cmd.Parameters.AddWithValue("@cid", A);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string pp = JsonConvert.SerializeObject(dt);
            return Json(pp, JsonRequestBehavior.AllowGet);
        }
    }
}