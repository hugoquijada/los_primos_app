import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'views.dart';

class HomeScreen extends StatefulWidget {

  static String ruta = "/";

  @override
  State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/logo.jpg"),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                child: Text("Hacer Pedido"), 
                onPressed: () {
                  context.go(PedidoScreen.ruta);
                }
              ),
            ]
          )
        ],
      ),
    );
  }

}