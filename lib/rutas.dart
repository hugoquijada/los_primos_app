import 'package:provider/provider.dart';

import 'mvvm/viewmodels/viewmodels.dart';
import 'mvvm/views/views.dart';
import 'utils/utils.dart';

final List<Ruta> rutas = [
  Ruta(
    path: HomeScreen.ruta,
    builder: (_) => HomeScreen()
  ),
  Ruta(
    path: LoginScreen.ruta,
    builder: (_) => LoginScreen()
  ),
  Ruta(
    path: PedidoListaScreen.ruta,
    builder: (_) => ChangeNotifierProvider(
      create: (_) => PedidoViewmodel(),
      child: PedidoListaScreen(),
    )
  ),
  Ruta(
    path: PedidoScreen.ruta,
    builder: (_) => ChangeNotifierProvider(
      create: (_) => PedidoViewmodel(),
      child: PedidoScreen(),
    )
  )
];
