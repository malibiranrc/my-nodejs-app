# my-nodejs-app
This repository will be used for teaching CI/CD via GitHub Actions deploying to Kubernetes (minikube). This project is a simple example of how to set up a Node.js app, containerize it with Docker, and deploy it to Kubernetes using GitHub Actions for CI/CD.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
  - [Running Locally](#running-locally)
- [Dockerization](#dockerization)
- [Deployment to Kubernetes](#deployment-to-kubernetes)
- [CI/CD with GitHub Actions](#cicd-with-github-actions)
- [Configuration](#configuration)
- [Contributing](#contributing)
- [Key Terms](#key-terms)
- [License](#license)

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

All the links in one place:
- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/)
- [Docker](https://www.docker.com/get-started)
- [Kubernetes Cluster](#kubernetes-cluster)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (Kubernetes command-line tool)
- [GitHub Account](https://github.com/join)


## Step 1: Create a GitHub Repository

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

## Step 2: Set Up Your Kubernetes Cluster

   - If you're new to Kubernetes, consider using a managed service like [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) or [Amazon EKS](https://aws.amazon.com/eks/). These services simplify cluster management.

   - For local development and experimentation, you can use [Minikube](https://minikube.sigs.k8s.io/docs/start/) to set up a single-node Kubernetes cluster on your machine.

## Step 3: Create a Kubernetes Manifest

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
        image: your-docker-username/my-nodejs-app:v1.0.0   # Docker image to use for the container.
        ports:
        - containerPort: 80   # Port exposed by the container (your app should listen on this port).
        # Add more configuration options here if needed.
```

This YAML file defines how Kubernetes should run your app.

## Step 4: Dockerize Your Application

Create a `Dockerfile` in your project directory. Here is an example for a Node.js app:

```Dockerfile
# Use an official Node.js runtime as a parent image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy application source code to the working directory
COPY . .

# Expose the port the app runs on
EXPOSE 80

# Start the application
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

## Step 5: Push Code to GitHub

Commit your code and push it to your GitHub repository using these commands:

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

## Step 6: Set Up GitHub Actions

Create a `.github/workflows` directory in your repository and add a `ci-cd.yaml` file to define your GitHub Actions workflow. Here's an example:

```yaml
name: CI/CD Pipeline

on:
  push:
    branches:
      - main

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - name: Checkout code
      uses: actions/checkout@v2

    - name: Set up Docker
      uses: docker/setup-docker@v2

    - name: Build Docker image
      run: |
        docker build -t your-docker-username/your-app-name:your-app-tag .
        docker push your-docker-username/your-app-name:your-app-tag

    - name: Set up kubectl
      uses: azure/k8s-set-context@v1
      with:
        kubeconfig: ${{ secrets.KUBE_CONFIG }}

    - name: Deploy to Kubernetes
      run: |
        kubectl apply -f deployment.yaml
```

## Step 7: Configure GitHub Secrets

In your GitHub repository, navigate to **Settings** > **Secrets** and add the following secrets:

- `DOCKER_USERNAME`: Your Docker Hub or container registry username.
- `DOCKER_PASSWORD`: Your Docker Hub or container registry password/token.
- `KUBE_CONFIG`: The contents of your Kubernetes config file (`~/.kube/config`).

## Step 8: Run Your CI/CD Pipeline

Now, whenever you push changes to your GitHub repository's `main` branch, the GitHub Actions workflow will trigger, building your Docker image and deploying it to your Kubernetes cluster.

Replace placeholders like `your-docker-username`, `your-app-name`, `your-app-tag`, and `your-domain.com` with your actual values.

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

