from typing import Any, Dict, List, Optional, Union, TypedDict
from http.client import HTTPResponse
from urllib.request import Request, urlopen
import json
import os

QUERY = """
query Query($id: ID!) {
    get_syntax_token(id: $id) {
        begin_offset
        created_date
        end_offset
        id
        order
        quote_id
        text
        tokenId
        updated_date
    }
}
"""


class AppSyncRequest(TypedDict):
    operationName: str
    query: str
    variables: Optional[Dict[str, Any]]


class SyntaxToken(TypedDict):
    begin_offset: int
    created_date: str
    end_offset: int
    id: str
    order: int
    quote_id: str
    text: str
    tokenId: int
    updated_date: str


class AppSyncResponseData(TypedDict):
    get_syntax_token: SyntaxToken


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
    path_parameters = event.get("pathParameters")
    if not (isinstance(path_parameters, dict)):
        path_parameters = {}
    app_sync_request: AppSyncRequest = AppSyncRequest(
        operationName="Query",
        query=QUERY,
        variables={
            "id": path_parameters.get("id"),
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
    content: SyntaxToken = response_data.get("data")
    if not (isinstance(content, dict)):
        content = {}
    status_code: Optional[int] = response.status
    return Response(
        body=json.dumps(content.get("get_syntax_token", {})),
        headers={**{"Content-Type": "application/json"}, **response.headers},
        statusCode=status_code,
    )
