using DataAccessLayer.Abstract;
using EntityLayer.Concrete;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BussinessLayer.Concrete
{
    public class UserManager
    {

        IUserDal _UserDal;

        public UserManager(IUserDal UserDal)
        {
            _UserDal = UserDal;
        }

        public void Add(User u)
        {
            _UserDal.Add(u);
        }

        public void Delete(User u)
        {
            _UserDal.Delete(u);
        }

        public User GetById(int id)
        {
            return _UserDal.GetById(id);
        }

        public List<User> GetList()
        {
            return _UserDal.ListAll();
        }

        public void Update(User u)
        {
            _UserDal.Update(u);
        }
    }
}
