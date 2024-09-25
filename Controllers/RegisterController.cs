using Microsoft.AspNetCore.Mvc;
namespace PHA.Controllers
{
    public class Register : Controller
    {
        [Route("Register")]
        public IActionResult Index()
        {
            return View("Register");
        }
    }
}