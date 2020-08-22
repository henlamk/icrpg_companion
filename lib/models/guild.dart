import 'dart:convert';

import 'package:flutter/material.dart';

class Guild {
  final String name;
  final String line;
  final String description;
  final String starterReward;
  final List<String> mileStones;

  final String assetName;
  final Color backgroundColor;

  Guild({
    this.starterReward,
    this.line,
    this.backgroundColor,
    this.name,
    this.mileStones,
    this.description,
    this.assetName,
  });

  toJson() {
    return {
      "name": name,
      "line": line,
      "description": description,
      "starterReward": starterReward,
      "mileStones": json.encode(mileStones),
      "assetName": assetName,
    };
  }
}

List<Guild> guilds = [
  Guild(
    name: 'Guardian',
    line: 'I stand between us and them.',
    starterReward: 'Shield Gloves',
    description: 'holds up his shield',
    mileStones: [
      'Battle Standard (Allies fighting next to you gain 2 Armor)',
      'Heart Stone (add 1 HEART to your maximum)',
      'Spiked Shield (Deal 3 damage on a missed attack)',
      'War Horn (Give an ally +3 on their next Attempt)',
      'Skin of Amber Gar (Consume to be immune to damage for 3 ROUNDS)',
      'Guardian’s Boots (Designate an ally, absorb any damage they take)',
    ],
    assetName: 'assets/images/guild_icons/Guardian-64x64.png',
    backgroundColor: Colors.black,
  ),
  Guild(
      name: 'Blade',
      line: 'I will kill them. I will kill them all.',
      starterReward: 'Weapon Gem',
      mileStones: [
        'Masterwork Boots (+1 DEX)',
        'Diamond Whetstone (Choose one weapon, when you Roll 6 Effort, Roll again)',
        'Khettish Chains (On a weapon attempt of 15 or better, Attack again)',
        'Blood of Furies (Trade HP for a Weapons Effort Bonus)',
        'Blade Gauntlets (On a Move turn, arrive and do 1D4 Weapon Effort)',
        'Obsidian Spears (Thrown, 5 Count, any hit does Double Ultimate Effort)',
      ],
      assetName: 'assets/images/guild_icons/Blade-64x64.png',
      backgroundColor: Colors.black),
  Guild(
      name: 'Shadow',
      line: 'Hold on, let me try something...',
      starterReward: 'Thief\'s Hood',
      mileStones: [
        'Thieves’ Boots (When rolling Stealth, only on a 1 do you fail)',
        'Thieves’ Gimbel (When rolling a natural 20 ATTACK, also roll for 1 LOOT)',
        'Weird Masks (+3 CHA when deceiving strangers)',
        'Smoke Bombs (5 Count, throw to conceal movements of one or more allies)',
        'Deadly Snare (Set a tiny trap that does Ultimate EFFORT when triggered)',
        'Shadow Dagger (Attack with Magic EFFORT, even after moving FAR)',
      ],
      assetName: 'assets/images/guild_icons/Shadow-64x64.png',
      backgroundColor: Colors.black),
  Guild(
      name: 'Archer',
      line: 'Fall back, focus fire on the big one!',
      starterReward: 'Speed Quiver',
      description: 'pew pew',
      mileStones: [
        '20 Magic Arrows (Roll Magic Effort on Hit)',
        'Berserker Ring (+2 Ultimate Effort)',
        'Marking Flare (Designate a hit target. Allies do double Effort against it)',
        'Grapple Arrow (Hit an anchor point and move there as a free action)',
        'Steel Bowstring (Hit a target, all targets between you are also hit)',
        'Lightning Bow (Always roll Magical EFFORT, you no longer need arrows)',
      ],
      assetName: 'assets/images/guild_icons/Archer-64x64.png',
      backgroundColor: Colors.yellow),
  Guild(
      name: 'Priest',
      line: 'Is anyone hurt? Stop moving!',
      starterReward: 'WIS Power: Healing Touch',
      description: 'heals n shit',
      mileStones: [
        'Heart Stone (add 1 HEART to your maximum)',
        'WIS Power: Healing Nova (Heal ALL Allies on a HARD WIS ATTEMPT)',
        'Amulet of the Fortress (If FAR from enemies, Allies touching you can’t be harmed)',
        'Belt of Udin (When Healing yourself, always do Ultimate EFFORT)',
        'Book of Knowledge (+3 INT when investigating the unknown)',
        'Select a spell'
      ],
      assetName: 'assets/images/guild_icons/Priest-64x64.png',
      backgroundColor: Colors.blue),
  Guild(
      name: 'Scout',
      line: 'Up ahead! Look out!',
      starterReward: 'Winged Boots',
      mileStones: [
        'Meditation Beads (+1 WIS)',
        'Ratchet Claw (In addition to Move, move one Ally on your Turn)',
        'WIS Power: True Sight (Reveal all hidden things with a WIS Attempt)',
        'Book of Traps (Make an EASY WIS roll to create, disable or locate traps)',
        'WIS Power: Silent Speech (Use a WIS ATTEMPT to communicate with Allies OR Enemies with no discernible sound at any distance)',
        'WIS Power: Frog Leap (Move freely where others must make ATTEMPTS or CHECKS because of terrain)',
      ],
      assetName: 'assets/images/guild_icons/Scout-64x64.png',
      backgroundColor: Colors.black),
  Guild(
      name: 'Mage',
      line: 'My friends, I\'ve got this... watch...',
      starterReward: 'INT Spell: Arcane Missile',
      mileStones: [
        'Volatile Fire Stone (+3 Ultimate Effort when Casting Spells)',
        'INT Spell: Pyroblast (Double Effort on up to three targets. Volatile: Attempt of 10 or less, choose 3 random targets)',
        'Shield Crystal (Impenetrable by conventional missiles)',
        'Blood Amulet (Sacrifice 1-10 HP, add to a Magical EFFORT roll)',
        'Book of Secrets (+1 INT)',
        'Select a spell',
      ],
      assetName: 'assets/images/guild_icons/Mage-64x64.png',
      backgroundColor: Colors.black),
  Guild(
      name: 'Commander',
      line: 'We go. NOW!',
      starterReward: 'Amulet of Kings',
      mileStones: [
        'Weapons Kit (+2 Weapon Effort)',
        'Blazing Hiltstone (Hammer into a weapon. On a roll of modified 15+, add 1D4 Fire damage and ignite the target)',
        'Lion Breastplate (+3 CHA when being frightened or intimidated)',
        'Lion Belt (+3 Armor)',
        'Lazarus Ring (Roll 1D8 when dying, rather than 1D6)',
        'WIS Power: Titan’s Battlecry (Grant +3 to all allies’ next Attempts OR -3 to all enemies’ next Attempts)',
      ],
      assetName: 'assets/images/guild_icons/Commander-64x64.png',
      backgroundColor: Colors.black),
  Guild(
      name: 'Wildling',
      line: 'I jump out the window!',
      starterReward: 'Hillman\s Belt',
      mileStones: [
        'Heart Stone (add 1 HEART to your maximum)',
        'WIS Power: Wild Growth (With WIS, Overgrow a target with vines. Immobilize it, all Attempts BY the target or CLOSE to the target are HARD)',
        'Ring of Weird Luck (On a 1 Attempt roll, your failure causes an odd benefit)',
        'WIS Spellsong: Tree (With WIS, give an ally who can hear you Ultimate EFFORT)',
        'WIS Spellsong: Rock (With WIS, heal allies that can hear you)',
        'Tasty Trouts (5 Count, consume to heal to full HEARTS)',
      ],
      assetName: 'assets/images/guild_icons/Wildling-64x64.png',
      backgroundColor: Colors.black),
];
