import 'package:get/get.dart';
import 'package:tag_system/models/os_model.dart';

class OpenSolicitationController extends GetxController {
  RxString _solicitationTitle = ''.obs;
  RxString _description = ''.obs;
  RxList _list = [].obs;

  get titleValid =>
      _solicitationTitle.value.length != 0 &&
      _solicitationTitle.value.length > 4;

  void setSolicitationTitle(String value) => _solicitationTitle.value = value;

  String get nameError {
    if (_solicitationTitle.value.isEmpty || titleValid) {
      return null;
    } else
      return 'Nome muito curto';
  }

  bool get descriptionValid =>
      _description.value.length != 0 && _description.value.length >= 15;

  void setDescription(String value) => _description.value = value;

  String get descriptionError {
    if (_description.value.isEmpty || descriptionValid) {
      return null;
    } else
      return 'Descrição muito curta, min 15 caracteres';
  }

  void openSolicitation() {
    _list.value = OsModel.osListMock;
    OsModel solicitation = OsModel(
        descricaoOcorrido: _solicitationTitle.value,
        trabalhoExecutado: _description.value,
        id: _list.length + 1);
    OsModel.osListMock.add(solicitation);
  }

  List get mockList => OsModel.osListMock.obs;

  void removeFromList(int index) {
    OsModel.osListMock.removeAt(index).obs;
  }
}
