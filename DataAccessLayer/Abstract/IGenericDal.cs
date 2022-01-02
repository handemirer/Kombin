using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataAccessLayer.Abstract
{
    public interface IGenericDal<T> where T : class
    {
        List<T> ListAll();

        void Add(T c);
        void Delete(T c);
        void Update(T c);

        T GetById(int id);
    }
}
