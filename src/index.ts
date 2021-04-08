import 'reflect-metadata';
import * as tq from 'type-graphql';
import { ApolloServer } from 'apollo-server';
import { context } from './context';
import { resolvers } from '@generated/type-graphql';
import dotenv from 'dotenv';

dotenv.config();

const app = async () => {
  const schema = await tq.buildSchema({
    resolvers,
  })

  new ApolloServer({ schema, context: context }).listen({ port: process.env.APP_PORT }, () =>
    console.log(
      `Graphql docs: http://localhost:${process.env.APP_PORT}`,
    ),
  )
}

app();
