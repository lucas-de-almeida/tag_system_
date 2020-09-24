import 'package:flutter/material.dart';

class LargeButtonDefault extends StatelessWidget {
  final String label;
  final void Function() onPressed;

  const LargeButtonDefault({
    @required this.label,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      padding: EdgeInsets.symmetric(vertical: 15),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(color: Colors.white),
      ),
      color: Color(0xFF3C4856),
    );
  }
}
