# Library Management System with Frappe!

## Introduction

This is a test project for learning frappe and bench. This repo has the config for running a development setup using docker-compose. This is based on the steps found at [frappe_docker docs](https://github.com/frappe/frappe_docker/blob/main/docs/development.md)

## Development

To start docker containers for development, clone this repo and run

### On Linux
```bash
export UID
GID=$(id -g) docker-compose up
```

### On macOS
```bash
UID=$(id -u) GID=$(id -g) docker-compose up
```

Connect to the frappe dev container to use the bench cli:

```bash
docker exec -it frappe-dev-frappe-1 /bin/bash
```

This opens up bash as user frappe if the user id is matched. Otherwise, run `su frappe` to change user to frappe before continuing development.

NOTE: If the user id on host is not the same as user id of frappe in the container, there could be issues with file ownership and permissions. Please refer frappe_docker docs for more information.
