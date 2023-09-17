# my-nodejs-app
This repository will be used for teaching CI/CD via GitHub Actions deploying to Kubernetes (minikube). This project is a simple example of how to set up a Node.js app, containerize it with Docker, and deploy it to Kubernetes using GitHub Actions for CI/CD.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Creating a GitHub Respository](creating-a-github-repository)
- [Working with GitHub in VS Code](Working-with-GitHub-in-VS-Code)

# Setting Up CI/CD with GitHub Actions and Kubernetes 🚀

## Prerequisites

Before you begin, make sure you have the following in place:

//TODO - add common errors and typical scenarios to be encountered

### 1. **GitHub Account**

   - If you don't have one, [sign up for a GitHub account here](https://github.com/join).

### 2. **Git**

   - Install Git on your computer. You can download it for your specific OS [here](https://git-scm.com/downloads).

### 3. **Docker**

   - You'll need Docker to containerize your application. Get it from [Docker's official website](https://www.docker.com/get-started).

### 4. **Kubernetes Cluster**

   - Kubernetes can be complex for beginners. Start by gaining a basic understanding with the [Kubernetes Basics tutorial](https://kubernetes.io/docs/tutorials/kubernetes-basics/).

### 5. **kubectl**

   - Install `kubectl`, the Kubernetes command-line tool, using the instructions [here](https://kubernetes.io/docs/tasks/tools/install-kubectl/).

### 6. **Visual Studio Code**
   *Note: VSCode is a popular code editor for various programming languages, and it will be helpful for editing and managing your project code.*
   - Visit the [Visual Studio Code website](https://code.visualstudio.com/) and download the version compatible with your operating system.
   - Follow the installation instructions for your operating system to install Visual Studio Code.
Follow these steps to log in to GitHub in Visual Studio Code:

## Working with GitHub in VS Code 

*Note: Documentation taken from: https://code.visualstudio.com/docs/sourcecontrol/github*

[GitHub](https://github.com) is a cloud-based service for storing and sharing source code. Using GitHub with Visual Studio Code lets you share your source code and collaborate with others right within your editor. There are many ways to interact with GitHub, for example, via their website at [https://github.com](https://github.com) or the [Git](https://git-scm.com) command-line interface (CLI), but in VS Code, the rich GitHub integration is provided by the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension.

<a class="install-extension-btn" href="vscode:extension/GitHub.vscode-pull-request-github">Install the GitHub Pull Requests and Issues extension</a>

To get started with the GitHub in VS Code, you'll need to install [Git](https://git-scm.com/download), [create a GitHub account](https://docs.github.com/get-started/signing-up-for-github/signing-up-for-a-new-github-account) and install the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension. In this topic, we'll demonstrate how you can use some of your favorite parts of GitHub without leaving VS Code.

If you're new to source control or want to learn more about VS Code's basic Git support, you can start with the [Source Control](/docs/sourcecontrol/overview.md) topic.

## Getting started with GitHub Pull Requests and Issues

Once you've installed the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension, you'll need to sign in. Follow the prompts to authenticate with GitHub in the browser and return to VS Code.

![Extension Sign In](images/github/extension-signin.png)

If you are not redirected to VS Code, you can add your authorization token manually. In the browser window, you will receive your authorization token. Copy the token, and switch back to VS Code. Select **Signing in to github.com...** in the Status bar, paste the token, and hit `kbstyle(Enter)`.

## Setting up a repository

### Cloning a repository

You can search for and clone a repository from GitHub using the **Git: Clone** command in the Command Palette (`kb(workbench.action.showCommands)`) or by using the **Clone Repository** button in the Source Control view (available when you have no folder open).

![Clone Repository button in the Source Control view](images/github/git-clone-button.png)

From the GitHub repository dropdown you can filter and pick the repository you want to clone locally.

![GitHub repository dropdown filtered on microsoft/vscode](images/github/github-repo-dropdown.png)

### Authenticating with an existing repository

Enabling authentication through GitHub happens when you run any Git action in VS Code that requires GitHub authentication, such as pushing to a repository that you're a member of or cloning a private repository. You don't need to have any special extensions installed for authentication; it is built into VS Code so that you can efficiently manage your repository.

When you do something that requires GitHub authentication, you'll see a prompt to sign in:

![Authentication Prompt](images/github/auth-prompt.png)

Follow the steps to sign into GitHub and return to VS Code. If authenticating with an existing repository doesn't work automatically, you may need to manually provide a personal access token. See [Personal Access Token authentication](https://github.com/microsoft/vscode-pull-request-github/wiki#personal-access-token-authentication) for more information.

Note that there are several ways to authenticate to GitHub, including using your username and password with two-factor authentication (2FA), a personal access token, or an SSH key. See [About authentication to GitHub](https://docs.github.com/github/authenticating-to-github/about-authentication-to-github) for more information and details about each option.

>**Note**: If you'd like to work on a repository without cloning the contents to your local machine, you can install the [GitHub Repositories](https://marketplace.visualstudio.com/items?itemName=github.remotehub) extension to browse and edit directly on GitHub. You can learn more below in the [GitHub Repositories extension](/docs/sourcecontrol/github.md#github-repositories-extension) section.
    
  Alternatively, you can view official documentation from VS Code here: 
  https://code.visualstudio.com/docs/sourcecontrol/github


## Creating a GitHub Repository

1. Go to [GitHub](https://github.com).

2. Log in to your GitHub account.

3. Click the **"+"** icon in the top right corner and select **"New Repository"**.

    ![NEW REPOSITORY](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/cd264f52-d645-488a-b049-9eb99e0dabb9)

4. Fill out the repository details:
   - Repository name.
   - Description (optional).
   - Public or private repository (choose as per your needs).
   - Initialize the repository with a `README.md` file.
   - Choose an appropriate `.gitignore` file based on your programming language.

5. Click the **"Create repository"** button.

## Setting Up Your Kubernetes Cluster

   - If you're new to Kubernetes, consider using a managed service like [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) or [Amazon EKS](https://aws.amazon.com/eks/). These services simplify cluster management.

   - For local development this project, we are going to use [Minikube](https://minikube.sigs.k8s.io/docs/start/) to set up a single-node Kubernetes cluster on your machine.

## Creating a Kubernetes Manifest

Create a `deployment.yaml` file to describe your application's configuration. Here's a simplified example for a Node.js app:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-nodejs-app   # The name of your deployment, can be customized.
spec:
  replicas: 3   # Number of replica pods to maintain. Adjust as needed.
  selector:
    matchLabels:
      app: my-nodejs-app   # Label to select pods for this deployment.
  template:
    metadata:
      labels:
        app: my-nodejs-app   # Label to identify pods created by this template.
    spec:
      containers:
      - name: my-nodejs-app
        image: rielam/mynodejsapp:latest   # Docker image to use for the container.
        ports:
        - containerPort: 3000   # Port exposed by the container (your app should listen on this port).
        resources:
          limits:
            memory: 2048Mi
            cpu: "2"
---
apiVersion: v1
kind: Service
metadata:
  name: my-nodejs-app
  namespace: default
spec:
  selector:
    app: my-nodejs-app
  type: NodePort
  ports:
  - name: http
    targetPort: 3000
    port: 80
```

This YAML file defines how Kubernetes should run your app.

## Dockerizing Your Application

Create a `Dockerfile` in your project directory. Here is an example for a Node.js app:

```Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:latest

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install
RUN npm install express

# Copy application source code to the working directory
COPY . .

# Expose the port the app runs on (your application should listen on this port)
EXPOSE 3000

# Start the application when the container starts
CMD ["node", "app.js"]
```

FROM node:14: Specifies the base image for your application, which is an official Node.js image.

WORKDIR /app: Sets the working directory inside the container to /app.

COPY package*.json ./: Copies package.json and package-lock.json to the working directory.

RUN npm install: Installs your application's dependencies using npm.

COPY . .: Copies your application's source code (all files and directories) into the container.

EXPOSE 80: Exposes port 80, indicating that your application inside the container will listen on this port.

CMD ["node", "app.js"]: Specifies the command to start your Node.js application when the container starts.

This `Dockerfile` packages your app into a Docker container.

## Pushing Code to GitHub

Commit your code and push it to your GitHub repository using these commands:

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

Or alternatively, you can use the Source Explorer from Visual Studio Code to commit your code:
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/b989c3f7-465c-4573-b414-8f912a62d2f3)


## Setting Up GitHub Actions

Create a `.github/workflows` directory in your repository and add a `ci-cd.yaml` file to define your GitHub Actions workflow. Here's an example:

```yaml
# This is a basic workflow to help you get started with Actions

# Name of the workflow, which will appear in the GitHub Actions UI.
name: CI

# Controls when the workflow will run.
on:
  # Triggers the workflow on a push event to the 'main' branch.
  push:
    branches:
      - main

# Jobs define the tasks to be executed in the workflow.
jobs:
  # A job named 'build' that will run on an 'ubuntu-latest' runner.
  build:
    runs-on: ubuntu-latest

    # Steps define the individual tasks within the job.
    steps:
      # Step to check out the source code from the repository.
      - name: Checkout Repository
        uses: actions/checkout@v2

      # Step to build and push a Docker image.
      - name: Build and Push Docker Image
        run: |
          # Build a Docker image with a specific tag.
          docker build -t rielam/mynodejsapp:latest .

          # Log in to Docker Hub using secrets.
          docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}

          # Push the Docker image to a Docker Hub repository.
          docker push rielam/mynodejsapp:latest

  # A job named 'deploy' that runs after the 'build' job is completed.
  deploy:
    needs: build
    runs-on: ubuntu-latest

    # Steps define the tasks within the 'deploy' job.
    steps:
      # Step to check out the source code from the repository.
      - name: Checkout Repository
        uses: actions/checkout@v2

      # Step to start a Minikube cluster.
      - name: Start minikube
        id: minikube
        uses: medyagh/setup-minikube@latest

      # Step to check the status of pods in the Kubernetes cluster.
      - name: Try out the cluster
        run: kubectl get pods -A

      # Step to deploy the application to Minikube using a configuration file.
      - name: Deploy to Minikube
        run: |
          # Apply a Kubernetes configuration file (deployment.yaml) to deploy the application.
          kubectl apply -f deployment.yaml
```

## Configuring GitHub Secrets

In your GitHub repository, navigate to **Settings** > **Secrets** and add the following secrets:

- `DOCKER_USERNAME`: Your Docker Hub or container registry username.
- `DOCKER_PASSWORD`: Your Docker Hub or container registry password/token.
- `KUBE_CONFIG`: The contents of your Kubernetes config file (`~/.kube/config`).

## Running Your CI/CD Pipeline
Now, whenever you push changes to your GitHub repository's `main` branch, the GitHub Actions workflow will trigger, building your Docker image and deploying it to your Kubernetes cluster.
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/22681b06-0573-425e-bfdd-c526afafdf38)


## Key Terms

## Continuous Integration (CI)

- **Continuous Integration (CI)**: A development practice where code changes are frequently and automatically integrated into a shared repository. This practice helps identify issues early by running automated tests.

- **Repository**: A location where all your project files, including code, are stored. In the context of Git and GitHub, this is where your version-controlled codebase resides.

- **Commit**: A snapshot of your code changes. You create commits to save your work and make it trackable.

- **Push**: The act of uploading your local code changes to a remote repository, making them accessible to others.

## Continuous Deployment/Delivery (CD)

- **Continuous Deployment (CD)**: A practice where code changes that pass automated tests are automatically deployed to production or a staging environment without manual intervention.

- **Continuous Delivery (CD)**: Similar to continuous deployment, but the final deployment to production is triggered manually.

- **Docker**: A platform for developing, shipping, and running applications inside containers. Containers are lightweight, portable, and isolated environments for applications and their dependencies.

## Kubernetes

- **Kubernetes**: An open-source container orchestration platform that automates the deployment, scaling, and management of containerized applications.

- **Pod**: The smallest deployable unit in Kubernetes. A pod can contain one or more containers that share network and storage resources.

- **Deployment**: A Kubernetes resource that manages the deployment and scaling of your application's pods. It ensures a specified number of replicas (copies) of your application are running.

- **Service**: A Kubernetes resource that provides a consistent way to access pods. Services load-balance traffic across pod replicas.

- **Ingress**: A Kubernetes resource for managing external access to services, typically HTTP/HTTPS traffic. It enables features like routing and SSL termination.

- **Config Maps and Secrets**: Kubernetes resources for managing configuration data and sensitive information like passwords or API keys.

- **Namespace**: A way to partition a Kubernetes cluster into multiple virtual clusters. It's used for organizational or isolation purposes.

- **Persistent Volumes and Persistent Volume Claims**: Kubernetes resources used for managing storage for your applications.

