# Pull node image from docker hub
FROM node:latest

# Set working directory
RUN mkdir -p /var/www/gqame
WORKDIR /var/www/gqame

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /var/www/gqame/node_modules/.bin:$PATH

# create user with no password
RUN adduser --disabled-password gqame

ENV USER=gqame

# Copy existing application directory contents
COPY --chown=$USER:$USER . /var/www/gqame
# install and cache app dependencies
COPY --chown=$USER:$USER package.json /var/www/gqame/package.json

# clear application caching
RUN npm cache clean --force

# grant a permission to the application
RUN chown -R $USER:$USER /var/www/gqame/
USER gqame

# install all dependencies
RUN npm install

EXPOSE 3004
CMD [ "npm", "run", "start" ]
