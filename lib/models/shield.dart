import 'package:icrpg_companion/util/enums.dart';

import 'gear.dart';
import 'stat.dart';

class Shield extends Gear {
  final ItemTypes itemType = ItemTypes.SHIELD;

  final List<ItemActionTypes> itemActionTypes = [
    ItemActionTypes.EQUIP,
    ItemActionTypes.UNEQUIP,
    ItemActionTypes.DESTROY,
    ItemActionTypes.SACRIFICE,
  ];

  // final Map<ItemActionTypes, IItemAction> itemActionFunctions = {
  //   ItemActionTypes.EQUIP: ItemActionEquip(),
  //   ItemActionTypes.UNEQUIP: ItemActionUnequip(),
  //   ItemActionTypes.DESTROY: ItemActionDestroy(),
  //   ItemActionTypes.SACRIFICE: ItemActionSacrifice(),
  // };

  Shield({
    name,
    effect,
    description,
    bonus,
  }) : super(
          name: name,
          effect: effect,
          description: description,
          bonus: bonus,
        );

  factory Shield.clone(Shield shield) {
    return Shield(
      name: shield.name,
      bonus: shield.bonus,
      description: shield.description,
      effect: shield.effect,
    );
  }

  factory Shield.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    Shield result = Shield(
      name: map['name'],
      description: map['description'],
      effect: map['effect'],
    );

    var rawBonus = map['bonus'] as List;
    if (rawBonus != null)
      result.bonus = rawBonus.map((b) => Stat.fromJson(b)).toList();

    return result;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'effect': effect,
      'bonus': bonus.map((b) => b.toJson()).toList(),
      'itemType': getStringValue(itemType),
    };
  }
}

List<Shield> shields = [
  Shield(
    name: 'Spiked Shield',
    description:
        'Failed enemy attacks are answered with Weapon Damage (no bonuses)',
    effect: '',
    bonus: [],
  ),
  Shield(
    name: 'Skull Shield',
    description: '+2 Armor, Can also be used as a Magical Weapon',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Shield(
    name: 'Used Shield',
    description: '+2 Armor, Heavily worn, will break on 3rd hit',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Shield(
    name: 'Lion Shield',
    description: '+2 Armor, Allies that are NEAR also get +2 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
];
