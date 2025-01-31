using Spezi.Domain.Entities;
using Spezi.Domain.Interfaces;

namespace Spezi.Application.Services
{
    public class RandomNumberService : IRandomNumberService
    {
        private readonly Random _random = new();

        public int GenerateRandomNumber()
        {
            return _random.Next(1,1000);
        }
    }
}