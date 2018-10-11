FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
EXPOSE 8888
ENV JAVA_OPTS "-server -Xms512m -Xmx512m -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError"
ENTRYPOINT java ${JAVA_OPTS} -Djava.security.egd=file:/dev/./urandom -jar /app.jar
