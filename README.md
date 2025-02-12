# docker-oss-serverless

Docker image containing [oss-serverless](https://github.com/oss-serverless/serverless) (maintained version of [Serverless Framework](https://www.serverless.com/) CLI v3).

As discussed in [this article](https://dev.to/aws-heroes/whats-next-with-the-serverless-framework-in-2025-121d), the official Serverless team has decided to drop support for Serverless Framework v3 and focus on v4, which has licensing changes that also affects the [CLI's authentication method](https://www.serverless.com/framework/docs/guides/upgrading-v4#authentication-via-access-or-license-keys). This gave birth to **oss-serverless**, an open-source fork of Serverless Framework v3, that is planned to be continuously maintained and enhanced.

The Docker image contains:
- Node.js
- Serverless Framework
- AWS CLI (required by some Serverless plug-ins)

## Prerequisites

- [Docker](https://docs.docker.com/get-docker/)
- [Make](https://www.gnu.org/software/make/)

## Usage

See [Makefile](Makefile) for configured versions.

#### build Docker image

```bash
$ make build
```

#### push image to container registry (i.e., Docker Hub)

```bash
$ make push
```

#### open shell inside the container

```bash
$ make shell
```