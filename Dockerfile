# ----------------------- Build Stage ---------------------- #
FROM node:lts-alpine as build

# Setting work directory
WORKDIR /usr/src/app/

# Copy packages files to workdir, changing owner to node user
COPY  package*.json ./

# Environment variable for env description
ENV NODE_ENV=production

# Use "npm ci" instead of "npm install"
RUN npm ci --only=${NODE_ENV}

# ----------------------- Release Stage ---------------------- #
FROM alpine:3.12 as release

# Install npm
RUN apk add npm

# Setting work directoey
WORKDIR /usr/src/app/

# Bundle application source code
COPY --from=build /usr/src/app/ .
COPY . .

# Published port documentation
EXPOSE 3000

# Using dumbe-init to deal with node process
CMD [ "node", "server.js"]