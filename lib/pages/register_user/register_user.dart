import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/input_default.dart';
import 'package:find_dropdown/find_dropdown.dart';
import 'package:tag_system/models/user_model.dart';

class ResgisterUser extends StatefulWidget {
  @override
  _ResgisterUserState createState() => _ResgisterUserState();
}

class _ResgisterUserState extends State<ResgisterUser> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _registerController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passordController = TextEditingController();
  List<UserModel> _userList = List<UserModel>();
  UserModel _userModel = UserModel();

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
              if (_formKey.currentState.validate()) {
                //a princio iria salvar na lista porem os controllers nao esato pegando o valor
                //o on save nao esta salvando
                _userList.add(_userModel);

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
                  onSaved: (String value) => _userModel.name = value,
                ),
                SizedBox(height: 10),
                InputDefault.register(
                  inputController: _registerController,
                  onSaved: (String value) => _userModel.register = value,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  icon: Icons.person,
                ),
                SizedBox(height: 10),
                InputDefault.email(
                  inputController: _emailController,
                  onSaved: (String value) => _userModel.email = value,
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
                  onChanged: (String item) => _userModel.shift,
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
                  onChanged: (String item) => _userModel.area,
                  selectedItem: 'Escolha uma area',
                ),
                SizedBox(height: 10),
                //validaç]ao ta dando erro nao aceita o numero de telefone
                InputDefault.phoneNumber(
                  inputController: _phoneController,
                  onSaved: (String value) => _userModel.phone = value,
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
                  onSaved: (String value) => _userModel.password = value,
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
