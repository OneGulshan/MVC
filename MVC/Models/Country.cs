using System.ComponentModel.DataAnnotations;

namespace MVC.Models
{
    public class Country
    {
        [Key]
        public int Cid { get; set; }
        public string CName { get; set; }
    }
}