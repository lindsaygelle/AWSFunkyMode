from datetime import datetime
import hashlib
import json
import boto3
import pytz
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
            return self.comprehend_client.detect_entities(
                Text=text, LanguageCode=language_code)
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
            return self.comprehend_client.detect_key_phrases(
                Text=text, LanguageCode=language_code)
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
            return self.comprehend_client.detect_pii_entities(
                Text=text, LanguageCode=language_code)
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
            return self.comprehend_client.detect_syntax(
                Text=text, LanguageCode=language_code)
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
            return self.comprehend_client.detect_sentiment(
                Text=text, LanguageCode=language_code)
        except Exception:
            print("Couldn't detect sentiment.")
            raise


def process_quote(quote: str, detect: ComprehendDetect, current_utc_time: datetime):
    processed_quote = {
        "CreatedAt": str(current_utc_time),
        "Entities": detect.detect_entities(quote),
        "KeyPhrases": detect.detect_key_phrases(quote),
        "MD5": hashlib.md5(quote.encode('utf-8')).hexdigest(),
        "Pii": detect.detect_pii(quote),
        "Quote": quote,
        "SHA256": hashlib.sha256(quote.encode('utf-8')).hexdigest(),
        "Sentiment": detect.detect_sentiment(quote),
        "Syntax": detect.detect_syntax(quote),
        "UpdatedAt": str(current_utc_time),
    }
    return processed_quote

def process_quotes(quotes, detect):
    processed_quotes = []
    current_utc_time = datetime.now(pytz.utc)

    with concurrent.futures.ThreadPoolExecutor() as executor:
        futures = [
            executor.submit(process_quote, quote, detect, current_utc_time)
            for quote in quotes
        ]

        for future in concurrent.futures.as_completed(futures):
            processed_quotes.append(future.result())

    return processed_quotes

def main():
    comprehend_client = boto3.client('comprehend')
    detect = ComprehendDetect(comprehend_client)

    input_filename = "./data/normal/json/quotes.json"
    output_filename = "./data/comprehend/json/quotes.json"

    with open(input_filename, mode="r") as fp:
        data = json.load(fp)
        contents = []

        for game in data:
            content = {
                "Consoles": [],
                "Name": game["Name"],
            }
            consoles = game["Consoles"]

            for console in consoles:
                content_console = {
                    "Name": console["Name"],
                    "Quotes": process_quotes(console["Quotes"], detect),
                }
                content["Consoles"].append(content_console)

            contents.append(content)

        with open(output_filename, mode="w") as output_fp:
            json.dump(contents, output_fp, indent=4, sort_keys=True)

if __name__ == '__main__':
    main()
