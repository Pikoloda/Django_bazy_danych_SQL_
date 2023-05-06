import csv

filename = 'country_info.txt'

dialect = csv.excel
dialect.delimiter = '|'
countries ={}
with open(filename, encoding='utf-8') as contry_file:
        # headers= ['country', 'capital', 'cc', 'cc3', 'iac', 'timezone', 'currency']
        headers = contry_file.readline().rstrip('\n').split(dialect.delimiter)

        for index, header in enumerate(headers):
            headers[index] = header.casefold()

        reader =csv.DictReader(contry_file, dialect=dialect, fieldnames= headers)

        # contry_file.readline()
        for row in reader:
            countries[row['country'].casefold()] = row
            countries[row['cc'].casefold()] = row

print(countries)
while True:
    selected_country = input("Podaj kraj lub kod: ")

    if selected_country == '0':
        break

    result = countries.get(selected_country.casefold())
    if result:
        print(f"Stolica: {result['capital']}", f"Strefa czasowa: {result['timezone']}",f"Kod kierunkowy: {result['iac']}",
              f"Waluta: {result['currency']}", sep='\n\t')
    else:
        print(f"Nie ma takiego klucza jak {selected_country}")

# for key in contry_file:
#     print(f"KEY : {key}, VALUE: {contry_file[key]}")

        # print(country)
        # print(cc)


        # print(dict)



# Po wpisaniu w konsoli nazwy kraju lub kodu 2 znakowego
# Na konsoli print -> Stolica, strefa czasowa, walutowa, stolica

# country = input("Podaj nazwe kraju: ")
# skrót = input("Podaj skrót kraju: ")
#





