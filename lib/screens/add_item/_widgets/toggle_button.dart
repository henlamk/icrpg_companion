import 'package:flutter/material.dart';
import 'package:icrpg_companion/util/enums.dart';

class ToggleButton extends StatefulWidget {
  final Function onChange;

  ToggleButton({
    Key key,
    this.onChange,
  }) : super(key: key);

  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  final Map<ItemTypes, bool> buttonStates = {
    ItemTypes.CONSUMABLEITEM: true,
    ItemTypes.PERMANENTITEM: false,
    ItemTypes.WEAPON: false,
    ItemTypes.GEAR: false,
  };

  double fontSize = 18;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[400]),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Center(
        child: ToggleButtons(
          borderColor: Colors.transparent,
          fillColor: Colors.blue,
          borderRadius: BorderRadius.circular(50),
          selectedColor: Colors.white,
          isSelected: buttonStates.values.toList(),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Consumable",
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Permanent",
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Gear",
                style: TextStyle(fontSize: fontSize),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                "Weapon",
                style: TextStyle(fontSize: fontSize),
              ),
            ),
          ],
          onPressed: (int index) {
            setState(() {
              for (var entry in buttonStates.keys) {
                buttonStates[entry] = false;

                if (ItemTypes.values.indexOf(entry) == index) {
                  buttonStates[entry] = true;
                }
              }
            });
          },
        ),
      ),
    );
  }
}
