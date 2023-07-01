# pull the base image
FROM node:alpine

ARG BACKEND_URL
ENV BACKEND_URL ${BACKEND_URL} 

# set the working direction
WORKDIR /

COPY . ./

RUN npm install
RUN npm run build

EXPOSE 3000

# start app
CMD ["npm", "start"]
