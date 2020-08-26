using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Wargame.Data;
using Wargame.Dtos;

namespace Wargame.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ResourcesController : ControllerBase
    {
        private readonly WargameContext _context;

        public ResourcesController(WargameContext context)
        {
            _context = context;
        }

        // GET: api/resources
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Resources>>> GetResources()
        {
            return await _context.resources.ToListAsync();
        }

        // GET: api/resources/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Resources>> GetResources(int id)
        {
            var resources = await _context.resources.FindAsync(id);

            if (resources == null)
            {
                return NotFound();
            }

            return resources;
        }

        // PUT: api/resources/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutResources(int id, Resources resources)
        {
            //if (id != resources.Id)
            //{
            //    return BadRequest();
            //}

            _context.Entry(resources).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ResourcesExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/resources
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Resources>> PostResources(Resources resources)
        {
            _context.resources.Add(resources);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetResources", new { id = resources.user_id }, resources);
        }

        // DELETE: api/resources/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Resources>> DeleteResources(int id)
        {
            var resources = await _context.resources.FindAsync(id);
            if (resources == null)
            {
                return NotFound();
            }

            _context.resources.Remove(resources);
            await _context.SaveChangesAsync();

            return resources;
        }

        private bool ResourcesExists(int id)
        {
            return _context.resources.Any(e => e.user_id == id);
        }
    }
}
