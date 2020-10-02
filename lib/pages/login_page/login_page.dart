import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/dialog_confirm_button.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:tag_system/components/large_button_default.dart';
import 'package:tag_system/components/logo_default.dart';
import 'package:tag_system/services/login_service.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _loginService = LoginService();
  bool _isUser =
      true; // Variável temporária, confere se é user ou não e manda para o menu correto;
  @override
  Widget build(BuildContext context) {
    void _sigin() async {
      var _isValid = await _loginService.signIn(
        register: _registerController.text,
        password: _passwordController.text,
      );
      if (_isValid) {
        Get.toNamed('/user_menu_page');
      } else {
        Get.toNamed("/admin_menu_page");
      }
    }

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
                  inputController: _passwordController,
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
                            _sigin();
                            Get.snackbar(
                              'error'.tr,
                              'errorLog'.tr,
                              backgroundColor: Colors.red,
                              snackPosition: SnackPosition.BOTTOM,
                            );
                          }
                          Get.snackbar(
                            //Chama Snackbar diretamente do GetX
                            'logged'.tr,
                            'succesLogged'.tr,
                            snackPosition: SnackPosition.BOTTOM,
                            backgroundColor: Colors.green,
                          );
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
