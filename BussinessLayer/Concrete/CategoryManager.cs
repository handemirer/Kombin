using BussinessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataAccessLayer.Repositories;
using DataAccessLayer.EntityFramework;
using DataAccessLayer.Abstract;

namespace BussinessLayer.Concrete
{
    public class CategoryManager : ICategoryService

    {

        ICategoryDal _categoryDal;

        public CategoryManager(ICategoryDal categoryDal)
        {
            _categoryDal = categoryDal;
        }

        public void Add(Category c)
        {
            _categoryDal.Add(c);
        }

        public void Delete(Category c)
        {
            _categoryDal.Delete(c);
        }

        public Category GetById(int id)
        {
            return _categoryDal.GetById(id);
        }

        public List<Category> GetList()
        {
            return _categoryDal.ListAll();
        }

        public void Update(Category c)
        {
            _categoryDal.Update(c);
        }
    }
}
