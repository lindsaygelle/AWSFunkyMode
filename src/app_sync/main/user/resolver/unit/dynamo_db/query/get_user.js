import { util } from "@aws-appsync/utils";

/**
 * Sends a request to get an item (User) with id `ctx.args.id`
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBGetItemRequest} the request
 */
export function request(ctx) {
  return {
    key: util.dynamodb.toMapValues({
      pk: "User",
      sk: ("Metadata#" + ctx.args.id)
    }),
    operation: "GetItem"
  };
}

/**
 * Returns the fetched DynamoDB item
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {*} the DynamoDB item
 */
export function response(ctx) {
  return ctx.result;
}
