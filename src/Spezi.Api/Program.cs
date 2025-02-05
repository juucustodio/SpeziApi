using Microsoft.OpenApi.Models;
using Spezi.Application.Services;
using Spezi.Domain.Interfaces;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Spezi API",
        Version = "v1",
        Description = "Spezi API is an API created for study purposes."
    });
});

builder.Services.AddScoped<IRandomNumberService, RandomNumberService>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI(c => 
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Spezi API v1");
    c.RoutePrefix = string.Empty;
});
app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAuthorization();
app.MapControllers();

await app.RunAsync();