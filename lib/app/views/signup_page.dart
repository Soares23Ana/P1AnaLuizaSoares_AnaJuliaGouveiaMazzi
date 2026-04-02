import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';
import '../models/usuario_model.dart';
import '../viewmodels/signup_viewmodel.dart';

class SignupPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _viewModel = SignupViewModel();

  SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cadastro")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nomeController,
                decoration: const InputDecoration(labelText: "Nome"),
                validator: Validatorless.required("Obrigatório"),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: "Email"),
                validator: Validatorless.email("Email inválido"),
              ),
              TextFormField(
                controller: _senhaController,
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
                validator: Validatorless.min(6, "Mínimo 6 caracteres"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _viewModel.cadastrar(
                      UsuarioModel(
                        nome: _nomeController.text,
                        email: _emailController.text,
                        senha: _senhaController.text,
                      ),
                    );
                    Navigator.pop(context); // Volta para o Login
                  }
                },
                child: const Text("Salvar Cadastro"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
