namespace MVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Init : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Countries",
                c => new
                    {
                        Cid = c.Int(nullable: false, identity: true),
                        CName = c.String(),
                    })
                .PrimaryKey(t => t.Cid);
            
            CreateTable(
                "dbo.States",
                c => new
                    {
                        Sid = c.Int(nullable: false, identity: true),
                        Cid = c.Int(nullable: false),
                        SName = c.String(),
                    })
                .PrimaryKey(t => t.Sid);
            
            CreateTable(
                "dbo.Students",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Country = c.Int(nullable: false),
                        State = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropTable("dbo.Students");
            DropTable("dbo.States");
            DropTable("dbo.Countries");
        }
    }
}
