FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 8080

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src

# Copia os arquivos de solução e projeto
COPY ["SpeziApiSolution.sln", "./"]
COPY ["Spezi.Api/Spezi.Api.csproj", "Spezi.Api/"]
COPY ["Spezi.Application/Spezi.Application.csproj", "Spezi.Application/"]
COPY ["Spezi.Domain/Spezi.Domain.csproj", "Spezi.Domain/"]

# Restaura as dependências
RUN dotnet restore "Spezi.Api/Spezi.Api.csproj"

# Copia todo o código-fonte
COPY . .

WORKDIR "/src/Spezi.Api"
RUN dotnet publish -c Release -o /app/publish

# Imagem final
FROM base AS final
WORKDIR /app
COPY --from=build /app/publish .

ENTRYPOINT ["dotnet", "Spezi.Api.dll"]