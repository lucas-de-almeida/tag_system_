import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListOS extends StatefulWidget {
  @override
  _ListOSState createState() => _ListOSState();
}

class _ListOSState extends State<ListOS> {
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    String _dateFormat = DateFormat('dd/MM/y').format(_dateTime);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: 400,
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 203, 236, 241), Colors.white],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        child: GestureDetector(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _dateFormat,
                          style: TextStyle(
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Nome da maquina",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          onTap: () {},
        ),
      ),
    );
  }
}
