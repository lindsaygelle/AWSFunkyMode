from concurrent.futures import ThreadPoolExecutor
from decimal import Decimal
import json
import boto3


def create_console_model(console_index, console_name, game_index):
    console_model = {
        "GSI": "Console",
        "ID": str(console_index),
        "ConsoleId": str(console_index),
        "Name": console_name,
        "PartitionKey": f"Console#{console_index}",
        "SortKey": "Console#Metadata",
    }
    return console_model


def create_entity_model(console_index, entitiy_index, game_index, quote_index):
    entity_model = {
        "EntityId": str(entitiy_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "GSI": "Entity",
        "ID": str(entitiy_index),
        "QuoteId": str(quote_index),
        "SortKey": f"Quote#{quote_index}&Entity&Metadata",
    }
    return entity_model


def create_entity_item_model(
    begin_offset,
    console_index,
    end_offset,
    entity_index,
    entity_item_index,
    game_index,
    order,
    quote_index,
    score,
    text,
    type,
):
    entity_item_model = {
        "BeginOffset": begin_offset,
        "EndOffset": end_offset,
        "EntityId": str(entity_index),
        "EntityItemId": str(entity_item_index),
        "GSI": "EntityItem",
        "ID": str(entity_item_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "Order": order,
        "Score": score,
        "SortKey": f"Quote#{quote_index}&Entity&Item#{order}",
        "Text": text,
        "Type": type,
    }
    return entity_item_model


def create_game_model(console_index, game_index, game_name):
    game_model = {
        "GSI": "Game",
        "GameId": str(game_index),
        "ID": str(game_index),
        "Name": game_name,
        "PartitionKey": f"Game#{game_index}",
        "SortKey": f"Game#{game_index}&Metadata",
    }
    return game_model


def create_key_phrase_model(console_index, game_index, key_phrase_index, quote_index):
    key_phrase_model = {
        "KeyPhraseId": str(key_phrase_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "GSI": "KeyPhrase",
        "ID": str(key_phrase_index),
        "QuoteId": str(quote_index),
        "SortKey": f"Quote#{quote_index}&KeyPhrase&Metadata",
    }
    return key_phrase_model


def create_key_phrase_item_model(
    begin_offset,
    console_index,
    end_offset,
    game_index,
    key_phrase_index,
    key_phrase_item_index,
    order,
    quote_index,
    score,
    text,
):
    key_phrase_item_model = {
        "BeginOffset": begin_offset,
        "EndOffset": end_offset,
        "GSI": "KeyPhraseItem",
        "ID": str(key_phrase_item_index),
        "KeyPhraseId": str(key_phrase_index),
        "KeyPhraseItemId": str(key_phrase_item_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "Order": order,
        "Score": score,
        "SortKey": f"Quote#{quote_index}&KeyPhrase&Item#{order}",
        "Text": text,
    }
    return key_phrase_item_model


def create_pii_model(
    console_index: int,
    game_index: int,
    quote_index: int,
    pii_index: int,
):
    pii_model = {
        "GSI": "PII",
        "ID": str(pii_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "PIIId": str(pii_index),
        "QuoteId": str(quote_index),
        "SortKey": f"Quote#{quote_index}&PII&Metadata",
    }
    return pii_model


def create_pii_entity_item_model(
    begin_offset: int,
    console_index: int,
    end_offset: int,
    game_index: int,
    pii_index: int,
    pii_item_index: int,
    order: int,
    quote_index: int,
    score: float,
    type: str,
):
    pii_entity_item_model = {
        "BeginOffset": begin_offset,
        "EndOffset": end_offset,
        "GSI": "PIIItem",
        "ID": str(pii_item_index),
        "Order": order,
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "PIIId": str(pii_index),
        "PIIItemID": str(pii_item_index),
        "QuoteId": str(quote_index),
        "Score": score,
        "SortKey": f"Quote#{quote_index}&PII&Item#{order}",
        "Type": type,
    }
    return pii_entity_item_model


def create_quote_model(console_index, game_index, quote_index, text):
    quote_model = {
        "ConsoleId": str(console_index),
        "GSI": "Quote",
        "GameId": str(game_index),
        "ID": str(quote_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "QuoteId": str(quote_index),
        "SortKey": f"Quote#{quote_index}&Metadata",
        "Text": text,
    }
    return quote_model


def create_sentiment_model(
    console_index: int, game_index: int, quote_index: int, sentiment_index: int
):
    sentiment_model = {
        "GSI": "Sentiment",
        "ID": str(sentiment_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "QuoteId": str(quote_index),
        "SentimentId": str(sentiment_index),
        "SortKey": f"Quote#{quote_index}&Sentiment&Metadata",
    }
    return sentiment_model


def create_sentiment_value_model(
    console_index: int,
    game_index: int,
    quote_index: int,
    sentiment: str,
    sentiment_index: int,
    sentiment_value_index: int,
):
    sentiment_value_model = {
        "GSI": "SentimentValue",
        "ID": str(sentiment_value_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "QuoteId": str(quote_index),
        "Sentiment": sentiment,
        "SentimentId": str(sentiment_index),
        "SentimentValueId": str(sentiment_value_index),
        "SortKey": f"Quote#{quote_index}&Sentiment&Value",
    }
    return sentiment_value_model


def create_sentiment_score_model(
    console_index: int,
    game_index: int,
    mixed: float,
    negative: float,
    neutral: float,
    positive: float,
    quote_index: int,
    sentiment_index: int,
    sentiment_score_index: int,
):
    sentiment_score_model = {
        "GSI": "SentimentScore",
        "ID": str(sentiment_score_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "Mixed": mixed,
        "Negative": negative,
        "Neutral": neutral,
        "Positive": positive,
        "SentimentId": str(sentiment_index),
        "SentimentScoreId": str(sentiment_score_index),
        "SortKey": f"Quote#{quote_index}&Sentiment&Score",
    }
    return sentiment_score_model


def create_syntax_model(console_index, game_index, quote_index: int, syntax_index: int):
    syntax_model = {
        "GSI": "Syntax",
        "ID": str(syntax_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "QuoteId": str(quote_index),
        "SortKey": f"Quote#{quote_index}&Syntax&Metadata",
        "SyntaxId": str(syntax_index),
    }
    return syntax_model


def create_syntax_item_model(
    begin_offset: int,
    console_index: int,
    end_offset: int,
    game_index: int,
    order: int,
    quote_index: int,
    syntax_index: int,
    syntax_item_index: int,
    text: str,
    token_id: int,
):
    syntax_item_model = {
        "BeginOffset": begin_offset,
        "EndOffset": end_offset,
        "GSI": "SyntaxItem",
        "ID": str(syntax_item_index),
        "Order": order,
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "SyntaxId": str(syntax_index),
        "SyntaxItemId": str(syntax_item_index),
        "SortKey": f"Quote#{quote_index}&Syntax&Item#{order}",
        "Text": text,
        "TokenId": token_id,
    }
    return syntax_item_model


def create_syntax_item_part_of_speech_model(
    console_index: int,
    game_index: int,
    order: int,
    quote_index: int,
    syntax_index: int,
    syntax_item_index: int,
    tag: str,
    score: float,
):
    syntax_item_part_of_speech_model = {
        "GSI": "SyntaxItemPartOfSpeech",
        "ID": str(syntax_item_index),
        "PartitionKey": f"Game#{game_index}&Console#{console_index}",
        "Score": score,
        "SortKey": f"Quote#{quote_index}&Syntax&Item#{order}&PartOfSpeech",
        "SyntaxId": str(syntax_index),
        "SyntaxItemId": str(syntax_item_index),
        "Tag": tag,
    }
    return syntax_item_part_of_speech_model


def process_model(model):
    return (
        model["GSI"]
        + ":"
        + " "
        + ", ".join([f'{key}="{model[key]}"' for key in sorted(list(model.keys()))])
    )


def put_item_concurrent(dynamodb_table, filename, models):
    with ThreadPoolExecutor() as executor:
        futures = [executor.submit(put_item, dynamodb_table, model) for model in models]

        with open(filename, mode="w") as output_fp:
            for future in futures:
                processed_result = future.result()
                output_fp.write(processed_result + "\n")


def put_item(dynamodb_table, filename, models):
    game_name = None
    for model in models:
        if model["GSI"] == "Game":
            game_name = model["Name"]
        if game_name != "Donkey Kong 64":
            continue

        model = json.loads(json.dumps(model), parse_float=Decimal)
        line = process_model(model=model)
        print(model)
        response = dynamodb_table.put_item(Item=model)
        if not (response["ResponseMetadata"]["HTTPStatusCode"] == 200):
            print(response)


def main():
    input_filename = "./data/comprehend/json/quotes.json"
    output_filename = "./data/dynamo_db/txt/quotes.txt"

    with open(input_filename, mode="r") as fp:
        data = json.load(fp)

        console_index = 0
        console_store = {}
        entity_index = 0
        entity_item_index = 0
        game_index = 0
        key_phrase_index = 0
        key_phrase_item_index = 0
        pii_index = 0
        pii_item_index = 0
        quote_index = 0
        sentiment_score_index = 0
        sentiment_index = 0
        sentiment_value_index = 0
        syntax_index = 0
        syntax_item_index = 0

        models = []

        for game in data:
            game_model = create_game_model(
                console_index=console_index,
                game_index=game_index,
                game_name=game["Name"],
            )

            models.append(game_model)

            consoles = game["Consoles"]

            for console in consoles:
                if console["Name"] not in console_store:
                    console_store[console["Name"]] = console_index
                    console_index = console_index + 1

                console_model = create_console_model(
                    console_index=console_store[console["Name"]],
                    console_name=console["Name"],
                    game_index=game_index,
                )

                models.append(console_model)

                quotes = console["Quotes"]

                for quote in quotes:
                    quote_model = create_quote_model(
                        console_index=console_model["ConsoleId"],
                        game_index=game_model["GameId"],
                        quote_index=quote_index,
                        text=quote["Quote"],
                    )

                    models.append(quote_model)

                    entity_model = create_entity_model(
                        console_index=console_model["ConsoleId"],
                        game_index=game_index,
                        entitiy_index=entity_index,
                        quote_index=quote_model["QuoteId"],
                    )

                    models.append(entity_model)

                    entities = quote["Entities"]["Entities"]

                    for i, entity in enumerate(entities):
                        entity_item_model = create_entity_item_model(
                            begin_offset=entity["BeginOffset"],
                            console_index=console_store[console["Name"]],
                            end_offset=entity["EndOffset"],
                            entity_index=entity_index,
                            entity_item_index=entity_item_index,
                            game_index=game_index,
                            order=i,
                            quote_index=quote_index,
                            score=entity["Score"],
                            text=entity["Text"],
                            type=entity["Type"],
                        )

                        entity_item_index = entity_item_index + 1

                        models.append(entity_item_model)

                    key_phrase_model = create_key_phrase_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        key_phrase_index=key_phrase_index,
                        quote_index=quote_index,
                    )

                    models.append(key_phrase_model)

                    key_phrases = quote["KeyPhrases"]["KeyPhrases"]

                    for i, key_phrase in enumerate(key_phrases):
                        key_phrase_item_model = create_key_phrase_item_model(
                            begin_offset=key_phrase["BeginOffset"],
                            console_index=console_store[console["Name"]],
                            end_offset=key_phrase["EndOffset"],
                            game_index=game_index,
                            key_phrase_index=key_phrase_index,
                            key_phrase_item_index=key_phrase_item_index,
                            order=i,
                            quote_index=quote_index,
                            score=key_phrase["Score"],
                            text=key_phrase["Text"],
                        )

                        key_phrase_item_index = key_phrase_item_index + 1

                        models.append(key_phrase_item_model)

                    pii_model = create_pii_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        quote_index=quote_index,
                        pii_index=quote_index,
                    )

                    models.append(pii_model)

                    pii_entities = quote["Pii"]["Entities"]

                    for i, pii_entity in enumerate(pii_entities):
                        pii_entity_item_model = create_pii_entity_item_model(
                            begin_offset=pii_entity["BeginOffset"],
                            console_index=console_store[console["Name"]],
                            end_offset=pii_entity["EndOffset"],
                            game_index=game_index,
                            order=i,
                            pii_index=pii_index,
                            pii_item_index=pii_item_index,
                            quote_index=quote_index,
                            score=pii_entity["Score"],
                            type=pii_entity["Type"],
                        )

                        models.append(pii_entity_item_model)

                        pii_item_index = pii_item_index + 1

                    sentiment_model = create_sentiment_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        quote_index=quote_index,
                        sentiment_index=sentiment_index,
                    )

                    models.append(sentiment_model)

                    sentiment_value_model = create_sentiment_value_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        quote_index=quote_index,
                        sentiment=quote["Sentiment"]["Sentiment"],
                        sentiment_index=sentiment_index,
                        sentiment_value_index=sentiment_value_index,
                    )

                    models.append(sentiment_value_model)

                    sentiment_score_model = create_sentiment_score_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        mixed=quote["Sentiment"]["SentimentScore"]["Mixed"],
                        negative=quote["Sentiment"]["SentimentScore"]["Negative"],
                        neutral=quote["Sentiment"]["SentimentScore"]["Neutral"],
                        positive=quote["Sentiment"]["SentimentScore"]["Positive"],
                        quote_index=quote_index,
                        sentiment_score_index=sentiment_score_index,
                        sentiment_index=sentiment_index,
                    )

                    models.append(sentiment_score_model)

                    syntax_model = create_syntax_model(
                        console_index=console_store[console["Name"]],
                        game_index=game_index,
                        quote_index=quote_index,
                        syntax_index=syntax_index,
                    )

                    models.append(syntax_model)

                    syntax_tokens = quote["Syntax"]["SyntaxTokens"]
                    for i, token in enumerate(syntax_tokens):
                        syntax_item_model = create_syntax_item_model(
                            begin_offset=token["BeginOffset"],
                            console_index=console_store[console["Name"]],
                            end_offset=token["EndOffset"],
                            game_index=game_index,
                            order=i,
                            quote_index=quote_index,
                            syntax_index=syntax_index,
                            syntax_item_index=syntax_item_index,
                            text=token["Text"],
                            token_id=token["TokenId"],
                        )

                        models.append(syntax_item_model)

                        syntax_item_part_of_speech_model = (
                            create_syntax_item_part_of_speech_model(
                                console_index=console_store[console["Name"]],
                                game_index=game_index,
                                order=i,
                                quote_index=quote_index,
                                score=token["PartOfSpeech"]["Score"],
                                syntax_index=syntax_index,
                                syntax_item_index=syntax_item_index,
                                tag=token["PartOfSpeech"]["Tag"],
                            )
                        )

                        models.append(syntax_item_part_of_speech_model)

                        syntax_item_index = syntax_item_index + 1

                    entity_index = entity_index + 1
                    key_phrase_index = key_phrase_index + 1
                    pii_index = pii_index + 1
                    quote_index = quote_index + 1
                    sentiment_score_index = sentiment_score_index + 1
                    sentiment_index = sentiment_index + 1
                    sentiment_value_index = sentiment_value_index + 1

            game_index = game_index + 1

        dynamodb = boto3.resource("dynamodb")
        dynamodb_table = dynamodb.Table("FunkyMode")
        put_item(dynamodb_table, output_filename, models)
        # with open(output_filename, mode="w") as output_fp:
        #    for model in models:
        #        output_fp.write(process_model(model) + "\n")


if __name__ == "__main__":
    main()
