from typing import Any, Dict, List, Optional, Union, TypedDict
from http import HTTPStatus
from http.client import HTTPResponse
from urllib.request import Request, urlopen
import json
import os

QUERY = """
query Query($id: ID!) {
    get_entity(id: $id) {
        begin_offset
        created_date
        end_offset
        id
        order
        quote_id
        score
        text
        type
        updated_date
    }
}
"""


class AppSyncRequestDataVariables(TypedDict):
    id: str


class AppSyncRequestData(TypedDict):
    operationName: str
    query: str
    variables: AppSyncRequestDataVariables


class Entity(TypedDict):
    begin_offset: int
    created_date: str
    end_offset: int
    id: str
    order: int
    quote_id: str
    score: float
    text: str
    type: str
    updated_date: str


class AppSyncResponseData(TypedDict):
    get_entity: Entity


class AppSyncResponseError(TypedDict):
    locations: List[Dict[str, str]]
    message: str
    path: str


class AppSyncResponse(TypedDict):
    data: AppSyncResponseData
    errors: Optional[List[AppSyncResponseError]]


HTTPHeaders = Dict[str, str]
HTTPMultiValueHeaders = Dict[str, List[str]]


class RequestContextIdentity(TypedDict):
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
    identity: RequestContextIdentity
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
    body: Optional[Union[Dict[str, Any], AppSyncResponse]]
    headers: Dict[str, Union[List[str], str]]
    statusCode: int


def create_app_sync_request(
    app_sync_request_data: AppSyncRequestData,
    app_sync_request_headers: Dict[str, str],
) -> Request:
    url: Optional[str] = os.environ.get("APP_SYNC_GRAPHQL_URL")
    request: Request = Request(
        url,
        data=json.dumps(app_sync_request_data).encode("utf-8"),
        headers=app_sync_request_headers,
    )
    return request


def create_app_sync_request_data(
    operation_name: str, query: str, variables: AppSyncRequestDataVariables
) -> AppSyncRequestData:
    return AppSyncRequestData(
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
    variables: AppSyncRequestDataVariables,
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


def handler(event: Event, context) -> Response:
    status_code: int = HTTPStatus.OK.value
    path_parameters = event.get("pathParameters")
    if not (isinstance(path_parameters, dict)):
        path_parameters = {}
    event_headers: HTTPHeaders = create_app_sync_request_headers(event.get("headers"))
    app_sync_request_variables: AppSyncRequestDataVariables = (
        AppSyncRequestDataVariables(
            id=path_parameters.get("id"),
        )
    )
    response: HTTPResponse = make_app_sync_request(
        event_headers=event_headers,
        operation_name="Query",
        query=QUERY,
        variables=app_sync_request_variables,
    )
    response_data: AppSyncResponse = json.load(response)
    content: Entity = response_data.get("data")
    errors: AppSyncResponseError = response_data.get("errors")
    if isinstance(errors, list):
        print(errors)
        status_code = HTTPStatus.BAD_REQUEST.value
    if not (isinstance(content, dict)):
        content = {}
    return Response(
        body=json.dumps(content.get("get_entity", {})),
        headers={**{"Content-Type": "application/json"}, **response.headers},
        statusCode=status_code,
    )
