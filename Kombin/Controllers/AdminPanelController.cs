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
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Categories()
        {


            var values = categoryManager.GetList();
            return View(values);

        }

        public IActionResult AddCategory()
        {
            return View();
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
        public IActionResult Users()
        {
            return View();
        }
        public IActionResult Posts()
        {
            return View();
        }

    }
}
