class Enemy:

    def __init__(self, name='Enemy', health=0, hit_power=0):
        self.name = name
        self.health = health
        self.hit_power = hit_power

    def take_damage(self, damage):
        remaining_health = self.health - damage
        if remaining_health > 0:
            self.health = remaining_health
        else:
            self.health = 0
            print(f"{self.name} is dead.")

    def attack(self):
        print(f"Enemy attack with power {self.hit_power}")

    def __str__(self):
        return f"Name {self.name}. Health: {self.health}. Hit power: {self.hit_power}"


class Troll(Enemy):

    def __init__(self, name):
        super().__init__(name, 100, 20)

    def take_damage(self, damage):
        super().take_damage(damage)
        if self.health == 0:
            self.health = 100

    def attack(self):
        print(f"Troll attack with power {self.hit_power}")

class OtherEnemy(Enemy):

    def __init__(self, name, hit_power):
        super().__init__(name=name,health=200, hit_power=hit_power)

    def attack(self):
        if self.health < 20:
            return
        super(OtherEnemy, self).attack()

    def take_damage(self, damage):
        if self.health < 50:
            super().take_damage(damage/2)
        else:
            super().take_damage(damage)


other_enemy = OtherEnemy('Other Enemy',50)
print(other_enemy)
print(other_enemy.attack())
other_enemy.take_damage(150)
print(other_enemy)



# Trolle zawsze miały 100 życia i 20 ataku HINT: super().
# Chcemy mieć konstruktor który nie przyjmuje parametrów zycia i ataku

# Dopisać kolejnego przeciwnika
# Zawsze ma 200 życia, ale różna siła ataku
# Nie będzie mógł atakować jeżeli jego życie spadnie poniżej 20 puntków
# Przyjmuje 2 razy mniejsze obrażenia jeżeli jego życie spadnie poniżej 50
