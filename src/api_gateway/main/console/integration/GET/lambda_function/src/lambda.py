from typing import Any, Dict, List, Optional, Union, TypedDict
from http.client import HTTPResponse
from urllib.request import Request, urlopen
import json
import os

QUERY = """
query Query($limit: Int, $next_token: String) {
    get_console_connection(limit: $limit, next_token: $next_token) {
        items {
            abbreviation
            created_date
            id
            name
            updated_date
        }
        next_token
    }
}
"""


class AppSyncRequest(TypedDict):
    operationName: str
    query: str
    variables: Optional[Dict[str, Any]]


class GetConsoleConnection(TypedDict):
    items: Optional[List[Dict[str, Any]]]
    next_token: Optional[str]


class AppSyncResponseData(TypedDict):
    get_console_connection: GetConsoleConnection


class AppSyncResponse(TypedDict):
    data: AppSyncResponseData


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


class Event(TypedDict):
    body: Optional[str]
    headers: Optional[Dict[str, str]]
    httpMethod: str
    isBase64Encoded: bool
    multiValueHeaders: Optional[Dict[str, List[str]]]
    multiValueQueryStringParameters: Optional[Dict[str, List[str]]]
    path: str
    pathParameters: Optional[Dict[str, str]]
    queryStringParameters: Optional[Dict[str, str]]
    requestContext: EventRequestContext
    resource: str
    stageVariables: Optional[Dict[str, str]]


class Response(TypedDict):
    body: Optional[Union[Dict[str, Any], AppSyncResponse]]
    headers: Dict[str, Union[List[str], str]]
    statusCode: int


def handler(event: Event, context) -> Response:
    query_string_parameters = event.get("queryStringParameters")
    if not (isinstance(query_string_parameters, dict)):
        query_string_parameters = {}
    app_sync_request: AppSyncRequest = AppSyncRequest(
        operationName="Query",
        query=QUERY,
        variables={
            "limit": query_string_parameters.get("limit"),
            "next_token": query_string_parameters.get("next_token"),
        },
    )
    app_sync_request_data: str = json.dumps(app_sync_request).encode("utf-8")
    app_sync_request_headers: Dict[str, str] = {
        "Content-Type": "application/json",
        "X-Api-Key": os.environ.get("APP_SYNC_API_KEY"),
    }
    url: Optional[str] = os.environ.get("APP_SYNC_GRAPHQL_URL")
    request: Request = Request(
        url, data=app_sync_request_data, headers=app_sync_request_headers
    )
    response: HTTPResponse = urlopen(request)
    response_data: AppSyncResponse = json.load(response)
    content: GetConsoleConnection = response_data.get("data")
    if not (isinstance(content, dict)):
        content = {}
    status_code: Optional[int] = response.status
    return Response(
        body=json.dumps(content.get("get_console_connection", {})),
        headers={**{"Content-Type": "application/json"}, **response.headers},
        statusCode=status_code,
)