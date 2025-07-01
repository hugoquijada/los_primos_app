import '../modelos/modelos.dart';
import 'firestore_service.dart';

class PedidoService {

  final firestore = FirestoreService();
  final String coleccion = 'Pedido';

  Future<void> guardar(Pedido pedido) async {
    await firestore.crear(coleccion, pedido.toMap());
  }

  Future<void> actualizar(String uid, Pedido pedido) async {
    await firestore.actualizar(coleccion, uid, pedido.toMap());
  }

}