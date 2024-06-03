using System.Data.SqlClient;
using System.Data;
using System.IO;
using System;
using System.Web.Mvc;
using ClosedXML.Excel;

namespace MVC.Controllers
{
    public class TasksController : Controller
    {
        // GET: Tasks
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult ExportToExcel(FormCollection formCollection)
        {
            DataTable dt = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter();
            try
            {
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_SelectEmployee", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                da.SelectCommand = cmd;
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    dt.TableName = "Employee";
                    using (XLWorkbook wb = new XLWorkbook())
                    {
                        wb.Worksheets.Add(dt);
                        wb.Style.Alignment.Horizontal = XLAlignmentHorizontalValues.Center;
                        wb.Style.Font.Bold = true;
                        Response.Clear();
                        Response.Buffer = true;
                        Response.Charset = "";
                        Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheet.sheet";
                        Response.AddHeader("content-disposition", "attachment;filename=EmployeeList.xlsx");
                        using (MemoryStream ms = new MemoryStream())
                        {
                            wb.SaveAs(ms);
                            ms.WriteTo(Response.OutputStream);
                            Response.Flush();
                            Response.Close();
                        }
                    };
                }
            }
            catch (Exception)
            {

                throw;
            }
            return View();
        }
    }
}