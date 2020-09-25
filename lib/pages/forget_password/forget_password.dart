import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:tag_system/components/dialog_confirm_button.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:tag_system/components/large_button_default.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    _registerController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
    _passwordRepeatController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('forgetPasswordTitle'.tr),
        centerTitle: true,
        backgroundColor: Colors.grey,
        automaticallyImplyLeading: false,
      ),
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
                  children: [
                    InputDefault.register(
                      inputController: _registerController,
                      hintText: 'registry'.tr,
                      icon: Icons.person,
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InputDefault(
                      inputController: _nameController,
                      hintText: 'name'.tr,
                      icon: Icons.person,
                      validator: (String value) {
                        if (value.length > 30) {
                          return 'nameValidation1'.tr;
                        }
                        if (value.length < 3) {
                          return 'nameValidation2'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InputDefault.password(
                      inputController: _passwordController,
                      hintText: 'newPassword'.tr,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value.length < 6) {
                          return 'shortPass'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    InputDefault.password(
                      inputController: _passwordRepeatController,
                      hintText: 'repeatPassword'.tr,
                      icon: Icons.lock,
                      validator: (value) {
                        if (value.length < 6) {
                          return 'shortPass'.tr;
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 20,
                          child: LargeButtonDefault(
                            onPressed: () {
                              Get.toNamed('/');
                            },
                            label: 'cancel'.tr,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 20,
                          child: LargeButtonDefault(
                            onPressed: () {
                              Get.defaultDialog(
                                radius: 0.0,
                                title: 'alertPasswordTitle'.tr,
                                content: Text(
                                  'alertPassword'.tr,
                                ),
                                confirm: Row(
                                  children: [
                                    FlatButton(
                                      onPressed: () {
                                        //esta entre aspas por que precisa ter uma string
                                        Share.share('_passwordController.text');
                                      },
                                      child: Icon(Icons.share),
                                    ),
                                    SizedBox(
                                      width: 70,
                                    ),
                                    DialogConfirmButton(),
                                  ],
                                ),
                              );
                            },
                            label: 'change'.tr,
                          ),
                        ),
                      ],
                    ),
                  ],
                ))),
      ),
    );
  }
}
