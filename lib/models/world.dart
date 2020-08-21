import 'package:flutter/material.dart';

class World {
  final String name;
  final String assetName;
  final Color backgroundColor;

  World({this.backgroundColor, this.name, this.assetName});
}

List<World> worlds = [
  World(name: 'Alfheim', assetName: '', backgroundColor: Colors.redAccent),
  World(name: 'Warp Shell', assetName: '', backgroundColor: Colors.blueGrey)
];
