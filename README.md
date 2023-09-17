# my-nodejs-app
This repository will be used for teaching CI/CD via GitHub Actions deploying to Kubernetes (minikube). This project is a simple example of how to set up a Node.js app, containerize it with Docker, and deploy it to Kubernetes using GitHub Actions for CI/CD.

Performing CI/CD with Kubernetes and GitHub Actions is a streamlined approach to software development that combines version control, automated testing, containerization, and orchestration. It starts with developers pushing code changes to a GitHub repository, triggering automated workflows orchestrated by GitHub Actions. These workflows build and package the application into Docker containers and deploy them to a Kubernetes cluster using defined manifests. The benefits are substantial: it ensures rapid and reliable code delivery, scalability, portability, and consistent application behavior across various environments. GitHub Actions automates the entire pipeline, while Kubernetes provides a resilient and scalable runtime environment. Together, they empower teams to accelerate development, reduce errors, and deliver high-quality software with agility and efficiency.
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/4e3e3aef-275d-4728-b2a8-fabb02cb01e6)


## Table of Contents

- [Prerequisites](#i-prerequisites)
- [Creating a GitHub Respository](#ii-Creating-A-GitHub-Repository)
- [Working with GitHub in VS Code](#iii-Working-with-GitHub-in-VS-Code)

# Setting Up CI/CD with GitHub Actions and Kubernetes 🚀

## I. Prerequisites

Before you begin, make sure you have the following in place:

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


## II. Creating a GitHub Repository

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

## III. Working with GitHub in VS Code 

*Note: Documentation taken from: https://code.visualstudio.com/docs/sourcecontrol/github*

[GitHub](https://github.com) is a cloud-based service for storing and sharing source code. Using GitHub with Visual Studio Code lets you share your source code and collaborate with others right within your editor. There are many ways to interact with GitHub, for example, via their website at [https://github.com](https://github.com) or the [Git](https://git-scm.com) command-line interface (CLI), but in VS Code, the rich GitHub integration is provided by the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension.

To get started with the GitHub in VS Code, you'll need to install [Git](https://git-scm.com/download), [create a GitHub account](https://docs.github.com/get-started/signing-up-for-github/signing-up-for-a-new-github-account) and install the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension. In this topic, we'll demonstrate how you can use some of your favorite parts of GitHub without leaving VS Code.

If you're new to source control or want to learn more about VS Code's basic Git support, you can start with the [Source Control](/docs/sourcecontrol/overview.md) topic.

### Getting started with GitHub Pull Requests and Issues

Once you've installed the [GitHub Pull Requests and Issues](https://marketplace.visualstudio.com/items?itemName=GitHub.vscode-pull-request-github) extension, you'll need to sign in. Follow the prompts to authenticate with GitHub in the browser and return to VS Code.

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/238a0163-339a-41c2-a71b-9a5db3dbfdc6)

If you are not redirected to VS Code, you can add your authorization token manually. In the browser window, you will receive your authorization token. Copy the token, and switch back to VS Code. Select **Signing in to github.com...** in the Status bar, paste the token, and hit `kbstyle(Enter)`.

### Cloning a repository

You can search for and clone a repository from GitHub using the **Git: Clone** command in the Command Palette (`kb(workbench.action.showCommands)`) or by using the **Clone Repository** button in the Source Control view (available when you have no folder open).

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/6daa37be-65a2-46bc-8ea7-8083d8624b90)


From the GitHub repository dropdown you can filter and pick the repository you want to clone locally.

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/5a234537-c73c-4fe6-979a-59e7d52eae87)


### Authenticating with an existing repository

Enabling authentication through GitHub happens when you run any Git action in VS Code that requires GitHub authentication, such as pushing to a repository that you're a member of or cloning a private repository. You don't need to have any special extensions installed for authentication; it is built into VS Code so that you can efficiently manage your repository.

When you do something that requires GitHub authentication, you'll see a prompt to sign in:

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/7ba6b7e6-4cf0-4e5e-890a-4c36687a5148)


Follow the steps to sign into GitHub and return to VS Code. If authenticating with an existing repository doesn't work automatically, you may need to manually provide a personal access token. See [Personal Access Token authentication](https://github.com/microsoft/vscode-pull-request-github/wiki#personal-access-token-authentication) for more information.

Note that there are several ways to authenticate to GitHub, including using your username and password with two-factor authentication (2FA), a personal access token, or an SSH key. See [About authentication to GitHub](https://docs.github.com/github/authenticating-to-github/about-authentication-to-github) for more information and details about each option.

>**Note**: If you'd like to work on a repository without cloning the contents to your local machine, you can install the [GitHub Repositories](https://marketplace.visualstudio.com/items?itemName=github.remotehub) extension to browse and edit directly on GitHub. You can learn more below in the [GitHub Repositories extension](/docs/sourcecontrol/github.md#github-repositories-extension) section.
    
  Alternatively, you can view official documentation from VS Code here: 
  https://code.visualstudio.com/docs/sourcecontrol/github

### Application Code

For the purposes of this project, you will be using a simple node.js application. Make sure to include these files as part of your repository:

'app.js'
```
'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);

```

'server.js'
```
'use strict';

const express = require('express');

// Constants
const PORT = 3000;
const HOST = '0.0.0.0';

// App
const app = express();
app.get('/', (req, res) => {
  res.send('Hello World');
});

app.listen(PORT, HOST);
console.log(`Running on http://${HOST}:${PORT}`);
```


## IV. Setting Up Your Kubernetes Cluster

   - If you're new to Kubernetes, consider using a managed service like [Google Kubernetes Engine (GKE)](https://cloud.google.com/kubernetes-engine) or [Amazon EKS](https://aws.amazon.com/eks/). These services simplify cluster management.

   - For local development this project, we are going to use [Minikube](https://minikube.sigs.k8s.io/docs/start/) to set up a single-node Kubernetes cluster on your machine. We will discuss this later in the GitHub Actions step.

## V. Creating a Kubernetes Manifest

Creating a Kubernetes manifest is like giving instructions to Kubernetes on how to run your application. It ensures consistency, automates deployment, and makes it easy to manage and scale your app. Think of it as a recipe for your application in the Kubernetes environment.

To create a manifest, create a `deployment.yaml` file to describe your application's configuration. You may refer to this repository to view where it's located. Here is the manifest used for this project:

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
  # The name of the Service.
  name: my-nodejs-app
  # The namespace where the Service is created (default is often used).
  namespace: default
spec:
  # Selects the Pods to expose with this Service.
  selector:
    app: my-nodejs-app

  # Specifies the type of Service.
  type: NodePort

  # Specifies the ports to expose.
  ports:
  - name: http
    # The target port on the Pods to forward traffic to.
    targetPort: 3000
    # The port on the Service itself that listens for incoming traffic.
    port: 80
```

This YAML file defines how Kubernetes should run your app. It should look something like this:
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/c85bc1a8-f6a3-470e-b298-11704a989529)


## VI. Dockerizing The Application

Dockerizing your app ensures it runs consistently across different environments, simplifies deployment, and makes it easy to scale and manage dependencies. It's a best practice for modern software development and CI/CD pipelines.

Sure, here are the steps to create a DockerHub account and then create a repository on DockerHub, formatted in Markdown:


### Creating a DockerHub Repository

1. **Log In**: If you're not already logged in, go to the [DockerHub website](https://hub.docker.com/), and click the "Log In" button at the top right corner. Enter your DockerHub username and password to log in.

2. **Access Repositories**: After logging in, click on your profile picture or username at the top right corner of the DockerHub homepage, and select "Your Repositories" from the dropdown menu.

3. **Create Repository**: On the "Your Repositories" page, click the green "Create Repository" button.

4. **Set Repository Details**:
   - **Namespace**: Choose a namespace for your repository. If you're just getting started, you can leave it as your username or select an organization if you have one.
   - **Repository Name**: Enter a name for your repository.
   - **Description** (optional): Add a description to provide more information about your repository.
   - **Visibility**: Choose between public or private visibility, depending on your needs and DockerHub plan.

5. **Configure Automated Builds** (optional): If you want to link your repository to a source code repository (e.g., GitHub) for automated builds, you can configure this in the "Build Settings" section.

6. **Create Repository**: Click the green "Create" button to create your DockerHub repository.

7. **Repository Created**: Your repository is now created and ready to use. You'll be directed to the repository's page, where you can find instructions on pushing Docker images to it and other management options.

It should look something like this:

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/efc49d9e-fcc0-4d08-b30b-c8df1c0cbb9e)

To Dockerize your application, create a `Dockerfile` in your project directory. Here is an example for a Node.js app:

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

### Creating a package.json file
Create a package.json file: If you don't already have a package.json file for your Node.js application, you should create one. This file lists your project's dependencies and other important information.

```json
{
    "name": "docker_web_app",
    "version": "1.0.0",
    "description": "Node.js on Docker",
    "author": "Riel Malibiran <ra.malibiran@gmail.com>",
    "main": "server.js",
    "scripts": {
      "start": "node server.js"
    },
    "dependencies": {
      "express": "^4.16.1"
    }
  }
```

Creating a `package.json` file is essential for managing your Node.js application's dependencies and is typically used in the Docker image build process. Make sure to include all your project's dependencies in this file.

## VII. Pushing Code to GitHub

Commit your code and push it to your GitHub repository using these commands:

```bash
git add .
git commit -m "Initial commit"
git push origin main
```

Or alternatively, you can use the Source Explorer from Visual Studio Code to commit your code:
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/b989c3f7-465c-4573-b414-8f912a62d2f3)

Your project should look something like this:

![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/279e4dc1-a2a1-47d4-9bc9-845532d3f783)

## VIII. Setting Up GitHub Actions

Create a `.github/workflows` directory in your repository and add a `ci-cd.yaml` file to define your GitHub Actions workflow. You can refer to the code comments for explanations on what each step does. Here is an example:

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
          # Build a Docker image with a specific tag. The format used is your dockerusername/imagename:tags
          docker build -t rielam/mynodejsapp:latest .

          # Log in to Docker Hub using secrets.
          docker login -u ${{ secrets.DOCKER_USERNAME }} -p ${{ secrets.DOCKER_PASSWORD }}

          # Push the Docker image to a Docker Hub repository. The format used is your dockerusername/imagename:tags
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

Alternatively, you can go to the 'Actions' tab on your repository and create a simple workflow, and use that template.
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/0a9d656f-f47c-49e5-8840-8af0402ae518)


## IX. Configuring GitHub Secrets

In your GitHub repository, navigate to **Settings** > **Secrets** and add the following secrets:

- `DOCKER_USERNAME`: Your Docker Hub or container registry username.
- `DOCKER_PASSWORD`: Your Docker Hub or container registry password/token.

## X. Running Your CI/CD Pipeline
Now, whenever you push changes to your GitHub repository's `main` branch, the GitHub Actions workflow will trigger, building your Docker image and deploying it to your Kubernetes cluster.
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/22681b06-0573-425e-bfdd-c526afafdf38)

You can monitor your build (CI) and deployments (CD) in the 'Actions' tab of your repository at the top of the GitHub page
![image](https://github.com/malibiranrc/my-nodejs-app/assets/77093390/7a2df39a-95f2-47e9-87f3-599f6b801e47)



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

