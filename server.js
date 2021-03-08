

// Require framework and instantiate it
const fastify = require('fastify')({ logger: true })
const PORT = 3000
const HOST = '0.0.0.0'

// Function tp handle signal
function handler(signal) {
    console.log(`Received event: ${signal}`)
}
process.on('SIGTERM', handler)

// Declare a route
fastify.get('/', async(request, apply) => {
    return { Hello: 'Docker'}
})

// Run the server
const start = async () => {
    try {
        await fastify.listen(PORT, HOST)
        console.log(`Server running: Process pid: ${process.pid}`)
    }catch(err) {
        fastify.log.error(err);
        ProcessingInstruction.exit(1)
    }
}
start();