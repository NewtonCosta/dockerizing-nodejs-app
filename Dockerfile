# Depending of your application requirement, is good practice to stick the base image version tag instead of using latest.
# Basically, using "image:lalest", every since the image is updated the latest tag will change, 
# probabily causing some incompatibility issue 
FROM node:lts-alpine

# Using dumb-init to handler npm process
RUN apk add dumb-init

ENV NODE_ENV=production

WORKDIR /usr/src/app

# Copy app files and change owner to node user
COPY --chown=node:node . /usr/src/app

# Use "npm ci" instead of "npm install"
RUN npm ci --only=production

# Explicitly running npm command with node user
# It's note recommended running npm command with sudo/root privilege
USER node

# CMD "npm" "start"
# CMD "yarn" "start"
# CMD ["yarn", "start"]
# CMD ["node", "server.js"]
# Options above works, but is not recommended for production
CMD ["dumb-init", "node", "server.js"]