using Microsoft.EntityFrameworkCore;
using PHA.Models;

namespace PHA.Database
{
    public class ApplicationDbContext : DbContext
    {
        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        { 
        }
        public DbSet<User> Users { get; set; }
    }
}
