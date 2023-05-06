class A:
    def itroduce(self):
        print("I'm A")


class B:
    def itroduce(self):
        print("I'm B")


class C(A, B):
    def difference(self):
        print("Different")


my_list = [A(), B(), C()]

for poli_class in my_list:
    poli_class.itroduce()

a = 1
b = 'string'
c = 1, 2, 3
d = {'key': 1}

print(a)
print(b)
print(c)
print(d)
