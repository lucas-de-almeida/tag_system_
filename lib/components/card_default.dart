import 'package:flutter/material.dart';

class CardDefault extends StatelessWidget {
  final String listDescriptionOccurred;
  final String listDescriptionAccomplished;
  final String listDescriptionSituation;
  final String listDescriptionID;

  const CardDefault({
    Key key,
    this.listDescriptionOccurred,
    this.listDescriptionAccomplished,
    this.listDescriptionSituation,
    this.listDescriptionID,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      color: Colors.blueGrey.withOpacity(.5),
      child: ListTile(
        title: Text(
          listDescriptionOccurred,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          listDescriptionAccomplished,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        isThreeLine: true,
        leading: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listDescriptionID.toString(),
            ),
            Text(
              listDescriptionSituation.toString().split('.').last,
            ),
          ],
        ),
      ),
    );
  }
}
