using EntityLayer.Concrete;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Kombin.Models
{
    public class AddPost
    {
        public User user { get; set; }
        public int category { get; set; }
        public string name { get; set; }
        public string defination { get; set; }
        public IFormFile imageFile { get; set; }
    }
}
