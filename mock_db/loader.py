import csv


def load_initial_data(filename='ingredients.csv') -> None:
    """
    Loads all initial data

    :param filename: name of file with initial data
    :return:
    """

    with open(filename, 'r', encoding='utf-8', newline='') as ingredients_file:
        reader =csv.reader(ingredients_file, delimiter =';', quoting=csv.QUOTE_NONNUMERIC)
        ingredients_file.readline() #ignore header
        for row in reader:
            mock_database.add_ingredient(*row)