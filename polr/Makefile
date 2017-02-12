help:
	@echo "First, get a MySQL docker up. Remember to map port & volume for it."
	@echo "For example, map 0.0.0.0:11306 to the docker's 3306. Then mount /var/lib/grokking/mysql to /var/lib/mysql"


# TODO: add checks to see if DB is running -> yes: new docker spins up, but use existing data
# TODO: add checks for params (e.g: password need to be set to something else)
MYSQL_MOUNT_DIR ?= /grokking/var/lib/mysql
MYSQL_ROOT_PASSWORD ?= rootpassword
MYSQL_ROOT_PORT ?= 13306
MYSQL_ROOT_NAME ?= mysql
mysql_docker_volume := /var/lib/mysql
mysql_docker_port := 3306
mysql_image := mysql:8.0.0
run.mysql:
	mkdir -p $(MYSQL_MOUNT_DIR)
	docker run -d -v $(MYSQL_MOUNT_DIR):$(mysql_docker_volume) --name $(MYSQL_ROOT_NAME) -e MYSQL_ROOT_PASSWORD=$(MYSQL_ROOT_PASSWORD) -p $(MYSQL_ROOT_PORT):$(mysql_docker_port) $(mysql_image)
