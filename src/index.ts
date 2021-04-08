import 'reflect-metadata'
import * as tq from 'type-graphql'
import { ApolloServer } from 'apollo-server'
import { context } from './context'
import { resolvers } from '@generated/type-graphql'

const app = async () => {
  const schema = await tq.buildSchema({
    resolvers,
  })

  new ApolloServer({ schema, context: context }).listen({ port: 4000 }, () =>
    console.log(
      `Graphql docs: http://localhost:4000`,
    ),
  )
}

app()
