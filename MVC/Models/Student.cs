using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace MVC.Models
{
    public class Student
    {
        [Key]
        public int Id { get; set; }
        public int Country { get; set; }
        public int State { get; set; }
        [NotMapped]
        public List<Country> Countries { get; set; }
        [NotMapped]
        public List<State> States { get; set; }
        [NotMapped]
        public string CountryName { get; set; }
        [NotMapped]
        public string StateName { get; set; }
    }
}