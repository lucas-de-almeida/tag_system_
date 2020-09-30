import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:find_dropdown/find_dropdown.dart';

class ResgisterUser extends StatefulWidget {
  @override
  _ResgisterUserState createState() => _ResgisterUserState();
}

class _ResgisterUserState extends State<ResgisterUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();
  String dropdownValueSfhift = 'Escolha um turno';
  String dropdownValueArea = 'Escolha uma area';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('userRegister'.tr),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              print('funcao que salva o usuario');
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
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            right: 32,
            left: 32,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InputDefault.name(
                  inputController: _nameController,
                ),
                SizedBox(height: 10),
                InputDefault.register(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  icon: Icons.person,
                ),
                SizedBox(height: 10),
                InputDefault.email(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  icon: Icons.email,
                ),
                SizedBox(height: 10),
                FindDropdown(
                  constraints: BoxConstraints(maxHeight: 250),
                  showSearchBox: false,
                  items: [
                    'Escolha um turno',
                    'Primeiro turno',
                    'Segundo turno',
                    'Terceiro turno',
                  ],
                  label: 'shift'.tr,
                  onChanged: (String item) => print(item),
                  selectedItem: 'Escolha um turno',
                ),
                SizedBox(height: 10),
                FindDropdown(
                  constraints: BoxConstraints(maxHeight: 250),
                  showSearchBox: false,
                  items: [
                    'Escolha uma area',
                    'Manutenção',
                    'Adm',
                    'Operador',
                  ],
                  label: 'area'.tr,
                  onChanged: (String item) => print(item),
                  selectedItem: 'Escolha uma area',
                ),
                SizedBox(height: 10),
                InputDefault.phoneNumber(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!

                  icon: Icons.phone,
                ),
                SizedBox(height: 10),
                InputDefault.password(
                  inputController: _passordController,
                  icon: Icons.lock,
                  validator: (value) {
                    if (value.length < 6) {
                      return 'shortPass'.tr;
                    }
                    return null;
                  },
                ),
                SizedBox(height: Get.height * 0.09),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
