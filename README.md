# Some best practices for building a typical NodeJS application Docker image
In this repo I cover some recommended best practices for building efficient NodeJS application images 

**First things first**
> Docker builds images automatically by reading the instructions from a Dockerfile -- a text file that contains all commands, in order, needed to build a given image.

For simplicity explanation, I bluit a web server using [Fastify](https://www.fastify.io/) as example. 

### 1. Prefer stick the release version of your NodeJS base image.
It's a good practice to stick the base image version tag instead of using latest.
Basically, using "image:lalest", every since the image is updated the latest tag will change, probabily causing some incompatibility issue, obviously depending on your application requirement

``FROM node:lts-alpine``
