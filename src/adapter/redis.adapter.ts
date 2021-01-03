import { IoAdapter } from '@nestjs/platform-socket.io';
import { createAdapter } from 'socket.io-redis';
export class RedisIoAdapter extends IoAdapter {
  createIOServer(port: number) {
    const server = super.createIOServer(port);
    const redisAdapter = createAdapter(
      `${process.env.REDIS_HOST}:${parseInt(process.env.REDIS_PORT)}`,
    );
    server.adapter(redisAdapter);
    return server;
  }
}
