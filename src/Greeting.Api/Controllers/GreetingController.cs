using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace Greeting.Api.Controllers
{
    [ApiController]
    [Route("/")]
    public class GreetingController : ControllerBase
    {
        public GreetingController() {}

        [HttpGet]
        public String Get()
        {
            return new String("Hello Hepsiburada from Yusuf Cemal Çelebi");
        }
    }
}
