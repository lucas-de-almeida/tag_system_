import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tag_system/components/menu_tile_default.dart';

class AdminMenuPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: <Widget>[
            MenuTileDefault(
              label: 'Registrar Usuário',
              onPressed: () => Get.toNamed("/register_user"),
              color: Colors.blue,
            ),
            MenuTileDefault(
              label: 'Lista de OS',
              onPressed: () => Get.toNamed("/list_os"),
              color: Colors.red,
            ),
            MenuTileDefault(
              label: 'Lista de Sol. de OS',
              onPressed: () => null,
              color: Colors.yellow,
            ),
            MenuTileDefault(
              label: 'Relatórios',
              onPressed: () => null,
              color: Colors.purple,
            ),
            MenuTileDefault(
              label: 'Cadastro de máquinas',
              onPressed: () => null,
              color: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
