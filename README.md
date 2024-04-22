## Vireo 3 Containerization

Containerized Vireo 3 Application for running in Docker or Kubernetes environment.


Application Versions:
- Vireo: [3.0.0](https://github.com/TexasDigitalLibrary/Vireo/releases/tag/v3.0.0)
- Play! Framework: [play-1.3.x-1.3.0-37-g2ca9290](https://github.com/TexasDigitalLibrary/play1/releases)


Reference: [Vireo 3.0.0 Installation](https://github.com/TexasDigitalLibrary/Vireo/wiki/3.0.0-installation)



#### Build and Run


```
# Start/stop application:

docker compose up -d
docker compose down -v

# Delete images:

docker rmi dissertation-vireo:1.0.0
docker system prune --force

docker rmi dissertation-db:1.0.0
docker system prune --force

docker rmi dissertation-apache:1.0.0
docker system prune --force

docker rmi dissertation-vireo:1.0.0 dissertation-db:1.0.0 dissertation-apache:1.0.0
docker system prune --force

# Connect to containers:

docker exec -it dissertation-vireo bash
docker exec -it dissertation-db bash
docker exec -it dissertation-apache bash

# Build individual services

BUILDKIT_PROGRESS=plain docker compose build vireo --no-cache 2>&1 | tee vireo-build.log
BUILDKIT_PROGRESS=plain docker compose build db --no-cache 2>&1 | tee db-build.log
BUILDKIT_PROGRESS=plain docker compose build apache --no-cache 2>&1 | tee apache-build.log
```


**Note:** To use Shibboleth for authentication, replace or configure the `dissertation-apache` service to use Shibboleth Service Provider.