import 'package:flutter/material.dart';

class MenuTileDefault extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final Color color;

  const MenuTileDefault({
    Key key,
    @required this.onPressed,
    @required this.label,
    @required this.color,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).buttonColor,
      child: FlatButton(
        onPressed: onPressed,
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        color: color.withOpacity(.5),
      ),
    );
  }
}
