import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/dialog_confirm_button.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:tag_system/components/large_button_default.dart';
import 'package:tag_system/components/logo_default.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.1,
            right: 32,
            left: 32,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LogoDefault(),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                InputDefault.register(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  hintText: 'registry'.tr,
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 40,
                ),
                InputDefault.password(
                  inputController: _passordController,
                  hintText: 'password'.tr,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'shortPass'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: Get.height * 0.09,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: LargeButtonDefault(
                        label: 'enter'.tr,
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Get.snackbar(
                              'logged'.tr,
                              'succesLogged'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                            );
                          } else {
                            Get.snackbar(
                              'error'.tr,
                              'errorLog'.tr,
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: FlatButton(
                    onPressed: () {
                      Get.defaultDialog(
                        radius: 0.0,
                        title: 'forgetPasswordTitle'.tr,
                        content: Text(
                          'alertForget'.tr,
                        ),
                        confirm: Align(
                          alignment: Alignment.bottomRight,
                          child: DialogConfirmButton(),
                        ),
                      );
                      //se se for adm e so descomenta kkkk
                      //Get.toNamed("/forget");
                    },
                    child: Column(
                      children: [
                        Text('forgetPassword'.tr),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
