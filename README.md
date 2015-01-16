# jeux-docker

[Docker](https://docker.com) containers for running [jeux](https://github.com/marthjod/jeux) backend and  [jeuxngo](https://github.com/marthjod/jeuxngo) frontend

## Building

- Database container (gets populated with test data SQL dump during build):
`docker build -t=jeuxngo/db db/`
- Django framework container:
`docker build -t=jeuxngo/django django/`
- Optionally, for development: data volume containing app's sources (cloned from [JEUX](https://github.com/marthjod/jeux)):
`docker build -t=jeuxngo/data-volume data-volume/`

## Running


- Example:

```bash
docker run -d --name db jeuxngo/db

docker run -ti \
	-e JEUX_DB_HOST=db \
	-e JEUX_DB_PORT=3306 \
	-e JEUX_DB_NAME=jeuxdb \
	-e JEUX_DB_USER=jeuxdb_user \
	-e "JEUX_DB_PASS=thepass" \
	-e "DJANGO_SECRET_KEY=yourkey" \
	-p 8000:8000 \
	--link db:db \
	jeuxngo/django
```

- Access webapp at http://DOCKER_HOST:PORT/rankings/ (e.g., http://localhost:8000/rankings/)
- Optionally, replace first `8000` with a Docker host port where webapp should be accessible.

## Developing

- Example:

```bash
docker run -ti --name sources jeuxngo/data-volume
# or, make a local source directory available
docker run -ti --name sources -v /path/to/jeuxngo/sources jeuxngo/data-volume

docker run -d --name db jeuxngo/db
docker run -d -p 8000:8000 --volumes-from sources --link db:db jeuxngo/django
```





