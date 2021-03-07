function handler(signal) {
    console.log(`Received event: ${signal}`)
}
process.on('SIGHUP', handler)

// Require framework and instantiate it
const fastify = require('fastify')({ logger: true })

// Declare a route
fastify.get('/', async(request, apply) => {
    return { Hello: 'Docker'}
})

// Run the server
const start = async () => {
    try {
        await fastify.listen(3000)
        console.log(`Server running: Process pid: ${process.pid}`)
    }catch(err) {
        fastify.log.error(err);
        ProcessingInstruction.exit(1)
    }
}
start();