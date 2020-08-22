import 'package:icrpg_companion/util/enums.dart';

import 'folk.dart';
import 'guild.dart';
import 'item.dart';
import 'stat.dart';
import 'world.dart';

class Character {
  final String name;
  final String documentId;
  final Guild guild;
  final Folk folk;
  final World world;

  final Map<StatTypes, Stat> stats = {
    StatTypes.HP: Stat(),
    StatTypes.ARM: Stat(),
    StatTypes.STR: Stat(),
    StatTypes.DEX: Stat(),
    StatTypes.CON: Stat(),
    StatTypes.CHA: Stat(),
    StatTypes.WIS: Stat(),
    StatTypes.INT: Stat(),
    StatTypes.BSC: Stat(),
    StatTypes.WPN: Stat(),
    StatTypes.MGC: Stat(),
    StatTypes.ULT: Stat(),
  };

  // final Stat hp;
  // final Stat armor;
  // final Stat strength;
  // final Stat dexterity;
  // final Stat constitution;
  // final Stat intelligence;
  // final Stat wisdom;
  // final Stat charisma;
  // final Stat basicEffort;
  // final Stat weaponEffort;
  // final Stat magicEffort;
  // final Stat ultimateEffort;

  final int coin;

  final List<Item> items = List<Item>();

  Character({
    // this.hp,
    // this.armor,
    // this.strength,
    // this.dexterity,
    // this.constitution,
    // this.intelligence,
    // this.wisdom,
    // this.charisma,
    // this.basicEffort,
    // this.weaponEffort,
    // this.magicEffort,
    // this.ultimateEffort,
    this.name,
    this.documentId,
    this.guild,
    this.world,
    this.folk,
    this.coin,
  });

  Character copyWith({name, documentId, guild, world, folk, coin}) {
    return Character(
        name: name ?? this.name,
        documentId: documentId ?? this.documentId,
        guild: guild ?? this.guild,
        world: world ?? this.world,
        folk: folk ?? this.folk,
        coin: coin ?? this.coin);
  }

  toJson() => {
        "name": name,
        "documentId": documentId,
        "guild": guild.toJson(),
        "world": world.toJson(),
        "folk": folk.toJson(),
        "coin": coin.toString()
      };
}
