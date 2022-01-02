using DataAccessLayer.Abstract;
using DataAccessLayer.Concrete;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Repositories
{
    public class CategoryRepository : ICategoryDal
    {
        Context context = new Context();
        public void Add(Category c)
        {
            context.Add(c);
            context.SaveChanges();
        }

        public void Delete(Category c)
        {
            context.Remove(c);
            context.SaveChanges();
        }

        public Category GetById(int id)
        {
            return context.Categories.Find(id);
        }

        public List<Category> ListAll()
        {
            return context.Categories.ToList();
        }

        public void Update(Category c)
        {
            context.Update(c);
            context.SaveChanges();

        }
    }
}
