using ACibao.Context;
using ACibao.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace ACibao.Services
{
    public interface IGetPowerInfo
    {
        Task<List<Powerinfo>> PowerInfo();
        Task<List<Powerinfo>> PowerInfoCedula(string cedula);
    }

    public class GetPowerInfo : IGetPowerInfo
    {
        protected readonly ApplicationDbContext _context;

        public GetPowerInfo(ApplicationDbContext context)
        {
            _context = context;
        }

        public async Task<List<Powerinfo>> PowerInfo()
        {
            Random rnd = new Random();

            int itemtypegroupnum = 2;
            int itemtypenum = 3;
            var result = await _context.powerinfo.FromSqlRaw("EXEC GetPowerInfo @itemtypegroupnum = {0}, @itemtypenum = {1}", itemtypegroupnum, itemtypenum).ToListAsync();

            var ejemplo2 = result.OrderBy(x => rnd.Next()).ToList();

            return ejemplo2;
        }

        public async Task<List<Powerinfo>> PowerInfoCedula(string cedula)
        {
            int itemtypegroupnum = 2;
            int itemtypenum = 3;
            var result = await _context.powerinfo.FromSqlRaw("EXEC GetPowerInfoCedula @itemtypegroupnum = {0}, @itemtypenum = {1}, @cedula = {2}", itemtypegroupnum, itemtypenum, cedula).ToListAsync();

            return result;
        }
    }
}
