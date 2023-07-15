using MVC.Models;
using System.Data.Entity;

namespace MVC.Data
{
    public class DataContext : DbContext
    {
        public DbSet<Employee> Employees { get; set; }
        public DbSet<Student> Student { get; set; }
        public DbSet<Country> Country { get; set; }
        public DbSet<State> State { get; set; }
    }
}