using BussinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Kombin.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using DataAccessLayer.Concrete;

namespace Kombin.Controllers
{
    public class PostController : Controller
    {
        PostManager postManager = new PostManager(new EfPostRepository());
        CategoryManager categoryManager = new CategoryManager(new EfCategoryRepository());
        UserManager userManager = new UserManager(new EfUserRepository());


        public IActionResult Index()
        {
            //postlarını görünütülemek için
            return View();
        }

        [HttpGet]
        public IActionResult AddPost()
        {
            //postlarını görünütülemek için
            List<Category> categories = categoryManager.GetList();
            return View(categories);
        }

        [HttpPost]
        public IActionResult AddPost(AddPost ad)
        {
            Post p = new Post();
            if (ad.imageFile != null)
            {
                var extension = Path.GetExtension(ad.imageFile.FileName);
                var newImageName = Guid.NewGuid() + extension;
                var location = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/imageFiles/", newImageName);
                var steam = new FileStream(location, FileMode.Create);
                ad.imageFile.CopyTo(steam);

                p.imageDestination = newImageName;
                p.name = ad.name;
                p.userId = Convert.ToInt32(HttpContext.Session.GetString("userid"));
                p.categoryId = ad.category;
                p.defination = ad.defination;


                postManager.Add(p);
            }

            return RedirectToAction("Index", "Post");
        }
    }
}
