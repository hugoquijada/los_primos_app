import 'package:flutter/foundation.dart';

class PedidoProducto extends ChangeNotifier {

  final String id;
  final String nombre;
  final String categoria;
  final bool esSushi;
  final bool esArmable;
  final int cantidad;
  final bool conAlga;
  final bool conBoneless;
  final List<String> ingredientes;

  PedidoProducto({
    required this.id,
    required this.nombre,
    required this.categoria,
    required this.cantidad,
    this.esSushi = false,
    this.esArmable = false,
    this.conAlga = false,
    this.conBoneless = false,
    this.ingredientes = const []
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nombre': nombre,
      'categoria': categoria,
      'cantidad': cantidad,
      'esSushi': esSushi,
      'esArmable': esArmable,
      'conAlga': conAlga,
      'conBoneless': conBoneless,
      'ingredientes': ingredientes,
    };
  }

  factory PedidoProducto.fromMap(Map<String, dynamic> map) {
    return PedidoProducto(
      id: map['id'],
      nombre: map['nombre'],
      categoria: map['categoria'],
      cantidad: map['cantidad'] ?? 1,
      esSushi: map['esSushi'] ?? false,
      esArmable: map['esArmable'] ?? false,
      conAlga: map['conAlga'] ?? false,
      conBoneless: map['conBoneless'] ?? false,
      ingredientes: List<String>.from(map['ingredientes'] ?? []),
    );
  }

}