ingredients = []


def add_igredients(name, calories, protein, fat, carbs, fiber, ingredients_type):
    ingredients.append(Ingredient(name, calories, protein, fat, carbs, fiber, ingredients_type))


def find_all():
    """
    Find all ingredients in list.
    :return: List of Ingredients
    """
    return ingredients.copy()


def find_by_name_like(name: str):
    """
    Find all ingredients by name like
    :param name: name 'like'
    :return: List of ingredients
    """
    copy =find_all()
    result =[]

    for ingredient in copy:
        if name.casefold() in ingredient.name.casefold():
            pass