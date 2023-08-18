from typing import Any, AnyStr, Dict, List, Optional, TypedDict, Union
import urllib.parse
import urllib.request
import json

class Request(TypedDict):
    operationName: str
    query: str
    variables: Dict[str, Any]

class Response(TypedDict):
    body: Optional[Union[AnyStr, str]]
    headers: Dict[str, Union[List[str], str]]
    statusCode: int


def handler(event, context) -> Response:
    return Response(
        body="User/#id",
        headers={
            "Content-Type": "application/json",
        },
        statusCode=200,
    )
