using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
namespace PHA.Controllers
{
	public class LoginController : Controller
	{
		[Route("login")]
        public ActionResult LoginPage()
        {
            return View("login");
        }


        
		[HttpPost]
		public IActionResult Login()
		{ 
			return Redirect("home");
		}
	}
}
