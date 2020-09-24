import 'package:get/get.dart';

class Controller extends GetxController {
  //LOGIN PAGE

  RxBool isObscure = false.obs;

  swichVisibility() {
    isObscure.toggle();
    print(isObscure.value);
  }
}
