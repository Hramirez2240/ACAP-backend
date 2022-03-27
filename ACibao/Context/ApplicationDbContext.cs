using ACibao.Entities;
using Microsoft.EntityFrameworkCore;

namespace ACibao.Context
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {

        }

        public DbSet<Itemdata> itemdata { get; set; }
        public DbSet<Itemdatapage> itemdatapage { get; set; }
        public DbSet<Physicalplatter> physicalplatter { get; set; }
        public DbSet<Powerinfo> powerinfo { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder
                .Entity<Powerinfo>(builder =>
                {
                    builder.HasNoKey();
                    builder.ToTable("PowerInfo");
                }));
        }
    }
}
