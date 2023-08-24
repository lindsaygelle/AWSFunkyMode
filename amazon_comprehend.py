from datetime import datetime
import hashlib
import json
import boto3
import pytz
import re
import concurrent.futures


class ComprehendDetect:
    """Encapsulates Comprehend detection functions."""

    def __init__(self, comprehend_client):
        """
        :param comprehend_client: A Boto3 Comprehend client.
        """
        self.comprehend_client = comprehend_client

    def detect_entities(self, text, language_code="en"):
        """
        Detects named entities in input text when you use the pre-trained model.
        Detects custom entities if you have a custom entity recognition model.

        :param text: The document to inspect.
        :param language_code: The language of the document.
        :return: The list of entities along with their confidence scores.
        """
        try:
            response = self.comprehend_client.detect_entities(
                Text=text, LanguageCode=language_code
            )
            response = convert_to_snake_case(response.get("Entities"))
            for i in range(len(response)):
                response[i] = {**response[i], **{"order": i}}
            return response
        except Exception:
            print("Couldn't detect entities.")
            raise

    def detect_key_phrases(self, text, language_code="en"):
        """
        Detects key phrases in a document. A key phrase is typically a noun and its
        modifiers.

        :param text: The document to inspect.
        :param language_code: The language of the document.
        :return: The list of key phrases along with their confidence scores.
        """
        try:
            response = self.comprehend_client.detect_key_phrases(
                Text=text, LanguageCode=language_code
            )
            response = convert_to_snake_case(response.get("KeyPhrases"))
            for i in range(len(response)):
                response[i] = {**response[i], **{"order": i}}
            return response
        except Exception:
            print("Couldn't detect phrases.")
            raise

    def detect_pii(self, text, language_code="en"):
        """
        Detects personally identifiable information (PII) in a document. PII can be
        things like names, account numbers, or addresses.

        :param text: The document to inspect.
        :param language_code: The language of the document.
        :return: The list of PII entities along with their confidence scores.
        """
        try:
            response = self.comprehend_client.detect_pii_entities(
                Text=text, LanguageCode=language_code
            )
            response = convert_to_snake_case(response.get("Entities"))
            for i in range(len(response)):
                response[i] = {**response[i], **{"order": i}}
            return response
        except Exception:
            print("Couldn't detect PII entities.")
            raise

    def detect_syntax(self, text, language_code="en"):
        """
        Detects syntactical elements of a document. Syntax tokens are portions of
        text along with their use as parts of speech, such as nouns, verbs, and
        interjections.

        :param text: The document to inspect.
        :param language_code: The language of the document.
        :return: The list of syntax tokens along with their confidence scores.
        """
        try:
            response = self.comprehend_client.detect_syntax(
                Text=text, LanguageCode=language_code
            )
            response = convert_to_snake_case(response.get("SyntaxTokens"))
            for i in range(len(response)):
                response[i] = {**response[i], **{"order": i}}
            return response
        except Exception:
            print("Couldn't detect syntax.")
            raise

    def detect_sentiment(self, text, language_code="en"):
        """
        Detects the overall sentiment expressed in a document. Sentiment can
        be positive, negative, neutral, or a mixture.

        :param text: The document to inspect.
        :param language_code: The language of the document.
        :return: The sentiments along with their confidence scores.
        """
        try:
            response = self.comprehend_client.detect_sentiment(
                Text=text, LanguageCode=language_code
            )
            return {
                "sentiment": response.get("Sentiment"),
                "sentiment_score": convert_to_snake_case(
                    response.get("SentimentScore")
                ),
            }
        except Exception:
            print("Couldn't detect sentiment.")
            raise


def convert_to_snake_case(data):
    if isinstance(data, dict):
        content = {}
        for key, value in data.items():
            content[get_snake_case(key)] = convert_to_snake_case(value)
        return content
    elif isinstance(data, list):
        return [convert_to_snake_case(item) for item in data]
    else:
        return data


def get_abbreviation(name):
    return "".join(
        [
            i if i.isnumeric() or len(i) == 2 else i[0]
            for i in re.sub("[^a-zA-Z0-9\s]", "", name.upper()).split(" ")
        ]
    )


def get_snake_case(value):
    value = re.sub(r"(?<!^)(?=[A-Z])", "_", value)
    return value.lower()


def process_quote(quote: str, detect: ComprehendDetect):
    processed_quote = {
        "entities": detect.detect_entities(quote),
        "key_phrases": detect.detect_key_phrases(quote),
        "pii": detect.detect_pii(quote),
        "sentiment": detect.detect_sentiment(quote),
        "syntax_tokens": detect.detect_syntax(quote),
        "text": quote,
    }
    return processed_quote


def main():
    comprehend_client = boto3.client("comprehend")
    detect = ComprehendDetect(comprehend_client)

    input_filename = "./data/normal/json/quotes.json"
    output_filename = "./data/comprehend/json/quotes.json"

    with open(input_filename, mode="r") as fp:
        data = json.load(fp)
        contents = {"consoles": []}

        def process_game_quote(game, detect):
            processed_quotes = []
            for quote in game["quotes"]:
                processed_quotes.append(process_quote(quote, detect))
            return processed_quotes

        with concurrent.futures.ThreadPoolExecutor() as executor:
            for console in data["consoles"]:
                content_console = {
                    "abbreviation": get_abbreviation(console["name"]),
                    "games": [],
                    "name": console["name"],
                }
                contents["consoles"].append(content_console)

                game_futures = []
                for game in console["games"]:
                    game_future = executor.submit(process_game_quote, game, detect)
                    game_futures.append((game_future, game))

                for game_future, game in game_futures:
                    content_game = {
                        "abbreviation": get_abbreviation(game["name"]),
                        "name": game["name"],
                        "quotes": game_future.result(),
                    }
                    content_console["games"].append(content_game)

        with open(output_filename, mode="w") as output_fp:
            json.dump(contents, output_fp, indent=4, sort_keys=True)


if __name__ == "__main__":
    main()
