import { util } from "@aws-appsync/utils";

/**
 * Queries FunkyMode DynamoDB table, limits the number of returned items (QuoteSubscription), and paginates with the provided `next_token`
 * @param {import('@aws-appsync/utils').Context<{limit?: number; next_token?: string}>} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBQueryRequest} the request
 */
export function request(ctx) {
  const { limit = 20, next_token = null } = ctx.args;
  const query = JSON.parse(
    util.transform.toDynamoDBConditionExpression({
      pk: {
        eq: "QuoteSubscription",
      },
      sk: {
        beginsWith: "Metadata#",
      },
    }),
  );
  return { limit, nextToken: next_token, operation: "Query", query };
}

/**
 * Returns the query items
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {[*]} a flat list of result items
 */
export function response(ctx) {
  if (ctx.error) {
    util.error(ctx.error.message, ctx.error.type);
  }
  return ctx.result;
}
