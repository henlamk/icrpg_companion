import 'package:icrpg_companion/util/enums.dart';

import 'consumable_item.dart';
import 'gear.dart';
import 'permanent_item.dart';
import 'shield.dart';
import 'stat.dart';

abstract class Item {
  final String name;
  final String effect;
  final String description;
  final ItemTypes itemType = ItemTypes.ITEM;
  int amount;

  List<Stat> _bonus;
  List<Stat> get bonus {
    if (_bonus == null) _bonus = List<Stat>();
    return _bonus;
  }

  set bonus(val) => _bonus = val;

  final List<ItemActionTypes> itemActionTypes = [];

  // final Map<ItemActionTypes, IItemAction> itemActionFunctions = {};

  Item({
    this.name,
    this.effect,
    this.description,
    this.amount,
    bonus,
  });

  void toJson();
}

List<Item> startItems = [
  PermanentItem(
      name: 'Rope & Hook',
      effect: '+3 DEX when climbing',
      description:
          'Standard issue grapple gear. Includes 50 feet of rope and a curved metal anchor.'),
  PermanentItem(
      name: 'Spell Book',
      effect: 'Magic Effort Explodes',
      description:
          'This book teaches you the art of unlimited power. When rolling MAGIC EFFORT on a D8, if you roll a natural 8, roll again. There is no limit to how many times you can roll.'),
  Shield(
      name: 'Common Shield',
      effect: '+2 Armor',
      description:
          'Sure, it uses up a hand, weighs a ton, and makes a bunch of noise, but it sure can take a beating. Common Shields can be sacrificed to absorb HALF of one attack against you. This destroys the shield.',
      bonus: [
        Stat(statType: StatTypes.ARM, defaultValue: 2),
      ]),
  ConsumableItem(
      name: 'Supplies Pack',
      effect: 'Food, Fire Starters, 3 Flares',
      description:
          'Long journey? This pack is a must. When traveling far and wide, the GM will roll for travel cost. This many ‘Supplies’ are consumed on the voyage. Average value per pack is 10 Coin.'),
  PermanentItem(
      name: 'Miner’s Gear',
      effect: 'Lantern, Pick, Spikes',
      description:
          'Even in science fiction settings, basic earthworks and tunneling gear can be critical.'),
  PermanentItem(
      name: 'Tools (one type)',
      effect: '+3 Variable',
      description:
          'Choose Lock picks, Smithing, Woodwork, Technology (by Type), or Medicine. Add a +3 Bonus to your ATTEMPTS when working with your Tools. Only affects the ATTEMPT. EFFORT type will be specific to each situation.'),
  PermanentItem(
      name: 'Trapper Gear',
      effect: 'Snares, Tackle, Tent',
      description:
          'Whether you’re wandering the wild, marooned on a strange planet, or stuck in the middle of nowhere, these are crucial.'),
  ConsumableItem(
      name: 'Pouch of 50 Coin',
      effect: '',
      description:
          'Seashells, credits, gold, greenbacks...whatever. You’ve got some pocket cash for the next tavern.'),
  Gear(
      name: 'Common Armor',
      effect: '+1 Armor',
      description:
          'One extra piece to add to your starting Armor. Remember as you gather more Armor items, a maximum of +10 Armor from items is all you can wear. This does NOT include Armor gained from your STAT.')
];

List<Item> items = [
  PermanentItem(
    amount: 1,
    name: 'Levitation',
    description: 'Enchant a target to float up to 6 feet high for 1D4 ROUNDS',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Identify',
    description:
        'Give a target +3 on an INT/Investigate roll, No Attempt needed to cast',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 10,
    name: '10 Magic Arrows',
    description:
        'Inflict Magical Damage with a bow shot, can be retrieved, broken on crit fail',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Armor of Faith',
    description: 'Give a target +3 Armor for 1 Turn',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Disguise Kit',
    description:
        'Whenever deceiving a stranger Do ULTIMATE effort and EASY checks',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Aegis Amulet',
    description: 'Roll 1D8 when dying',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Healing Touch',
    description: 'Touch to heal an ally with Magical Effort',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Healing Nova',
    description: 'Heal all NEAR allies with double Magical Effort',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Grapple Vine',
    description:
        'When you move, pull a NEAR monster or ally with you, Opposing STR to resist',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lightning Bolt',
    description:
        'Burn 1-12 HP, add to a blast of magical effect, double against metal-clad',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ice Blast',
    description: 'Inflict magical damage and immobilize target for 1 turn',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Arcane Bomb',
    description:
        'Plant this glowing orb, in 1D4 ROUNDS explodes for 2D12, NEAR range',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Fireball',
    description: 'Blast any targets within NEAR range of a location',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Heart Stone',
    description: 'add 1 Heart to your max',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.HP, defaultValue: 10),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Enchanting',
    description:
        'Enchant an item to do magical effort and a +1 per Heart of Effort spent',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Divine Shield',
    description:
        'Enchant a target you can see to absorb the next 10 Effort done to it',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Staff of Elements',
    description: 'Triple any elemental Magical Effort you do with INT SPELLS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Turn Undead',
    description:
        'For 1 ROUND, repel 1D8 undead creatures, They cannot get within NEAR range',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Terror Shard',
    description:
        'Hold aloft, living things must resist with WIS or flee for a turn',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Resurrection',
    description:
        'HARD roll, In 4 ROUNDS a deceased target you touch will live again with 1 HP',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dragon Orb',
    description:
        'Blast 4D12 Magical Fire damage, FAR range, The item is destroyed',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Ghosts',
    description:
        'On a 15+ Attempt create a clone NEAR that performs the same attack or action',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Crown of Madness',
    description: 'Make a target take a random action (GM’s roll)',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sharpening',
    description: 'Add +2 Effort to a weapon, Once per weapon',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Swarm',
    description:
        'Cast on a location you can see, CLOSE targets take Magical Damage for 1D4 ROUNDS',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mender',
    description: 'Repair a ruined item or weapon instantly',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dwarven Anvil',
    description:
        'Once per 1D12 days, create a weapon with +3 Attempt OR Effort bonuses',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Book of Skills',
    description:
        'With any 3 successes, earn a permanent +1 to a specific type of Attempt',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Fire',
    description: 'Double all fire Damage inflicted',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ringlet of Genius',
    description: 'Use ULTIMATE effort with any successful INT roll',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Goblet of Udin',
    description: 'Double effects from any Food consumed',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Aras',
    description:
        'When recovering, recover a full HEART in addition to your normal RECOVERY',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Heart Stone',
    description: 'add 1 Heart to your max',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.HP, defaultValue: 10),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Translocate',
    description: 'Swap places with an ally you can see',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Power',
    description: 'Double all Magic Effort',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'King’s Signet',
    description: 'Have final say on group decisions, and be loved for it',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Thieves’ Picks',
    description: '+3 Attempt AND Double Effort when opening chests',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Giants',
    description: '+1 STR, +1 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.STR, defaultValue: 1),
      Stat(statType: StatTypes.ARM, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Masterful Boots',
    description: '+1 DEX',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.DEX, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'King’s Mug',
    description: '+1 CON',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.CON, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Amulet of Secrets',
    description: '+1 INT',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.INT, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Meditation Beads',
    description: '+1 WIS',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.WIS, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Masterful Coats',
    description: '+1 CHA',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.CHA, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Armor Kit',
    description: '+2 Armor',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ARM, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Fire Stone',
    description: '+1 Magic Effort',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.MGC, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Weapon Kit',
    description: '+2 Weapon Effort',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.WPN, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Diamond Spyglass',
    description: '+6 WIS on Scouting attempts',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Berserk Ring',
    description: '+3 on ULTIMATE effort',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.ULT, defaultValue: 3),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Holy Bulwark',
    description:
        'Bless an ally with touch, for 4 ROUNDS they are immune to non-Magical Effort',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Storm',
    description:
        'Everything with FAR range blasted with hail for Magical Damage',
    effect: 'WIS Power',
  ),
  PermanentItem(
    amount: 1,
    name: 'Feather of Falling',
    description: 'You cannot be hurt by damage from a fall at any height',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Timebender',
    description:
        'If the GM rolls a timer, you can have her roll it again. The second roll will be final',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lightning Steed',
    description:
        'Summon a flying steed to travel. What would take a day, takes 1 TURN',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Weird Luck',
    description:
        'If you roll a 1 twice, your blunder causes something oddly beneficial',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Spellslinger Ring',
    description:
        'If you roll a critical attempt when casting, Attempt another spell instantly',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Slayers',
    description:
        'If you make a successful Weapon attack, attempt again. If a hit, roll ULTIMATE effort',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lantern',
    description: 'Easy-light box lantern, lights all within NEAR range',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Climber’s Spikes',
    description: 'Climb a route as normal. Any who follow roll EASY',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: '50’ Rope',
    description: '50 feet of sturdy fiber rope coiled up',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pry Bar',
    description:
        'A 3 foot iron bar with one hooked end, roll EASY when forcing doors',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'First Aid Kit',
    description:
        'Bandages and tinctures for field dressing, consume to give a dying ally 1 HP',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ladder',
    description: 'A wooden ladder with 12 rungs, 12 feet high',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hunting Snare',
    description:
        'Re-usable spring-loaded trap, If triggered will immobilize and do 1 damage',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Torch',
    description:
        'An-oil soaked stick wrapped in cloth, illuminates NEAR for 1D8 ROUNDS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Rivet Kit',
    description:
        'A small hammer and press tool used to press rivets through leather or wood',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Smoke Canister',
    description:
        'Destroy to create a cloud of opaque smoke with NEAR radius for 1D4 ROUNDS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Blank Book',
    description: 'A blank journal-style book with sheathed pen',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Metal Cutters',
    description:
        'A large snip tool for cutting bars or chains, roll Ultimate Effort when doing so',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Small Tent',
    description: 'Houses 3 individuals, packs into small bundle',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Canvas Tarp',
    description: 'A durable cloth square NEAR long on each side',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Worn Parachute',
    description:
        'Deploy when falling to nullify fall damage, has 1% chance of failure',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ferry Pole',
    description: 'A sturdy pole that can reach FAR, very difficult to carry',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Fishing Gear',
    description: 'Standard low-cost fishing tackle and rod',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cooking Set',
    description:
        'Pot, plates, utensils, spices. Heal 5 HP OVER HEART max when camping',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Large Magnet',
    description: 'Powerful magnet that can hold 100 pounds',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hacksaw',
    description: 'used to very slowly cut metal or wood with precision',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'War Banner',
    description: 'A canvas banner mounted on a 10 foot pole, unmarked',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Anchor',
    description: 'An iron anchor and 50 foot chain used on medium sized boats',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Jug of Junk Oil',
    description: 'Leftovers from mechanical work, highly flammable, slick',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Bullhorn',
    description:
        'A conical horn with pistol grip, transmit a yell to DOUBLE FAR range',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ratchet Winch',
    description:
        'A length of chain bisected by a ratchet lever, pull VERY HEAVY objects',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Armor Spike Kit',
    description:
        'Add spikes to any piece of armor, attackers take 1 HP when hitting',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mastercraft Arrows',
    description: 'Double Weapon Effort on a hit, 3 count',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Jug of Flies',
    description:
        'A large glass jug filled with flies, remnant of some kind of science work',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Deformed Skull',
    description: 'A weird artifact kept by some oddball',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wheeled Dolly',
    description:
        'A metal square platform with four small caster wheels, used to truck cargo',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Carved Tankard',
    description: 'a uniquely crafted drinking mug, huge',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Signal Flare',
    description: 'A magnesium flare that burns bright yellow, even under water',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Signal Horn',
    description: 'When sounded can be heard for 1 mile',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Glass Scope',
    description:
        'Attach to one ranged weapon, grants +1 DEX when using that weapon',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Huge Cargo Pulley',
    description: 'Used with rope to easily hoist huge objects',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lode Stone',
    description: 'An incredibly heavy cube of solid iron with a hoop on top',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Steel Rod',
    description:
        'Leftover from some large machine, 3 feet long, almost unbreakable',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Frogman Gear',
    description:
        'Mask, fins, and a small air bladder for 4 ROUNDS spent underwater, reusable',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mining Tools',
    description: 'Make EASY rolls when excavating',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gold Chain',
    description: 'Once worn by the wealthy, worth 1D100 x 5 Coin',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Shovel',
    description: 'A sturdy steel and wood shovel',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Padlock and Key',
    description: 'Reinforced steel lock',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Phial of Acid',
    description: 'A few ounces of concentrated hydrochloric acid',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hunter’s Bait',
    description:
        'A non-perishable, odoriferous gunk that draws wildlife for up to 1 mile',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Forgeman’s Bellows',
    description:
        'Huge, durable bellows to stoke a fire to incredible temperatures',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pouch of Ball Bearings',
    description: 'A small sack of stainless steel spheres ranging in size',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Goat Bell',
    description: 'A leather collar with iron bell, adjustable size',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Medic Stretcher',
    description: 'Carry a fallen ally with no STR checks',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Float Vest',
    description: 'Used to avoid swimming fatigue or drowning in rough water',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Deck of Cards',
    description: 'Play numerous games or perform parlor tricks',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Butchery Kit',
    description: 'A rolled cloth with numerous knives, hooks, and cleavers',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Farmer’s Bug Sprayer',
    description:
        'A hand operated pump-mister filled with vinegar-lemon mixture',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Riding Tack',
    description:
        'Leather harnesses, universal saddle for any number of beast-mounts',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Armor Repair Kit',
    description: 'Re-usable supplies and tools to fix any ARMOR',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Navigation Gear',
    description:
        'Scopes and charts for navigating, make EASY navigation rolls, save supplies',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Holy Silver Amulet',
    description:
        'Silver properties, an inspiring symbol of the good in this world',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Martial Arts Manual',
    description: 'When fighting with bare hands and feet, do Weapon Damage',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Locale Map',
    description: 'Glean all pertinent locations in a 25 mile radius',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Alchemist’s Kit',
    description: 'Do 1 HEART of effort to produce a random 1-use Potion',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Runestone',
    description:
        'If you are killed in battle, this stone can bring you back from Asgard...but how?',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Light of the Gods',
    description: 'Destroy this gem to raise a DYING ally and give them full HP',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Arn’s Hex',
    description:
        'Rot a target with 1 Damage per round for 1 day, and also suffer the condition',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mind Trap',
    description: 'Once learned, lose 1 INT, Touch a target to cast same effect',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 10,
    name: 'Terrible Arrows',
    description:
        'Magical Arrows, but they NEVER hit their target, boomeranging on a 1',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Crown of Memories',
    description:
        'HARD INT Check to take off, Slowly devours wearer’s best memories',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Tears',
    description: '-1 WIS, To remove the ring a willing recipient must be found',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.WIS, defaultValue: -1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Hag’s Eye',
    description:
        'Look through to locate evil nearby, for 1 week, see evil hiding everywhere',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Tentacle Glove',
    description:
        'Roll Magical for Basic Effort, +2 STR, -3 CHA, A hideous barbed whip replaces one arm',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.STR, defaultValue: 2),
      Stat(statType: StatTypes.CHA, defaultValue: -3),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Drunk’s Tankard',
    description: 'HARD CON and -1 CON to put down, Constantly thirst for Gar',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Amulet of Certainty',
    description:
        'HARD CHA to remove, +1 CHA, Stride boldly into all dangers as if invincible',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.CHA, defaultValue: 1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Crow’s Foot',
    description:
        'Natural 20 to put down, Covet the Crow’s Foot over all other things, even allies',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Staff of Serpents',
    description:
        'Once learned gains its own +3 CHA, wills user to sadistic use of magic',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Liar’s Dice',
    description:
        'For the next 3 rolls you make, lie to your group about what you rolled, then destroy',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Betrayal',
    description:
        'HARD CON to remove, Choose a random ally, become convinced they want you dead',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Necklace of Decay',
    description: 'HARD CON to remove, Age 10 years every round',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Flame',
    description:
        'Add 1D6 Fire Damage to attacks, Flammable items on your person slowly burn away',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Woodbane Crown',
    description:
        'Do double EFFORT against anything wooden, your wooden items slowly fall apart',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Book of Lies',
    description:
        'HARD INT to break its spell, Become convinced of false facts, all INT checks are HARD',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Spider Pack',
    description:
        'An insectoid satchel that won’t let go, STR 15 1 to remove, -5 CHA, Reduce Carry to 5',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Aazul’s Conjuration',
    description: 'Summon 1D4 imp demons who crave living flesh',
    effect: 'INT Spell',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Death Wish',
    description:
        'HARD INT to remove, Have a sudden and potent will to die with glory',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Whispering Amulet',
    description:
        'HARD CHA to remove, It just won’t shut up, All Stealth checks are HARD',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dead Man’s Mug',
    description:
        'HARD CHA to put down, Invert any benefits from drink into harm',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Rotted Pipeweed',
    description:
        'HARD INT to put down, Addictive, When smoked nullify INT bonus for 1D4 hours',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Skull Bracelet',
    description: 'HARD INT to put down, When worn, re-roll DYING if above 3',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cap of Madness',
    description:
        'HARD INT to remove, All INT checks are HARD, Go completely stark raving bonkers',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Beltstone',
    description:
        'HARD INT to remove, When worn, take double damage from any fall',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Olive Branch',
    description: 'HARD CHA to put down, Refuse to hurt any living thing',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cold Iron Cross',
    description: 'HARD WIS to remove, You cannot use WIS powers',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Key of the Ogdru',
    description:
        'If used, a magical keyhole appears, it widens to summon 1D8 Giant Tentacles',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Chain Energy Gem',
    description:
        'Attach to a weapon, Make that weapon Magical, Effort done hits all CLOSE enemies',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gemini Jewel',
    description:
        'Attune to any INT SPELL, That spell now casts twice when used, on Targets of choice',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Salamander Wristlet',
    description: 'Regenerate 1 HP each round, unless DYING',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Acid Whetstone',
    description:
        'Sharpen a bladed weapon, Successful attacks with that weapon destroy 1 enemy gear',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Invisibility',
    description:
        'Make a WIS check to activate, remain invisible for 1D4 ROUNDS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Crown of Goblins',
    description:
        'Command all Goblins with absolute authority, even if they hate you',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Illusory Self',
    description: 'Conjure a very realistic mirror-clone of yourself',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dimension Jump',
    description: 'Warp to any location you can see or can accurately remember',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hand of Resurrection',
    description:
        'Raise 1 dead creature back to full HP, roll 1D4, if a 1 or 2 the item is destroyed',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dire Bear',
    description:
        'Become a colossal bear for 1D4 ROUNDS, Add 1 HEART, Double bonuses',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Iron Skin',
    description: 'Your ARMOR is 20 for 1D4 ROUNDS',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Diamond Tiara',
    description: 'A crown worth more than a small city',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ivory Rose',
    description:
        'Bestow this on one person, that person will guard you with their life',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Tooth of the Agnar',
    description:
        'Attach to 1 Weapon, That weapon does ULTIMATE Effort on any roll of 15+',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Magma Coil',
    description:
        'Give off a belch of smoke and fire to make any STR check EASY or STR EFFORT Ultimate',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Heroic Tabard',
    description:
        'Whenever you cry “Huzzah!” those who answer “Huzzah!” roll EASY on their next turn',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Song of the Mountain',
    description:
        'Sing! All enemies within FAR range are -5 CHA to resist persuasion',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pet Slime Cube',
    description:
        'This tiny Slime Cube has imprinted on you as parent, 3” on a side',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pet Goblin',
    description:
        'This hapless, gearless runt has sworn never to leave your side',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wave of Fury',
    description:
        'If NEAR the ocean, call forth a massive wave, impacts in 1D4 ROUNDS',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gravity Inversion',
    description: 'Invert gravity within FAR range for 1D4 ROUNDS',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gunner’s Tripod',
    description:
        'Gain +5 Attempts/Effort when firing at targets beyond FAR range with a Weapon',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Watcher',
    description:
        'A small glass eye, place anywhere and see through it within 1 mile',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Yalfonso’s Disc',
    description:
        'A frictionless, levitating disc of energy that holds up to 200 pounds',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ronaldo’s Backwagon',
    description: 'Gain 10 more slots in CARRIED gear',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Call of Aram',
    description:
        'A mighty war horn, Sound a call that can be heard for 5 miles, with a +3 CHA',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Runic Rope',
    description: 'ANY roll using this rope is EASY, 50’',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Thoor’s Stone',
    description:
        'Only the looter of this object is able to lift or move it, a baseball-sized cube',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Book of Infinity',
    description:
        'You have perfect recall of every fact or detail you have ever encountered',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Amulet of Thunder',
    description:
        'When rolling ULTIMATE, re-roll anything less than a 6, the second roll is final',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lemninkainen’s Wondrous Sack',
    description: 'Increase your CARRIED gear slots to 20',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Akintu',
    description:
        'An odd tiki statue that brings good luck, When you roll a 19, treat it as a 20',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cloud Buffalo',
    description:
        'A steed that descends from the sky on command, carries 8 people and 10 LOOT',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Earth’s Heart',
    description:
        'A massive ruby, the biggest, most rare jewel in all the world',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gnomish Metal Melter',
    description:
        '1D4 ROUNDS to reach full power, then vaporizes ANY NEAR metal objects',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ghost Trap',
    description:
        'Holds up to 5 non-corporeal beings, simply place, wait, and trigger, Target gets DEX check',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Clockwork Arm',
    description: 'Prosthetic, +3 STR, all STR checks are EASY, -1 CHA',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.STR, defaultValue: 3),
      Stat(statType: StatTypes.CHA, defaultValue: -1),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Bracelet of Thoor',
    description: '+2 STR',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.STR, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Quickness',
    description: '+2 DEX',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.DEX, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Sage’s Crystal',
    description: '+2 INT',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.INT, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'Effigy of Osric',
    description: '+2 WIS',
    effect: '',
    bonus: [
      Stat(statType: StatTypes.WIS, defaultValue: 2),
    ],
  ),
  PermanentItem(
    amount: 1,
    name: 'The Hidden',
    description:
        'Allies NEAR are invisible for 1D4 ROUNDS, They become visible if they move away',
    effect: 'INT SPELL',
  ),
  PermanentItem(
      amount: 1,
      name: 'Eye of Azatoth',
      description: '+6 Magical Effort',
      effect: '',
      bonus: [
        Stat(statType: StatTypes.MGC, defaultValue: 6),
      ]),
  PermanentItem(
    amount: 1,
    name: 'Boon of the Gods',
    description:
        'Grant one OTHER PLAYER a class Milestone Reward of their choice, one use',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Shrink Ray',
    description: 'Reduce one target to 1/100th its size for 1D4 ROUNDS',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Giant Growth',
    description: 'Grow one target to 5x its size for 1D4 ROUNDS',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Osric’s Bulwark Wall',
    description: 'Form a massive castle wall from boulders or cobbles',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Destroy the Dead',
    description: 'Annihilate 1 Undead per 1 HP burned, FAR range',
    effect: 'INT SPELL',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ghost Ship',
    description:
        'Conjure a black galleon, no crew, that will last 1D4 weeks before dissipating',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cosmic Gateway',
    description:
        'Open a door, access ANY world in the cosmos, burn 8 HP to walk through',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Invulnerability',
    description:
        'Anoint one target with touch, they cannot be harmed for 1D8 ROUNDS',
    effect: 'WIS POWER',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sherherezazahd',
    description:
        'A ghostly sword that fights at your side, add Magical Weapon effort to all attacks',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Time Doorway',
    description:
        'Access ANY time at current location, age 10 years to go through',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lifewalker',
    description:
        'Leave a trail of flowers and growth wherever you go, those within heal 2 HP per round',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wishing Well',
    description:
        'Immovable once used, Make 1 WISH per YEAR, it will come true within 1D4 days',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Book of Mastery',
    description:
        '3 pages, each decoded with an INT roll, Learn 1 Milestone Reward of any class',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Necronomicon',
    description:
        'Create 1 INT SPELL or WIS POWER with a HARD INT check, learn or teach it instantly',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Translator Tapeworm',
    description:
        'Increases appetite, Speak and understand all spoken languages',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'You Doll',
    description:
        'Perfectly resembles its owner, Make an INT roll to ask it any question and get a true answer',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sedated Runner Bird',
    description:
        'This sleepy bird has been drugged and goes berserk when it awakes',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Finful Ring',
    description:
        'Armor, A ring wreathed in wiggling fins. Swim at triple normal speed',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Bag o’ Fingers',
    description:
        'A leather sack filled with 2D20 fingers from various bio-forms',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Glooby Trap',
    description:
        'A glob of ultra-sticky putty or goo. Once touched, only a HARD STR roll can set you free',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Eyeball Ball',
    description:
        'A wacky, energetic bouncing eyeball toy. See through it with an INT roll',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Gag Plank',
    description:
        'A plank of wood for building, but made hollow to effortlessly break under little force',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Giant Egg',
    description:
        'Use warmth and time to hatch. Spawn 1 randomly chosen monster, which bonds to you',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Eargantua’s Ears',
    description:
        'A pair of giant ears that can be worn, only fail a hearing ATTEMPT with a 1',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Soggy Bottoms Banjo',
    description:
        'A weird stringed instrument with a whimscal sound, entertain any small crowd',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Azael’s Blood Dice',
    description:
        'Roll these red dice. Enemies become fascinated with them for 1D4 ROUNDS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Chatty Skull',
    description:
        'A human skull that just won’t shut up. If disposed, will pop up elsewhere soon',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Time Tube',
    description:
        'A small tube. Pass an item through. It will arrive in the past at a moment you choose',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Bomb Roach',
    description:
        'A realistic mechanical insect. Set it in motion, it will explode as it runs in 1 TURN',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Grim’s Boot',
    description:
        'Use on a rope or line to fish, You are guaranteed a major catch',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Knot Rope',
    description: 'A 300 foot length of rope tangled in inextricable knots',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Towel',
    description: 'A green towel',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ship in a Bottle',
    description:
        '1 use, Shatter this bottle to reveal a full sized galleon with weapons and supplies',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Death’s Eye',
    description:
        'A crystal sphere, Look within to see the moment of your death',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Blood Spider',
    description:
        'This large black spider crawls on you, heals 1 HP per ROUND unless you are DYING',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Spectrum Silk',
    description:
        'A bolt of slick fabric that seethes with a myriad of vibrant colors',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Glider Parasite',
    description:
        'A multi-legged arthropod, HARD STR to remove, Allows you to glide when falling',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'See Me Torch',
    description:
        'A torch that will burn as long as at least 1 person is looking directly at it',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Expanding Slime Cube',
    description: 'A tiny slime cube which continuously grows once released',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wind of Saras',
    description:
        'A bottle of air, which bellows out like wind whenever uncorked',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Tectura Infinitessema',
    description: 'A tiny, malevolent, sentient dungeon',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Note to Self',
    description:
        'A letter written from you in some alternate dimension or time, addressed to you',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Martin’s Left Hand',
    description: 'This is Martin’s left hand. Martin wants it back',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lil Stool',
    description: 'A fully functonal toilet, 2 inches tall',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Magician’s Hoop',
    description:
        'A steel ring that can ‘hook into’ any other ring or circle with a whack',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Jarred Silk Worm',
    description:
        'A glass jar containing an odd worm. Produces 1 foot of unbreakable thread per day',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cockroach Pinata',
    description:
        'A paper globe containing 10,000 cockroaches who have not eaten for weeks',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Lantern of Sett',
    description:
        'A candle-lit lantern box. When lit, it emits pitch black darkness NEAR range',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Spores of Chang',
    description:
        'A jar of fungal spores. If inhaled, your sense of smell is 1,000 times normal acuity',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Bag o’ Keys',
    description:
        'Each time you reach in, extract a key. There is a 5% chance it’s the key you want',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Portable Footprints',
    description:
        'Place these paper-thin footprints anywhere, they look perfectly realistic',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Xylobone',
    description:
        'A musical instrument made from bones. The music can make some men crave death',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Rope Incense',
    description:
        '5 uses, The smoke from this oral incense can be climbed like rope, lasts 1D4 ROUNDS',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pipes of Dawn',
    description:
        'A magical flute. When played with a CHA roll, the sun will rise',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mini Mimic',
    description:
        'A tiny, tameable mimic that can imitate any object the size of a canteloupe or smaller',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Comical Toot',
    description:
        'Attach this small tassle to any headgear. Causes hysterical laughter for those who see it',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sifter of All Things',
    description:
        'A culinary sifter. Things inside become other things...but what?',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Teeth of Krynn',
    description:
        'A necklace of 8 teeth from various beasts, each still hungry for its favored prey',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hungry Emerald',
    description:
        'An impressive emerald with a hard-to-notice mouth. It eats COINS when possible',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Here, Fishy, Fishy',
    description:
        'A simple horn. When used, summon a fish from ANY mass of water',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dry Ring',
    description: 'You can never be wet or touched by liquid',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Portable Fissure',
    description:
        'A strange optical illusion. Place this small crack on any object, and it will be cracked',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sponge Stone',
    description:
        'A fist-sized rock that can absorb up to 100 gallons of liquid',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ring of Mirrors',
    description:
        'When worn, you can interact with objects, creatures, and structures as if reversed',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Frog Pellets',
    description:
        'A handful of tiny green blobs. When touching moisture, each blob becomes 1D20 frogs',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dimensional Map',
    description:
        'Unroll this leather map. Becomes a 3D, living, moving version of your surroundings',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hand-on-a-Stick',
    description: 'Can be used to open chests or doors, or test trapped items',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Monkey Drummer',
    description:
        'When set down, begins drumming a tiny drum. Will only stop when stored',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Tattoo Collection',
    description: 'A small pirate’s chest filled with tattooed skin pieces',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Rubber Treasure',
    description:
        'A collection of fake COINS, jewels, and baubles made of rubbery resin',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Vortex in a Bottle',
    description:
        'A powerful, swirling vortex contained in glass. If released, sucks everything FAR',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Larry',
    description:
        'A small creature who owes you his life. When examined, it cannot be determined what he is',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Creepy Coconut',
    description: 'A hideous, terrifying coconut that resembles a human face',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wheel-mobile',
    description:
        '1 CHUNK, A tiny, one-wheeled gadget that can hold up to 5 passengers',
    effect: 'Vehicle',
  ),
  PermanentItem(
    amount: 1,
    name: 'Beard Birds',
    description:
        'A small family of birds that live in the nearest beard, but move to follow you',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Magnetic Plank',
    description: 'A plank of wood for building but with a +5 STR magnetic pull',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Soul of a King',
    description:
        'A tiny glowing spark kept in glass. This is the everlasting soul of a long lost King',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Infinity Banner',
    description: 'A huge billowing flag which can display anything you choose',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Kelligan’s Cube',
    description:
        'A weird cubic puzzle. The cubes align in colors and symbols, bending reality',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Wand of Genders',
    description: 'With a touch, change any creature’s gender',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Cold Box',
    description: 'A small chest. Inside is always freezing cold',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Folding Road',
    description: 'Unfold 1 mile of wagon-width road at any location',
    effect: '',
  ),
  PermanentItem(
    amount: 1,
    name: 'Skullcrusher Helm',
    description:
        'Once donned, slams shut for Weapon Damage, Damage again to remove',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Handshake from Hell',
    description:
        'An odd hand sculpture, when touched latches on with a STR +5 grip',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Locust Urn',
    description:
        'If opened, release a 2 HEART Swarm of Locusts that cannot be harmed with Weapons',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Needle Glove',
    description:
        'A metal gauntlet with poison finger needles, 1 HP damage per round until you eat',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Magic Bomb',
    description:
        'If looted, explodes in a cloud of gas FAR range, This gas nullifies all magic 1D4 ROUNDS',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Kthuul Parasite',
    description:
        'Attach to face, Roll 1D6 every turn, if 1 it controls you, HARD CON to remove',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Kthuul Egg Layer',
    description:
        'Small nodule blasts a cloud of tiny spores, in 1D8 ROUNDS, it hatches inside you...',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Kthuul Spine',
    description:
        'A black spine of chitin sticks through your hand for 1D6 Damage',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Sticky Ice',
    description:
        'Looter is stuck to a magically frozen chest, immobilized until chest destroyed',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mask of Horrors',
    description:
        'A hideously deformed human face, -5 CHA, 2D12 damage to remove',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Vision of Fear',
    description:
        'An illusory presence of raw fear, Looter must flee FAR in a random direction',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'A Lovely Box',
    description:
        'HARD CHA roll to put down, You must never open it, NO ONE can ever open it! Mine!',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Mira’s Broach',
    description:
        'HARD CON to remove, Red Gem sucks 2 HP per successful attack, Thirsty for blood',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Belt of Burdens',
    description: '',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Flower Demon',
    description:
        'Looter unleashes a tiny demon, everywhere it goes is choked with vines and flowers',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Liar’s Compass',
    description:
        'HARD INT to put down, Become convinced the worst way is the best way',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Giggles',
    description:
        'A cute cuddly monkey doll, CHA 18 2 to put down, Giggle almost constantly, at awful things',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Black Heart Stone',
    description:
        'You only have 1 HEART for 1D4 days, no matter your actual max',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Effigy of Azatoth',
    description:
        'A fiendish little statue, Once touched, for 1D4 days any blood loss spawns a tentacle',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Hunter Orb',
    description:
        'A relentless adamantium orb flies out and hunts you and allies, 3 HEARTS, Magic',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Book of Forgetting',
    description:
        'Falls apart when read, Lose track of ONE EQUIPPED LOOT for 1D4 days',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Fool’s Armor Kit',
    description: 'When used, deduct 1 from your Armor total',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Fool’s Weapon Kit',
    description: 'The weapon you modify will BREAK on its next failed attack',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Exploding Thorn Whips',
    description:
        'Once LOOTED, you and all NEAR ALLIES are immobilized for 1D4 ROUNDS',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Dizzy Gas',
    description:
        'Looter breathes a poof of purple mist, All DEX rolls are HARD for 1D4 days',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Eye Mites',
    description:
        'A colony of tiny mites explodes into your eyes, go BLIND for 1D4 hours',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Pure Beauty',
    description:
        'HARD CHA to look away once opened, If others look, same escape required',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Ray of Death',
    description:
        'Make a CON check or be instantly reduced to 0 HP by a black ray of magic',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Timeslip',
    description:
        'Whatever the DM’s timer reads when LOOTED, accelerate it by 1',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Booby-trapped Arrow',
    description:
        '1 Ammo, When fired, do Magical Damage to anything within FAR range',
    effect: 'TRAP',
  ),
  PermanentItem(
    amount: 1,
    name: 'Stink Bomb',
    description:
        'You and your allies smell awful, -5 CHA and smell for 1 mile for 1D4 days',
    effect: 'TRAP',
  ),
];
