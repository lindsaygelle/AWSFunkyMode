from typing import Any, Dict, List, Optional, Union, TypedDict
from http import HTTPStatus
from http.client import HTTPResponse
from urllib.request import Request, urlopen
import json
import logging
import os


OPERATION_QUERY = "Query"
QUERY = """
query Query($limit: Int, $next_token: String) {
    get_pii_connection(limit: $limit, next_token: $next_token) {
        items {
            begin_offset
            created_date
            end_offset
            id
            order
            quote_id
            score
            type
            updated_date
        }
        next_token
    }
}
"""


class Pii(TypedDict):
    begin_offset: int
    created_date: str
    end_offset: int
    id: str
    order: int
    quote_id: str
    score: float
    type: str
    updated_date: str


class PiiConnection(TypedDict):
    items: Optional[List[Pii]]
    next_token: Optional[str]


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
        "X-Api-Key": os.environ.get("APP_SYNC_API_KEY"),
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


def make_app_sync_request_query(
    event_body: Any, event_headers: HTTPHeaders
) -> HTTPResponse:
    response = make_app_sync_request(
        event_headers=event_headers,
        operation_name=OPERATION_QUERY,
        query=QUERY,
        variables=event_body,
    )
    return response


def handler(event: Event, context: Any) -> Response:
    logging.info(event)
    body: Optional[PiiConnection] = None
    headers: HTTPHeaders = {"Content-Type": "application/json"}
    status_code: int = HTTPStatus.OK.value
    try:
        query_string_parameters = event.get("queryStringParameters") or {}
        event_body = {
            "limit": query_string_parameters.get("limit"),
            "next_token": query_string_parameters.get("next_token"),
        }
        logging.info(event_body)
        event_headers = event.get("headers")
        logging.info(event_headers)
        response: HTTPResponse = make_app_sync_request_query(event_body, event_headers)
        response_data: AppSyncResponse = json.load(response)
        logging.info(response_data)
        body = response_data.get("data")
        if isinstance(body, dict):
            body = body.get("get_pii_connection")
        headers = {**headers, **response.headers}
        status_code = response.status
        errors: AppSyncResponseError = response_data.get("errors")
        if isinstance(errors, list):
            logging.error(errors)
            status_code = HTTPStatus.BAD_REQUEST.value
    except Exception as e:
        logging.error(e)
        status_code = HTTPStatus.BAD_REQUEST.value
    logging.info({"body": body, "headers": headers, "status_code": status_code})
    return Response(
        body=json.dumps(body),
        headers=headers,
        statusCode=status_code,
    )
