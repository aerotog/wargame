using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Transactions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wargame.Models;
using Wargame.Models.Units;
using Wargame.Repositories.Data;
using Wargame.Repositories.Entities;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Wargame.Controllers
{
    //[Route("api/[controller]")]
    [ApiController]
    public class UnitsController : ControllerBase
    {
        private readonly WargameContext _context;
        private readonly IEnumerable<IUnit> _units;

        public UnitsController(IEnumerable<IUnit> units, WargameContext context)
        {
            _units = units;
            _context = context;
        }
        //// GET: api/<UnitsController>
        //[HttpGet]
        //public IEnumerable<string> Get()
        //{
        //    return new string[] { "value1", "value2" };
        //}

        // GET api/<UnitsController>/5
        [HttpGet("api/user/{userId}/build")]
        public string Get(int userId)
        {
            return userId.ToString();
        }

        //// POST api/<UnitsController>
        [HttpPost("api/user/{userId}/build/{unitId}")]
        public async Task<bool> PostAsync(long userId, string unitId)
        {
            Enum.TryParse(unitId, out UnitTypes unitType);
            var unit = _units.Single(x => x.Type == unitType);

            var built = false;

            await using var transaction = await _context.Database.BeginTransactionAsync();

            var userLand = await _context.resources.FindAsync(userId, (int)ResourceTypes.Land);
            var userPop = await _context.resources.FindAsync(userId, (int)ResourceTypes.Population);
            var userResource = await _context.resources.FindAsync(userId, (int)unit.ResourceCostType);

            if (userLand.count > unit.LandCost
                && userPop.count > unit.PopCost
                && userResource.count > unit.ResourceCost)
            {
                if (unit.LandCost > 0)
                {
                    userLand.count -= unit.LandCost;
                    _context.Entry(userLand).State = EntityState.Modified;
                }

                if (unit.PopCost > 0)
                {
                    userPop.count -= unit.PopCost;
                    _context.Entry(userPop).State = EntityState.Modified;
                }

                if (unit.ResourceCost > 0)
                {
                    userResource.count -= unit.ResourceCost;
                    _context.Entry(userResource).State = EntityState.Modified;
                }

                var unitEntity = await _context.units.FindAsync(userId, (int) unit.Type);

                if (unitEntity != null)
                {
                    unitEntity.count += 1;
                    _context.Entry(unitEntity).State = EntityState.Modified;
                }
                else
                { 
                    unitEntity = new Units
                    {
                        count = 1,
                        type_id = (int)unit.Type,
                        user_id = userId
                    };
                    _context.units.Add(unitEntity);
                }

                built = true;
                await _context.SaveChangesAsync();
            }
            await transaction.CommitAsync();


            return built;
        }

        //// PUT api/<UnitsController>/5
        //[HttpPut("{unitId}")]
        //public void Put(int unitId, [FromBody] string value)
        //{
        //}

        //// DELETE api/<UnitsController>/5
        //[HttpDelete("{unitId}")]
        //public void Delete(int unitId)
        //{
        //}
    }
}
