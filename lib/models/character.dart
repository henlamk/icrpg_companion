import 'package:icrpg_companion/util/enums.dart';

import 'consumable_item.dart';
import 'folk.dart';
import 'gear.dart';
import 'guild.dart';
import 'item.dart';
import 'permanent_item.dart';
import 'shield.dart';
import 'stat.dart';
import 'weapon.dart';
import 'world.dart';

class Character {
  final String name;
  final String documentId;
  final Guild guild;
  final Folk folk;
  final World world;

  final Stat hp;
  final Stat armor;
  final Stat strength;
  final Stat dexterity;
  final Stat constitution;
  final Stat intelligence;
  final Stat wisdom;
  final Stat charisma;
  final Stat basicEffort;
  final Stat weaponEffort;
  final Stat magicEffort;
  final Stat ultimateEffort;

  double coin;
  String _userId;

  List<Gear> _gear = [];
  List<Item> _items = [];
  List<ConsumableItem> _consumables = [];
  List<Weapon> _weapons = [];

  set gear(val) => _gear = val;
  set items(val) => _items = val;
  set consumables(val) => _consumables = val;
  set weapons(val) => _weapons = val;

  set userId(val) {
    if (_userId == null) _userId = val;
  }

  String get userId => _userId;

  List<Gear> get gear {
    if (_gear == null) _gear = List<Gear>();
    return _gear;
  }

  List<Item> get items {
    if (_items == null) _items = List<Item>();
    return _items;
  }

  List<ConsumableItem> get consumables {
    if (_consumables == null) _consumables = List<ConsumableItem>();
    return _consumables;
  }

  List<Weapon> get weapons {
    if (_weapons == null) _weapons = List<Weapon>();
    return _weapons;
  }

  Character({
    this.hp,
    this.armor,
    this.strength,
    this.dexterity,
    this.constitution,
    this.intelligence,
    this.wisdom,
    this.charisma,
    this.basicEffort,
    this.weaponEffort,
    this.magicEffort,
    this.ultimateEffort,
    this.name,
    this.documentId,
    this.guild,
    this.world,
    this.folk,
    this.coin,
    userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'documentId': documentId,
      'userId': userId,
      'name': name,
      'world': world.name,
      'folk': folk.name,
      'guild': guild.name,
      'coin': coin,
      'hp': hp.defaultValue,
      'arm': armor.defaultValue,
      'str': strength.defaultValue,
      'dex': dexterity.defaultValue,
      'con': constitution.defaultValue,
      'int': intelligence.defaultValue,
      'wis': wisdom.defaultValue,
      'cha': charisma.defaultValue,
      'bsc': basicEffort.defaultValue,
      'wpn': weaponEffort.defaultValue,
      'mgc': magicEffort.defaultValue,
      'ult': ultimateEffort.defaultValue,
      'gear': gear.map((g) => g.toJson()).toList(),
      'weapons': weapons.map((w) => w.toJson()).toList(),
      'items': items.map((i) => i.toJson()).toList(),
      'consumables': consumables.map((f) => f.toJson()).toList(),
    };
  }

  static Character fromMap(Map<String, dynamic> map, String documentId) {
    if (map == null) return null;

    var result = Character(
      documentId: documentId,
      name: map['name'],
      world: worlds.firstWhere((w) => w.name == map['world']),
      folk: folks.firstWhere((f) => f.name == map['folk']),
      guild: guilds.firstWhere((g) => g.name == map['guild']),
      coin: map['coin'],
      hp: Stat(statType: StatTypes.HP, defaultValue: map['hp']),
      armor: Stat(statType: StatTypes.ARM, defaultValue: map['arm']),
      strength: Stat(statType: StatTypes.STR, defaultValue: map['str']),
      dexterity: Stat(statType: StatTypes.DEX, defaultValue: map['dex']),
      constitution: Stat(statType: StatTypes.CON, defaultValue: map['con']),
      intelligence: Stat(statType: StatTypes.INT, defaultValue: map['int']),
      wisdom: Stat(statType: StatTypes.WIS, defaultValue: map['wis']),
      charisma: Stat(statType: StatTypes.CHA, defaultValue: map['cha']),
      basicEffort: Stat(statType: StatTypes.BSC, defaultValue: map['bsc']),
      weaponEffort: Stat(statType: StatTypes.WPN, defaultValue: map['wpn']),
      magicEffort: Stat(statType: StatTypes.MGC, defaultValue: map['mgc']),
      ultimateEffort: Stat(statType: StatTypes.ULT, defaultValue: map['ult']),
    );

    var gearRaw = map['gear'] as List;
    if (gearRaw != null)
      result.gear = gearRaw.map((g) => Gear.fromJson(g)).toList();

    var itemsRaw = map['items'] as List;
    if (itemsRaw != null)
      result.items = itemsRaw.map((i) {
        switch (i['itemType']) {
          case 'PERMANENTITEM':
            return PermanentItem.fromJson(i);
          case 'WEAPON':
            return Weapon.fromJson(i);
          case 'SHIELD':
            return Shield.fromJson(i);
          case 'GEAR':
            return Gear.fromJson(i);
        }
      }).toList();

    var weaponsRaw = map['weapons'] as List;
    if (weaponsRaw != null)
      result.weapons = weaponsRaw.map((w) => Weapon.fromJson(w)).toList();

    var foodRaw = map['consumables'] as List;
    if (foodRaw != null)
      result.consumables =
          foodRaw.map((f) => ConsumableItem.fromJson(f)).toList();

    return result;
  }

  void prettyPrint() {
    print(
        '${name} ${world.name} ${folk.name} ${guild.name} gear:${gear.length} consumables: ${consumables.length} items:${items.length} weapons:${weapons.length}');
  }

  static Character getDefault() => Character(
        world: worlds[0],
        guild: guilds[0],
        folk: folks[0],
        name: '',
        hp: Stat(defaultValue: 10, statType: StatTypes.HP),
        armor: Stat(defaultValue: 0, statType: StatTypes.ARM),
        strength: Stat(defaultValue: 0, statType: StatTypes.STR),
        dexterity: Stat(defaultValue: 0, statType: StatTypes.DEX),
        constitution: Stat(defaultValue: 0, statType: StatTypes.CON),
        intelligence: Stat(defaultValue: 0, statType: StatTypes.INT),
        wisdom: Stat(defaultValue: 0, statType: StatTypes.WIS),
        charisma: Stat(defaultValue: 0, statType: StatTypes.CHA),
        basicEffort: Stat(defaultValue: 0, statType: StatTypes.BSC),
        weaponEffort: Stat(defaultValue: 0, statType: StatTypes.WPN),
        magicEffort: Stat(defaultValue: 0, statType: StatTypes.MGC),
        ultimateEffort: Stat(defaultValue: 0, statType: StatTypes.ULT),
      );

  static Character getDummy() {
    var result = Character(
      world: worlds[0],
      guild: guilds[0],
      folk: folks[0],
      name: 'dummylorion',
      hp: Stat(defaultValue: 10, statType: StatTypes.HP),
      armor: Stat(defaultValue: 0, statType: StatTypes.ARM),
      strength: Stat(defaultValue: 0, statType: StatTypes.STR),
      dexterity: Stat(defaultValue: 0, statType: StatTypes.DEX),
      constitution: Stat(defaultValue: 0, statType: StatTypes.CON),
      intelligence: Stat(defaultValue: 0, statType: StatTypes.INT),
      wisdom: Stat(defaultValue: 0, statType: StatTypes.WIS),
      charisma: Stat(defaultValue: 0, statType: StatTypes.CHA),
      basicEffort: Stat(defaultValue: 0, statType: StatTypes.BSC),
      weaponEffort: Stat(defaultValue: 0, statType: StatTypes.WPN),
      magicEffort: Stat(defaultValue: 0, statType: StatTypes.MGC),
      ultimateEffort: Stat(defaultValue: 0, statType: StatTypes.ULT),
    );

    result.gear.add(startGear[0]);
    result.gear.add(startGear[1]);
    result.gear.add(startGear[2]);
    result.gear.add(startGear[3]);

    result.items.add(startItems[0]);
    result.items.add(startItems[1]);
    result.items.add(startItems[2]);
    result.items.add(startItems[3]);
    result.items.add(startItems[4]);
    result.items.add(startItems[5]);
    result.items.add(startItems[0]);
    result.items.add(startItems[1]);

    // result.consumables.add(foods[0]);
    // result.consumables.add(foods[1]);
    // result.consumables.add(foods[1]);

    result.weapons.add(starterWeapons[0]);
    result.weapons.add(starterWeapons[1]);
    result.weapons.add(starterWeapons[2]);

    return result;
  }
}
