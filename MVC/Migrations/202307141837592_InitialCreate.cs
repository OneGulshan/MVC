namespace MVC.Migrations
{
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Employees",
                c => new
                    {
                        EmployeeId = c.Int(nullable: false, identity: true),
                        EmployeeName = c.String(nullable: false, maxLength: 20),
                        EmployeeAge = c.Int(nullable: false),
                        EmployeeEmail = c.String(nullable: false),
                        EmpPassword = c.String(nullable: false),
                        EmpConfirmPassword = c.String(nullable: false),
                        Decimal = c.Decimal(nullable: false, precision: 18, scale: 2),
                        EmpOrganisationName = c.String(),
                        Address = c.String(),
                        JoningDate = c.String(),
                        JoiningTime = c.String(),
                    })
                .PrimaryKey(t => t.EmployeeId);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Employees");
        }
    }
}
