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
        defaultValue: map['defaultValue'], currentValue: map['currentValue']);
  }

  Map<String, dynamic> toJson() {
    return {
      'defaultValue': this.defaultValue,
      'currentValue': this.currentValue,
      'statType': getStringValue(this.statType),
    };
  }
}
