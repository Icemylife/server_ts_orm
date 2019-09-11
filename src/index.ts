import 'reflect-metadata';
import * as Koa from 'koa';
import * as Router from 'koa-router';
import * as body from 'koa-bodyparser';
import { createConnection, getConnection } from 'typeorm';
// import { ProductEntity } from './entity/ProductEntity';
import { StoneEntity } from './entity/StoneEntity';

const app = new Koa();
const router = new Router();

createConnection();

router.get('/sandbox', async (ctx, next) => {
  const connection = await getConnection();

  const query = await connection
    // .getRepository(ProductEntity)
    .getRepository(StoneEntity)
    .createQueryBuilder('stone')
    .leftJoinAndSelect('stone.currency', 'currency')
    .take(2);

  const result = query.getMany();

  ctx.body = await result;
});

app
  .use(body())
  .use(router.routes())
  .use(router.allowedMethods());

app.listen(3000, 'localhost', null, () => {
  console.log('Server started!');
});