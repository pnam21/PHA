using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using PHA.Models;

namespace PHA.Repository
{

	public class DataContext : DbContext
	{
        

        public DataContext(DbContextOptions<DataContext> options) : base(options) 
		{
		}
		public DbSet<User> Users { get; set; }

	}
}
