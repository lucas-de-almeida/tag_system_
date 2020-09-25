import 'package:get/get.dart';

class Controller extends GetxController {
  //LOGIN PAGE
  RxBool isObscure = false.obs;
  bool get returnIsObscure => isObscure.value;

  swichVisibility() {
    isObscure.toggle();
  }
}
