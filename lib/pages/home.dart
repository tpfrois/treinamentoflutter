import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:treinamento/pages/login.dart';

import 'contador.dart';
import 'desafio.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  final String urlFotoPerfil = "https://github.com/tpfrois.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Treinamento Flutter'),
        centerTitle: true,
      ),
      drawer: Drawer(
          child: ListView(children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: const Text("Treinamento Flutter"),
          accountEmail: const Text("@tpfrois"),
          currentAccountPicture: CircleAvatar(
            backgroundImage: NetworkImage(urlFotoPerfil),
          ),
        ),
        ListTile(
          title: const Text("Contador"),
          leading: const Icon(Icons.add),
          onTap: () => irParaPagina(const ContadorPage(), context),
        ),
        ListTile(
          title: const Text("Desafio"),
          leading: const Icon(Icons.star),
          onTap: () => irParaPagina(const DesafioPage(), context),
        ),
        ListTile(
          title: const Text("Sair"),
          leading: const Icon(Icons.power_settings_new_sharp),
          onTap: () => irParaPagina(const LoginPage(), context),
        ),
      ])),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(urlFotoPerfil),
          ),
          const Text(
            "Thiago Frois",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () => irParaPagina(const ContadorPage(), context),
                  child: const Text("Ir para contador")),
              const SizedBox(width: 20),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellow.shade900)),
                  onPressed: () => irParaPagina(const DesafioPage(), context),
                  child: const Text("Desafio")),
            ],
          ),
          IconButton(
              padding: const EdgeInsets.all(0),
              onPressed: () => irParaPagina(const LoginPage(), context),
              icon: const Icon(Icons.power_settings_new_sharp,
                  size: 50, color: Colors.redAccent)),
        ]),
      ),
    );
  }

  void irParaPagina(Widget pagina, BuildContext context) {
    if (pagina is LoginPage) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => pagina));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => pagina));
    }
  }
}
