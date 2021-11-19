import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DesafioPage extends StatefulWidget {
  const DesafioPage({Key? key}) : super(key: key);

  @override
  _DesafioPageState createState() => _DesafioPageState();
}

class _DesafioPageState extends State<DesafioPage> {
  String _usuario = "";
  String _nome = "";
  String _biografia = "";

  final TextEditingController _controllerUsuario = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Desafio'),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Text('Usuário: $_usuario',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Nome: $_nome',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                Text('Biografia: $_biografia',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _controllerUsuario,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                ElevatedButton(
                  child: const Text('Buscar'),
                  onPressed: () {
                    _buscarUsuario(_controllerUsuario.text);
                  },
                )
              ])),
        ));
  }

  Future<void> _buscarUsuario(String usuario) async {
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text("Buscando usuário...")));

    final response =
        await http.get(Uri.parse('https://api.github.com/users/$usuario'));

    ScaffoldMessenger.of(context).clearSnackBars();

    if (response.statusCode == 200) {
      final Map<String, dynamic> dados = json.decode(response.body);
      setState(() {
        _usuario = dados['login'];
        _nome = dados['name'] ?? "<Sem nome>";
        _biografia = dados['bio'] ?? "<Sem biografia>";
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text("Ocorreu um erro ao buscar o usuário.")));
    }
    print(response.body);
  }
}
