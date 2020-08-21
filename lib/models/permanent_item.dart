import 'package:icrpg_companion/util/enums.dart';

import 'item.dart';
import 'stat.dart';

class PermanentItem extends Item {
  final ItemTypes itemType = ItemTypes.PERMANENTITEM;

  final List<ItemActionTypes> itemActionTypes = [
    ItemActionTypes.DESTROY,
  ];

  // final Map<ItemActionTypes, IItemAction> itemActionFunctions = {
  //   ItemActionTypes.DESTROY: ItemActionDestroy(),
  // };

  List<Stat> _bonus;
  List<Stat> get bonus {
    if (_bonus == null) _bonus = List<Stat>();
    return _bonus;
  }

  set bonus(val) => _bonus = val;

  PermanentItem({
    effect,
    description,
    amount,
    name,
    bonus,
  }) : super(
          effect: effect,
          description: description,
          amount: amount,
          name: name,
        );

  factory PermanentItem.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return PermanentItem(
      name: map['name'],
      description: map['description'],
      effect: map['effect'],
      amount: map['amount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'effect': effect,
      'amount': amount,
      'itemType': getStringValue(itemType),
    };
  }

  factory PermanentItem.clone(Item currentItem) {
    return PermanentItem(
      name: currentItem.name,
      description: currentItem.description,
      effect: currentItem.effect,
    );
  }
}

List<PermanentItem> permanentItems = [
  PermanentItem(
    name: 'Ladder',
    description: 'A wooden ladder with 12 rungs, 12 feet high',
  ),
  PermanentItem(
    name: 'Hunting Snare',
    description:
        'Re-usable spring-loaded trap, If triggered will immobilize and do 1 damage',
  ),
  PermanentItem(
    name: 'Rivet Kit',
    description:
        'A small hammer and press tool used to press rivets through leather or wood',
  ),
  PermanentItem(
    name: 'Smoke Canister',
    description:
        'Destroy to create a cloud of opaque smoke with NEAR radius for 1D4 ROUNDS',
  ),
];
