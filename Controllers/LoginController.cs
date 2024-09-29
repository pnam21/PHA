using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
namespace PHA.Controllers
{
	public class LoginController : Controller
	{
		[Route("login")]
		[HttpGet]
		public IActionResult Index()
		{
			return View("Login");
		}


		// Deal with login logic
		[Route("login")]
		[HttpPost]
		public IActionResult Login()
		{ 
			return Redirect("home");
		}
	}
}
