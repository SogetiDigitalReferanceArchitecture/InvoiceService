# Docker for invocie service container

FROM node
MAINTAINER Prashant Shandilya "prashant.shandilya@capgemini.com"

# Create app directory
RUN mkdir -p /app
WORKDIR /app

# Install the application
ADD package.json /app/package.json
RUN npm install -g loopback-cli 
RUN npm install  
COPY . /app
ENV WEB_PORT 8080
EXPOSE  8080

# Define command to run the application when the container starts
CMD ["node", "."] 