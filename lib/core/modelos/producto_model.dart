import 'package:flutter/foundation.dart';

class Producto extends ChangeNotifier {

  final String id;
  final String nombre;
  final String categoria;
  final bool esSushi;
  final bool esArmable;
  final List<String> ingredientesDisponibles;

  Producto({
    required this.id,
    required this.nombre,
    required this.categoria,
    this.esSushi = false,
    this.esArmable = false,
    this.ingredientesDisponibles = const []
  });
  
}