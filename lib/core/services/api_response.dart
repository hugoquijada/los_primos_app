import 'dart:convert';

import 'package:http/http.dart';

class ApiResponse {
  int? statusCode;
  Paginacion? paginacion;
  List<Map<String, dynamic>>? resultados;
  Map<String, dynamic>? detalle;
  Map<String, dynamic>? errores;
  String mensaje = '';

  bool get isOk => statusCode! >= 200 && statusCode! < 300;
  bool get isError => statusCode! >= 400 && statusCode! < 500;
  bool get isServerError => statusCode! >= 500;

  ApiResponse(Response response) {
    statusCode = response.statusCode;
    var body = json.decode(response.body);
    if (body.containsKey('paginacion')) {
      var pag = body['paginacion'];
      paginacion = Paginacion(
        total: pag['total'],
        pagina: pag['pagina'],
        limite: pag['limite'],
      );
    }
    if (body.containsKey('mensaje')) {
      mensaje = body['mensaje'];
    }
    if (body.containsKey('resultado') && body["resultado"] != null) {
      resultados = (body['resultado'] as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .toList();
    }
    if (body.containsKey('detalle')) {
      detalle = body['detalle'];
    }
    if (body.containsKey('errores')) {
      errores = body['errores'];
    }
  }
}

class Paginacion {
  final int total;
  final int pagina;
  final int limite;

  Paginacion({required this.total, required this.pagina, required this.limite});

  factory Paginacion.fromJson(Map<String, dynamic> json) {
    return Paginacion(
      total: json['total'],
      pagina: json['pagina'],
      limite: json['limite'],
    );
  }
}