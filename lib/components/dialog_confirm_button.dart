import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogConfirmButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Get.back();
      },
      child: Text(
        'OK',
        style: TextStyle(
          color: Colors.grey[600],
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
    );
  }
}
