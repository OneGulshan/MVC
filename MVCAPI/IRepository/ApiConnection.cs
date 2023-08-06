using System.Collections.Generic;
using System.Threading.Tasks;
using System;
using MVC.Models;

namespace MVCAPI.IRepository
{
    public class ApiConnection
    {
        Task<List<VehicleMasterModel>> GetDashboardVehicleMaster(Tuple<int, int, string, string> tup);
        Task<VehicleMasterModel> EditVehicleMaster(Int64 Id);
    }
}