import 'package:icrpg_companion/util/enums.dart';

import 'stat.dart';
import 'world.dart';

class Folk {
  final String name;
  final String bonusText;
  final World world;
  final String description;

  List<Stat> _bonus;
  List<Stat> get bonus {
    if (_bonus == null) _bonus = List<Stat>();
    return _bonus;
  }

  set bonus(val) => _bonus = val;

  Folk({
    this.name,
    this.bonusText,
    this.world,
    this.description,
    bonus,
  });

  toJson() => {
        "name": name,
        "bonusText": bonusText,
        "world": world.toJson(),
        "description": description
      };
}

List<Folk> folks = [
  Folk(
      world: worlds[0],
      name: 'Elf Kind',
      bonusText: 'DEX +1, INT +1',
      description:
          'Highborn from the age of immortals, beautiful, graceful, and elegant with ages...but tainted with an ancient legacy of betrayal.',
      bonus: [
        Stat(statType: StatTypes.DEX, defaultValue: 1),
        Stat(statType: StatTypes.INT, defaultValue: 1),
      ]),
  Folk(
      world: worlds[0],
      name: 'Dwarves',
      bonusText: 'CON +1, CHA +1',
      description:
          'Hewn from solid rock in the Primordius, guardians of the world’s heart. Dwarves are as varied as the mountain ranges they hail from, and are as fine as the gar they quaff!',
      bonus: [
        Stat(statType: StatTypes.CON, defaultValue: 1),
        Stat(statType: StatTypes.CHA, defaultValue: 1),
      ]),
  Folk(
      world: worlds[0],
      name: 'Small Folks',
      bonusText: 'WIS +1, Magic Effect +1',
      description:
          'Wood kin descended from the first men, and holders of true goodness. Some say it’s their humility, or good cooking, that makes them true of heart. Either way, there is little more than height that is small about their kin.',
      bonus: [
        Stat(statType: StatTypes.WIS, defaultValue: 1),
        Stat(statType: StatTypes.MGC, defaultValue: 1),
      ]),
  Folk(
      world: worlds[0],
      name: 'Humans',
      bonusText: 'INT +1, Weapon Damage +1',
      description:
          'Once the dominators, now a dwindling race searching for a King. Still, even scattered, their versatility and valor are the stuff of legend.',
      bonus: [
        Stat(statType: StatTypes.INT, defaultValue: 1),
        Stat(statType: StatTypes.WPN, defaultValue: 1),
      ]),
  Folk(
      world: worlds[0],
      name: 'Hill Folk',
      bonusText: 'STR +1, Basic Work +3',
      description:
          'Huge, thick-boned kin of bears and wolves, and keepers of -the wild. Some stand almost 8 feet in height. They generally eschew technology, civilization, and elaborate equipment. Preferring a good steak and the silence of trees to treasure and power.',
      bonus: [
        Stat(statType: StatTypes.STR, defaultValue: 1),
        Stat(statType: StatTypes.BSC, defaultValue: 3),
      ]),
  Folk(
    world: worlds[1],
    name: 'Mecha',
    bonusText: '+1 STR, Can be rebuilt, 2 Hearts at creation',
    description: '',
  ),
  Folk(
    world: worlds[1],
    name: 'Reptoid',
    bonusText: '+1 DEX, Heatvision, Use any surface as walkable',
    description: '',
  ),
  Folk(
    world: worlds[1],
    name: 'Psyker',
    bonusText:
        '+1 INT, Use an Investigate check to read minds, Limited telekinetics',
    description: '',
  ),
  Folk(
    world: worlds[1],
    name: 'Geno',
    bonusText: '+1 to any two stats',
    description: '',
  ),
  Folk(
    world: worlds[1],
    name: 'Xill',
    bonusText: '+1 CON, Immune to vacuum, +1 Natural Armor',
    description: '',
  ),
];
