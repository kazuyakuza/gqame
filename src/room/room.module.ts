import { Module } from '@nestjs/common';
import { RoomGateway } from './room.gateway';

@Module({
  providers: [RoomGateway],
})
// eslint-disable-next-line prettier/prettier
export class RoomModule { }
