# Makefile.

build:
	docker build -t spring-ob .

up:
	docker run -p 8080:8080 --name spring-ob spring-ob

daemon:
	docker run -d -p 8080:8080 --name spring-ob spring-ob

down:
	docker stop spring-ob

status:
	docker ps 

cleanup:
	docker rm $$(docker ps -a -q)

cleanup-images:
	docker rmi $$(docker images | grep "^<none>" | awk "{print $$3}")
