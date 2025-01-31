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
        Description = "Spezi API is an API created for study purposes. The goal of this project is to explore various functionalities using .NET, Domain-Driven Design (DDD), GitHub Actions, Bicep, and Azure Cloud."
    });
});

builder.Services.AddScoped<IRandomNumberService, RandomNumberService>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c => 
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Spezi API v1");
        c.DocumentTitle = "Spezi API Documentation";
        c.RoutePrefix = string.Empty; // Serve the Swagger UI at the app's root
        c.DefaultModelsExpandDepth(-1); // Disable schema display
        c.DisplayRequestDuration(); // Display request duration
        c.DocExpansion(Swashbuckle.AspNetCore.SwaggerUI.DocExpansion.None); // Collapse all sections by default
        c.EnableFilter(); // Enable search filter
        c.DefaultModelRendering(Swashbuckle.AspNetCore.SwaggerUI.ModelRendering.Model); // Default rendering for models
        c.ShowExtensions(); // Show extensions (e.g., x- properties)
        c.InjectStylesheet("/swagger-ui/custom.css"); // Custom CSS for further styling
    });
}

app.UseHttpsRedirection();
app.UseStaticFiles();
app.UseAuthorization();
app.MapControllers();

app.Run();
