# Use the official .NET image as a build stage
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

COPY /src ./src

WORKDIR /app
RUN dotnet restore /app/src/Spezi.Api/Spezi.Api.csproj


RUN dotnet publish /app/src/Spezi.Api/Spezi.Api.csproj -c Release -o ./out


FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Exposição da porta e execução da aplicação
EXPOSE 80
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]
