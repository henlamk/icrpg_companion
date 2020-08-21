import 'package:icrpg_companion/util/enums.dart';

import 'character.dart';
import 'item.dart';

class RouteArgumentModel {
  final Character character;
  final ItemTypes itemType;
  final Item item;

  RouteArgumentModel({this.character, this.itemType, this.item});
}

class SelectStatsRouteArguments {
  final Character character;
  final bool isEditting;
  final bool isInCreation;

  SelectStatsRouteArguments(
      {this.character, this.isEditting, this.isInCreation});
}
