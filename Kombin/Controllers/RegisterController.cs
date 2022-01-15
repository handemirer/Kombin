using BussinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace Kombin.Controllers
{
    public class RegisterController : Controller
    {

        UserManager userManager = new UserManager(new EfUserRepository());

        [HttpGet]
        [AllowAnonymous]
        public IActionResult Index()
        {
            return View();
        }


        [HttpPost]
        [AllowAnonymous]
        public IActionResult Index(User user)
        {
            user.Role = 1;

            using (var sha256provider = new SHA256CryptoServiceProvider())
            {
                var hash = sha256provider.ComputeHash(Encoding.UTF8.GetBytes(user.UserPassword));
                user.UserPassword = BitConverter.ToString(hash).Replace("-", "");
            }

            userManager.Add(user);
            return RedirectToAction("Index", "Home");
            //return View();
        }

    }
}
