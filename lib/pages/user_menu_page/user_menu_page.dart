import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/card_default.dart';
import 'package:tag_system/models/os_model.dart';
import 'package:tag_system/pages/open_solicitation_page/open_solicitation_controller.dart'
    show OpenSolicitationController;

class UserMenuPage extends StatefulWidget {
  @override
  _UserMenuPageState createState() => _UserMenuPageState();
}

class _UserMenuPageState extends State<UserMenuPage> {
  final OpenSolicitationController c = Get.put(OpenSolicitationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minhas solicitações de OS\'s'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Get.toNamed('/open_solicitation_page');
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Obx(
          () => ListView.builder(
            itemCount: c.mockList.length,
            itemBuilder: (context, index) {
              List<OsModel> _list = c.mockList;
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
                    onLongPress: () {
                      c.removeFromList(index);
                      setState(() {});
                    }),
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
ALERT COM
Título da solicitação
Descrição do ocorrido.
Tag/Apelido da máquina;
*/
