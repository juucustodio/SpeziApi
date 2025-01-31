# Spezi API

Spezi API is an API created for study purposes. The goal of this project is to explore various functionalities using .NET, Domain-Driven Design (DDD), GitHub Actions, Bicep, and Azure Cloud.

## Requirements

- .NET 9.0 SDK or higher
- Visual Studio Code or another editor of your choice

## Project Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/juucustodio/spezi-api.git
    cd spezi-api
    ```

2. Restore project dependencies:
    ```sh
    dotnet restore
    ```

3. Build the project:
    ```sh
    dotnet build
    ```

## Running the Project

To run the application in development mode, follow these steps:

1. Set the `ASPNETCORE_ENVIRONMENT` environment variable to `Development`.

2. Configure the `launch.json` file in Visual Studio Code:
    ```json
    {
        "version": "0.2.0",
        "configurations": [
            {
                "name": ".NET Core Launch (web)",
                "type": "coreclr",
                "request": "launch",
                "preLaunchTask": "build",
                "program": "${workspaceFolder}/bin/Debug/net9.0/Spezi.Api.dll",
                "args": [],
                "cwd": "${workspaceFolder}",
                "stopAtEntry": false,
                "serverReadyAction": {
                    "action": "openExternally",
                    "pattern": "\\bNow listening on:\\s+(https?://\\S+)"
                },
                "env": {
                    "ASPNETCORE_ENVIRONMENT": "Development"
                },
                "sourceFileMap": {
                    "/Views": "${workspaceFolder}/Views"
                }
            }
        ]
    }
    ```

3. Start the application:
    ```sh
    dotnet run
    ```

## API Endpoints

### Generate Random Number

- **URL**: `/api/RandomNumber`
- **Method**: `GET`
- **Accepts**: `application/json`

Example request using the `Spezi.Api.http` file:

```plaintext
@Spezi.Api_HostAddress = http://localhost:5262

GET {{Spezi.Api_HostAddress}}/api/RandomNumber
Accept: application/json

###