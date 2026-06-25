import 'game_character.dart';
import 'super_ability.dart';
import 'boss.dart';
import 'rpg_game.dart';

abstract class Hero extends GameCharacter {
  SuperAbility ability;
  Hero(super.name, super.health, super.damage, this.ability);

  void attack(Boss boss) {
    boss.health -= damage;
  }

  void applySuperPower(Boss boss, List<Hero> heroes);
}

class Warrior extends Hero {
  Warrior(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.criticalDamage);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    int crit = damage * (RpgGame.random.nextInt(5) + 2);
    boss.health -= crit;
    print('Warrior $name hits critically $crit');
  }
}

class Magic extends Hero {
  Magic(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.boost);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.roundNumber <= 4) {
      int boostAmount = RpgGame.random.nextInt(4) + 2;
      for (var hero in heroes) {
        if (hero.isAlive() && hero != this) {
          hero.damage += boostAmount;
        }
      }
      print('Magic $name boosted team damage by $boostAmount');
    }
  }
}

class Berserk extends Hero {
  int blockedDamage = 0;
  Berserk(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.blockAndRevert);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    boss.health -= blockedDamage;
    print('Berserk $name reverted $blockedDamage');
  }
}

class Medic extends Hero {
  int healPoints;
  Medic(String name, int health, int damage, this.healPoints)
    : super(name, health, damage, SuperAbility.heal);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    for (var hero in heroes) {
      if (hero.isAlive() && this != hero) {
        hero.health += healPoints;
      }
    }
  }
}

class Golem extends Hero {
  Golem(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.golemShield);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Lucky extends Hero {
  Lucky(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.dodge);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Witcher extends Hero {
  bool hasResurrected = false;

  Witcher(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.resurrection);

  @override
  void attack(Boss boss) {}

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (hasResurrected) return;

    for (var hero in heroes) {
      if (!hero.isAlive() && hero != this) {
        hero.health = this.health;
        this.health = 0;
        hasResurrected = true;
        print('Witcher $name sacrificed himself to resurrect ${hero.name}');
        break;
      }
    }
  }
}

class Thor extends Hero {
  Thor(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.stun);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (RpgGame.random.nextBool()) {
      boss.isStunned = true;
      print('Thor $name stunned the boss!');
    }
  }
}

class Kamikadze extends Hero {
  Kamikadze(String name, int health)
    : super(name, health, 0, SuperAbility.suicideAttack);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {
    if (health > 0) {
      if (RpgGame.random.nextBool()) {
        int fullDamage = health;
        boss.health -= fullDamage;
        print('Kamikadze $name exploded perfectly and dealt $fullDamage damage to the Boss!');
      } else {
        int halfDamage = health ~/ 2;
        boss.health -= halfDamage;
        print('Kamikadze $name missed slightly but dealt $halfDamage damage to the Boss!');
      }
      health = 0;
    }
  }
}

class Reaper extends Hero {
  int baseDamage;
  int _maxHealth;

  Reaper(String name, int health, int damage)
      : baseDamage = damage,
        _maxHealth = health,
        super(name, health, damage, SuperAbility.fury);

  @override
  void attack(Boss boss) {
    if (health < (_maxHealth * 0.15)) {
      damage = baseDamage * 3;
      print('Reaper $name is in absolute fury! Damage tripled!');
    } else if (health < (_maxHealth * 0.30)) {
      damage = baseDamage * 2;
      print('Reaper $name is in fury! Damage doubled!');
    } else {
      damage = baseDamage;
    }
    super.attack(boss);
  }

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}

class Bomber extends Hero {
  Bomber(String name, int health, int damage)
    : super(name, health, damage, SuperAbility.lastBlast);

  @override
  void applySuperPower(Boss boss, List<Hero> heroes) {}
}
