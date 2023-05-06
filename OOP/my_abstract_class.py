from abc import ABC, abstractmethod

class AbstractClass (ABC):

    def __init__(self,value):
        self.value = value
        super().__init__()

    @abstractmethod
    def foo(self):
        pass

    def test(self):
        print('Test')

class MyClass (AbstractClass):

    def foo(self):
        print(f"Implemented! Value is {self.value}")

my_class = MyClass(11)
my_class.foo()
print("WORKS")