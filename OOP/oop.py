class Animal (object):
    pass

class Dog(Animal):
    pass

# class Owczarek(Dog):
#     pass

class Cat(Animal):
    pass

# if __name__ == '__main__':

dog = Dog()

# print(isinstance(dog,Animal))
# print(isinstance(dog,Dog))
# print(isinstance(dog,Cat))

dog_1 = Dog()
dog_2 = dog

print(dog is dog)
print(dog is dog_1)
print(dog is dog_2)

print(dog)
print(dog_1)
print(dog_2)

print(__name__)

# print(issubclass(Cat,Animal))
# print(issubclass(Dog,Animal))
# print(issubclass(Animal,Animal))
# print(issubclass(Dog,Cat))
# print(issubclass(Cat,Dog))

#
# print(issubclass(Owczarek,Dog))
# print(issubclass(Owczarek,Animal))
# print(issubclass(Owczarek,object))


