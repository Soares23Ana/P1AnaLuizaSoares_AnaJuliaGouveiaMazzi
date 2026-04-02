import '../models/usuario_model.dart';

class UsuarioMockStore {
  static final UsuarioMockStore _instance = UsuarioMockStore._internal();
  factory UsuarioMockStore() => _instance;
  UsuarioMockStore._internal();

  final List<UsuarioModel> usuarios = [];

  void adicionar(UsuarioModel user) => usuarios.add(user);

  bool existe(String email, String senha) {
    return usuarios.any((u) => u.email == email && u.senha == senha);
  }
}
