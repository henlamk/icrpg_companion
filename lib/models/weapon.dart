import 'package:icrpg_companion/util/enums.dart';

import 'gear.dart';
import 'stat.dart';

class Weapon extends Gear {
  final String effect;
  final String description;
  final ItemTypes itemType = ItemTypes.WEAPON;

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

  Weapon({
    this.effect,
    this.description,
    bonus,
    name,
  }) : super(
          name: name,
          bonus: bonus,
        );

  factory Weapon.clone(Weapon weapon) {
    return Weapon(
      name: weapon.name,
      bonus: weapon.bonus,
      effect: weapon.effect,
      description: weapon.description,
    );
  }

  factory Weapon.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Weapon(
      name: map['name'],
      description: map['description'],
      effect: map['effect'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'effect': effect,
      'itemType': getStringValue(itemType),
    };
  }
}

List<Weapon> starterWeapons = [
  Weapon(
      name: 'Dagger',
      effect: '',
      description:
          'A timeless classic of all who dare the wide world. Concealed, Fast, Piercing, Thrown'),
  Weapon(
      name: 'Short Sword',
      effect: '',
      description:
          'The preferred weapon of rogues and light footmen. Fast, Light, Sturdy'),
  Weapon(
      name: 'Long Sword',
      effect: '',
      description:
          'Considered a mark of lordship in many places. Deadly, Large, Sharp'),
  Weapon(
      name: 'Great Sword',
      effect: '',
      description: 'The Zweihander! Near, Huge, Chopping, Heavy'),
  Weapon(
      name: 'Axe',
      effect: '',
      description: 'As much weapon as tool. Useful, Durable, Thrown'),
  Weapon(
      name: 'Battle Axe',
      effect: '',
      description:
          'A brutal modification on an old invention, preferred by savages and berserkers. Huge, Chopping, Can’t be Sheathed'),
  Weapon(
      name: 'Halberd',
      effect: '',
      description: 'Pole-axe of the front lines. Near, Giant, Reach, Siege'),
  Weapon(
      name: 'Staff',
      effect: '',
      description:
          'What adventurer hasn’t delighted in the finding of a good, solid STICK. Light, Simple, Useful, Everywhere'),
  Weapon(
      name: 'Spear',
      effect: '',
      description:
          'Some call it the world’s first weapon. Near, Simple, Long, Durable, Thrown'),
  Weapon(
      name: 'Siege Spear',
      effect: '',
      description: 'Used for felling horses. Near, Giant, Reach, Piercing'),
  Weapon(
      name: 'Mace',
      effect: '',
      description: 'Merciful? Hardly. Heavy, Smashes Armor, Merciful'),
  Weapon(
      name: 'Hammer',
      effect: '',
      description:
          'The one weapon that will never break. Useful, Indestructible, Thrown'),
  Weapon(
      name: 'Flail',
      effect: '',
      description:
          'Usually used on horseback. Deadly, Unblockable, Can’t be Sheathed'),
  Weapon(
      name: 'Long Bow',
      effect: '',
      description: 'Far, Immense Range, Piercing, Large'),
  Weapon(
      name: 'Short Bow',
      effect: '',
      description: 'Far, Small, Light, Short Range'),
  Weapon(
      name: 'Sling', effect: '', description: 'Far, Invisible, Free, Merciful'),
  Weapon(
      name: 'Crossbow',
      effect: '',
      description:
          'Complex to operate, and not found in many places, but terribly effective in war. Far, Expensive, Rapid Fire, Military'),
];

List<Weapon> weapons = [
  Weapon(
    name: 'Silver Sword',
    description: '+1 Effort, Silver properties',
    effect: '',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: 1,
      )
    ],
  ),
  Weapon(
    name: 'Spiked Net',
    description:
        'STR check to escape, Entangled, Move NEAR only and all checks HARD',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Ragged Battleaxe',
    description: '-2 to Attempts but roll ULTIMATE effort every time',
    effect: '',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: -2,
      )
    ],
  ),
  Weapon(
    name: 'The Iron Hook',
    description: 'Use a turn to pull a target to your location, FAR range',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Bow of Eagles',
    description: 'Use an extra turn aiming to do double Damage',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Silver Spear',
    description: '+3 to DEX Attempt when thrown, silver properties',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Flaming Sword',
    description: 'Add 1D4 Burn damage for 1D4 ROUNDS to damaged targets',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Dwarvish Hammer',
    description: 'roll Double ULTIMATE on natural 20s',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Lifedrinker',
    description: 'Heal half of any Damage done to living targets',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Mace of Thunder',
    description: 'Any target struck is stunned on its next TURN and cannot act',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Common Sword',
    description: 'Standard Steel blade with heavy use',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Worn Long Bow',
    description: 'Has 10% chance of breaking when used',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Common Dagger',
    description: 'Thrown, Piercing, Fast',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Pikeman’s Spear',
    description: 'Has NEAR reach, cannot be thrown',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Rapid Crossbow',
    description: 'Has 10% chance of firing a second BOLT when fired',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Cloven Sword',
    description:
        '+2 Attempts AND Effort, Magical, cannot be put down, slowly become a goat',
    effect: '',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: 2,
      )
    ],
  ),
  Weapon(
    name: 'Ravager Axe',
    description:
        '+1 STR, Once engaged with an enemy, you are compelled to finish the kill',
    effect: '',
    bonus: [
      Stat(
        statType: StatTypes.STR,
        defaultValue: 1,
      )
    ],
  ),
  Weapon(
    name: 'Bow of Hatred',
    description: 'HARD WIS to put down, Failed attacks hit a random target',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Freezing Blade',
    description: 'HARD WIS and 2D6 cold damage to put down',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'War Axe of Skulls',
    description:
        'HARD CHA to put down, Axe has +3 CHA, forces you to collect skulls',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Ugly Stick',
    description: 'Do -1 CHA damage the first time you hit a target',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Fel Cleaver',
    description:
        'HARD STR to put down, When you make a kill, attack a random NEAR target',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Magnetic Crossbow',
    description:
        '+2 Attempts and Effort, HARD STR to separate from metal armor',
    effect: '',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: 2,
      )
    ],
  ),
  Weapon(
    name: 'Impaler’s Spear',
    description: 'HARD CHA to put down, Be compelled to pike your victims',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Reaver’s Scythe',
    description: 'HARD CHA to put down, You are now forbidden to heal allies',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Dagger of Spite',
    description:
        'HARD CHA to put down, Anytime you are persuaded, stab that person!',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Blade of Greed',
    description: 'A golden Gladius, HARD CHA to put down, Go after EVERY CHEST',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Blade of Azatoth',
    description:
        'A tentacle-like sword, Become convinced The Devourer must arise',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Dwarven Bomb',
    description:
        'Fuse burns for 1D4 ROUNDS, Explodes doing 4D12 to anything NEAR',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Harpoon Gun',
    description: 'Attack to grapple a foe with a +5 STR if they try to escape',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Bow of Seeking',
    description:
        'If you know a target’s name, you never miss it, even around corners',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Fire Blade',
    description:
        '+3 Attempts/Effort, Ignites flammables, 1D4 Burning for 1D4 ROUNDS',
    effect: 'Magical',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: 3,
      )
    ],
  ),
  Weapon(
    name: 'Feral Claws',
    description:
        '+3 Attempts, Retractable steel blades, Roll EFFORT TWICE on a hit',
    effect: 'Magical',
    bonus: [
      Stat(
        statType: StatTypes.WPN,
        defaultValue: 3,
      )
    ],
  ),
  Weapon(
    name: 'Red Fang',
    description: 'Any damage you do with Red Fang, heal half that amount',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Crystal Darts',
    description:
        '3 Count, Magical, Immobilize a target, in 1D4 ROUNDS explode for 2D12',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Dagger of the Unseen',
    description:
        'If attack undetected, any human-sized victim is reduced to 0 HP',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Headsman’s Shovel',
    description: 'On a 20, automatically behead any human-sized target',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Gungnir',
    description:
        'Spear, Smite the ground to pass final judgment, +10 CHA for 1 mile',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Hammer of Hell',
    description: 'All EFFORT done with this weapon affects all NEAR enemies',
    effect: 'Magical',
    bonus: [],
  ),
  Weapon(
    name: 'Boomerang Whip',
    description:
        'A 12’ bull whip, leather, that can be thrown and caught again',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Blade of Skepticism',
    description:
        'HARD STR to put down, A talking sword that doubts your every move',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Bowby Trap',
    description:
        'Gag long bow, when shot the roll acts against the user, and the arrow backfires',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Really Ugly Stick',
    description:
        'Inflict 5 or more damage on a target to give it a permanent -5 CHA',
    effect: '',
    bonus: [],
  ),
  Weapon(
    name: 'Deathbraid',
    description:
        'A huge braid of black hair that whips and moves like a WEAPON',
    effect: 'Magical',
    bonus: [],
  ),
];
