import json


def read_lines_from_file(filename):
    with open(filename, "r") as file:
        return file.readlines()


def process_line(line):
    indentation = len(line) - len(line.lstrip())
    text = line.strip()
    return indentation, text


def create_new_game(name):
    return {"Name": name, "Consoles": []}


def add_game_to_list(game, games):
    games.append(game)


def add_console_to_game(game, console_name):
    console = {"Name": console_name, "Quotes": []}
    game["Consoles"].append(console)


def add_quote_to_console(game, quote):
    quote = quote.replace('"', "").replace("[sic]", "")
    game["Consoles"][-1]["Quotes"].append(quote)


def sort_quotes(console):
    console["Quotes"] = sorted(console["Quotes"])


def save_to_json(data, output_filename):
    with open(output_filename, encoding="utf-8", mode="w") as fp:
        json.dump(data, fp, indent=4, sort_keys=True)


def parse_game_data(lines):
    games = []
    current_game = None

    for line in lines:
        indentation, text = process_line(line)

        if indentation == 0:
            if current_game:
                add_game_to_list(current_game, games)
            current_game = create_new_game(text)
        elif indentation == 4:
            if current_game:
                add_console_to_game(current_game, text)
        elif indentation == 8:
            if current_game and current_game["Consoles"]:
                add_quote_to_console(current_game, text)

    if current_game:
        add_game_to_list(current_game, games)

    return games


def main():
    input_filename = "./data/raw/txt/quotes.txt"
    output_filename = "./data/normal/json/quotes.json"

    lines = read_lines_from_file(input_filename)
    parsed_data = parse_game_data(lines)

    for game in parsed_data:
        for console in game["Consoles"]:
            sort_quotes(console)

    save_to_json(parsed_data, output_filename)


if __name__ == "__main__":
    main()
