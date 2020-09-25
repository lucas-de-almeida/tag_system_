import 'package:get/get.dart';

class Controller extends GetxController {
  //LOGIN PAGE
  RxBool isObscure = false.obs;
  RxBool isNotPassword = false.obs;

  bool returnIsObscure() => isObscure.value;

  swichVisibility() {
    isObscure.toggle();
  }
}
