# OakServerDockerCompose

The service stack of OakMemory

## Docker Compose image for OakServer

It contains some service:

- Cron: Automatic tasks
- PaperSpigot: The game server software

### Cron

This service contains so many automatic tasks, such as automatic backup and automatic clean outdated logs.

#### Envs

- `GIT_EMAIL` Set the email git to use.
- `GIT_NAME` Set the name git to use.

### PaperSpigot

This server running the paper spigot server software.

#### Envs

- `USE_AUTHLIB_INJECT` Set if paper use authlib_injector. Default is `false`
- `USE_AUTHLIB_SERVER` Set if paper use authlib_injector server. Default is ` `
- `MAX_MEM` Set the paper max memory usage. Default is 1024M
- `JVM_ARGS` Will passing to JVM while JVM start. Default is `-XX:-UseG1GC`

#### Args

- `AUTHLIB_VERSION`: Set the authlib-injector version to build. Default is `v1.2.1`
- `AUTHLIB_REPO`: Set the authlib-injector clone repo. Default is `https://github.com/OakMemory/AuthlibInjector`
