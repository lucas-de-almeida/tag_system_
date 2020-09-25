import 'package:cnpj_cpf_formatter/cnpj_cpf_formatter.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:cnpj_cpf_helper/cnpj_cpf_helper.dart';
import 'package:tag_system/controllers/controller.dart';

class InputDefault extends StatelessWidget {
  final Controller c = Get.put(Controller());
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

  InputDefault.register({
    Key key,
    this.formatters,
    this.labelText,
    this.icon,
    this.inputType,
    @required this.inputController,
    this.hintText,
    this.validator = _registerValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  }) : super(key: key);

  static String _registerValidator(String value) {
    if (value.length > 6 || value.length < 1) {
      return 'Registro inválido';
    }
    return null;
  }

  InputDefault.cpf({
    Key key,
    this.labelText = 'CPF_TEXTFIELD',
    this.icon = Icons.check_box_outline_blank,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.hintText,
    this.validator = _cpfValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.formatters = [
          CnpjCpfFormatter(
            eDocumentType: EDocumentType.CPF,
          )
        ],
        super(key: key);

  static String _cpfValidator(String value) {
    if (CnpjCpfBase.isCpfValid(value)) {
      return null;
    }
    return 'REGISTER_CPF_ERROR';
  }

  InputDefault.email({
    Key key,
    this.formatters,
    this.labelText = 'EMAIL_TEXTFILED',
    this.icon = Icons.mail,
    this.inputType = TextInputType.emailAddress,
    @required this.inputController,
    this.hintText,
    this.validator = _emailValidator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  }) : super(key: key);

  static String _emailValidator(String value) {
    if (EmailValidator.validate(value)) {
      return null;
    }
    return 'REGISTER_EMAIL_ERROR';
  }

  InputDefault.cellPhone({
    Key key,
    this.labelText = 'REGISTER_PHONE',
    this.icon = Icons.call,
    this.inputType = TextInputType.number,
    @required this.inputController,
    this.hintText,
    this.validator = _cellPhone,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = false,
    this.autofocus,
    this.focusNode,
  })  : this.formatters = [
          MaskTextInputFormatter(
              mask: '(##) # ####-####', filter: {"#": RegExp(r'[0-9]')})
        ],
        super(key: key);

  static String _cellPhone(String value) {
    if (!(value.length < 16)) {
      return null;
    }
    return 'REGISTER_PHONE_ERROR';
  }

  InputDefault.password({
    Key key,
    this.formatters,
    this.labelText = 'HOME_PASSWORD',
    this.icon,
    this.inputType,
    @required this.inputController,
    this.hintText,
    @required this.validator,
    this.onSaved,
    this.onChanged,
    this.onSubmited,
    this.onEditComplete,
    this.isPassword = true,
    this.autofocus,
    this.focusNode,
  }) : super(key: key);

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
