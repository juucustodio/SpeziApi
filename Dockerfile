# Usa a imagem oficial do .NET 9 para build
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build

# Define o diretório de trabalho no container
WORKDIR /app

# Copia a solução e os arquivos dos projetos primeiro para realizar o restore de dependências
COPY . .

# Restaura as dependências do NuGet
RUN dotnet restore src/Spezi.Api/Spezi.Api.csproj --force-evaluate

# Copia o restante do código e compila a aplicação
COPY . .
WORKDIR /app
RUN ls
RUN dotnet build src/Spezi.Api/Spezi.Api.csproj --configuration Release
# Publica a aplicação
RUN dotnet publish src/Spezi.Api/Spezi.Api.csproj --configuration Release --no-build --output /app/publish

# Verifica se o arquivo Spezi.Api.dll está presente após a publicação
RUN ls -al /app/publish

# Publica a aplicação
# RUN dotnet publish src/Spezi.Api/Spezi.Api.csproj --configuration Release --no-build --output /app/publish

# Usa a imagem .NET Runtime para rodar a API
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime

# Define o diretório de trabalho para o container de runtime
WORKDIR /app

# Copia os arquivos publicados da imagem anterior
COPY --from=build /app/publish .

# Expõe a porta 8080
EXPOSE 8080

# Comando de inicialização
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]
