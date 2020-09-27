import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:tag_system/utils/constants.dart';
import 'package:get/get.dart';

class ListOS extends StatefulWidget {
  @override
  _ListOSState createState() => _ListOSState();
}

class _ListOSState extends State<ListOS> {
  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    //usa a biblioteca do intl para fazer a data do aparelho no formato que quiser
    //porem essa data tem q ser alterada conform vir da lista , essa esta aqui pra se salvar no formato
    String _dateFormat = DateFormat('dd/MM/y').format(_dateTime);
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
                child: Text("Data Inicial e Final"),
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
      body: Container(
        width: 400,
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(255, 203, 236, 241), Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        //dados do card vai vir do banco estes esta fixos so pra mostrar o modelo
        //nao irei incluir tag de tradução para os itens dentro do card pq ele mudam conforme a lista
        child: GestureDetector(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _dateFormat,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Nome da maquina",
                          style: TextStyle(fontSize: 18.0),
                        ),
                        SizedBox(width: 10),
                        Text(
                          "Preventiva",
                          style: TextStyle(fontSize: 18.0),
                        ),
                      ],
                    ),
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
