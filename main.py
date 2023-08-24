import json


def read_lines_from_file(filename):
    with open(filename, "r") as file:
        return file.readlines()


def process_line(line):
    indentation = len(line) - len(line.lstrip())
    text = line.strip()
    return indentation, text


def process_text(text: str):
    if text.endswith(":"):
        text = text.removesuffix(":")
    if text.startswith("-"):
        text = text.removeprefix("-")
    return text.strip()


def create_new_console(name):
    return {"name": process_text(name), "games": []}


def add_console_to_list(game, consoles):
    consoles.append(game)


def add_game_to_console(game, console_name):
    console = {"name": process_text(console_name), "quotes": []}
    game["games"].append(console)


def add_quote_to_game(game, quote):
    quote = quote.replace('"', "").replace("[sic]", "")
    game["games"][-1]["quotes"].append(process_text(quote))


def sort_quotes(console):
    console["quotes"] = sorted(console["quotes"])


def save_to_json(data, output_filename):
    with open(output_filename, encoding="utf-8", mode="w") as fp:
        json.dump({"consoles": data}, fp, indent=4, sort_keys=True)


def parse_game_data(lines):
    consoles = []
    current_console = None

    for line in lines:
        indentation, text = process_line(line)

        if indentation == 0:
            if current_console:
                add_console_to_list(current_console, consoles)
            current_console = create_new_console(text)
        elif indentation == 4:
            if current_console:
                add_game_to_console(current_console, text)
        elif indentation == 8:
            if current_console and current_console["games"]:
                add_quote_to_game(current_console, text)

    if current_console:
        add_console_to_list(current_console, consoles)

    return consoles


def main():
    input_filename = "./data/raw/txt/quotes.txt"
    output_filename = "./data/normal/json/quotes.json"

    lines = read_lines_from_file(input_filename)
    parsed_data = parse_game_data(lines)

    for game in parsed_data:
        for console in game["games"]:
            sort_quotes(console)

    save_to_json(parsed_data, output_filename)


if __name__ == "__main__":
    main()
