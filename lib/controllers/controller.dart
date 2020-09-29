import 'package:get/get.dart';

class Controller extends GetxController {
  //LOGIN PAGE
  RxBool isObscure = false.obs;
  bool get returnIsObscure => isObscure.value;
  //default drop
  RxString isValue;

  String addValue(v) {
    return isValue = v;
  }

  swichVisibility() {
    isObscure.toggle(); //Função nativa do GetX alterna true/false;
  }
}
