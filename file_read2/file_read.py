filename = 'country_info.txt'

countries = {}
with open(filename, encoding='utf-8') as contry_file:
    for row in contry_file:
        data = row.strip().split('|')
        country, capital, cc, cc3, iac, timezone, currency = data
        #Teraz chcemy zasilić naszą mapę countries

        # Tworzymy mapę z danymi
        country_info_map = {
            'capital': capital,
            'timezone': timezone,
            'iac': iac,
            'currency': currency
        }
        countries[country.casefold()] = country_info_map
        countries[cc.casefold()] = country_info_map

while True:
    selected_country = input("Podaj kraj lub kod: ")

    if selected_country == '0':
        break

    result = countries.get(selected_country.casefold())
    if result:
        print(f"Stolica: {result['capital']}", f"Strefa czasowa: {result['timezone']}",f"Kod kierunkowy: {result['iac']}",
              f"Waluta: {result['currency']}", sep='\n\t')
    else:
        print(f"Nie ma takiego kluczajak {selected_country}")




# Po wpisaniu w konsoli nazwy kraju lub kodu 2 znakowego
# Na konsoli print -> Stolica, strefa czasowa, walutowa, stolica


#





