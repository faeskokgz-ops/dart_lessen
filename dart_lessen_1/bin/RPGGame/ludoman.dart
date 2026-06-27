import 'dart:math';

class Boss {
  int health;
  Boss(this.health);
}

class Hero {
  String name;
  int health;
  int damage;
  Hero(this.name, this.health, this.damage);
  void applySuperAbility(Boss boss, List<Hero> team) {}
}

class Ludoman extends Hero {
  final Random _random = Random();

  Ludoman(String name, int health, int damage) : super(name, health, damage);

  @override
  void applySuperAbility(Boss boss, List<Hero> team) {
    int dice1 = _random.nextInt(6) + 1;
    int dice2 = _random.nextInt(6) + 1;

    print("Кубики: [$dice1] и [$dice2]");

    if (dice1 == dice2) {
      boss.health -= dice1 * dice2;
      print("Дубль! Здоровье Босса: ${boss.health}");
    } else {
      var alive = team.where((h) => h.health > 0 && h != this).toList();
      if (alive.isNotEmpty) {
        var victim = alive[_random.nextInt(alive.length)];
        victim.health -= (dice1 + dice2);
        print("Проигрыш! Нанесено урон сокоманднику ${victim.name}. Его здоровье: ${victim.health}");
      }
    }
  }
}

void main() {
  var boss = Boss(100);
  var team = <Hero>[];

  var teammate = Hero("Воин", 80, 10);
  var ludoman = Ludoman("Лудоман", 100, 15);

  team.add(teammate);
  team.add(ludoman);

  ludoman.applySuperAbility(boss, team);
}