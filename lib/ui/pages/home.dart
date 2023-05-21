import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import '../pages/menuPage.dart';

class HomePage extends StatelessWidget {
  final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/GreenPlastic.png',
            width: 300,
            height: 300,
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: TextFormField(
              controller: _textController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              cursorColor: Color3,
              style: Theme.of(context).textTheme.bodyMedium,
              onChanged: (user) {},
              onSaved: (user) {
                debugPrint(user);
              },
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: Color3,
                hintText: "USUARIO",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.person),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 250,
            height: 45,
            child: TextFormField(
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: Color3,
              onSaved: (pswd) {
                debugPrint(pswd);
              },
              decoration: InputDecoration(
                hintStyle: Theme.of(context).textTheme.bodyMedium,
                filled: true,
                fillColor: Color3,
                hintText: "CONTRASEÑA",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Icon(Icons.lock),
                ),
              ),
            ),
          ),
          SizedBox(
              width: 250,
              height: 35,
              child: ElevatedButton(
                  onPressed: () {
                    if (_textController.text.isEmpty) {
                      Get.snackbar('Error', 'Los campos no pueden estar vacíos',
                          icon: Icon(Icons.warning),
                          backgroundColor: Colors.red);
                    } else {
                      Get.to(MenuPage());
                    }
                  },
                  child: Text(
                    'CONTINUAR',
                    style: Theme.of(context).textTheme.labelLarge,
                  ))),
        ],
      ),
    ));
  }
}
