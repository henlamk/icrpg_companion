import 'package:flutter/material.dart';
import 'package:icrpg_companion/app.dart';
import 'package:icrpg_companion/util/ui_helpers.dart';

class CustomExpansionPanelList extends StatefulWidget {
  final List<ExpansionPanelListItem> items;
  final Function onSelected;
  final Function onDeleted;

  CustomExpansionPanelList({
    Key key,
    this.items,
    this.onSelected,
    this.onDeleted,
  }) : super(key: key);

  @override
  _CustomExpansionPanelListState createState() =>
      _CustomExpansionPanelListState();
}

class _CustomExpansionPanelListState extends State<CustomExpansionPanelList> {
  final List<ExpansionPanelListItem> mock = [
    ExpansionPanelListItem(expandedValue: 'details', headerValue: '1'),
    ExpansionPanelListItem(expandedValue: 'details', headerValue: '2'),
  ];

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
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
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Details goes here'),
                    verticalSpaceSmall,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.grey.withOpacity(.7),
                        ),
                        widget.onSelected == null
                            ? Container()
                            : Row(
                                children: [
                                  horizontalSpaceMedium,
                                  InkWell(
                                    onTap: widget.onSelected,
                                    child: Chip(
                                      label: Text('PLAY'),
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                    verticalSpaceSmall,
                  ],
                ),
              ),
              isExpanded: item.isExpanded,
            ),
          )
          .toList(),
    );
  }
}

class ExpansionPanelListItem {
  ExpansionPanelListItem({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}
