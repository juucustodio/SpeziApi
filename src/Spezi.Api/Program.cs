using Spezi.Application.Services;
using Spezi.Domain.Interfaces;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();

builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new Microsoft.OpenApi.Models.OpenApiInfo{
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

app.Run();
