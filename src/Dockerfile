# Etapa 1: Build da aplicação
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /app

# Copia os arquivos do projeto e restaura as dependências
COPY . ./src

# List files for debugging
RUN ls -la /app
RUN ls -la /app/src

# Verifica se o diretório Spezi.Api existe
RUN if [ -d "/app/src/Spezi.Api" ]; then echo "Directory exists"; else echo "Directory does not exist"; fi

WORKDIR /app/src/Spezi.Api

# List files for debugging
RUN ls -la /app/src/Spezi.Api

RUN dotnet restore Spezi.Api.csproj

# Copia o restante do código e compila a aplicação
RUN dotnet publish Spezi.Api.csproj -c Release -o /out

# Etapa 2: Runtime da aplicação
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS runtime
WORKDIR /app
COPY --from=build /out .

# Exposição da porta e execução da aplicação
EXPOSE 80
ENTRYPOINT ["dotnet", "Spezi.Api.dll"]
