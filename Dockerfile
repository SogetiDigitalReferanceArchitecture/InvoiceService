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

# Run IBM vulnerability advisor policies 
RUN sed -i -e '/^PASS_MIN_DAYS/ s/0/1/' /etc/login.defs
RUN sed -i -e '/^PASS_MAX_DAYS/ s/99999/90/' /etc/login.defs
RUN sed -i -e '/^password.*pam_unix.so/ s/$/ minlen=8/' /etc/pam.d/common-password 

# Define command to run the application when the container starts
CMD ["node", "."] 