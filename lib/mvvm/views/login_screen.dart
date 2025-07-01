import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/viewmodels.dart';

class LoginScreen extends StatefulWidget {

  static String ruta = "/login";

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {

  final _correoController = TextEditingController();
  final _claveController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context, listen: true);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _correoController
          ),
          TextField(
            controller: _claveController
          ),
          ElevatedButton(
            onPressed: () {
              loginViewModel.iniciarSesion(_correoController.text.toString(), _claveController.text.toString());
            }, 
            child: Text("Iniciar Sesión")
          )
        ],
      ),
    );
  }

}