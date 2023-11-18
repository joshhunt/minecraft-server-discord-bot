// ESM
import Fastify from "fastify";

const fastify = Fastify({
  logger: true,
});

// Declare a route
fastify.get("/", (request, reply) => {
  reply.send({ hello: "world" });
});

const port = parseInt(process.env.PORT ?? "3333");

fastify.listen({ port: port }, (err, address) => {
  if (err) throw err;
  console.log(`Server is now listening on ${address}`);
});
