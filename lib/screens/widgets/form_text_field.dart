import 'package:flutter/material.dart';

class CustomFormTextField extends StatelessWidget {
  final TextEditingController textController;
  final String text;

  const CustomFormTextField({Key key, this.textController, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: TextFormField(
        controller: textController,
        decoration: InputDecoration(hintText: text, border: InputBorder.none),
      ),
      decoration: BoxDecoration(
        color: Colors.grey[300].withOpacity(.7),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
