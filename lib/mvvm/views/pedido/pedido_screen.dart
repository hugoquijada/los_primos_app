import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodels/viewmodels.dart';
import '../../../core/modelos/modelos.dart';

class PedidoScreen extends StatefulWidget {
  static String ruta = '/pedido';

  const PedidoScreen({super.key});

  @override
  State<StatefulWidget> createState() => _PedidoScreenState();
}

class _PedidoScreenState extends State<PedidoScreen> {

  void _mostrarSelectorProducto(BuildContext context, PedidoViewmodel viewModel) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        Producto? productoSeleccionado;
        bool conAlga = false;
        bool conBoneless = false;
        String? categoriaSeleccionada;
        List<String> ingredientesElegidos = [];

        return StatefulBuilder(
          builder: (context, setState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: viewModel.categorias.map((cat) {
                        final seleccionada = cat == categoriaSeleccionada;
                        return GestureDetector(
                          onTap: () => setState(() => categoriaSeleccionada = cat),
                          child: Card(
                            color: seleccionada ? Colors.teal : Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(color: seleccionada ? Colors.teal : Colors.grey.shade300),
                            ),
                            elevation: seleccionada ? 4 : 1,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              child: Text(
                                cat,
                                style: TextStyle(
                                  color: seleccionada ? Colors.white : Colors.black87,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
              
                    if (categoriaSeleccionada != null) ...viewModel.productosDisponibles
                      .where((p) => p.categoria == categoriaSeleccionada)
                      .map((p) => ListTile(
                            title: Text(p.nombre),
                            onTap: () {
                              setState(() {
                                productoSeleccionado = p;
                                ingredientesElegidos = [];
                              });
                            },
                            selected: productoSeleccionado?.id == p.id,
                          )
                        ),
              
                    if (productoSeleccionado != null) ...[
                      if (productoSeleccionado!.esSushi)
                        ...[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("¿Con alga?"),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile<bool>(
                                      title: const Text("No"),
                                      value: false,
                                      groupValue: conAlga,
                                      onChanged: (value) => setState(() => conAlga = value!),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<bool>(
                                      title: const Text("Sí"),
                                      value: true,
                                      groupValue: conAlga,
                                      onChanged: (value) => setState(() => conAlga = value!),
                                    ),
                                  ),
                                ]
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("¿Con  Boneless?"),
                              Row(
                                children: [
                                  Expanded(
                                    child: RadioListTile<bool>(
                                      title: const Text("No"),
                                      value: false,
                                      groupValue: conBoneless,
                                      onChanged: (value) => setState(() => conBoneless = value!),
                                    ),
                                  ),
                                  Expanded(
                                    child: RadioListTile<bool>(
                                      title: const Text("Sí"),
                                      value: true,
                                      groupValue: conBoneless,
                                      onChanged: (value) => setState(() => conBoneless = value!),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      if (productoSeleccionado!.esArmable)
                        Wrap(
                          spacing: 8,
                          children: productoSeleccionado!.ingredientesDisponibles.map((ing) {
                            final activo = ingredientesElegidos.contains(ing);
                            return FilterChip(
                              label: Text(ing),
                              selected: activo,
                              onSelected: (seleccionado) {
                                setState(() {
                                  if (seleccionado) {
                                    ingredientesElegidos.add(ing);
                                  } else {
                                    ingredientesElegidos.remove(ing);
                                  }
                                });
                              },
                            );
                          }).toList(),
                        ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              if (productoSeleccionado != null) {
                                viewModel.agregarProducto(
                                  PedidoProducto(
                                    id: productoSeleccionado!.id,
                                    nombre: productoSeleccionado!.nombre,
                                    categoria: productoSeleccionado!.categoria,
                                    cantidad: 1,
                                    esSushi: productoSeleccionado!.esSushi,
                                    esArmable: productoSeleccionado!.esArmable,
                                    conAlga: conAlga,
                                    conBoneless: conBoneless,
                                    ingredientes: ingredientesElegidos,
                                  )
                                );
                                
                                setState(() {
                                  productoSeleccionado = null;
                                  conAlga = false;
                                  conBoneless = false;
                                  categoriaSeleccionada = null;
                                  ingredientesElegidos = [];
                                });
                              }
                            },
                            child: const Text("Agregar al pedido"),
                          )
                        ],
                      )
                    ]
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<PedidoViewmodel>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Pedido")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("¿El pedido es para...?"),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<TipoPedido>(
                    title: const Text("Comer aquí"),
                    value: TipoPedido.aqui,
                    groupValue: vm.tipoPedido,
                    onChanged: (value) =>
                        vm.seleccionarTipoPedido(value!),
                  ),
                ),
                Expanded(
                  child: RadioListTile<TipoPedido>(
                    title: const Text("Para llevar"),
                    value: TipoPedido.llevar,
                    groupValue: vm.tipoPedido,
                    onChanged: (value) =>
                        vm.seleccionarTipoPedido(value!),
                  ),
                ),
              ],
            ),
            if (vm.tipoPedido == TipoPedido.aqui) ...[
              const SizedBox(height: 16),
              const Text("Identifica la mesa:"),
              TextField(
                onChanged: vm.asignarMesa,
                decoration: const InputDecoration(
                  hintText: "Ej. Mesa 5",
                  border: OutlineInputBorder(),
                ),
              ),
            ],
            const SizedBox(height: 24),
            const Text("Productos:"),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: vm.productos.length,
                itemBuilder: (context, index) {
                  final p = vm.productos[index];
                  return ListTile(
                    title: Text(p.nombre),
                    subtitle: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black),
                        children: [
                          if(p.esSushi) ...[
                            TextSpan(text: "${p.conAlga ? "Con" : "Sin"} Alga, "),
                            TextSpan(text: "${p.conBoneless ? "Con" : "Sin"} Boneless"),
                          ],
                          if(p.ingredientes.isNotEmpty)
                            TextSpan(text: p.ingredientes.map((i) => i).join(", "))
                        ]
                      )
                    ),
                    trailing: Text("x ${p.cantidad}"),
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                  onPressed: () => _mostrarSelectorProducto(context, vm),
                  child: const Text("Agregar producto"),
                ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: vm.puedeContinuar
                  ? () {
                      // Aquí iría la navegación a la siguiente parte del flujo
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Continuar con pedido..."),
                        ),
                      );
                    }
                  : null,
                child: const Text("Continuar"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
