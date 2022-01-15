using BussinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using EntityLayer.Concrete;
using Kombin.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Kombin.Controllers
{
    [Authorize(Roles = "Admin")]
    public class AdminPanelController : Controller
    {

        CategoryManager categoryManager = new CategoryManager(new EfCategoryRepository());
        UserManager userManager = new UserManager(new EfUserRepository());
        PostManager postManager = new PostManager(new EfPostRepository());
        public IActionResult Index()

        {
            ViewBag.categoryNumber = categoryManager.GetList().Count;
            ViewBag.userNumber = userManager.GetList().Count;
            ViewBag.postNumber = postManager.GetList().Count;

            return View();
        }

        #region Category
        public IActionResult Categories()
        {


            var values = categoryManager.GetList();
            return View(values);

        }

        public IActionResult AddCategory()
        {
            return View();
        }

        public IActionResult DeleteCategory(int id)
        {
            categoryManager.Delete(categoryManager.GetById(id));
            return RedirectToAction("Categories", "AdminPanel");
        }

        [HttpPost]
        public IActionResult AddCategory(AddCategory ac)
        {

            Category category = new Category();
            category.CategoryName = ac.name;
            category.MainCategory = ac.MainCategory;
            category.CategoryDescription = "";
            category.CategoryStatus = true;

            categoryManager.Add(category);
            return RedirectToAction("Categories", "AdminPanel");
        }
        #endregion

        #region User
        public IActionResult Users()
        {
            var values = userManager.GetList();
            return View(values);
        }


        public IActionResult UserWithId(int id)
        {
            User u = userManager.GetById(id);
            return View(u);
        }
        [HttpPost]
        public IActionResult UserWithId(int id, int role)
        {

            User u = userManager.GetById(id);
            u.Role = role;
            userManager.Update(u);
            return RedirectToAction("UserWithId", "AdminPanel", 3);
        }

        public IActionResult DeleteUser(int id)
        {
            //userManager.Delete(userManager.GetById(id));
            return RedirectToAction("Users", "AdminPanel");
        }
        #endregion

        #region Posts
        public IActionResult Posts()
        {
            var values = postManager.GetList();
            return View(values);
        }

        public IActionResult DeletePost(int id)
        {
            postManager.Delete(postManager.GetById(id));
            return RedirectToAction("Posts", "AdminPanel");
        }
        #endregion

    }
}
