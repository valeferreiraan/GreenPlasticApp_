import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';

class MenuPage extends StatefulWidget {
  @override
  _menuPageState createState() => _menuPageState();
}

class _menuPageState extends State<MenuPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      drawer: Drawer(
        backgroundColor: Color3,
        elevation: 0,
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text('Catalogo'),
            Text('Cotización'),
            Text('Historial'),
            Text('Formulario \ncontacto')
          ],
        ),
      ),
      body: Stack(
        children: [
          IconButton(
            onPressed: () {
              _globalKey.currentState?.openDrawer();
            },
            icon: Icon(Icons.menu),
            color: Color3,
          ),
          Center(
            child: Text(
              'Home',
              textScaleFactor: 2,
            ),
          )
        ],
      ),
    );
  }
}
