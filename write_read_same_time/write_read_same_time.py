import csv

ordering = ['athlete', 'gold', 'silver', 'bronze', 'country']

read_file_name = 'athlete_medals.csv'
output_file_name = 'medals_dict.py'
with open(read_file_name, encoding='utf-8', newline='') as data,\
        open(output_file_name, 'w', encoding='utf-8') as output_file:
    print('import csv', file=output_file)
    print(file=output_file)
    print('medals_table = [', file=output_file)

    reader = csv.DictReader(data)

    for row_dict in reader:
        new_dict = {}
        for key in ordering:
            value = row_dict[key]
            if value.isnumeric():
                value = int(value)
            new_dict[key.casefold()] = value
        new_dict['Total'] = None
        print(f'\t{new_dict},', file=output_file)

    print(']', file=output_file)
    print(file=output_file)