import 'package:flutter/foundation.dart';

import 'modelos.dart';

class Pedido extends ChangeNotifier {

  final String? id;
  final String tipo;
  final String? mesa;
  final DateTime fecha;
  final List<PedidoProducto> productos;

  Pedido({
    this.id,
    required this.tipo,
    this.mesa,
    required this.fecha,
    required this.productos,
  });

  Map<String, dynamic> toMap() {
    return {
      'tipo': tipo,
      'mesa': mesa,
      'fecha': fecha.toIso8601String(),
      'productos': productos.map((p) => p.toMap()).toList(),
    };
  }

  factory Pedido.fromMap(String id, Map<String, dynamic> map) {
    return Pedido(
      id: id,
      tipo: map['tipo'],
      mesa: map['mesa'],
      fecha: DateTime.parse(map['fecha']),
      productos: (map['productos'] as List)
        .map((item) => PedidoProducto.fromMap(item))
        .toList(),
    );
  }

}