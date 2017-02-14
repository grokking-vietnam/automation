help:
	@echo "First, get a MySQL docker up. Remember to map port & volume for it."
	@echo "For example, map 0.0.0.0:11306 to the docker's 3306. Then mount /var/lib/grokking/mysql to /var/lib/mysql"
	@echo "Then run the Polr docker (nginx + php + polr). Again, mount the code folder"


# TODO: add checks to see if DB is running -> yes: new docker spins up, but use existing data
# TODO: add checks for params (e.g: password need to be set to something else)
MYSQL_MOUNT_DIR ?= /var/grokking/var/lib/mysql
MYSQL_ROOT_PASSWORD ?= rootpassword
MYSQL_ROOT_PORT ?= 13306
MYSQL_DOCKER_NAME ?= mysql
mysql_docker_volume := /var/lib/mysql
mysql_docker_port := 3306
mysql_image := mysql:8.0.0
run.mysql:
	mkdir -p $(MYSQL_MOUNT_DIR)
	docker run -d -v $(MYSQL_MOUNT_DIR):$(mysql_docker_volume) --name $(MYSQL_DOCKER_NAME) -e MYSQL_ROOT_PASSWORD=$(MYSQL_ROOT_PASSWORD) -p $(MYSQL_ROOT_PORT):$(mysql_docker_port) $(mysql_image)

POLR_MOUNT_DIR ?= /var/grokking/var/www/polr
POLR_DOCKER_NAME = polr
POLR_HTTP_PORT = 1080
POLR_HTTPS_PORT = 10443
polr_docker_dir := /var/www/polr
polr_docker_http_port := 80
polr_docker_https_port := 443
polr_image := grokking.polr
run.polr:
	mkdir -p $(POLR_MOUNT_DIR)
	docker run -d -v $(POLR_MOUNT_DIR):$(polr_docker_dir) --name $(POLR_DOCKER_NAME) -p $(POLR_HTTP_PORT):$(polr_docker_http_port) -p $(POLR_HTTPS_PORT):$(polr_docker_http_port) $(polr_image)

OPTS ?=
TAG ?= latest
docker_name := grokking.polr
build.docker:
	docker build --rm $(OPTS) -t $(docker_name):$(TAG) .

debug.polr:
	docker exec -it polr /bin/bash
