import 'package:icrpg_companion/util/enums.dart';

import 'item.dart';
import 'stat.dart';

class Gear extends Item {
  final String effect;
  final String description;
  final ItemTypes itemType = ItemTypes.GEAR;
  bool isEquipped;

  List<Stat> _bonus;
  List<Stat> get bonus {
    if (_bonus == null) _bonus = List<Stat>();
    return _bonus;
  }

  set bonus(val) => _bonus = val;

  final List<ItemActionTypes> itemActionTypes = [
    ItemActionTypes.EQUIP,
    ItemActionTypes.UNEQUIP,
    ItemActionTypes.DESTROY,
  ];

  // final Map<ItemActionTypes, IItemAction> itemActionFunctions = {
  //   ItemActionTypes.EQUIP: ItemActionEquip(),
  //   ItemActionTypes.UNEQUIP: ItemActionUnequip(),
  //   ItemActionTypes.DESTROY: ItemActionDestroy(),
  // };

  Gear({
    this.effect,
    this.description,
    this.isEquipped = true,
    bonus,
    name,
  }) : super(
          name: name,
        ) {
    this.bonus = bonus;
  }

  factory Gear.clone(Gear gear) {
    return Gear(
      name: gear.name,
      bonus: gear.bonus,
      description: gear.description,
      effect: gear.effect,
      isEquipped: gear.isEquipped,
    );
  }

  factory Gear.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    Gear result = Gear(
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
      'name': super.name,
      'description': description,
      'effect': effect,
      'bonus': bonus.map((b) => b.toJson()).toList(),
      'itemType': getStringValue(itemType),
    };
  }
}

List<Gear> startGear = [
  Gear(
      effect: '+1 INT',
      description:
          'All worlds hold weird secrets. With this, you know a few of them.',
      name: 'Amulet of Secrets',
      bonus: [
        Stat(statType: StatTypes.INT, defaultValue: 1),
      ]),
  Gear(
      effect: '+1 WIS',
      description:
          'By counting the beads, the mind settles. Senses heighten, intuition improves.',
      name: 'Meditation Beads',
      bonus: [
        Stat(statType: StatTypes.WIS, defaultValue: 1),
      ]),
  Gear(
      effect: '+1 CHA',
      description: 'Your voice seems more commanding, your tone more grave.',
      name: 'Masterful Coats',
      bonus: [
        Stat(statType: StatTypes.CHA, defaultValue: 1),
      ]),
  Gear(
      effect: '+1 Magic Effort',
      description:
          'Fragments of some forgotten crystal enhance your magical power.',
      name: 'Fire Stone',
      bonus: [
        Stat(statType: StatTypes.MGC, defaultValue: 1),
      ]),
  Gear(
      effect: '+1 DEX',
      description:
          'Nothing helps the nimble and swift like well-made foot wear.',
      name: 'Masterful Boots',
      bonus: [
        Stat(statType: StatTypes.DEX, defaultValue: 1),
      ]),
  Gear(
      effect: '+1 CON',
      description:
          'He who drinks from the same mug every day will know the joys of a steadfast gut.',
      name: 'Trusty Mug',
      bonus: [
        Stat(statType: StatTypes.CON, defaultValue: 1),
      ]),
  Gear(
    effect: '+1 STR',
    description:
        'Used for bending bars, swinging a hammer, and pulling a wagon.',
    name: 'Ring of Might',
    bonus: [Stat(statType: StatTypes.STR, defaultValue: 1)],
  ),
  Gear(
      effect: '+2 Weapon Effort',
      description:
          'Grip chain, custom belt sling, and other tidbits give you an edge.',
      name: 'Weapon Kit',
      bonus: [
        Stat(statType: StatTypes.WPN, defaultValue: 1),
      ]),
  Gear(
      effect: 'Roll Magic Effort',
      description:
          'Be it arrows, bolts or bullets, it houses a weird, deadly power.',
      name: '20 Magic Ammo'),
  Gear(
      effect: '+3 WIS when scouting',
      description:
          'Scanning the horizon for threats? One of many types of scouting.',
      name: 'Spy Glass'),
  Gear(
    effect: '+3 Ultimate Effort',
    description: 'Make Ultimate Effort rolls even more Ultimate!',
    name: 'Berserk Ring',
    bonus: [
      Stat(statType: StatTypes.ULT, defaultValue: 3),
    ],
  ),
  Gear(
      effect: 'Any time you roll for LOOT, roll TWICE',
      description: 'Get double the LOOT!',
      name: 'Greedy Gloves'),
];

List<Gear> gear = [
  Gear(
    name: 'Mithril Vest',
    description: 'Subtract 2 from all Weapon Damage done against you',
    effect: '',
  ),
  Gear(
    name: 'Fin Boots',
    description: '+1 Armor, double effort and range when swimming',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Cloak of Shadows',
    description: '+1 Armor, roll EASY checks when sneaking',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Demon Helmet',
    description: '+1 Armor, +3 CHA when intimidating',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Claw Boots',
    description: 'Walk on any surface in any direction without a Check',
    effect: '',
  ),
  Gear(
    name: 'Cloak of Aras',
    description: 'Deflect 1 Weapon attack against you per turn',
    effect: '',
  ),
  Gear(
    name: 'Silver Gauntlets',
    description: '+3 STR when gripping or grappling, silver properties',
    effect: '',
  ),
  Gear(
    name: 'Dragon Helmet',
    description: '+2 Armor, Wearer immune to damage inflicted by fire',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Mask of Mofune',
    description: '+1 Armor, Roll ultimate effort when intimidating',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Adamantine Hauberk',
    description: '+4 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 4),
    ],
  ),
  Gear(
    name: 'Wristlets of Might',
    description: 'Armor +1, Roll 1D8 for any Basic Effort',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Iron Gut Belt',
    description: '+1 Armor, If you fail a CON roll, try one more time',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Gadgeteer’s Goggles',
    description:
        '+1 Armor, Rolls with CREATE DEVICE or repairing machines are always EASY',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Boots of Haste',
    description: 'Armor +1, After an action, you may then also Move again',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Astral Crown',
    description:
        '+2 Armor, On a critical spell cast, cast same through any ally’s body at that moment',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Common Helmet',
    description: '+1 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Worker’s Clothes',
    description: '+1 Armor, Durable coveralls, gloves and hat',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Wool Cloak',
    description: '+1 Armor, A typical hooded cape for winter wear',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Fur-lined Coat',
    description: '+1 Armor, Disregard negative effects of extreme cold',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Corrosion-Proof Gloves',
    description:
        '+1 Armor, Chemically treated leather that is immune to Acid or corrosion',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Highborn Clothes',
    description: '+1 Armor, One set of high-end, tailored formal wear',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Forgeman’s Boots',
    description: '+1 Armor, Immune to fire or hot surfaces when walked on',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Bird Suit',
    description:
        '+1 Armor, A theatrical feather-suit and beaked mask for festive occasions',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Gilly Cloak',
    description:
        '+1 Armor, A leaf-covered cape, Roll EASY on stealth in natural surroundings',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Scout’s Pouch Harness',
    description: '+1 Armor, Extend maximum carry capacity to 12 LOOT',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Arming Jacket',
    description: '+1 Armor, Increase maximum wearable Armor to 11',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Imperium Signet',
    description: '+1 Armor, The sign of a ranking member of the cosmic order',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Turtle Shield',
    description:
        '+3 Armor, HARD CON roll to put down, Occupies 3 equipped or carried slots',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Cloak of Crushing Weight',
    description: '+1 Armor, Hard STR to remove, all rolls HARD when worn',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Shield of Teeth',
    description:
        '+3 Armor, If you make a kill, the shield will eat the remains in a gruesome mess',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Fish Boots',
    description:
        '+1 Armor, When swimming move up to DOUBLE FAR, slowly grow gills',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Helm of Toads',
    description:
        '+2 Armor, -3 CHA, HARD STR to remove, Croak after speaking, Speak to Toads',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
      Stat(statType: StatTypes.CHA, defaultValue: -3),
    ],
  ),
  Gear(
    name: 'Kthuul Breather',
    description:
        '+2 Armor, -2 CHA, Breathe anywhere, if worn 1D8 ROUNDS, cannot be removed',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
      Stat(statType: StatTypes.CHA, defaultValue: -2),
    ],
  ),
  Gear(
    name: 'Cloak of Vapor',
    description:
        '+2 Armor, Stealth Checks are EASY, If worn 1D8 days slowly become vaporous',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Fel Armor',
    description:
        '+6 Armor, No other Armor can be Equipped, slowly take on evil habits and appearance',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 6),
    ],
  ),
  Gear(
    name: 'Helm of the Dead',
    description:
        '+2 Armor, Take on the properties of the undead, Removable only when DYING',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Agnar Helmet',
    description:
        '+2 Armor, HARD STR to remove, Gain only half of any benefit from FOOD',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Cloak of Despair',
    description:
        '+1 Armor, HARD CHA to remove, Constantly doom-say your allies’ plans',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Feral Fur Coat',
    description:
        '+3 Armor, HARD CHA to remove, Become totally animalistic in action and thought',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Cuirass of Rising',
    description:
        '+3 Armor, to remove, Any dead things NEAR you arise as undead',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Berserk Helm',
    description:
        '+2 Armor, Double your WEAPONS EFFORT bonus, but choose targets randomly',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Imperium Power Armor',
    description:
        '+2 Armor, +2 STR, Use 1 of 3 fuel cells to double bonuses for 1D4 ROUNDS',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
      Stat(statType: StatTypes.STR, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Fighter’s Girdle',
    description: '+1 Armor, When DYING, add 2 to your roll',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Frost Bracers',
    description:
        '+3 Armor, Become immune to any damage done or ill effects of cold',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Helmet of Udin',
    description: '+4 Armor, +3 CHA, Allies NEAR you gain +1 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 4),
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Antlers of the Storm',
    description:
        '+3 Armor, With a WIS check you can command the weather when outdoors',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Hood of Fear',
    description:
        '+3 Armor, Any enemies who can see you make a WIS check or flee on their turn',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Frog Boots',
    description: '+2 Armor, When moving FAR, leap with ease',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Brain Horror Helm',
    description:
        '+3 Armor, Gain the ‘It shows you things’ property of a Brain Horror',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 3),
    ],
  ),
  Gear(
    name: 'Ramthas Battle Harness',
    description: '+1 Armor, Gain 3 more slots in EQUIPPED gear',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Gnomish Beam Goggles',
    description:
        '+2 Armor, Fires a ray of ULTIMATE Weapon damage, but attacks are HARD',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Belt of Guzzling',
    description: '+4 Armor, Never fail another CON check',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 4),
    ],
  ),
  Gear(
    name: 'Adamantium Armor',
    description:
        '+8 Armor, Ignore any Damage below 3, Reduce Equipped GEAR to 5 slots',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 8),
    ],
  ),
  Gear(
    name: 'Styll Suit',
    description:
        '+4 Armor, Wear no other ARMOR, Breathe anywhere, never hungry, heal 2 HP per round',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 4),
    ],
  ),
  Gear(
    name: 'Drunken Hauberk',
    description: '+2 Armor, +2 CON, Never fail a test involving Gar',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
      Stat(statType: StatTypes.CON, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Gleaming Gorget',
    description: '+1 armor, +2 CHA',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
      Stat(statType: StatTypes.CHA, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Slayer’s Helm',
    description: '+2 Armor, +6 Weapon Effort',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
      Stat(statType: StatTypes.WPN, defaultValue: 6),
    ],
  ),
  Gear(
    name: 'Wings of Gabriel',
    description:
        '+5 Armor, Foldable, Fly at will, Double your maximum move range',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 5),
    ],
  ),
  Gear(
    name: 'Shield of Angels',
    description:
        '+6 Armor, You and all NEAR allies ignore any damage of 5 or less',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 6),
    ],
  ),
  Gear(
    name: 'Lizard Head Hat',
    description:
        '+1, A large leather hat crafted to resemble a Reptoid or Lizard Folk, Convincing',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Robes of Kazghat',
    description:
        '+2, Wearer is immune to any effects caused by time travel or time distortion',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Tunic of Generosity',
    description:
        '+5 Armor, Natural 20 to remove, Be compelled to give your gear to friends',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 5),
    ],
  ),
  Gear(
    name: 'Crab Arm',
    description:
        'Armor +2, A parasitic crab claw arm that attaches to your shoulder permanently',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Handsy Hands',
    description:
        '+1, Each of your hands has 10 fingers, each functioning as two hands',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Cozy Hat',
    description:
        '+2, This fluffy fur hat is so warm and cozy, be immune to cold even with no other clothes',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  Gear(
    name: 'Volatile Goggles',
    description:
        '+1, When rolling ULTIMATE, roll twice. If the second roll is a 1, negate both',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  Gear(
    name: 'Skin Suit',
    description:
        'A fitted suit of hide that fits under your armor, granting you 10 disposable HP',
    effect: '',
  ),
];
