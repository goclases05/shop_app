import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/components/body.dart';

class LoginSuccesScreen extends StatelessWidget {
  const LoginSuccesScreen({ Key? key }) : super(key: key);
  static String routeName="/login_success";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Acceso exitoso"),
      ),
      body: Body(),
    );
  }
}