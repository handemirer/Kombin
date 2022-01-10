using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    public interface IGenericDal<T> where T : class
    {
        List<T> ListAll();

        List<T> ListAll(Expression<Func<T, bool>> filter);

        void Add(T c);
        void Delete(T c);
        void Update(T c);

        T GetById(int id);
    }
}
