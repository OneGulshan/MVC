namespace MVC.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class addvehiclemaster : DbMigration
    {
        public override void Up()
        {
            DropTable("dbo.VehicleMasters");
        }
        
        public override void Down()
        {
            CreateTable(
                "dbo.VehicleMasters",
                c => new
                    {
                        VehicleId = c.Int(nullable: false, identity: true),
                        VehicleCode = c.String(),
                        VehicleName = c.String(),
                        TransporterId = c.Long(nullable: false),
                        VehicleNumber = c.String(),
                        RegistrationDate = c.DateTime(),
                        VehicleValidUpto = c.DateTime(),
                        VehicleCondition = c.Int(nullable: false),
                        ChasisNo = c.String(),
                        EngineNo = c.String(),
                        Company = c.String(),
                        Brand = c.String(),
                        VehicleModel = c.String(),
                        Color = c.String(),
                        TypeofFuel = c.Int(nullable: false),
                        NumberofTyres = c.Byte(),
                        MaximumCapacityofFuelTanker = c.Decimal(precision: 18, scale: 2),
                        DriverSeat = c.Int(),
                        StandardWeightofVehicle = c.Decimal(precision: 18, scale: 2),
                        MaximumLoadingCapacity = c.Decimal(precision: 18, scale: 2),
                        PollutionCertExpiryDate = c.DateTime(nullable: false),
                        PermitExpiryDate = c.DateTime(nullable: false),
                        FitnessCertExpiryDate = c.DateTime(nullable: false),
                        InsuranceExpiryDate = c.DateTime(nullable: false),
                        RECORD_STATUS = c.String(),
                        RECORD_CREATED_BY = c.Long(nullable: false),
                        RECORD_CREATED_ON = c.DateTime(nullable: false),
                        RECORD_UPDATED_BY = c.Long(),
                        RECORD_UPDATED_ON = c.DateTime(),
                        ORIGINAL_RECORD = c.String(),
                        CompanyId = c.Long(nullable: false),
                        FYId = c.Long(nullable: false),
                        IsApproved = c.Byte(nullable: false),
                    })
                .PrimaryKey(t => t.VehicleId);
            
        }
    }
}
