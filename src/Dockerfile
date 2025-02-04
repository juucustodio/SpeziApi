# Use the official .NET image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

COPY . ./src

WORKDIR /app/src/Spezi.Api
RUN dotnet restore Spezi.Api.csproj


RUN dotnet publish Spezi.Api.csproj -c Release -o /app/out


FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /app/out .

# Exposição da porta e execução da aplicação
EXPOSE 80
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]
