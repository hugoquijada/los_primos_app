import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import 'mvvm/viewmodels/viewmodels.dart';
import 'mvvm/views/views.dart';
import 'utils/utils.dart';
import 'rutas.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MainApp());
}

GoRouter routerBuilder(LoginViewModel auth) {
  return GoRouter(
    refreshListenable: auth,
    redirect: (context, state) {

      final bool sesionIniciada = auth.sesionIniciada;
      final path = state.uri.path;

      final actual = rutas.firstWhere(
        (r) => r.path == path,
        orElse: () => Ruta(path: '', builder: (_) => SizedBox()),
      );

      if(actual.requiresAuth && !sesionIniciada) {
        return LoginScreen.ruta;
      }

      if (sesionIniciada && path == LoginScreen.ruta) {
        return HomeScreen.ruta;
      }

      return null;
    },
    routes: rutas.map((r) => GoRoute(path: r.path, builder: (c, s) => r.builder(c))).toList(),
    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text("No se encontró la página"))
    )
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
      child: Builder(builder: (context) {
        final auth = Provider.of<LoginViewModel>(context, listen: false);
        final router = routerBuilder(auth);

        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: "Los Primos",
          theme: ThemeData.light(),
          routerConfig: router,
        );
      }),
    );
  }
}
