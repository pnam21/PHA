﻿using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
namespace PHA.Controllers
{
	public class LoginController : Controller
	{
		[Route("login")]

		[HttpGet]
		public IActionResult LoginPage()
		{
			return View("Login");
		}



        
		[HttpPost]
		public IActionResult Login()
		{ 
			return Redirect("home");
		}
	}
}
