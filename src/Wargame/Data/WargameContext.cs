using Microsoft.EntityFrameworkCore;
using Wargame.Dtos;

namespace Wargame.Data
{
    public class WargameContext : DbContext
    {
        public WargameContext (DbContextOptions<WargameContext> options)
            : base(options)
        {
        }

        public DbSet<Resources> resources { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseNpgsql("Host=127.0.0.1;Database=wargame;Username=postgres;Password=password");

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Resources>()
                .HasKey(o => new { o.user_id, o.type_id});
        }
    }
}
