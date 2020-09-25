import 'package:get/get.dart';

// nao esqueca de alterar tanto no ingles como no portugues e com as mesmas tags
class TagsTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'maintenanceTitle': 'HercoMaintenance',
          'registry': 'Registry',
          'password': 'Password',
          'enter': 'Enter',
          'forgetPassword': 'Forgot Your Password Click Here',
          'logged': 'Logged in!',
          'succesLogged!': 'Successfully logged in!',
          'error': 'Error',
          'errorLog': 'error when logging!',
          'shortPass': 'Very Short Password',
          'forgetPasswordTitle': 'I Forgot My Password',
          'name': 'Name',
          'nameValidation1': 'Name very long!',
          'nameValidation2': 'Name very short!',
          'newPassword': 'New Password',
          'repeatPassword': 'Repeat the New Password',
          'cancel': 'Cancel',
          'change': 'Change',
          'alertPassword':
              'Password changed successfully! Please login to validate the change.',
          'alertForget': 'To change your password, look for maintenance.',
        },
        'pt_BR': {
          'maintenanceTitle': 'HercoManutenção',
          'registry': 'Registro',
          'password': 'Senha',
          'enter': 'Entrar',
          'forgetPassword': 'Esqueceu sua senha clique aqui',
          'logged': 'Logou!',
          'succesLogged': 'Logado com sucesso!',
          'error': 'Erro',
          'errorLog': 'Erro ao Logar!',
          'shortPass': 'Senha muito curta!',
          'forgetPasswordTitle': 'Esqueci Minha Senha',
          'name': 'Nome',
          'nameValidation1': 'Nome muito Longo!',
          'nameValidation2': 'Nome muito curto!',
          'newPassword': 'Nova Senha',
          'repeatPassword': 'Repete a Nova Senha',
          'cancel': 'Cancelar',
          'change': 'Alterar',
          'alertPassword':
              'Senha alterada com Sucesso! Por favor faça login para validação da alteração.',
          'alertForget': 'Para alterar sua senha procure a manutenção.',
        }
      };
}
