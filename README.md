# Some best practices for building a typical NodeJS application Docker image
In this repo I cover some recommended best practices for building efficient NodeJS application images 

**First things first**
> Docker builds images automatically by reading the instructions from a Dockerfile -- a text file that contains all commands, in order, needed to build a given image.

For simplicity explanation, I bluit a web server using [Fastify](https://www.fastify.io/) as example. 

### 1. Prefer pin the release version of your NodeJS base image.
It's a good practice to stick the base image version tag instead of using latest.
Basically, using "image:latest", every since the image is updated the latest tag will point to a different image version, depending on your application requirement, probably I can cause some incompatibility issue

Example: ``FROM node:14`` 

### 2. Run _npm ci_ instead of _npm install_
_npm ci_ will be significantly faster when: 

- Thereis a package-lock.json or npm-shrinkwrap.json file.
- The node_modules folder is missing or empty.

_npm ci_ command is similar to npm install, except it's meant to be used in automated environments such as test platforms, continuous integration, and deployment -- or any situation where you want to make sure you're doing a clean install of your dependencies.

Checkout the main differences between usind _npm install_ and _npm ci_ [here](https://docs.npmjs.com/cli/v7/commands/npm-ci)

### 3. Don't install unnecessary packages
The size of image does really matter  when we are building image to production usage. To reduce complexity, file sizes and build times avoid installing unnecessary packages.
In the NodeJs context, we can manage it by using **--only=production** flag with _npm ci_ or _npm install_.

### 4. Exclude with .dockerignore
Docker provide a .dockerignore file to exclude files not relevant to the build (without restruturing source repo). 
It's recommended add **node_modules** and **npm-debug.log** to prevent your local modules and debug logs being copied onto your final Docker Image.

### 5. Use multi-stage builds
[Multi-stage builds](https://docs.docker.com/develop/develop-images/multistage-build/) allow you to drastically reduce the size of your final image, without struggling to reduce the number of intermediate layers and files.

<hr>

 Pick up the [Dockerfile](https://github.com/NewtonCosta/dockerizing-nodejs-app/blob/3a3ba5ef73bd11f85dfe8385a151568b093afebb/Dockerfile) as an example. 
 
 
 
 
