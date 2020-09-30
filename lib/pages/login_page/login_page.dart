import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:tag_system/components/large_button_default.dart';
import 'package:tag_system/components/logo_default.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isUser =
      true; // Variável temporária, confere se é user ou não e manda para o menu correto;
  @override
  Widget build(BuildContext context) {
    _registerController.text =
        '123456'; // Temporário, apenas para logar mais rápido
    _passordController.text = '123456';

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: Get.height * 0.1, //Get.size substitui MediaQuery
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

                  icon: Icons.person,
                ),
                SizedBox(
                  height: 40,
                ),
                InputDefault.password(
                  inputController: _passordController,
                  //hintText: 'password'.tr,
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
                              //Chama Snackbar diretamente do GetX
                              'logged'.tr,
                              'succesLogged'.tr,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                            );
                            if (_registerController.text == '123466') {
                              _isUser = false;
                            }
                            print(_isUser);
                            if (_isUser) {
                              Get.toNamed('/user_menu_page');
                            } else {
                              _isUser = true;

                              Get.toNamed("/admin_menu_page");
                            }
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
                      /*
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
                       */
                      //se se for adm e so descomenta kkkk

                      Get.toNamed("/forget");
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
