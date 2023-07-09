using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace MVC.Models
{
    public class Employee
    {
        [DisplayName("ID")]
        [Required]//Default Message
        public int EmployeeId { get; set; }
        [Required(ErrorMessage = "Name is mandatory")]//Custom Message
        [StringLength(20, MinimumLength = 5, ErrorMessage = "Name Should be in between 5 and 20")]
        public string EmployeeName { get; set; }
        [Range(20,60, ErrorMessage = "Age should be in the range of 20 and 60")]
        public int? EmployeeAge { get; set; }
        public string EmployeeGender { get; set; }
        [RegularExpression("^([0-9a-zA-Z]([-\\.\\w]*[0-9a-zA-Z])*@([0-9a-zA-Z][-\\w]*[0-9a-zA-Z]\\.)+[a-zA-Z]{2,9})$", ErrorMessage = "Invalid Email")]
        public string EmployeeEmail { get; set; }
        [RegularExpression(@"(?=^.{8,}$)((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[A-Z])(?=.*[a-z]).*$", ErrorMessage = "UpperCase, LowerCase, Numbers, Symbols, 8 Characters")]//@ <- Verbatim Litteral For Esscape Sequences reading as a normal character like \d etc.
        public string EmpPassword { get; set; }
        [Compare("EmpPassword",ErrorMessage = "Password is not identical")]//identical(same)
        public string EmpConfirmPassword { get; set; }
        [RegularExpression(@"^\d+(\.\d{1,3})?$", ErrorMessage = "Max 3 Digits Allowed !!")]
        [Range(0.999, 9999.999, ErrorMessage = "Please Enter Max Range 9999 !!")]
        public decimal? Decimal { get; set; }
    }
}//Note:- Every DataAnotation its own Default Message but we can declare own Custom Message,
//if auto required message showed other prop's without data anotation providing please provide null by ? that's prop