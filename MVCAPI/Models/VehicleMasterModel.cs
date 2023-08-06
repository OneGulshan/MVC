using System;
using System.ComponentModel.DataAnnotations;

namespace MVCAPI.Models
{
    public class VehicleMaster
    {
        public int VehicleId { get; set; }
        [StringLength(13, MinimumLength = 4, ErrorMessage = "Vehicle Code Length Min 4 and Max 13 Char")]
        public string VehicleCode { get; set; }
        [StringLength(200, MinimumLength = 10, ErrorMessage = "Vehicle Name Length Min 10 and Max 200 Char")]
        public string VehicleName { get; set; }
        public Int64 TransporterId { get; set; }
        public string TransporterName { get; set; }
        [StringLength(13, MinimumLength = 7, ErrorMessage = "Vehicle Number Length Min 7 and Max 13 Char")]
        public string VehicleNumber { get; set; }
        public DateTime RegistrationDate { get; set; }
        public DateTime VehicleValidupto { get; set; }
        [Display(Name = "Vehicle Condition")]
        [Required(ErrorMessage = "Vehicle Condition is required.")]
        public int VehicleCondition { get; set; }
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Chasis No Length Max 30 Char")]
        public string ChasisNo { get; set; }
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Engine No Length Max 30 Char")]
        public string EngineNo { get; set; }
        [StringLength(100, MinimumLength = 1, ErrorMessage = "Company No Length Max 100 Char")]
        public string Company { get; set; }
        [StringLength(100, MinimumLength = 1, ErrorMessage = "Brand No Length Max 100 Char")]
        public string Brand { get; set; }
        [StringLength(100, MinimumLength = 1, ErrorMessage = "Vehicle Model Length Max 100 Char")]
        public string VehicleModel { get; set; }
        [StringLength(30, MinimumLength = 1, ErrorMessage = "Color Length Max 30 Char")]
        public string Color { get; set; }
        public TypeofFuelList TypeofFuel { get; set; }
        [Range(1, 99, ErrorMessage = "Type of Fuel Length Max 2 Number")]
        public Nullable<byte> NumberofTyres { get; set; }
        [RegularExpression(@"^\d+(\.\d{1,3})?$", ErrorMessage = "Max 3 Digits Allowed !!")]
        [Range(0, 9999.999, ErrorMessage = "Please Enter Max Range 9999.999 !!")]
        public decimal MaximumCapacityofFuelTanker { get; set; }
        public int DriverSeat { get; set; }
        [RegularExpression(@"^\d+(\.\d{1,3})?$", ErrorMessage = "Max 3 Digits Allowed !!")]
        [Range(0, 99999.999, ErrorMessage = "Please Enter Max Range 99999.999 !!")]
        public decimal StandardWeightofVehicle { get; set; }
        [RegularExpression(@"^\d+(\.\d{1,3})?$", ErrorMessage = "Max 3 Digits Allowed !!")]
        [Range(0, 99999.999, ErrorMessage = "Please Enter Max Range 99999.999 !!")]
        public decimal MaximumLoadingCapacity { get; set; }
        public DateTime PollutionCertExpiryDate { get; set; }
        public DateTime PermitExpiryDate { get; set; }
        public DateTime FitnessCertExpiryDate { get; set; }
        public DateTime InsuranceExpiryDate { get; set; }
        //public List<UDFDetail> MainUDFList { get; set; }
    }
    public enum TypeofFuelList
    {
        Diesel = 1,
        Petrol = 2,
        GAS = 3,
        Electric = 4,
        Others = 5
    }
}