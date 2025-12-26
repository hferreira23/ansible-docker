# ansible-docker

[![build-containers](https://github.com/hferreira23/ansible-docker/actions/workflows/build-containers.yaml/badge.svg)](https://github.com/hferreira23/ansible-docker/actions/workflows/build-containers.yaml)
[![SemVer](https://github.com/hferreira23/ansible-docker/actions/workflows/SemVer.yaml/badge.svg)](https://github.com/hferreira23/ansible-docker/actions/workflows/SemVer.yaml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A production-ready, multi-architecture Docker image for Ansible automation, optimized for size and security.

## 🚀 Features

- **Latest Ansible Core**: Built with ansible-core 2.20.1
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
docker pull hferreira/ansible-docker:1.2.0

# GitHub Container Registry
docker pull ghcr.io/hferreira23/ansible-docker:latest
docker pull ghcr.io/hferreira23/ansible-docker:1.2.0
```

## 🔧 What's Inside

### Python Packages
- **ansible-core** 2.20.1 - Core Ansible automation engine
- **ansible-lint** 25.12.1 - Best practice checker for Ansible
- **jmespath** 1.0.1 - JSON query language for Ansible filters
- **ara** 1.7.4 - Ansible Run Analysis for playbook reporting
- **dnspython** 2.8.0 - DNS toolkit for Python

### Ansible Collections
- `community.general` - General purpose Ansible modules
- `ansible.posix` - POSIX system management
- `ansible.netcommon` - Network device modules
- `community.docker` - Docker container management
- `community.libvirt` - Libvirt virtualization

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

- **After Release** - Builds when SemVer workflow creates a release
- **Pull Requests** - Builds (without push) for PRs starting with `fix:` or `feat:`
- **Scheduled** - Weekly builds on Saturdays at 4:00 AM UTC
- **Manual** - Via workflow_dispatch for on-demand builds

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
**Current Version**: 1.2.0
