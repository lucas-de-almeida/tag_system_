import 'package:flutter/material.dart';
import 'package:tag_system/components/card_default.dart';
import 'package:tag_system/models/os_model.dart';

class UserMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas solicitações de OS\'s'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: OsModel.osListMock.length,
            itemBuilder: (context, index) {
              List<OsModel> _list = OsModel.osListMock;
              return CardDefault(
                listDescriptionOccurred:
                    'Ocorrido: ${_list[index].descricaoOcorrido}',
                listDescriptionAccomplished:
                    'Realizado: ${_list[index].trabalhoExecutado}',
                listDescriptionID: 'ID: ${_list[index].id}',
                listDescriptionSituation: 'Situação:\n${_list[index].status}',
              );
            },
          )),
    );
  }
}

/*
ALERT COM
Título da solicitação
Descrição do ocorrido.
Tag/Apelido da máquina;
*/
