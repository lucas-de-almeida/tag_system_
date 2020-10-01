import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DefaultDrawer extends StatelessWidget {
  const DefaultDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}
