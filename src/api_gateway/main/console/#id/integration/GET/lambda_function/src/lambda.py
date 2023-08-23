from typing import Any, Dict, List, Optional, Union, TypedDict
from http import HTTPStatus
from http.client import HTTPResponse
from urllib.request import Request, urlopen
import json
import os


QUERY = """
query Query($id: ID!) {
    get_console(id: $id) {
        abbreviation
        created_date
        id
        name
        updated_date
    }
}
"""


class Console(TypedDict):
    abbreviation: str
    created_date: str
    id: str
    name: str
    updated_date: str


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
        data=json.dumps(app_sync_request_data).encode("utf-8"),
        headers=app_sync_request_headers,
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


def make_app_sync_request_query(event: Event) -> HTTPResponse:
    path_parameters = event.get("pathParameters", {})
    event_headers = create_app_sync_request_headers(event.get("headers"))
    app_sync_request_variables = {
        "id": path_parameters.get("id"),
    }
    response = make_app_sync_request(
        event_headers=event_headers,
        operation_name="Query",
        query=QUERY,
        variables=app_sync_request_variables,
    )
    return response


def handler(event: Event, context: Any) -> Response:
    status_code: int = HTTPStatus.OK.value
    response: HTTPResponse = make_app_sync_request_query(event)
    response_data: AppSyncResponse = json.load(response)
    content: Optional[Console] = response_data.get("data", {}).get("get_console")
    errors: AppSyncResponseError = response_data.get("errors")
    if isinstance(errors, list):
        print(errors)
        status_code = HTTPStatus.BAD_REQUEST.value
    return Response(
        body=json.dumps(content),
        headers={**{"Content-Type": "application/json"}, **response.headers},
        statusCode=status_code,
    )
