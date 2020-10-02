import 'package:tag_system/models/user_model.dart';

abstract class DataModalUser {
  static UserModel logedUser;
  static List<UserModel> userList = [
    UserModel(
      name: 'Lucas Almeida',
      register: '123456',
      email: 'lucas@email.com.br',
      shift: 'Primeiro turno',
      area: 'Adm',
      phone: '(51)912345678',
      password: '123456',
    ),
    UserModel(
      name: 'Luis Eduardo',
      register: '654321',
      email: 'luisEduardo@email.com.br',
      shift: 'Segundo turno',
      area: 'Manutenção',
      phone: '(51)912345678',
      password: '123456',
    ),
    UserModel(
      name: 'Luis Fernando',
      register: '123123',
      email: 'luisFernando@email.com.br',
      shift: 'terceiro turno',
      area: 'Operador',
      phone: '(51)912345678',
      password: '123456',
    ),
  ];
}
