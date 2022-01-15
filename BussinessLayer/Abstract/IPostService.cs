using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessLayer.Abstract
{
    public interface IPostService
    {
        void Add(Post p);
        void Delete(Post p);
        void Update(Post p);
        List<Post> GetList();
        List<Post> GetListWithUser(int userid);
        List<Post> GetListWithCategory(Category c);
        List<Post> GetListWithMainCategory(int mainCategory);



    }
}
