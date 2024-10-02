using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System.Text;
using PHA.Models;
using PHA.Repository;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
using Microsoft.VisualStudio.Web.CodeGenerators.Mvc.Templates.BlazorIdentity.Pages;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace PHA.Controllers
{
    public class LoginController : Controller

{
    private readonly DataContext _context;

    public LoginController(DataContext context)
    {
        _context = context;
    }
        [HttpGet]
        public IActionResult LoginPage()
        {
            return View("Login");
        }
        [HttpPost]
    public IActionResult Login(User model)
    {
        if (ModelState.IsValid)
        {
            // Kiểm tra thông tin đăng nhập trong cơ sở dữ liệu
            var user = _context.Users.FirstOrDefault(u => u.UserName == model.UserName && u.Password == model.Password);

            if (user != null)
            {
                // Đăng nhập thành công, thực hiện các hành động cần thiết
                // Ví dụ: Lưu thông tin người dùng vào session
                return RedirectToAction("Index", "Home");
            }
            else
            {
                ModelState.AddModelError("", "Tài khoản hoặc mật khẩu không đúng");

            }
            }
        return View(model);
    }

    }
}




            
