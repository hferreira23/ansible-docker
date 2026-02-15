# ansible-docker

[![build-containers](https://github.com/hferreira23/ansible-docker/actions/workflows/build-containers.yaml/badge.svg)](https://github.com/hferreira23/ansible-docker/actions/workflows/build-containers.yaml)
[![sem-ver-release](https://github.com/hferreira23/ansible-docker/actions/workflows/sem-ver-release.yaml/badge.svg)](https://github.com/hferreira23/ansible-docker/actions/workflows/sem-ver-release.yaml)
[![commit-lint](https://github.com/hferreira23/ansible-docker/actions/workflows/commit-lint.yaml/badge.svg)](https://github.com/hferreira23/ansible-docker/actions/workflows/commit-lint.yaml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A multi-architecture Docker image for Ansible automation, optimized for size and security. It's setup for my own hobby needs, feel free to fork or copy and change to fit your use case.

## 🚀 Features

- **Latest Ansible Core**: Built with ansible-core
- **Multi-Architecture**: Native support for `linux/amd64` and `linux/arm64`
- **Optimized Size**: Minimal image footprint through aggressive cleanup and optimization
- **Pre-installed Tools**: Includes ansible-lint, jmespath, ara, and essential Ansible collections
- **Security First**: Runs on Python 3.14-dev base with regular security updates
- **CI/CD Ready**: Automated builds, semantic versioning, and scheduled updates

## 📦 Available Images

Images are published to both Docker Hub and GitHub Container Registry:

```bash
# Docker Hub
docker pull hferreira/ansible-docker:latest
docker pull hferreira/ansible-docker:<release-version>

# GitHub Container Registry
docker pull ghcr.io/hferreira23/ansible-docker:latest
docker pull ghcr.io/hferreira23/ansible-docker:<release-version>
```

## 🔧 What's Inside

### Python Packages
- **ansible-core** - Core Ansible automation engine
- **ansible-lint** - Best practice checker for Ansible
- **jmespath** - JSON query language for Ansible filters
- **ara** - Ansible Run Analysis for playbook reporting
- **dnspython** - DNS toolkit for Python
- **pihole6api** - Pi-hole API client for Python

### Ansible Collections
- `community.general` - General purpose Ansible modules
- `ansible.posix` - POSIX system management
- `ansible.netcommon` - Network device modules
- `community.docker` - Docker container management
- `community.libvirt` - Libvirt virtualization
- `hferreira23.pihole` - Pi-hole management

### System Tools
- `git` - Version control
- `curl` - HTTP client
- `sshpass` - Non-interactive SSH password authentication
- `openssh-client` - SSH client
- `jq` - JSON processor

## 🏗️ Image Optimization

This image employs several strategies to minimize size:

1. **Multi-stage build** - Separate builder stage for compilation
2. **No documentation** - Excludes man pages, docs, and info files
3. **Minimal locales** - Only includes required language packs
4. **Python cache cleanup** - Removes `.pyc`, `.pyo`, and `__pycache__` directories
5. **APT cleanup** - Removes package lists and cache files
6. **No pip cache** - Uses `--no-cache-dir` for all pip installations

## 💻 Usage

### Basic Usage

```bash
docker run -it --rm hferreira/ansible-docker:latest
```

### Run Ansible Playbook

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  hferreira/ansible-docker:latest \
  ansible-playbook playbook.yml
```

### With SSH Keys

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -v ~/.ssh:/root/.ssh:ro \
  -w /workspace \
  hferreira/ansible-docker:latest \
  ansible-playbook -i inventory playbook.yml
```

### Interactive Shell

```bash
docker run -it --rm \
  -v $(pwd):/workspace \
  -w /workspace \
  hferreira/ansible-docker:latest \
  /bin/bash
```

## 🔄 CI/CD Workflows

### Automated Release Process

This repository uses [Release Please](https://github.com/googleapis/release-please) for automated semantic versioning:

1. **Commits** following [Conventional Commits](https://www.conventionalcommits.org/) trigger PR creation
2. **Release PR** is auto-merged when approved
3. **GitHub Release** is created with changelog
4. **Multi-arch images** are built and pushed to Docker Hub and GHCR
5. **Version tags** are created without the `v` prefix (e.g., `1.2.0`)

### Supported Commit Types
(based on https://github.com/commitizen/conventional-commit-types/blob/master/index.json)

- `feat:` - New features (minor version bump)
- `fix:` - Bug fixes (patch version bump)
- `perf:` - Performance improvements
- `docs:` - Documentation changes
- `style:` - Code style changes
- `refactor:` - Code refactoring
- `test:` - Test additions or fixes
- `build:` - Build system changes
- `ci:` - CI/CD changes
- `chore:` - Other maintenance tasks

### Build Triggers

- **Release Published** - Builds and pushes when a GitHub release is published
- **Pull Requests** - Builds (without push) for PRs starting with `fix:` or `feat:`
- **Scheduled** - Weekly builds on Saturdays at 4:00 AM UTC using latest release
- **Manual** - Via workflow_dispatch for on-demand builds using latest release

## 🏷️ Version Tags

- `latest` - Latest stable release
- `X.Y.Z` - Specific semantic version (e.g., `1.2.0`)
- `amd64` - AMD64-specific build
- `arm64` - ARM64-specific build

## 🛠️ Development

### Building Locally

```bash
docker build -t ansible-docker:local .
```

### Testing

```bash
docker run -it --rm ansible-docker:local ansible --version
docker run -it --rm ansible-docker:local ansible-lint --version
```

## 📋 Requirements

- Docker 20.10 or later
- Docker Buildx for multi-architecture builds

## 🤝 Contributing

Contributions are welcome! Please follow these guidelines:

1. Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages
2. PRs starting with `fix:` or `feat:` will automatically trigger CI builds
3. All commits are validated with commitlint
4. Release PRs are automatically created and merged

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [Docker Hub](https://hub.docker.com/r/hferreira/ansible-docker)
- [GitHub Container Registry](https://github.com/hferreira23/ansible-docker/pkgs/container/ansible-docker)
- [Issues](https://github.com/hferreira23/ansible-docker/issues)
- [Changelog](CHANGELOG.md)

## 📊 Image Information

- **Base Image**: dhi.io/python:3.14-dev
- **Architecture**: linux/amd64, linux/arm64
- **Shell**: bash
- **Python Path**: /opt/python

---

**Maintained by**: [Hugo Ferreira](https://github.com/hferreira23)
**Current Version**: 1.3.0
