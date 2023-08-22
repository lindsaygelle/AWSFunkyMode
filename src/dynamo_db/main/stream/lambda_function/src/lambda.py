from typing import Any, Dict, List, Literal, Union, TypedDict


class EventRecordDynamoDB(TypedDict):
    ApproximateCreationDateTime: str
    Keys: Dict[str, str]
    NewImage: Dict[str, Any]
    SequenceNumber: str
    SizeBytes: str
    StreamViewType: Union[
        Literal["KEYS_ONLY"],
        Literal["NEW_IMAGE"],
        Literal["NEW_AND_OLD_IMAGES"],
        Literal["OLD_IMAGE"],
    ]


class EventRecord(TypedDict):
    awsRegion: str
    dynamodb: EventRecordDynamoDB
    eventID: str
    eventName: str
    eventVersion: str
    eventSource: str


class Event(TypedDict):
    Records: List[EventRecord]


def handler(event: Event, context):
    print(event)
    return
