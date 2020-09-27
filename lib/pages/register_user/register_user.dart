import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/input_default.dart';

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
        title: Text('registerUser'.tr),
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
                SizedBox(height: 10),
                InputDefault.register(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  hintText: 'registry'.tr,
                  icon: Icons.person,
                ),
                SizedBox(height: 10),
                InputDefault.email(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  hintText: 'email'.tr,
                  icon: Icons.email,
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: dropdownValueSfhift,
                  decoration: InputDecoration(
                    labelText: 'shift'.tr,
                  ),
                  items: _getDropdownItensSfhit(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValueSfhift = value;
                    });
                  },
                ),
                SizedBox(height: 10),
                DropdownButtonFormField<String>(
                  value: dropdownValueArea,
                  decoration: InputDecoration(
                    labelText: 'area'.tr,
                  ),
                  items: _getDropdownItensArea(),
                  onChanged: (value) {
                    setState(() {
                      dropdownValueArea = value;
                    });
                  },
                ),
                InputDefault.cellPhone(
                  inputController: _registerController,
                  //import o package do get e depois so colocar o tr!não esqueça da classe translation!
                  hintText: 'phone'.tr,
                  icon: Icons.phone,
                ),
                SizedBox(height: 10),
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
                SizedBox(height: Get.height * 0.09),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem> _getDropdownItensSfhit() {
    return <String>[
      'Escolha um turno',
      'Primeiro turno',
      'Segundo turno',
      'Terceiro turno'
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  List<DropdownMenuItem> _getDropdownItensArea() {
    return <String>[
      'Escolha uma area',
      'Manutenção',
      'Adm',
      'Operador',
    ].map<DropdownMenuItem<String>>((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }
}
