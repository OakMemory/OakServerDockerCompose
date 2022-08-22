# OakServerDockerCompose

The service stack of OakMemory

## Docker Compose image for OakServer

It contains some service:

- Cron: Automatic backup using git
- PaperSpigot: The game server software

### Cron

#### Envs

- `GIT_EMAIL` Set the email git to use.
- `GIT_NAME` Set the name git to use.

### PaperSpigot

#### Envs

- `USE_AUTHLIB_INJECT` Set if paper use authlib_injector. Default is `false`
- `USE_AUTHLIB_SERVER` Set if paper use authlib_injector server. Default is ` `
- `MAX_MEM` Set the paper max memory usage. Default is 1024M
- `JVM_ARGS` Will passing to JVM while JVM start. Default is `-XX:-UseG1GC`
