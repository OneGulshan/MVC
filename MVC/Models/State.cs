using System.ComponentModel.DataAnnotations;

namespace MVC.Models
{
    public class State
    {
        [Key]
        public int Sid { get; set; }
        public int Cid { get; set; }
        public string SName { get; set; }
    }
}