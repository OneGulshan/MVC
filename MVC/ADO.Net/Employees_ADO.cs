//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System.ComponentModel.DataAnnotations;

namespace MVC.ADO.Net
{
    public partial class Employees_ADO
    {
        [Key]
        public int EmployeeId { get; set; }
        public string EmployeeName { get; set; }
        public int EmployeeAge { get; set; }
        public string EmployeeEmail { get; set; }
        public string EmpPassword { get; set; }
        public string EmpConfirmPassword { get; set; }
        public decimal Decimal { get; set; }
        public string EmpOrganisationName { get; set; }
        public string Address { get; set; }
        public string JoningDate { get; set; }
        public string JoiningTime { get; set; }
    }
}
