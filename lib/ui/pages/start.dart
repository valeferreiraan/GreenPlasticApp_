import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  //final _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 8.0, 15.0, 8.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  "GreenPlastic App",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
              
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(LOGIN_ROUTE);
                    },
                    child: Text("Iniciar Sesión")),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      Get.toNamed(SIGNUP_ROUTE);
                    },
                    child: Text("Registrarse"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
