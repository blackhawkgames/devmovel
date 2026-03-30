import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {

  late Future<List<dynamic>> futureUsuarios;

  @override
  void initState() {
    super.initState();
    futureUsuarios = fetchUsuarios();
  }

  Future<List<dynamic>> fetchUsuarios() async {
    try {
      final response = await http.get(
        Uri.parse('http://127.0.0.1:3000/usuarios'),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        throw Exception('Erro ao carregar');
      }
    } catch (e) {
      throw Exception('Falha na conexão');
    }
  }

  Future<void> deletarUsuario(int id) async {
    await http.delete(
      Uri.parse('http://127.0.0.1:3000/usuarios/$id'),
    );

    setState(() {
      futureUsuarios = fetchUsuarios();
    });
  }

  Future<void> confirmarDelete(int id) async {
    final confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Confirmar'),
        content: Text('Deseja deletar este usuário?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Deletar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await deletarUsuario(id);
    }
  }

  Future<void> atualizarUsuario(int id, String nome, String email) async {
    await http.put(
      Uri.parse('http://127.0.0.1:3000/usuarios/$id'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'nome': nome,
        'email': email,
      }),
    );

    setState(() {
      futureUsuarios = fetchUsuarios();
    });
  }

  Future<void> mostrarDialogEditar(Map user) async {
    final nomeController = TextEditingController(text: user['nome']);
    final emailController = TextEditingController(text: user['email']);

    final confirm = await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Editar usuário'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text('Salvar'),
          ),
        ],
      ),
    );

    if (confirm == true) {
      await atualizarUsuario(
        user['id'],
        nomeController.text,
        emailController.text,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários')),
      body: FutureBuilder<List<dynamic>>(
        future: futureUsuarios,
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados'));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Nenhum usuário encontrado'));
          }

          final usuarios = snapshot.data!;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final user = usuarios[index];

              return ListTile(
                title: Text(user['nome']),
                subtitle: Text(user['email']),

                onTap: () => mostrarDialogEditar(user),

                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => confirmarDelete(user['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}