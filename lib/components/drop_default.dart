import 'package:flutter/material.dart';

class DropMenuDefault extends StatefulWidget {
  final List<DropdownMenuItem<dynamic>> items;
  String value;
  final String labelText;

  DropMenuDefault(
      {Key key, this.items, this.value = 'dropdefault', this.labelText})
      : super(key: key);

  @override
  _DropMenuDefaultState createState() => _DropMenuDefaultState();
}

class _DropMenuDefaultState extends State<DropMenuDefault> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: widget.value,
      items: widget.items,
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
      onChanged: (value) {
        setState(() {
          widget.value = value;
        });
      },
    );
  }
}
