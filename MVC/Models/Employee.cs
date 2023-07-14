using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MVC.Models
{
    public class Employee
    {
        [Key]
        [DisplayName("ID")]
        [Required]
        public int EmployeeId { get; set; }
        [Required(ErrorMessage = "Name is mandatory")]
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Name Should be in between 5 and 20")]
        public string EmployeeName { get; set; }
        [Required]
        [Range(20,60, ErrorMessage = "Age should be in the range of 20 and 60")]
        public int? EmployeeAge { get; set; }
        [Required]
        [RegularExpression("^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$", ErrorMessage = "Invalid Email")]
        public string EmployeeEmail { get; set; }
        [Required]
        [RegularExpression(@"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$", ErrorMessage = "UpperCase, LowerCase, Numbers, Symbols, 8 Characters")]
        [DataType(DataType.Password)]
        public string EmpPassword { get; set; }
        [Required]
        [Compare("EmpPassword",ErrorMessage = "Password is not identical")]//identical(same)
        public string EmpConfirmPassword { get; set; }
        [Required]
        [RegularExpression(@"^\d+(\.\d{1,3})?$", ErrorMessage = "Max 3 Digits Allowed !!")]
        [Range(0.999, 9999.999, ErrorMessage = "Please Enter Max Range 9999 !!")]
        public decimal? Decimal { get; set; }
        [ReadOnly(true)]
        public string EmpOrganisationName { get; set; }
        [DataType(DataType.MultilineText)]
        public string Address { get; set; }
        [DataType(DataType.Date)]//Provide Calendar For Date Picking
        [DisplayName("Joining Date")]
        public string JoningDate { get; set; }
        [DataType(DataType.Time)]//Provide Calendar For Time Picking
        [DisplayName("Joining Time")]
        public string JoiningTime { get; set; }
    }
}
