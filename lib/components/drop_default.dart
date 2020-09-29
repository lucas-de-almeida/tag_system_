import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/controllers/controller.dart';

class DropMenuDefault extends StatelessWidget {
  final List<DropdownMenuItem<dynamic>> items;
  final String value;
  final String labelText;
  final Controller c = Get.put(Controller());

  DropMenuDefault(
      {Key key, this.items, this.value = 'dropdefault', this.labelText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonFormField(
        value: value,
        items: items,
        decoration: InputDecoration(
          labelText: labelText,
        ),
        onChanged: (v) {
          c.isValue = c.addValue(v) as RxString;
        },
      ),
    );
  }
}
