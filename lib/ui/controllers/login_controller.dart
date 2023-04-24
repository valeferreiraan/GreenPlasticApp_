import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:email_validator/email_validator.dart';

class LoginController extends GetxController{
  //usuario provisional
  String username='user1@dominio.com';
  String password='123456789';

  //mensaje de comprobación
  var message=''.obs;

  var logged=false.obs;

  final userController = TextEditingController();
  final passController = TextEditingController();

  void logIn(String user, String pass){
    //los usuarios van a ser correos
    if(EmailValidator.validate(user)){
      message.value='';
      if (user==username && pass==password){
        logged.value=true;
      } else{
        logged.value=false;
      }
    } else{
      message.value='Usuario o contraseña incorrectos';
    }
  }

  void resetText(){
    userController.text='';
    passController.text='';
  }

  void logOut(){
    logged.value=false;
  }

}