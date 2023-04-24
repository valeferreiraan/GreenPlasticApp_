import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:greenplastic_app/constants.dart';
import '../pages/menuPage.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Green Plastic \n App',
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineLarge /*TextStyle(color: Colors.white,
            shadows: [
              Shadow(blurRadius: 2.0, color: Color1, offset: Offset(1.0, 1.0))
            ])*/
            ,
          ),
          SizedBox(
            width: 250,
            height: 35,
            child: TextFormField(
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
            height: 35,
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
                    Get.to(MenuPage());
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
