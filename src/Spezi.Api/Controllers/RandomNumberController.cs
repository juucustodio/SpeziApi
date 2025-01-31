using Microsoft.AspNetCore.Mvc;
using Spezi.Domain.Interfaces;

namespace Spezi.Api.Controllers
{
    [Route("api/[controller]")]
    [ApiController]

    public class RandomNumberController : ControllerBase
    {
        private readonly IRandomNumberService _randomNumberService;

        public RandomNumberController(IRandomNumberService randomNumberService)
        {
            _randomNumberService = randomNumberService;
        }

        [HttpGet]
        public IActionResult Get()
        {
            var randomValue = _randomNumberService.GenerateRandomNumber();
            return Ok(new { number = randomValue });
        }
    }
}