namespace Spezi.Domain.Entities
{
    public class RandomNumberEntity 
    {
        public int Value { get; private set; }

        public RandomNumberEntity (int value)
        {
            Value = value;
        }
    }
    
}