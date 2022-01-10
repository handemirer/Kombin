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
    public class PostManager : IPostService

    {

        IPostDal _postDal;

        public PostManager(IPostDal postDal)
        {
            _postDal = postDal;
        }

        public void Add(Post p)
        {
            _postDal.Add(p);
        }

        public void Delete(Post p)
        {
            _postDal.Delete(p);
        }

        public Post GetById(int id)
        {
            return _postDal.GetById(id);
        }

        public List<Post> GetList()
        {
            return _postDal.ListAll();
        }

        public List<Post> GetListWithCategory(Category c)
        {
            return _postDal.ListAll(x => x.categoryId == c.CategoryId);
        }

        public List<Post> GetListWithMainCategory(int mainCategory)
        {
            CategoryManager categoryManager = new CategoryManager(new EfCategoryRepository());
            var categorylist = categoryManager.GetListByMainCategory(mainCategory);
            var categoryidlist = new List<int>();
            categorylist.ForEach(delegate (Category c) { categoryidlist.Add(c.CategoryId); });
            return _postDal.ListAll(x => categoryidlist.Contains(x.categoryId));
        }

        public List<Post> GetListWithUser(User s)
        {
            return _postDal.ListAll(x => x.userId == s.UserId);
        }

        public void Update(Post p)
        {
            _postDal.Update(p);
        }
    }
}
