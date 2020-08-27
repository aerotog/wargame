using Microsoft.EntityFrameworkCore;
using Wargame.Repositories.Entities;

namespace Wargame.Repositories.Data
{
    public class WargameContext : DbContext
    {
        public WargameContext (DbContextOptions<WargameContext> options)
            : base(options)
        {
        }

        public DbSet<Resources> resources { get; set; }
        public DbSet<Units> units { get; set; }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseNpgsql("Host=127.0.0.1;Database=wargame;Username=postgres;Password=development");

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Resources>()
                .HasKey(o => new { o.user_id, o.type_id});

            modelBuilder.Entity<Units>()
                .HasKey(o => new { o.user_id, o.type_id });
        }
    }
}
