# orderbird

Objective: https://github.com/orderbird/ob-teamday

## My Learnings:

This was a quite interesting task for me to deal with Spring Boot for first time and I enjoyed finding and fixing the error :)

1. As a first step, I thought of understanding how Sprint Boot application works before diving into finding the errors. I found a very nice article on how to build an Application using Spring Boot - https://spring.io/guides/gs/spring-boot/

2. Then I managed to download all the dependent tools and built a sample Hello SpringBoot application.

3. Built the application using Gradle.

4. I said "Hello" to the "Spring".


## Solution:

1. Dockerfile - contains the build step of the container.

2. Makefile - abstract the steps to run the application inside a container.

3. java/spring-boot-project/src/main/java/com/orderbird/teamday/HelloSpringController.java - 
This file contained an error and was fixed by importing RestController and RequestMapping package. And by adding RequestMapping for 'http://localhost:8080/' 

## Build Steps:

1. Clone the Repository ->

```
git clone https://github.com/hitheshsreedhara/orderbird.git
```
2. Build the Spring-Boot App using Makefile ->

```
make build
```
```
docker build -t spring-ob .
Sending build context to Docker daemon    257kB
Step 1/8 : FROM gradle:4.7-jdk-alpine
 ---> f438b7d58d0a
Step 2/8 : WORKDIR /opt/orderbird
 ---> Using cache
 ---> 6b57ee3fd05c
Step 3/8 : ADD ./java/spring-boot-project/ /opt/orderbird
 ---> dfeeae5930ab
Step 4/8 : USER root
 ---> Running in 28ab31a930d7
Removing intermediate container 28ab31a930d7
 ---> b72c147a738a
Step 5/8 : RUN chown -R gradle /opt/orderbird
 ---> Running in cb6e0fc23d2c
Removing intermediate container cb6e0fc23d2c
 ---> f2898568a7a6
Step 6/8 : USER gradle
 ---> Running in 4e3f65bae7ce
Removing intermediate container 4e3f65bae7ce
 ---> 1da56d8adeee
Step 7/8 : EXPOSE 8080
 ---> Running in d0814528775e
Removing intermediate container d0814528775e
 ---> 54f30c9d23eb
Step 8/8 : CMD ["gradle", "--stacktrace", "run"]
 ---> Running in 9bee7ce9f569
Removing intermediate container 9bee7ce9f569
 ---> 728ece0d8158
Successfully built 728ece0d8158
Successfully tagged spring-ob:latest
```

3. Run the App using make ->
```
make up
```
```
docker run -p 8080:8080 --name spring-ob spring-ob

Welcome to Gradle 4.7!

Here are the highlights of this release:
 - Incremental annotation processing
 - JDK 10 support
 - Grouped non-interactive console logs
 - Failed tests are re-run first for quicker feedback

For more details see https://docs.gradle.org/4.7/release-notes.html

Starting a Gradle Daemon (subsequent builds will be faster)
```

4. Browse for [http://localhost:8080](http://localhost:8080) to say Hello to the Spring through the container "spring-ob" ->

5. Check status of the container ->
```
make status
```
```
docker ps
CONTAINER ID        IMAGE               COMMAND                  CREATED             STATUS              PORTS                    NAMES
012b875e48c9        spring-ob           "gradle --stacktrace…"   27 seconds ago      Up 28 seconds       0.0.0.0:8080->8080/tcp   spring-ob
```
6. Stop the Application ->
```
make down
```

