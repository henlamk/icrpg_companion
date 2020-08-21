import 'package:icrpg_companion/util/enums.dart';

class Stat {
  //evtl nen enum value hier rein bringen? hat letztes mal eher fuer unruhe gesorgt...
  final StatTypes statType;
  int defaultValue;
  int currentValue;

  get name => getStringValue(statType);

  Stat({
    this.statType,
    this.defaultValue,
    this.currentValue,
  });

  factory Stat.newValue(Stat stat, int value) {
    return Stat(
      statType: stat.statType,
      defaultValue: value,
      currentValue: stat.currentValue,
    );
  }

  factory Stat.fromJson(Map<String, dynamic> map) {
    if (map == null) return null;

    return Stat(
        statType: _findStatTypeByString(map['statType']),
        defaultValue: map['defaultValue'],
        currentValue: map['currentValue']);
  }

  Map<String, dynamic> toJson() {
    return {
      'defaultValue': this.defaultValue,
      'currentValue': this.currentValue,
      'statType': getStringValue(this.statType),
    };
  }

  static StatTypes _findStatTypeByString(String value) {
    switch (value) {
      case 'HP':
        return StatTypes.HP;
      case 'ARM':
        return StatTypes.ARM;
      case 'STR':
        return StatTypes.STR;
      case 'DEX':
        return StatTypes.DEX;
      case 'CON':
        return StatTypes.CON;
      case 'INT':
        return StatTypes.INT;
      case 'WIS':
        return StatTypes.WIS;
      case 'CHA':
        return StatTypes.CHA;
      case 'BSC':
        return StatTypes.BSC;
      case 'WPN':
        return StatTypes.WPN;
      case 'MGC':
        return StatTypes.MGC;
      case 'ULT':
        return StatTypes.ULT;
    }
    return null;
  }
}
