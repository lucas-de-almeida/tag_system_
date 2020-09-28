import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cnpj_cpf_helper/cnpj_cpf_helper.dart';
import 'package:tag_system/controllers/controller.dart';

class InputDefault extends StatelessWidget {
  final Controller c = Get.put(Controller()); //Instacía o Controller do GetX;
  final List<TextInputFormatter> formatters;
  final String labelText;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController inputController;
  final String hintText;
  final bool isPassword;
  final String Function(String) validator;
  final void Function(String) onSaved;
  final void Function(String) onChanged;
  final void Function(String) onSubmited;
  final void Function() onEditComplete;
  final bool autofocus;
  final FocusNode focusNode;

  //Construtor padrao.
  InputDefault({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    this.hintText,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  }) : super(key: key);

  InputDefault.name({
    Key key,
    this.formatters,
    this.labelText,
    this.icon = Icons.person,
    this.inputType,
    @required this.inputController,
    this.validator = _nameValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'name'.tr,
        super(key: key);

  static String _nameValidator(String value) {
    if (value.length > 30) {
      return 'nameValidation1'.tr;
    }
    if (value.length < 3) {
      return 'nameValidation2'.tr;
    }
    return null;
  }

  InputDefault.register({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    this.validator = _registerValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'registry'.tr,
        super(key: key);

  static String _registerValidator(String value) {
    if (value.length > 6 || value.length < 1) {
      return 'registerInputError'.tr;
    }
    return null;
  }

  InputDefault.cpf({
    Key key,
    this.labelText,
    this.icon = Icons.check_box_outline_blank,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.validator = _cpfValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'cpfInputLabel'.tr,
        this.formatters = [
          CnpjCpfFormatter(
            eDocumentType: EDocumentType.CPF,
          )
        ],
        super(key: key);

  static String _cpfValidator(String value) {
    if (GetUtils.isCpf(value)) {
      return null;
    }
    return 'cpfInputError'.tr;
  }

  InputDefault.email({
    Key key,
    this.formatters,
    this.labelText,
    this.icon = Icons.mail,
    this.inputType = TextInputType.emailAddress,
    @required this.inputController,
    this.validator = _emailValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'email'.tr,
        super(key: key);

  static String _emailValidator(String value) {
    if (GetUtils.isEmail(value)) {
      return null;
    }
    return 'emailInputError'.tr;
  }

  InputDefault.phoneNumber({
    Key key,
    this.labelText,
    this.icon = Icons.call,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.validator = _phoneValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'phone'.tr,
        this.formatters = [
          MaskTextInputFormatter(
              mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')})
        ],
        super(key: key);

  static String _phoneValidator(String value) {
    /* if (!(value.length < 16)) {
      return null;
    } */
    if (GetUtils.isPhoneNumber(value)) {
      return null;
    }
    return 'phoneInputError'.tr;
  }

  InputDefault.password({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = true,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'password'.tr,
        super(key: key);

  InputDefault.repeatPassword({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = true,
    this.autofocus,
    this.focusNode,
  })  : this.hintText = 'repeatPassword'.tr,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => TextFormField(
          focusNode: focusNode,
          autofocus: autofocus ?? false,
          keyboardType: inputType ?? TextInputType.text,
          inputFormatters: formatters ?? [],
          obscureText: isPassword
              ? c.returnIsObscure
              : false, // Só esconderá o text se isPassword for true;
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            labelText: hintText,
            labelStyle: TextStyle(
              color: Colors.black,
            ),
            suffixIcon: Visibility(
              visible: isPassword,
              //Se isPassword==true, retorna IconButton;
              child: IconButton(
                icon: Icon(
                  c.returnIsObscure ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey[600],
                ),
                onPressed: () {
                  c.swichVisibility();
                },
              ),
              //Se isPassword==false, retorna Icon;
              replacement: Icon(
                icon,
                color: Colors.grey[600],
              ),
            ),
          ),
          controller: inputController,
          validator: validator,
        ));
  }
}
