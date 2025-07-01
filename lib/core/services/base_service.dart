import 'dart:convert';

import 'package:http/http.dart' as http;
import 'session_store.dart';

class BaseService {
  int currentPage = 0;
  int limit = 20;
  int total = 0;
  //produccion: supergas.api.rdsistemas.app

  String base_url = 'https://supergas.api.rdsistemas.app/distribuidor';
  String baseUrl = 'supergas.api.rdsistemas.app';
  String distribuidor = 'https://supergas.api.rdsistemas.app/distribuidor/';
  String numeroVersion = '1.25.04.17';

  Future<Map<String, String>> getDefaultHeaders({withAuth = true}) async {
    Map<String, String> defaultHeaders = {'Content-Type': 'application/json'};

    if (withAuth) {
      String? token = await SessionStorage().getToken();
      defaultHeaders['Authorization'] = 'Bearer ${token ?? ''}';
    }

    return defaultHeaders;
  }

  Future<http.Response> get(String endpoint,
      {bool withAuth = true,
      Map<String, String>? queryParameters,
      Map<String, String>? headers}) async {
    final uri = Uri.https(baseUrl, endpoint, queryParameters);
    var defaultHeaders = await getDefaultHeaders(withAuth: withAuth);
    var head = {...?headers, ...defaultHeaders};
    return await http.get(uri, headers: head);
  }

  Future<http.Response> post(String endpoint,
      {bool withAuth = true,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    final uri = Uri.https(baseUrl, endpoint, queryParameters);
    var defaultHeaders = await getDefaultHeaders(withAuth: withAuth);
    var head = {...?headers, ...defaultHeaders};
    final resp = await http.post(uri, body: json.encode(body), headers: head);
    return resp;
  }

  Future<http.Response> delete(String endpoint,
      {bool withAuth = true,
      Map<String, String>? queryParameters,
      Map<String, dynamic>? body,
      Map<String, String>? headers}) async {
    final uri = Uri.https(baseUrl, endpoint, queryParameters);
    var defaultHeaders = await getDefaultHeaders(withAuth: withAuth);
    var head = {...?headers, ...defaultHeaders};
    return await http.delete(uri, body: json.encode(body), headers: head);
  }

  String prefijoVersion() {
    if (base_url.contains('api')) {
      return 'vP';
    } else if (base_url.contains('test')) {
      return 'vT';
    }
    return 'v'; // Versión genérica por si no coincide con api ni test
  }
}