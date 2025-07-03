import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../views.dart';
import '../../../mvvm/viewmodels/viewmodels.dart';

class AppDrawer extends StatelessWidget {

  final String rutaActual;

  const AppDrawer({super.key, required this.rutaActual});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<LoginViewModel>(context);
  
    return Drawer(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.teal),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  CircleAvatar(radius: 30, backgroundImage: AssetImage("assets/logo.jpg")),
                  SizedBox(height: 8),
                  Text("Los Primos", style: TextStyle(color: Colors.white, fontSize: 20)),
                ],
              ),
            ),
            _item(context, icon: Icons.home, label: 'Inicio', ruta: '/'),
            _item(context, icon: Icons.receipt_long, label: 'Pedidos', ruta: '/pedido'),
            if(vm.sesionIniciada) ...[
              _item(context, icon: Icons.list_alt, label: 'Catálogo', ruta: '/catalogo'),
            ],
            if(!vm.sesionIniciada)
              _item(context, icon: Icons.list_alt, label: 'Iniciar Sesión', ruta: LoginScreen.ruta),
            if(vm.sesionIniciada) ...[
              const Spacer(),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Cerrar sesión'),
                onTap: () {
                  vm.cerrarSesion();
                  context.go('/');
                },
              ),
            ]
          ],
        ),
      ),
    );
  }

  Widget _item(BuildContext context, {required IconData icon, required String label, required String ruta}) {
    final esSeleccionado = ruta == rutaActual;
    return ListTile(
      leading: Icon(icon, color: esSeleccionado ? Colors.teal : null),
      title: Text(label, style: TextStyle(color: esSeleccionado ? Colors.teal : null)),
      selected: esSeleccionado,
      onTap: () {
        Navigator.pop(context);
        if (!esSeleccionado) context.go(ruta);
      },
    );
  }
}
