# Use a base image that does not run as root
FROM openjdk:11-jre-slim

ARG JAR_FILE

# Create a directory for your app and set the correct permissions
RUN mkdir /app && chown nobody:nogroup /app

# Copy the JAR file into the image
COPY $JAR_FILE /app/myapp.jar

# Specify the working directory
WORKDIR /app

# Run the app as a non-root user
USER nobody
CMD ["java", "-jar", "myapp.jar"]
