using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessLayer.Abstract
{
    public interface ICategoryService
    {
        void Add(Category c);
        void Delete(Category c);
        void Update(Category c);
        List<Category> GetList();
        List<Category> GetListByMainCategory(int MainCategory);
        Category GetById(int id);
    }
}
