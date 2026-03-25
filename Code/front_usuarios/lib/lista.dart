import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ListaPage extends StatefulWidget {
  @override
  _ListaPageState createState() => _ListaPageState();
}

class _ListaPageState extends State<ListaPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Usuários')),
      body: FutureBuilder<List<dynamic>>(
        future: fetchUsuarios(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Erro ao carregar dados'));
          }

          final usuarios = snapshot.data!;

          return ListView.builder(
            itemCount: usuarios.length,
            itemBuilder: (context, index) {
              final user = usuarios[index];

              return ListTile(
                title: Text(user['nome']),
                subtitle: Text(user['email']),
              );
            },
          );
        },
      ),
    );
  }
}