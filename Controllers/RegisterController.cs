using Microsoft.AspNetCore.Mvc;
using PHA.Models;
using PHA.Repository;

namespace PHA.Controllers
{
    public class RegisterController : Controller
    {
        //get
        public IActionResult RegisterPage()
        {
            return View("register");
        }
        
    }
}

