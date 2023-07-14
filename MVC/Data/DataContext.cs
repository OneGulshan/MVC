using MVC.Models;
using System.Data.Entity;

namespace MVC.Data
{
    public class DataContext : DbContext
    {
        public DbSet<Employee> Employees { get; set; }
    }
}