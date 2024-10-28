# Helm, Git, Curl, and YQ Docker Image

This Docker image is based on Alpine Linux and includes useful tools for DevOps and CI/CD pipelines: Helm, Git, Curl, and `yq`. It also installs the Helm Push plugin to support pushing charts to ChartMuseum or other compatible chart repositories.

## Image Contents

The image includes:
- **Helm**: for managing Kubernetes packages.
- **Git**: for version control and cloning repositories.
- **Curl**: for transferring data from or to a server.
- **yq**: a lightweight and portable command-line YAML processor, useful for parsing and modifying YAML files.
- **Helm Push Plugin**: version `v0.9.0`, enabling `helm push` commands for working with ChartMuseum and similar repositories.

## Installation Details

- **Base Image**: `alpine:latest`
- **Maintainer**: Oleks Dovzh - `oleksdovz@gmail.com`

