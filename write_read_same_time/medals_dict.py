import csv

medals_table = [
	{'athlete': 'CASLAVSKA, Vera', 'gold': 7, 'silver': 4, 'bronze': 0, 'country': 'Czechoslovakia', 'total': None},
	{'athlete': 'FISCHER, Birgit', 'gold': 8, 'silver': 4, 'bronze': 0, 'country': 'East Germany', 'total': None},
	{'athlete': 'NURMI, Paavo', 'gold': 9, 'silver': 3, 'bronze': 0, 'country': 'Finland', 'total': None},
	{'athlete': 'VAN ALMSICK, Franziska', 'gold': 0, 'silver': 4, 'bronze': 6, 'country': 'Germany', 'total': None},
	{'athlete': 'GEREVICH, Aladar', 'gold': 7, 'silver': 1, 'bronze': 2, 'country': 'Hungary', 'total': None},
	{'athlete': 'KELETI, Agnes', 'gold': 5, 'silver': 3, 'bronze': 2, 'country': 'Hungary', 'total': None},
	{'athlete': 'MANGIAROTTI, Edoardo', 'gold': 6, 'silver': 5, 'bronze': 2, 'country': 'Italy', 'total': None},
	{'athlete': 'GAUDINI, Giulio', 'gold': 3, 'silver': 4, 'bronze': 2, 'country': 'Italy', 'total': None},
	{'athlete': 'ONO, Takashi', 'gold': 5, 'silver': 4, 'bronze': 4, 'country': 'Japan', 'total': None},
	{'athlete': 'KATO, Sawao', 'gold': 8, 'silver': 3, 'bronze': 1, 'country': 'Japan', 'total': None},
	{'athlete': 'NAKAYAMA, Akinori', 'gold': 6, 'silver': 2, 'bronze': 2, 'country': 'Japan', 'total': None},
	{'athlete': 'COMANECI, Nadia', 'gold': 5, 'silver': 3, 'bronze': 1, 'country': 'Romania', 'total': None},
	{'athlete': 'NEMOV, Alexei', 'gold': 4, 'silver': 2, 'bronze': 6, 'country': 'Russia', 'total': None},
	{'athlete': 'LATYNINA, Larisa', 'gold': 9, 'silver': 5, 'bronze': 4, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'ANDRIANOV, Nikolay', 'gold': 7, 'silver': 5, 'bronze': 3, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'SHAKHLIN, Boris', 'gold': 7, 'silver': 4, 'bronze': 2, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'CHUKARIN, Viktor Ivanovich', 'gold': 7, 'silver': 3, 'bronze': 1, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'ASTAKHOVA, Polina', 'gold': 5, 'silver': 2, 'bronze': 3, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'DITYATIN, Aleksandr', 'gold': 3, 'silver': 6, 'bronze': 1, 'country': 'Soviet Union', 'total': None},
	{'athlete': 'SCHERBO, Vitaly', 'gold': 6, 'silver': 0, 'bronze': 4, 'country': 'Unified team', 'total': None},
	{'athlete': 'PHELPS, Michael', 'gold': 14, 'silver': 0, 'bronze': 2, 'country': 'United States', 'total': None},
	{'athlete': 'THOMPSON, Jenny', 'gold': 8, 'silver': 3, 'bronze': 1, 'country': 'United States', 'total': None},
	{'athlete': 'TORRES, Dara', 'gold': 4, 'silver': 4, 'bronze': 4, 'country': 'United States', 'total': None},
	{'athlete': 'BIONDI, Matthew', 'gold': 8, 'silver': 2, 'bronze': 1, 'country': 'United States', 'total': None},
	{'athlete': 'COUGHLIN, Natalie', 'gold': 3, 'silver': 4, 'bronze': 4, 'country': 'United States', 'total': None},
	{'athlete': 'OSBURN, Carl Townsend', 'gold': 5, 'silver': 4, 'bronze': 2, 'country': 'United States', 'total': None},
	{'athlete': 'SPITZ, Mark', 'gold': 9, 'silver': 1, 'bronze': 1, 'country': 'United States', 'total': None},
	{'athlete': 'HALL, Gary Jr.', 'gold': 5, 'silver': 3, 'bronze': 2, 'country': 'United States', 'total': None},
	{'athlete': 'LEWIS, Carl', 'gold': 9, 'silver': 1, 'bronze': 0, 'country': 'United States', 'total': None},
]
column_names = ['athlete','gold','silver','bronze','total']

filename= 'athlete_medal_write.csv'

# def print_name():
# 	print('Andrzej')
#
# zmienna_name = print_name
# zmienna_name()

def sort_key(d: dict) -> str:
	return d['athlete']

with open(filename, 'w', encoding='utf-8', newline='') as ouyput_file:
	writer = csv.DictWriter(ouyput_file, fieldnames=column_names, quoting=csv.QUOTE_NONNUMERIC, extrasaction='ignore')
	writer.writeheader()

	writer.writerows(sorted(medals_table, key=sort_key))
