using Microsoft.AspNetCore.Mvc;
using Spezi.Domain.Interfaces;

namespace Spezi.Api.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RandomNumberController : ControllerBase
    {
        private readonly IRandomNumberService _randomNumberService;

        public RandomNumberController(IRandomNumberService randomNumberService)
        {
            _randomNumberService = randomNumberService;
        }


        /// <summary>
        /// Gets a random number.
        /// </summary>
        /// <returns>A random number.</returns>
        [HttpGet]
        [ProducesResponseType(typeof(int), StatusCodes.Status200OK)]
        public IActionResult GetRandomNumber()
        {
            var randomValue = _randomNumberService.GenerateRandomNumber();
            return Ok(randomValue);
        }
    }
}