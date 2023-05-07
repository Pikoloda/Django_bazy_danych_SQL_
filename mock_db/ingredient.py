class Ingredient:

    def __init__(self, name, calories, protein, fat, carbs, fiber, ingredient_type):
        self.name = name
        self.calories = calories
        self.protein = protein
        self.fat = fat
        self.carbs = carbs
        self.fiber = fiber
        self.ingredient_type = ingredient_type

    def __str__(self):
        return str(self.__dict__)