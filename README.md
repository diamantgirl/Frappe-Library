# Development Setup with Frappe!

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

## Creating a site

```bash
# Create bench
bench init --skip-redis-config-generation frappe-bench
cd frappe-bench

# Setup hosts
bench set-config -g db_host mariadb
bench set-config -g redis_cache redis://redis-cache:6379
bench set-config -g redis_queue redis://redis-queue:6379
bench set-config -g redis_socketio redis://redis-queue:6379

# Create a new site
bench new-site --no-mariadb-socket development.localhost
# bench new-site --mariadb-root-password 123 --admin-password admin --no-mariadb-socket development.localhost

# Set developer mode
bench --site development.localhost set-config developer_mode 1
bench --site development.localhost clear-cache

# Start bench
bench start # without debugging
bench --site development.localhost console # with debugging
```

After this step, the locally created site can be accessed via http://development.localhost:8000

## Next steps

Once the development setup is ready, this can be used for trying out or developing new apps. Each app is typically maintained in its own git repo. Consult frappe framework docs for [creating an app](https://frappeframework.com/docs/user/en/tutorial/create-an-app) or [adding an existing app](https://frappeframework.com/docs/user/en/bench/bench-commands#add-apps).
