# Use the official .NET image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copy the .csproj file and restore dependencies
COPY src/Spezi.Api/*.csproj src/Spezi.Api/
RUN dotnet restore src/Spezi.Api/Spezi.Api.csproj

# Copy the remaining source code and build the application
COPY src/Spezi.Api/ src/Spezi.Api/
WORKDIR /app/src/Spezi.Api
RUN dotnet publish -c Release -o /app/out

# Use the official .NET runtime image as a runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app

# Copy the published files from the build stage
COPY --from=build /app/out .

# Expose the port and set the entry point for the application
EXPOSE 80
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]
