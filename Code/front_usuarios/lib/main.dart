import 'package:flutter/material.dart';
import 'cadastro.dart';
import 'lista.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Usuários',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sistema de Usuários',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 30),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CadastroPage()),
                );
              },
              child: Text('CADASTRAR USUÁRIO'),
            ),

            SizedBox(height: 10),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ListaPage()),
                );
              },
              child: Text('LISTAR USUÁRIOS'),
            ),
          ],
        ),
      ),
    );
  }
}