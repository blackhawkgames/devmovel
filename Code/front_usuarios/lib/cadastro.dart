import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class CadastroPage extends StatefulWidget {
  @override
  _CadastroPageState createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final emailController = TextEditingController();

  Future<void> salvarUsuario() async {
    try {
      final response = await http.post(
        Uri.parse('http://127.0.0.1:3000/usuarios'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'nome': nomeController.text,
          'email': emailController.text,
        }),
      );

      if (response.statusCode == 201) {
        nomeController.clear();
        emailController.clear();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Usuário cadastrado!')),
        );
      } else {
        throw Exception('Erro ao salvar');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Falha na conexão')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: salvarUsuario,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
      ),
    );
  }
}