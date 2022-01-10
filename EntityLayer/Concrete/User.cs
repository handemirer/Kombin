using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class User
    {
        [Key]
        public int UserId { get; set; }
        public string UserUsername { get; set; }
        public string UserFullname { get; set; }
        public string UserPassword { get; set; }
        public int Role { get; set; }
    }
}
