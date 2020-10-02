import 'package:tag_system/models/dataModalUser.dart';

class LoginService {
  Future<bool> signIn({String register, String password}) async {
    DataModalUser.logedUser = null;
    await Future.delayed(Duration(milliseconds: 500), () {
      DataModalUser.logedUser = DataModalUser.userList.firstWhere(
          (e) => e.register == register && e.password == password,
          orElse: () => null);
    });
    return DataModalUser.logedUser != null;
  }

  Future<void> signOut() async {
    await Future.delayed(
        Duration(milliseconds: 500), () => DataModalUser.logedUser = null);
  }
}
