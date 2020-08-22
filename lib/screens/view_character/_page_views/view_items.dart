import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/screens/view_character/_page_views/_widgets/expansion_panel_list_item.dart';

class ViewItems extends StatefulWidget {
  const ViewItems({Key key}) : super(key: key);

  @override
  _ViewItemsState createState() => _ViewItemsState();
}

class _ViewItemsState extends State<ViewItems> {
  List<ExpansionPanelListItem> mock = [
    ExpansionPanelListItem(expandedValue: 'details', headerValue: '1'),
    ExpansionPanelListItem(expandedValue: 'details', headerValue: '2'),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              print('what $isExpanded)');
              mock[index].isExpanded = !isExpanded;
            });
          },
          children: mock
              .map<ExpansionPanel>(
                (ExpansionPanelListItem item) => ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) =>
                      ListTile(
                    title: Text(item.headerValue),
                  ),
                  body: ListTile(
                    title: Text('what'),
                    subtitle: Text('Details goes here'),
                  ),
                  isExpanded: item.isExpanded,
                ),
              )
              .toList(),
        ),
        InkWell(
          onTap: () => Keys.navKey.currentState.pushNamed(Routes.addItem),
          child: Container(
            height: 50,
            child: Center(child: Text('+')),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          ),
        )
      ],
    );
  }
}
