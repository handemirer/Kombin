using BussinessLayer.Concrete;
using DataAccessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Kombin.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;

namespace Kombin.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        PostManager postManager = new PostManager(new EfPostRepository());

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index()
        {
            /*
            var userId = HttpContext.Session.GetString("userid");
            if (userId != null)
            {
                Context context = new Context();
                var loggedUser = context.Users.Find(Convert.ToInt32(userId));
                ViewBag.loggedUserName = loggedUser.UserFullname;
                ViewBag.loggedUserId = userId;
            }
            */
            return View();
        }

        public IActionResult Man()
        {

            var posts = postManager.GetListWithMainCategory(0);
            return View(posts);

        }
        public IActionResult Woman()
        {
            var posts = postManager.GetListWithMainCategory(1);
            return View(posts);
        }
        public IActionResult Explore()
        {
            var posts = postManager.GetList();
            return View(posts);
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
