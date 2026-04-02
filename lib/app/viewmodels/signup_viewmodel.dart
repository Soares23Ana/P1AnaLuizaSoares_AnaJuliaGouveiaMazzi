import '../data/usuario_mock_store.dart';
import '../models/usuario_model.dart';

class SignupViewModel {
  final _store = UsuarioMockStore();
  void cadastrar(UsuarioModel user) => _store.adicionar(user);
}
