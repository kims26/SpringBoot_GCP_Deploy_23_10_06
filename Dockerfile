# 베이스 이미지로 OpenJDK 11 이미지를 사용합니다.
FROM openjdk:11

# 작업 디렉토리를 /app으로 설정합니다.
WORKDIR /app

# JAR 파일을 Docker 이미지로 복사합니다.
COPY target/your-spring-boot-app.jar /app/

# Docker 컨테이너 내에서 8080 포트를 사용합니다.
EXPOSE 8080

# 애플리케이션을 실행합니다.
CMD ["java", "-jar", "your-spring-boot-app.jar"]
