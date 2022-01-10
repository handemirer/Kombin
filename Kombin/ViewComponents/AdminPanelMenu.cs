using BussinessLayer.Concrete;
using DataAccessLayer.EntityFramework;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Kombin.ViewComponents
{
    public class AdminPanelMenu : ViewComponent
    {

        public IViewComponentResult Invoke()
        {
            return View();
        }
    }
}
