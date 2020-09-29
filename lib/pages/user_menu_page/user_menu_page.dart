import 'dart:ui';
import 'package:flutter/material.dart';
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
              return Card(
                elevation: 6,
                color: Colors.blueGrey.withOpacity(.5),
                child: ListTile(
                  title: Text(
                    'Ocorrido: ${_list[index].descricaoOcorrido}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Realizado: ${_list[index].trabalhoExecutado}',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  isThreeLine: true,
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ID: ${_list[index].id.toString()}',
                      ),
                      Text(
                        'Situação:\n${_list[index].status.toString().split('.').last}',
                      ),
                    ],
                  ),
                ),
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
