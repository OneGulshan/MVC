namespace MVC.Migrations
{
    using System.Data.Entity.Migrations;

    internal sealed class Configuration : DbMigrationsConfiguration<MVC.Data.DataContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
            ContextKey = "MVC.Data.DataContext";
        }

        protected override void Seed(MVC.Data.DataContext context)
        {
        }
    }
}
