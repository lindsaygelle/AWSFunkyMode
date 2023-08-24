from typing import Any, Dict, List, Optional, Union, TypedDict
from http import HTTPStatus
from http.client import HTTPResponse
from urllib.request import Request, urlopen
from uuid import NAMESPACE_DNS, UUID, uuid5
import json
import os


MUTATION = """
mutation Mutation(
        $quote_id: ID!,
        $id: ID!,
        $user_id: ID!
    ) {
    create_quote_subscription(input: {
        quote_id: $quote_id,
        id: $id,
        user_id: $user_id
    }) {
        created_date
        quote_id
        id
        updated_date
        user_id
    }
}
"""
OPERATION_MUTATION = "Mutation"


class QuoteSubscription(TypedDict):
    created_date: str
    quote_id: str
    id: str
    updated_date: str
    user_id: str


class QuoteSubscriptionMutation(TypedDict):
    quote_id: str
    id: UUID
    user_id: str


AppSyncRequestVariables = Dict[str, Any]


class AppSyncRequest(TypedDict):
    operationName: str
    query: str
    variables: Optional[AppSyncRequestVariables]


AppSyncResponseData = Any


class AppSyncResponseError(TypedDict):
    locations: List[Dict[str, str]]
    message: str
    path: str


class AppSyncResponse(TypedDict):
    data: Optional[AppSyncResponseData]
    errors: Optional[List[AppSyncResponseError]]


HTTPHeaders = Dict[str, str]
HTTPMultiValueHeaders = Dict[str, List[str]]


class EventRequestContextIdentity(TypedDict):
    accessKey: str
    accountId: str
    apiKey: str
    apiKeyId: str
    caller: str
    cognitoAuthenticationProvider: Optional[str]
    cognitoAuthenticationType: Optional[str]
    cognitoIdentityId: Optional[str]
    cognitoIdentityPoolId: Optional[str]
    principalOrgId: Optional[str]
    sourceIp: str
    user: str
    userAgent: str
    userArn: str


class EventRequestContext(TypedDict):
    accountId: str
    apiId: str
    domainName: str
    domainPrefix: str
    extendedRequestId: str
    httpMethod: str
    identity: EventRequestContextIdentity
    path: str
    protocol: str
    requestId: str
    requestTime: str
    requestTimeEpoch: int
    resourceId: str
    resourcePath: str
    stage: str


EventMultiValueQueryStringParameters = Dict[str, List[str]]
EventPathParameters = Dict[str, str]
EventQueryStringParameters = Dict[str, str]


class Event(TypedDict):
    body: Optional[str]
    headers: Optional[HTTPHeaders]
    httpMethod: str
    isBase64Encoded: bool
    multiValueHeaders: Optional[HTTPMultiValueHeaders]
    multiValueQueryStringParameters: Optional[EventMultiValueQueryStringParameters]
    path: str
    pathParameters: Optional[EventPathParameters]
    queryStringParameters: Optional[EventQueryStringParameters]
    requestContext: EventRequestContext
    resource: str
    stageVariables: Optional[Dict[str, str]]


class Response(TypedDict):
    body: Optional[Any]
    headers: HTTPHeaders
    statusCode: int


def create_app_sync_request(
    app_sync_request_data: AppSyncRequest,
    app_sync_request_headers: HTTPHeaders,
) -> Request:
    url: Optional[str] = os.environ.get("APP_SYNC_GRAPHQL_URL")
    request: Request = Request(
        url,
        data=json.dumps(app_sync_request_data, default=lambda x: str(x)).encode(
            "utf-8"
        ),
        headers=app_sync_request_headers,
        method="POST",
    )
    return request


def create_app_sync_request_data(
    operation_name: str, query: str, variables: AppSyncRequestVariables
) -> AppSyncRequest:
    return AppSyncRequest(
        operationName=operation_name,
        query=query,
        variables=variables,
    )


def create_app_sync_request_headers(headers: HTTPHeaders) -> Dict[str, str]:
    return {
        "Content-Type": "application/json",
        "X-Api-Key": headers.get("X-Api-Key"),
    }


def make_app_sync_request(
    event_headers: HTTPHeaders,
    operation_name: str,
    query: str,
    variables: AppSyncRequestVariables,
) -> HTTPResponse:
    app_sync_request_data = create_app_sync_request_data(
        operation_name=operation_name, query=query, variables=variables
    )
    app_sync_request_headers = create_app_sync_request_headers(event_headers)
    request: Request = create_app_sync_request(
        app_sync_request_data, app_sync_request_headers
    )
    response: HTTPResponse = urlopen(request)
    return response


def make_app_sync_request_mutation(
    event_body: QuoteSubscriptionMutation, event_headers: HTTPHeaders
) -> HTTPResponse:
    response = make_app_sync_request(
        event_headers=event_headers,
        operation_name=OPERATION_MUTATION,
        query=MUTATION,
        variables=event_body,
    )
    return response


def handler(event: Event, context: Any) -> Response:
    body: Optional[QuoteSubscription] = None
    headers: HTTPHeaders = {"Content-Type": "application/json"}
    status_code: int = HTTPStatus.OK.value
    try:
        event_body: QuoteSubscriptionMutation = json.loads(event.get("body"))
        event_body["id"] = uuid5(NAMESPACE_DNS, json.dumps(event_body, sort_keys=True))
        print(event_body)
        event_headers = event.get("headers")
        print(event_headers)
        response: HTTPResponse = make_app_sync_request_mutation(
            event_body, event_headers
        )
        response_data: AppSyncResponse = json.load(response)
        print(response_data)
        body = response_data.get("data", {}).get("create_quote_subscription")
        headers = {**headers, **response.headers}
        status_code = response.status
        errors: AppSyncResponseError = response_data.get("errors")
        if isinstance(errors, list):
            print(errors)
            status_code = HTTPStatus.BAD_REQUEST.value
    except Exception as e:
        status_code = HTTPStatus.BAD_REQUEST.value
    return Response(
        body=json.dumps(body),
        headers=headers,
        statusCode=status_code,
    )
