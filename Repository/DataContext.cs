using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using PHA.Models;

namespace PHA.Repository
{

	public class DataContext : IdentityDbContext<AppUserModel>
	{
		public DataContext(DbContextOptions<DataContext> options) : base(options) 
		{
		}
		public DbSet<AppUserModel> User { get; set; }

	}
}
