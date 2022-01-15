using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Kombin.Controllers
{

    public class LoginController : Controller
    {
        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [AllowAnonymous]
        public async Task<IActionResult> Index(User user)
        {
            using (var sha256provider = new SHA256CryptoServiceProvider())
            {
                var hash = sha256provider.ComputeHash(Encoding.UTF8.GetBytes(user.UserPassword));
                user.UserPassword = BitConverter.ToString(hash).Replace("-", "");
            }

            Context context = new Context();
            var dataValue = context.Users.FirstOrDefault(x => x.UserUsername == user.UserUsername && x.UserPassword == user.UserPassword);


            if (dataValue != null)
            {

                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name,user.UserUsername),
                    new Claim(ClaimTypes.Role, "Admin"),
                    new Claim("userid".ToString(),dataValue.UserId.ToString()),
                };

                HttpContext.Session.SetString("userid", dataValue.UserId.ToString());

                var userIdentity = new ClaimsIdentity(claims, "a");
                ClaimsPrincipal principal = new ClaimsPrincipal(userIdentity);
                await HttpContext.SignInAsync(principal);
                return RedirectToAction("Index", "Home");
            }
            else
            {

                return View();
            }
        }

        [AllowAnonymous]
        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            HttpContext.Session.Clear();
            return View();
        }
    }
}
