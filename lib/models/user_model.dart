class UserModel {
  String name;
  String register;
  String email;
  String shift;
  String area;
  String phone;
  String password;

  UserModel({
    this.name,
    this.register,
    this.email,
    this.shift,
    this.area,
    this.phone,
    this.password,
  });

  static List<UserModel> osListMock = [
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
