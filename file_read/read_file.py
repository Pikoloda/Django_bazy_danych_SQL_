# try:
#     lord_of_the_rings = open('lor.txt', 'r')
#
#     for line in lord_of_the_rings:
#         print(line)
#         raise ValueError
#
# except Exception:
#     print('EXCEPTION!!!!')
# finally:
#     print('Bedę zamykał plik')
#     lord_of_the_rings.close()

lord_of_the_rings = open('lor.txt', 'r', encoding='utf-8')

for line in lord_of_the_rings:
     print(line.rstrip())

lord_of_the_rings.close()

# text = 'Trzy Pierścienie dla królów elfów pod otwartym niebem,\n'
# print(len(text))

