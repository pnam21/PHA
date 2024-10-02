using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Scripting;
using PHA.Models;
using PHA.Repository;

namespace PHA.Controllers
{
    public class RegisterController : Controller
    {
        private readonly DataContext _context;

        public RegisterController(DataContext context)
        {
            _context = context;
        }

        // GET
        public ActionResult RegisterPage()
        {
            return View("Register");
        }

        // POST
        [HttpPost]
        public ActionResult Register(User model)
        {
            if (ModelState.IsValid)
            {
                var x = _context.Users.ToList();

                if (_context.Users.Any(u => u.UserName.Equals(model.UserName) || u.Email.Equals(model.Email)))
                {
                    ModelState.AddModelError("", "Username or Email already exists.");
                    return View(model);
                }


                var user = new User
                {
                    FullName = model.FullName,
                    UserName = model.UserName,
                    Password = model.Password,
                    PhoneNumber = model.PhoneNumber,
                    Email = model.Email
                };

                _context.Users.Add(user);
                _context.SaveChanges();

                return RedirectToAction("LoginPage", "Login");
            }

            return View(model);
        }


    }
}

