using Microsoft.AspNetCore.Identity;
using System.ComponentModel.DataAnnotations;

namespace PHA.Models
{
    public class AppUserModel : IdentityUser
    {
        [Key] 
        public int user_id { get; set; }
        [Required(ErrorMessage = "Please fill in this blank")]
        public string UserName { get; set; }
        [Required(ErrorMessage = "Please fill in this blank")]
        public string Password { get; set; }
        [Required(ErrorMessage = "Please fill in this blank")]
        public string Email { get; set; }
        [Required(ErrorMessage = "Please fill in this blank")]
        public string FullName { get; set; }
        [Required(ErrorMessage = "Please fill in this blank")]
        public string PhoneNumber { get; set; }
        
        
    }
}
