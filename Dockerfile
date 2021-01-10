# Pull node image from docker hub
FROM node:10-alpine

# create user with no password
RUN adduser --disabled-password gqame

USER gqame

# Set working directory
RUN mkdir -p /var/www/gqame
WORKDIR /var/www/gqame

# grant a permission to the application
RUN sudo chown -Rh $USER:$USER /var/www/gqame

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /var/www/gqame/node_modules/.bin:$PATH

# Copy existing application directory contents
COPY . /var/www/gqame
# install and cache app dependencies
COPY package.json /var/www/gqame/package.json

# clear application caching
RUN npm cache clean --force

# install all dependencies
RUN npm install

EXPOSE 3004
CMD [ "npm", "run", "start" ]
