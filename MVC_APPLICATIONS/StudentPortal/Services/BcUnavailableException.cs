namespace StudentPortal.Services;

public class BcUnavailableException : Exception
{
    public BcUnavailableException(string message, Exception? inner = null)
        : base(message, inner)
    {
    }
}