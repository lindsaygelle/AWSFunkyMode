from typing import Dict, Optional, TypedDict


class EventCallerContext(TypedDict):
    awsSdkVersion: str
    clientId: str


class EventRequestUserAttributes(TypedDict):
    email: str
    email_verified: bool
    sub: str


class EventRequest(TypedDict):
    userAttributes: EventRequestUserAttributes
    validationData: Optional[Dict]


class EventResponse(TypedDict):
    pass


class Event(TypedDict):
    callerContext: EventCallerContext
    region: str
    request: EventRequest
    response: EventResponse
    triggerSource: str
    userName: str
    userPoolId: str
    version: str


def handler(event: Event, context) -> Event:
    return event
