using Microsoft.AspNetCore.Mvc;
using PHA.Models;
using PHA.Repository;
using System.Collections.Generic;
using System.Linq;

namespace PHA.Controllers
{
    public class DashboardController : Controller
    {
        private readonly DataContext _context;

        public DashboardController(DataContext context)
        {
            _context = context;
        }

        public IActionResult Index()
        {
            var user = _context.Users.ToList();
            return View(user);
        }

        [HttpGet]
        public JsonResult Search(string query, string filter)
        {
            var user = _context.Users.AsQueryable();


            return Json(user.ToList());
        }
    }
}
