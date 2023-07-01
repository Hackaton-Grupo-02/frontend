# pull the base image
FROM node:alpine

ARG BACKEND_URL
ENV BACKEND_URL ${BACKEND_URL} 

# set the working direction
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install app dependencies

COPY package.json ./
COPY package-lock.json ./
RUN npm install
RUN npm run build

# add app
COPY . ./

# start app
CMD ["npm", "start"]