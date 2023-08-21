from typing import Dict, List, TypedDict

class Event(TypedDict):
    Records: List[Dict]

def handler(event, context):
    print(event)
    return
