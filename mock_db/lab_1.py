import csv

filename = 'ingredients.csv'

dialect = csv.excel
dialect.delimiter = ';'
with open(filename, encoding='utf-8', newline='') as ingredients_file:
    headers =['NAME',"CALORIES","PROTEIN","FAT","CARBS","FIBER","TYPE"]
    # reader = csv.reader(ingredients_file, quoting= csv.QUOTE_NONNUMERIC)

    # for row in reader:
    #     print(row)
    reader = csv.DictReader(ingredients_file, dialect=dialect, fieldnames=headers)

    for row in reader:
        print(row)

