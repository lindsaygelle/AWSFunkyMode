from typing import Dict, Optional, TypedDict


class EventCallerContext(TypedDict):
    awsSdkVersion: str
    clientId: str


class EventRequestUserAttributes(TypedDict):
    email: str


class EventRequest(TypedDict):
    userAttributes: EventRequestUserAttributes
    validationData: Optional[Dict]


class EventResponse(TypedDict):
    autoConfirmUser: bool
    autoVerifyEmail: bool
    autoVerifyPhone: bool


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
