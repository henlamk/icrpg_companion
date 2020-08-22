import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/screens/view_character/_page_views/_widgets/expansion_panel_list_item.dart';
import 'package:icrpg_companion/screens/widgets/expansion_panel_list.dart';
import 'package:icrpg_companion/screens/widgets/icon_button.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key key}) : super(key: key);

  @override
  _ViewItemsState createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomExpansionPanelList(),
        CustomIconButton(
          icon: Icons.add,
          onTap: () => Keys.navKey.currentState.pushNamed(Routes.addItem),
        )
      ],
    );
  }
}
