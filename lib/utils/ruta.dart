import 'package:flutter/widgets.dart';

class Ruta {
  final String path;
  final Widget Function(BuildContext) builder;
  final bool requiresAuth;

  const Ruta({
    required this.path,
    required this.builder,
    this.requiresAuth = false
  });
}