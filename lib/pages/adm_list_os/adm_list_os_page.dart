import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tag_system/models/os_model.dart';
import 'package:tag_system/utils/constants.dart';
import 'package:get/get.dart';

class AdmListOS extends StatefulWidget {
  @override
  _AdmListOSState createState() => _AdmListOSState();
}

class _AdmListOSState extends State<AdmListOS> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //pode ser mudado nao tem um exemplo lana marvel, nao recordo se iamos de drawer ou os botoes diretos na home
      //porem ja deixei pronto a base
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Home Opções'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              selected: true,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: Icon(Icons.grid_on),
              title: Text('Almoxarifado'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Cadastro de usuario'),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Cadastro de maquinas'),
              onTap: () {},
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Sair'),
              onTap: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('vai pra tela de ediçao ou nova Os');
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      appBar: AppBar(
        title: Text('listOSTitle'.tr),
        centerTitle: true,
        backgroundColor: Colors.grey,
        actions: [
          //faz os tres botaoes no canto esquerdo
          PopupMenuButton<OrderOptions>(
            itemBuilder: (context) => <PopupMenuEntry<OrderOptions>>[
              PopupMenuItem<OrderOptions>(
                child: Text("tagMachines".tr),
                value: OrderOptions.tagdeMachine,
              ),
              PopupMenuItem<OrderOptions>(
                child: Text("dateOpenEnd".tr),
                value: OrderOptions.dateInitlEnd,
              ),
              PopupMenuItem<OrderOptions>(
                child: Text('userRegister'.tr),
                value: OrderOptions.userRegister,
              ),
              PopupMenuItem<OrderOptions>(
                child: Text("area".tr),
                value: OrderOptions.area,
              ),
              PopupMenuItem<OrderOptions>(
                child: Text("shift".tr),
                value: OrderOptions.shift,
              ),
            ],
            onSelected: _orderList,
          ),
        ],
      ),
      //copiado lista padrao do eduardo =)
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: OsModel.osListMock.length,
          itemBuilder: (context, index) {
            List<OsModel> _list = OsModel.osListMock;
            return GestureDetector(
              child: Card(
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
              ),
              onTap: () {
                print('navega para tela de edicao/cadastro');
              },
              onLongPress: () {
                Get.defaultDialog(
                  title: 'excludeOsAlert'.tr,
                  cancel: FlatButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text('cancel'.tr),
                  ),
                  confirm: FlatButton(
                    onPressed: () {
                      print('chama a funcao pra deletar');
                      Get.back();
                    },
                    child: Text('enter'.tr),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }

  //funcao que vai definir o que fazer com cada filtro
  //ou seja a pegar a lista de os e definir a logica.
  void _orderList(OrderOptions result) {
    switch (result) {
      case OrderOptions.tagdeMachine:
        //alguma funcao
        break;
      case OrderOptions.dateInitlEnd:
        //alguma funcao
        break;
      case OrderOptions.area:
        //alguma funcao
        break;
      case OrderOptions.userRegister:
        //alguma funcao
        break;
      case OrderOptions.shift:
        //alguma funcao
        break;
      default:
        break;
    }
    setState(() {});
  }
}
