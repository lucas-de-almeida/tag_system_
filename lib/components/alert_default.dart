import 'package:flutter/material.dart';

class AlertDefault extends StatelessWidget {
  final String textMessage;
  final String title;
  final Widget button;
  AlertDefault({
    @required this.textMessage,
    this.title,
    this.button,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: title != null ? Text(title) : Container(),
      content: Text(
        textMessage,
        textAlign: TextAlign.center,
      ),
      // titleTextStyle: TextStyle(),
      actions: [
        button,
      ],
    );
  }
}
