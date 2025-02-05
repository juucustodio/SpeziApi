[![SpeziApi Build Test](https://github.com/juucustodio/SpeziApi/actions/workflows/pipeline-build.yml/badge.svg)](https://github.com/juucustodio/SpeziApi/actions/workflows/pipeline-build.yml)
[![SonarCloud - Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=juucustodio_SpeziApi&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=juucustodio_SpeziApi)

# Spezi API

Spezi API is an API created for study purposes. The goal of this project is to explore various functionalities using .NET, Domain-Driven Design (DDD), GitHub Actions, Bicep, and Azure Cloud.

---

## 📌 Requirements

- .NET 9.0 SDK or higher
- Visual Studio Code or another editor of your choice

---

## 🚀 Project Setup

### 1️⃣ Clone the repository
```sh
git clone https://github.com/your-username/spezi-api.git
cd spezi-api
```

### 2️⃣ Restore project dependencies
```sh
dotnet restore
```

### 3️⃣ Build the project
```sh
dotnet build
```

---

## ▶️ Running the Project

To run the application in development mode, follow these steps:

### 1️⃣ Set the environment variable
```sh
export ASPNETCORE_ENVIRONMENT=Development
```

### 2️⃣ Configure the `launch.json` file in Visual Studio Code
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

### 3️⃣ Start the application
```sh
dotnet run
```

---

## 📡 API Endpoints

### 🔹 Generate Random Number

- **URL**: `/api/RandomNumber`
- **Method**: `GET`
- **Accepts**: `application/json`

#### Example request using the `Spezi.Api.http` file:
```plaintext
@Spezi.Api_HostAddress = http://localhost:8080

GET {{Spezi.Api_HostAddress}}/api/RandomNumber
Accept: application/json
```

---

## 🚢 Running the Project with Docker

To run the application in a Docker container, follow these steps:

### 1️⃣ Build the Docker image
```sh
docker build -t spezi-api .
```

### 2️⃣ Run the Docker container
```sh
docker run -d -p 8080:8080 --name spezi-api-container spezi-api
```

- **Local URL**: Access the application locally at [http://localhost:8080](http://localhost:8080)

---

## ☁️ Running the Project via Azure WebApp

If you have deployed the project to Azure using GitHub Actions or manually, you can access the application via:

- **WebApp URL**: [yourwebapp.azurewebsites.net](http://yourwebapp.azurewebsites.net)

---

## ☁️ Infrastructure as Code (IaC) with Bicep

This project uses Bicep for Infrastructure as Code (IaC) to manage Azure resources. The deployment process is automated using GitHub Actions.

### 🛠️ Bicep Modules
- **`appServicePlan-module.bicep`**: Defines the App Service Plan.
- **`acr-module.bicep`**: Defines the Azure Container Registry (ACR).
- **`vnet-module.bicep`**: Defines the Virtual Network (VNet) and DDoS protection.
- **`webapp-module.bicep`**: Defines the Web App and its configuration.

### 🚀 Deployment Pipeline
The deployment pipeline is defined in `pipeline-iac.yml` and can be triggered manually from the GitHub Actions tab.

#### Running the Deployment Pipeline:
1. Go to the repository on GitHub.
2. Click on the **"Actions"** tab.
3. Select the workflow **"Deploy Infrastructure as Code (IaC) using Bicep"**.
4. Click on **"Run workflow"**.
5. Choose the environment (`dev`, `sit`, `uat`, `prd`).
6. Click on **"Run workflow"** to start the deployment.

### 🔑 Secrets Configuration
Ensure the following secrets are configured in your GitHub repository:

- `AZURE_CLIENT_ID`: The client ID of the Azure AD application.
- `AZURE_CLIENT_SECRET`: The client secret of the Azure AD application.
- `AZURE_TENANT_ID`: The tenant ID of your Azure AD.
- `PROJECT_KEY`: The unique key of your project in SonarCloud. This key is used to identify your project in SonarCloud.
- `SONAR_ORGANIZATION`: The key of your organization in SonarCloud. This key is used to identify your organization in SonarCloud.
- `SONAR_TOKEN`: The authentication token for SonarCloud. This token is used to authenticate API requests to SonarCloud.

#### Example Command to Deploy Bicep Manually
Replace `<your-resource-group>` with the name of your Azure resource group.
```sh
az deployment group create --resource-group <your-resource-group> --template-file main.bicep
```

---

## 📜 Swagger UI

The interactive API documentation can be accessed through Swagger UI.
- Start the application and navigate to: [http://localhost:8080/index.html](http://localhost:8080/index.html)

---

## ⚙️ Configuration
The application settings are located in the `appsettings.json` file.

---

## 🤝 Contribution
Contributions are welcome! Feel free to open **issues** and **pull requests**.

---

## 📄 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for more details.

---
