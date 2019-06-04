## Two distinct sections 
## The configuration for the first block is pretty similar to the last ones like so:
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

## Sends we are not worried about instant updates, we don't need to copy over to /app, just to (`.`)
## The path to the folder of all the files we care about, will be in `/app/build` essentially what we want to copy over to the run face.
## To specify the start of a second phase we will need to do this. Notice there isn't any need for special syntax for a new base image Block. So, you can assume that each of this statements can only have a single function. FROM statements terminate the sections(block)
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
## ^^ It is saying, I want to copy over something from the previous phase
## We don't need to specifically state any start command, because nginx essentially takes care of that itself. 