import 'package:icrpg_companion/util/enums.dart';

import 'item.dart';

class ConsumableItem extends Item {
  final List<ItemActionTypes> itemActionTypes = [
    ItemActionTypes.USE,
    ItemActionTypes.DESTROY,
    ItemActionTypes.SETAMOUNT,
  ];

  // final Map<ItemActionTypes, IItemAction> itemActionFunctions = {
  //   ItemActionTypes.USE: ItemActionUse(),
  //   ItemActionTypes.DESTROY: ItemActionDestroy(),
  // };

  final ItemTypes itemType = ItemTypes.CONSUMABLEITEM;
  final bool isHealing;

  ConsumableItem({
    this.isHealing = false,
    effect,
    description,
    amount,
    name,
  }) : super(
          effect: effect,
          description: description,
          amount: amount,
          name: name,
        );

  factory ConsumableItem.newAmount(ConsumableItem item, int amount) {
    return ConsumableItem(
      name: item.name,
      effect: item.effect,
      description: item.description,
      amount: amount,
      isHealing: item.isHealing,
    );
  }

  factory ConsumableItem.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return ConsumableItem(
      name: map['name'],
      description: map['description'],
      effect: map['effect'],
      amount: map['amount'],
      isHealing: map['isHealing'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'effect': effect,
      'amount': amount,
      'isHealing': isHealing,
      'itemType': getStringValue(itemType),
    };
  }
}

List<ConsumableItem> consumables = [
  ConsumableItem(
    name: 'Moldy Buns',
    description: 'Heal 5 HP, Tastes simply awful',
    effect: 'FOOD',
    amount: 1,
    isHealing: true,
  ),
  ConsumableItem(
    name: 'Speedy Snack',
    description: 'Gain a bonus MOVE after your next MOVE',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Spider Bites',
    description: 'Heal 2D6 HP, you’re pretty much eating a bug',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Feast o’ Fingers',
    description: 'Heal all allies 1D8 if they are at CLOSE range',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Iradrum Heart',
    description:
        'For 24 hours after eating if you drop to 0 HP instantly recover to 1 HP',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Ire Bacons',
    description: 'Heal 3D12',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Red Gar',
    description: 'Heal to full HP, absorb the next attack unharmed',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Black Gar',
    description: '+10 Armor for 4 ROUNDS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Queen’s Kiss',
    description: 'Your next action is an automatic critical success',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Shire Jerky',
    description: 'Regenerate 1D12 HP for the next 4 ROUNDS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Ale of Death',
    description:
        'After death, return with 10 HP. If consumed and you don’t die that day, it is wasted',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Ale of Life',
    description: 'Drink in battle. Any ally who touches you heals 1D12 HP once',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Feast of Kings',
    description: 'All allies restore full HP and receive one Chest',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Soldier’s Rations',
    description: 'Heal 1D4 HP',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Captain’s Rations',
    description: 'Heal 1D6 HP',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Skin of Stale Gar',
    description: 'Consume to make your next roll EASY',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Turkey Leg',
    description: 'Heal 1D10 HP',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Stimulant Elixir',
    description: 'On your next turn move FAR as if it was NEAR',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Traveler’s Meal',
    description: 'Heal up to 5 people for 1 HEART',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Side of Beef, Roasted',
    description: 'Heal 3 people 1D12',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Hard Gar Cider',
    description: 'Ignore the next 10 Damage done to you',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Cask of Golden Gar',
    description:
        'Recover 2 HP for up to 50 people, once tapped will sour in 1 day',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'A Fine Steak',
    description: 'Heal to full HP',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Elemental Elixir',
    description:
        'When enchanting, consume to add an elemental property: Ice, Fire, Air, Earth',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Phial of Resolve',
    description:
        'Drink this Elixir to add Ultimate Effort to your next successful Attempt',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Seaweed Sandwich',
    description: 'Heal 3 HP, Smell like seawater and bilge for 1 week',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Toe Rot Waybread',
    description: 'Heal 3 HP, Move only NEAR for 1D4 of your ROUNDS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Raw Hatchlings',
    description:
        'Take 3 HP Damage, Make a CON Check or violently vomit, hate eggs for 1 month',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Wrigglers',
    description: 'Heal 2D6 HP, All CON Checks are now HARD for 24 hours',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Agnar Liver Paste',
    description:
        'Heal 2D12, NEAR Allies must make a CON Check or take 1 stink damage',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Fungus Burger',
    description:
        'Heal 1 HP, Lose -2 HP per round, and all CON Checks HARD until healed to full',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Hungry Bread',
    description:
        'Heal 1D6 HP, Become ravenously, insatiably hungry for 1D6 days',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Glowcap Mushroom',
    description:
        'Heal 1 HEART of HP, Experience bonzo hallucinations for 1D4 days',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Gnomish Gar',
    description:
        'Drop to 0 HP, If you regain HP, become a Grey Gnome, -3 CHA, -2 STR for 1D4 days',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Swamp Gar',
    description:
        'Lose 3 HP, Mucky mud beer makes you UNABLE TO EAT for 1D6 days',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Gar Swill',
    description:
        '6 sips, Take 2 damage with each sip, but be hopelessly addicted for 1D4 days',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Hoppy Gar',
    description: 'Heal to Full HP, All checks are EASY for 1D4 ROUNDS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Dobbs’ Cheddar',
    description: '3 Count, Add to any FOOD to double that FOOD’s effects',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Genetic Soup',
    description: 'changes the eater into a random new BIO-FORM instantly',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Enchanted Sandwich',
    description:
        'Never ages or spoils, 5 bites, 1 Bite heals 1D8 HP, When finished gain +1 CON',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Juice of Sapho',
    description: '+8 INT, Triple the EFFORT of your next SPELL',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Timecap Mushroom',
    description: 'SKIP the next DM’s turn',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Dragon’s Blood',
    description: 'Grow wings and breathe fire for 1D4 ROUNDS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Stench Gar',
    description:
        'Release a poisonous belch, Reduce one NEAR creature to 1 HEART',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Star of Unadai',
    description: 'Gain +1 to all STATS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Water of Life',
    description:
        'Die, Return to life 1D4 ROUNDS later with 2 additional HEARTS',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Mead of Udin',
    description: 'All who drink awake the next day with an additional HEART',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Monkey Root',
    description:
        '1 Use, +5 DEX for 4 ROUNDS, Make monkey noises when you try to speak',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Dud Beer Cask',
    description: '5 uses, Gar that has been brewed wrong and has no alchohol',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Mushroom Gar',
    description:
        '5 uses, Gar brewed with rare fungus. Glow slightly and be delirious for 1D4 Hours',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Beauty Bacon',
    description:
        '3 uses, enjoy +10 CHA for 1D4 ROUNDS. You look, and smell, delicious',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Sandwich of Love',
    description:
        '1 use, Whoever eats this sandwich falls in love with a person of your choice',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Phial of Demon’s Tears',
    description:
        '1 use, Take the form of a demon for 1D4 days. You’re never quite the same',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Chokemeat',
    description:
        '1 use, When eaten, this tough jerky will choke and gag the eater until they pass out',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Bug Bait',
    description:
        '3 uses, Tiny bits of savory spice. All insects within 1 mile are drawn to it',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Dragon Wine',
    description:
        '3 uses, After drinking, you sound, smell, and intimidate just like a Drake',
    effect: 'FOOD',
    amount: 1,
  ),
  ConsumableItem(
    name: 'Limb Seed',
    description:
        '1 use, Apply to a severed limb or stump to grow a new limb in 1D4 days',
    effect: 'FOOD',
    amount: 1,
  ),
];
