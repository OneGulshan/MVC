using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;

namespace MVC
{
    public partial class PrintRDLC : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LocalReport rep = rptReportViewer.LocalReport;
                rep.ReportPath = "EmployeeList.rdlc";
                ReportDataSource rds = new ReportDataSource();

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter();
                SqlConnection con = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["DataContext"].ConnectionString);
                SqlCommand cmd = new SqlCommand("SP_SelectEmployee", con)
                {
                    CommandType = CommandType.StoredProcedure
                };
                da.SelectCommand = cmd;
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    rds.Name = "DS_PrintRDLC";
                    rds.Value = dt;
                    rep.DataSources.Add(rds);
                }
            }
        }
    }
}