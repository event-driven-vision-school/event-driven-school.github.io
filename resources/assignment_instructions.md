# Assignment instructions

## Prerequisites
Before starting the assignments, make sure the following software is installed on your system:

- Python 3.11+ — [python.org](https://www.python.org/downloads/)
- Docker — [docker.com](https://www.docker.com/get-started/)
- Git — [git-scm.com](https://git-scm.com/)

--- 

## Pulling Assignment Docker Images

All Docker images for the assignments are available on the [Event-Driven Vision School GitHub Container Registry](https://github.com/orgs/event-driven-vision-school/packages)

### 1. Create a GitHub Personal Access Token

To access the container registry, you need to create a **classic Personal Access Token (PAT)** on GitHub.

Navigate to:

```text
GitHub → Settings → Developer Settings → Personal access tokens → Tokens (classic) → Generate new token
```

When creating the token:

- Choose any descriptive name
- Select your preferred expiration date
- Enable the following permission:

```text
read:packages
```

After generating the token, copy and save it securely. You will use it as the password when logging into the registry.

### 2. Log in to GitHub Container Registry

Open a terminal and run:

```bash
docker login ghcr.io
```

You will be prompted for:

- **Username** → your GitHub username
- **Password** → the Personal Access Token you created earlier

If the login is successful, you should see:

```text
Login Succeeded
```

### 3. Pull the Required Docker Image

Each assignment package page contains the corresponding `docker pull` command.

Example:

```bash
docker pull ghcr.io/event-driven-vision-school/<image-name>
```

Replace `<image-name>` with the specific image required for your assignment.

## Example

```bash
docker pull ghcr.io/event-driven-vision-school/events-representations:solution
```

This downloads the Docker image locally so it can be used for the assignment environment.
