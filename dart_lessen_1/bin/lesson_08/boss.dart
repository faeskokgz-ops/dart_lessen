import 'game_character.dart';
import 'super_ability.dart';
import 'hero.dart';
import 'rpg_game.dart';

class Boss extends GameCharacter {
  SuperAbility? defence;
  bool isStunned = false;

  Boss(super.name, super.health, super.damage);

  void attack(List<Hero> heroes) {
    // Находим живого Голема перед началом атаки
    Golem? golem;
    for (var hero in heroes) {
      if (hero is Golem && hero.isAlive()) {
        golem = hero;
        break;
      }
    }

    for (var hero in heroes) {
      if (!hero.isAlive()) continue;

      // Проверка уклонения Lucky
      if (hero is Lucky) {
        if (RpgGame.random.nextInt(100) < 25) {
          print('Lucky ${hero.name} dodged the attack!');
          continue;
        }
      }

      int damageToDeal = damage;

      // Проверка блокировки Berserk
      if (hero is Berserk && defence != SuperAbility.blockAndRevert) {
        int blocked = (RpgGame.random.nextInt(2) + 1) * 5;
        hero.blockedDamage = blocked;
        damageToDeal -= blocked;
      }

      // Перенаправление части урона в Голема
      if (golem != null && golem != hero) {
        int redirectedDamage = damageToDeal ~/ 5;
        damageToDeal -= redirectedDamage;
        
        golem.health -= redirectedDamage;
        if (!golem.isAlive()) {
          golem = null; // Голем погиб, больше урон не принимает
        }
      }

      // Наносим урон текущему герою
      hero.health -= damageToDeal;

      // Строгая проверка: если именно Bomber умер от этой атаки
      if (hero is Bomber && !hero.isAlive()) {
        health -= 100;
        print('Bomber ${hero.name} died and exploded! Dealt 100 residual damage to Boss!');
      }
    }
  }

  void chooseDefence() {
    List<SuperAbility> variants = SuperAbility.values;
    int randomIndex = RpgGame.random.nextInt(variants.length);
    defence = variants[randomIndex];
  }

  @override
  String toString() {
    if (defence == null) {
      return '${super.toString()} defence: No Defence';
    } else {
      return '${super.toString()} defence: ${defence!.name}';
    }
  }
}