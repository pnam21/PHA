using Microsoft.AspNetCore.Mvc;
using PHA.Database;
using PHA.Models;

namespace PHA.Controllers
{
    public class RegisterController : Controller
    {
        private readonly ApplicationDbContext _context;
        public RegisterController(ApplicationDbContext context)
        {
            _context = context ?? throw new ArgumentNullException(nameof(context));
        }
        [Route("register")]
        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }
        [HttpPost]
        public async Task<IActionResult> Register(User user)
        {
            if (!ModelState.IsValid)
            {
                return View(user);
            }
            return View(user);
			try
			{
				_context.Users.Add(user);
				await _context.SaveChangesAsync(); // Lưu vào database

				return RedirectToAction("login"); // Điều hướng tới trang đăng nhập
			}
			catch (Exception ex)
			{
				// Log lỗi nếu có (có thể ghi vào console hoặc file log)
				Console.WriteLine(ex.Message);
				ModelState.AddModelError("", "Có lỗi xảy ra, vui lòng thử lại!"); // Thêm lỗi vào ModelState
				return View(user); // Trả lại view với thông báo lỗi
			}
		}
    }
}

