using Microsoft.AspNetCore.Mvc;
using Greeting.Api.Controllers;
using Xunit;
using System;

namespace Greeting.Api.Tests.Controllers
{
    public class GreetingControllerTests
    {
        [Fact]
        public void Get_NoParams_StringReturnType()
        {
            var controller = new GreetingController();

            var response = controller.Get();
            Assert.IsType<String>(response);
        }
    }
}