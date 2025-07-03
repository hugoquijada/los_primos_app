import 'package:flutter/material.dart';
import 'package:los_primos/mvvm/views/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';

import '../../viewmodels/viewmodels.dart';
import '../../../core/modelos/modelos.dart';
import 'pedido_form_screen.dart';

class PedidoListaScreen extends StatefulWidget {
  static String ruta = '/pedido';

  const PedidoListaScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PedidoListaScreenState();
}

class _PedidoListaScreenState extends State<PedidoListaScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<PedidoViewmodel>(context, listen: false).cargarPedidos();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PedidoViewmodel>(context);
    return Scaffold(
      drawer: AppDrawer(rutaActual: PedidoListaScreen.ruta),
      appBar: AppBar(title: Text("Pedidos")),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.add),
        label: Text("Pedido"),
        onPressed: () {
          context.go(PedidoScreen.ruta);
        },
      ),
      body: vm.pedidos.isEmpty
        ? const Center(child: Text("No hay pedidos"))
        : ListView.builder(
            itemCount: vm.pedidos.length,
            itemBuilder: (_, index) {
              final p = vm.pedidos[index];
              return Card(
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  title: Text(p.tipo == "llevar"
                      ? "Para llevar"
                      : "Comer aquí - Mesa ${p.mesa ?? 'Sin número'}"),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Fecha: ${p.fecha}"),
                      const SizedBox(height: 4),
                      ...p.productos.map((prod) => Text("- ${prod.nombre} x${prod.cantidad}")),
                    ],
                  ),
                ),
              );
            },
          ),
    );
  }
}
