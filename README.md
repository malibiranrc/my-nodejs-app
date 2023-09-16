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
- [License](#license)

## Prerequisites

Before you begin, make sure you have the following installed:

- [Node.js](https://nodejs.org/) and [npm](https://www.npmjs.com/)
- [Docker](https://www.docker.com/get-started)
- [Kubernetes Cluster](#kubernetes-cluster)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) (Kubernetes command-line tool)
- [GitHub Account](https://github.com/join)

## Getting Started

### Running Locally

To run this Node.js application locally, follow these steps:

1. Clone this repository to your local machine:

   ```bash
   git clone https://github.com/malibiranrc/my-nodejs-app.git
   cd my-nodejs-app
