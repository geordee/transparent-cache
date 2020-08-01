# Transparent Cache Example

Demonstrate a transparent cache configuration using Nginx.

The project uses an OpenResty server, which is a platform
based on Nginx and LuaJIT.

## Prerequisites

- OpenResty
- LuaRocks
- Lapis

## Develop

```bash
mkdir transparent-cache
lapis new --lua
lapis server
```

## Deploy

```bash
docker build -t transparent-cache:latest .
docker run -d --name cached-api -p 8080:8080 transparent-cache
```

## Test

```bash
time curl localhost:8080
for i in $(seq 3);do time curl localhost:8080/slow;done
for i in $(seq 3);do time curl localhost:8080/cached/slow;done
```
