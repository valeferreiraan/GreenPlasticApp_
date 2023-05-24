import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:greenplastic_app/ui/pages/menuPage.dart';

class LoginController extends GetxController {
  //usuario provisional
  String username_prueba = 'adm@gp.com';
  String password_prueba = '1';

  var user = ''.obs;
  var pswd = ''.obs;

  var logged = false.obs;

  final userController = TextEditingController();
  final passController = TextEditingController();

  void setEmail(String username) {
    user.value = username;
  }

  void setPass(String pass) {
    pswd.value = pass;
  }

  void login(String user, String pswd) {
    if (user.isEmpty || pswd.isEmpty) {
      Get.snackbar('Error', 'Los campos no pueden estar vacíos',
          icon: Icon(Icons.warning), backgroundColor: Colors.red);
    } else {
      if (EmailValidator.validate(user)) {
        if (user == username_prueba && pswd == password_prueba) {
          Get.to(MenuPage());
          Get.snackbar('Bienvenido', '',
              icon: Icon(Icons.people),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 1));
        } else {
          Get.snackbar('Error', 'Correo o contraseña incorrectos',
              icon: Icon(Icons.warning), backgroundColor: Colors.red);
        }
      } else {
        Get.snackbar('Error', 'Correo no válido',
            icon: Icon(Icons.warning), backgroundColor: Colors.red);
      }
    }
  }

  void resetText() {
    userController.text = '';
    passController.text = '';
  }

  void logOut() {
    logged.value = false;
  }
}
