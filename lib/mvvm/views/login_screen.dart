import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/viewmodels.dart';

class LoginScreen extends StatefulWidget {

  static String ruta = "/login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _correoController = TextEditingController();
  final _claveController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginViewModel = Provider.of<LoginViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.lock_outline, size: 48, color: Colors.teal),
                  const SizedBox(height: 24),
                  TextField(
                    controller: _correoController,
                    decoration: const InputDecoration(
                      labelText: "Correo electrónico",
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _claveController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Contraseña",
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: loginViewModel.cargando
                          ? null
                          : () {
                              loginViewModel.iniciarSesion(
                                _correoController.text.trim(),
                                _claveController.text.trim(),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        backgroundColor: Colors.teal,
                      ),
                      child: loginViewModel.cargando
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 2,
                              ),
                            )
                          : const Text("Iniciar Sesión", style: TextStyle(color: Colors.white),),
                    ),
                  ),
                  if (loginViewModel.error != null) ...[
                    const SizedBox(height: 16),
                    Text(
                      loginViewModel.error!,
                      style: const TextStyle(color: Colors.red),
                    )
                  ]
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
