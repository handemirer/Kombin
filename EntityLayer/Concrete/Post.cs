using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace EntityLayer.Concrete
{
    public class Post
    {
        [Key]
        public int PostId { get; set; }
        public int userId { get; set; }
        public int categoryId { get; set; }
        public string name { get; set; }
        public string defination { get; set; }
        public string imageDestination { get; set; }

    }
}
