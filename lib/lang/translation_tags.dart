import 'package:get/get.dart';

class TagsTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'maintenanceTitle': 'HercoMaintenance',
          'registry': 'Registry',
          'password': 'Password',
          'enter': 'Enter',
          'forgetPassword': 'Forgot Your Password Click Here',
          'forgetPasswordTitle': 'I Forgot My Password',
          'phone': 'Phone',
          'newPassword': 'New Password',
          'repeatPassword': 'Repeat the New Password',
          'cancel': 'Cancel',
          'change': 'Change',
          'alertPassword':
              'Password changed successfully! Please login to validate the change.'
        },
        'pt_BR': {
          'maintenanceTitle': 'HercoManutenção',
          'registry': 'Registro',
          'password': 'Senha',
          'enter': 'Entrar',
          'forgetPassword': 'Esqueceu sua senha clique aqui',
          'forgetPasswordTitle': 'Esqueci Minha Senha',
          'phone': 'Telefone',
          'newPassword': 'Repete a Nova Senha',
          'cancel': 'Cancelar',
          'change': 'Alterar',
          'alertPassword':
              'Senha alterada com Sucesso! Por favor faça login para validação da alteração.'
        }
      };
}
