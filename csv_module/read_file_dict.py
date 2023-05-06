import csv

filename = 'username.csv'

our_dialect = csv.excel

with open(filename, encoding='utf-8', newline='') as user_file:
    headers = ['jeden', ' dwa', ' trzy', 'cztery', 'pięć']
    reader = csv.DictReader(user_file, delimiter= ';', fieldnames=headers)

    for row in reader:
        print(row)