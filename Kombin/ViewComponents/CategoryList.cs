using BussinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Kombin.ViewComponents
{
    public class CategoryList : ViewComponent
    {
        CategoryManager categoryManager = new CategoryManager(new EfCategoryRepository());

        public IViewComponentResult Invoke(int MainCategory)
        {
            var values = categoryManager.GetListByMainCategory(MainCategory);
            return View(values);
        }
    }
}
