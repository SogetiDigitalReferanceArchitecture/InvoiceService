# Docker for invocie service container

FROM node
MAINTAINER Prashant Shandilya "prashant.shandilya@capgemini.com"

# Install the application
ADD package.json package.json 
RUN npm install  
ADD server.js /server/server.js
ENV WEB_PORT 80
EXPOSE  80

# Define command to run the application when the container starts
CMD ["node", "."] 