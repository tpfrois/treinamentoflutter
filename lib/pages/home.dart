import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          ElevatedButton(
              onPressed: () => irParaPagina(const ContadorPage(), context),
              child: const Text("Ir para contador")),
          ElevatedButton(
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.yellow.shade900)),
              onPressed: () => irParaPagina(const DesafioPage(), context),
              child: const Text("Desafio"))
        ]),
      ),
    );
  }

  void irParaPagina(Widget pagina, BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => pagina));
  }
}
