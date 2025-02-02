# Use the official .NET image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

COPY src/ ./src/

RUN dotnet restore ./src/Spezi.Api/Spezi.Api.csproj

# Copy everything else and build
COPY src/Spezi.Api/. ./src/Spezi.Api/
WORKDIR /app/src/Spezi.Api
RUN dotnet publish -c Release -o out

# Use the official .NET runtime image as a runtime stage
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/src/Spezi.Api/out ./
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]