from typing import Any, Dict, List, Literal, Union, TypedDict
from boto3.dynamodb.types import (
    BINARY,
    BINARY_SET,
    BOOLEAN,
    LIST,
    MAP,
    NULL,
    NUMBER,
    NUMBER_SET,
    STRING,
    STRING_SET,
)


DynamoDBBinary = Dict[BINARY, str]
DynamoDBBinarySet = Dict[BINARY_SET, List[str]]
DynamoDBBoolean = Dict[BOOLEAN, bool]
DynamoDBList = Dict[LIST, List[Any]]
DynamoDBMap = Dict[MAP, Dict[Any, Any]]
DynamoDBNull = Dict[NULL, str]
DynamoDBNumber = Dict[NUMBER, str]
DynamoDBNumberSet = Dict[NUMBER_SET, List[str]]
DynamoDBString = Dict[STRING, str]
DynamoDBStringSet = Dict[STRING_SET, List[str]]


DynamoDBValue = Union[
    DynamoDBBinary,
    DynamoDBBinarySet,
    DynamoDBBoolean,
    DynamoDBList,
    DynamoDBMap,
    DynamoDBNull,
    DynamoDBNumber,
    DynamoDBNumberSet,
    DynamoDBString,
    DynamoDBStringSet,
]


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
    eventSourceARN: str


class Event(TypedDict):
    Records: List[EventRecord]


def handler(event: Event, context):
    print(event)
    return
