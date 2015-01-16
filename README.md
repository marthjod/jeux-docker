# jeux-docker

[Docker](https://docker.com) containers for running [jeux](https://github.com/marthjod/jeux) backend and [jeuxngo](https://github.com/marthjod/jeuxngo) frontend

## Building

- Database container (gets populated with test data SQL dump during build):
`docker build -t=jeux/db db/`
- Django framework container:
`docker build -t=jeux/django django/`
- Nginx webserver container:
`docker build -t=jeux/webserver webserver/`
- Optionally, for development: data volume containing app's sources (cloned from [JEUX](https://github.com/marthjod/jeux)):
`docker build -t=jeux/data-volume data-volume/`

## Running


- Example:

```bash
docker run -d --name db jeux/db

docker run -d \
	-e JEUX_DB_HOST=db \
	-e JEUX_DB_PORT=3306 \
	-e JEUX_DB_NAME=jeuxdb \
	-e JEUX_DB_USER=jeuxdb_user \
	-e "JEUX_DB_PASS=thepass" \
	-e "DJANGO_SECRET_KEY=yourkey" \
	-e APP_URL_PREFIX=audience \
	-p 8000:8000 \
	--link db:db \
	--name django
	jeux/django

docker run -it \
	-p 80:80 \
	--link django:django \
	jeux/webserver
```

- Access webapp at http://DOCKER_HOST:PORT/audience/rankings/ (e.g., http://localhost:80/audience/rankings/)

## Developing

- Example:

```bash
docker run -ti --name sources jeux/data-volume
# or, make a local source directory available
docker run -ti --name sources -v /path/to/jeux/sources jeuxngo/data-volume

docker run -d --name db jeux/db
docker run -d -p 8000:8000 --volumes-from sources --link db:db jeux/django
```





