import 'package:flutter/material.dart';
import '../../core/modelos/modelos.dart';

enum TipoPedido { aqui, llevar }

class PedidoViewmodel extends ChangeNotifier {

  TipoPedido? tipoPedido;
  String? mesa;
  List<PedidoProducto> productos = [];

  List<String> categorias = [
    "ENTRADAS",
    "AGUA CHILE",
    "COCTELES Y MÁS",
    "SUSHI",
    "BEBIDAS"
  ];

  List<Producto> productosDisponibles = [
    Producto(id: '11', categoria: 'ENTRADAS', nombre: 'TOSTADA TROPICAL'),
    Producto(id: '12', categoria: 'ENTRADAS', nombre: 'TOSTADA MONCHOSA'),
    Producto(id: '13', categoria: 'ENTRADAS', nombre: 'TOSTADA DE ATÚN'),
    Producto(id: '14', categoria: 'ENTRADAS', nombre: 'TOSTADA LOS PRIMOS'),
    Producto(
      id: '15', 
      categoria: 'ENTRADAS', 
      nombre: 'TOSTADA AL GUSTO', 
      esArmable: true, 
      ingredientesDisponibles: [
        "Camarón picado",
        "Camarón cocido",
        "Pulpo",
        "Callo catarina",
        "Pescado",
        "Atún",
      ]
    ),
    Producto(id: '21', categoria: 'AGUA CHILE', nombre: 'Agua chile verde y negro'),
    Producto(id: '31', categoria: 'COCTELES Y MÁS', nombre: 'Coctel de camarón'),
    Producto(id: '32', categoria: 'COCTELES Y MÁS', nombre: 'Coctel los primos'),
    Producto(id: '33', categoria: 'COCTELES Y MÁS', nombre: 'Molcajete salceado'),
    Producto(id: '34', categoria: 'COCTELES Y MÁS', nombre: 'Molcajete campechano'),
    Producto(id: '35', categoria: 'COCTELES Y MÁS', nombre: 'Torre de mariscos'),
    Producto(id: '41', categoria: 'BEBIDAS', nombre: 'Coca-cola'),
    Producto(id: '42', categoria: 'BEBIDAS', nombre: 'Clamato preparado'),
    Producto(id: '43', categoria: 'BEBIDAS', nombre: "Pa' la cruda"),
    Producto(id: '44', categoria: 'BEBIDAS', nombre: "Limonada", ingredientesDisponibles: ["Mineral", "Natural"]),
    Producto(id: '1', categoria: 'SUSHI', nombre: 'EL SONORENSE', esSushi: true),
    Producto(id: '2', categoria: 'SUSHI', nombre: 'EL GABACHO', esSushi: true),
    Producto(id: '3', categoria: 'SUSHI', nombre: 'MARISQUERO', esSushi: true),
    Producto(id: '4', categoria: 'SUSHI', nombre: 'TORBELLINO', esSushi: true),
    Producto(
      id: '5',
      nombre: 'ARMALO A TU GUSTO',
      categoria: 'SUSHI',
      esSushi: true,
      esArmable: true,
      ingredientesDisponibles: [
        'Res', 
        'Camaron',
        'Pollo', 
        'Surimi', 
        'Boneless', 
        'Aguacate',
        'Chile verde',
        'Pepino',
        'Jalapeño',
        'Tocino',
        'Philadelphia',
        'Queso para gratinar',
        'Alga',
        'Zanahoria',
        'Cheese dip'
      ],
    ),

  ];

  void seleccionarTipoPedido(TipoPedido tipo) {
    tipoPedido = tipo;
    notifyListeners();
  }

  void asignarMesa(String m) {
    mesa = m;
    notifyListeners();
  }

  void agregarProducto(PedidoProducto producto) {
    productos.add(producto);
    notifyListeners();
  }

  void editarProducto(int index, PedidoProducto producto) {
    productos[index] = producto;
    notifyListeners();
  }

  bool get puedeContinuar {
    if(tipoPedido == TipoPedido.aqui) {
      return mesa != null && mesa!.isNotEmpty;
    }

    return tipoPedido != null;
  }
}