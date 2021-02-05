FROM java:8
VOLUME /tmp
COPY springboot-websocket-0.0.1-SNAPSHOT.jar demo.jar
RUN bash -c "touch /demo.jar"
EXPOSE 8090
ENTRYPOINT ["java","-jar","demo.jar"]