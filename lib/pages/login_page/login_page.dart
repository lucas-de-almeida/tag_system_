import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
                  hintText: 'Registro',
                  icon: Icons.person,
                  autofocus: true,
                ),
                SizedBox(
                  height: 40,
                ),
                InputDefault.password(
                  inputController: _passordController,
                  hintText: 'Senha',
                  icon: Icons.lock,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'Senha muito curta!';
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
                        label: 'ENTRAR',
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Get.snackbar(
                              'Logou',
                              'Logado com sucesso!',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.green,
                            );
                          } else {
                            Get.snackbar(
                              'Erro',
                              'Erro ao logar',
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
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          'Esqueceu sua senha?',
                        ),
                        Text('Clique aqui'),
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
