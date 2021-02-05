# VERSION 1.0.0
# Author: ljt

# 打包jar采用maven镜像
FROM maven:3.6-jdk-8-slim AS MAVEN_BUILD
MAINTAINER ljt <1502362004@qq.com>

# 工作目录在镜像的 /build 目录下
WORKDIR /build/
# 把本地的 pom.xml 和 src目录 复制到镜像的/build目录下
COPY pom.xml /build/
COPY src /build/src/
# 执行maven打包
RUN mvn package
# 运行jar采用jdk基础镜像
FROM openjdk:8-jdk-alpine
# 设置工作目录在镜像的 /app 目录下
WORKDIR /app
# 将jar包添加到容器中并更名为app.jar
COPY --from=MAVEN_BUILD /build/target/springboot-websocket-0.0.1-SNAPSHOT.jar /app/
#RUN bash -c "touch /demo.jar"
EXPOSE 8090
# 运行jar包
ENTRYPOINT ["java","-jar","springboot-websocket-0.0.1-SNAPSHOT.jar"]