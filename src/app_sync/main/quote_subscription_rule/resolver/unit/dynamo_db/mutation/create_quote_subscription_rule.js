import { util } from "@aws-appsync/utils";

/**
 * Puts an item (QuoteSubscriptionRule) into the DynamoDB table FunkyMode using an auto-generated ID.
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {import('@aws-appsync/utils').DynamoDBPutItemRequest} the request
 */
export function request(ctx) {
  const createdDate = util.time.nowISO8601();
  const { id = util.autoUlid() } = ctx.args.input;
  const updatedDate = createdDate;
  return {
    attributeValues: util.dynamodb.toMapValues(
      Object.assign(
        { created_date: createdDate, id, updated_date: updatedDate },
        ctx.args.input,
      ),
    ),
    key: util.dynamodb.toMapValues({
      pk: "QuoteSubscriptionRule",
      sk: "Metadata#" + id,
    }),
    operation: "PutItem",
  };
}

/**
 * Returns the item or throws an error if the operation failed
 * @param {import('@aws-appsync/utils').Context} ctx the context
 * @returns {*} the inserted item
 */
export function response(ctx) {
  if (ctx.error) {
    util.error(ctx.error.message, ctx.error.type);
  }
  return ctx.result;
}
