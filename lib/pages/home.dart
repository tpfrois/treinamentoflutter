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
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          CircleAvatar(
            radius: 80,
            backgroundImage: NetworkImage(urlFotoPerfil),
          ),
          Column(
            children: [
              const Text(
                "Thiago Frois",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              ElevatedButton(
                  onPressed: () => irParaPagina("contador", context),
                  child: const Text("Ir para contador")),
              ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.yellow.shade900)),
                  onPressed: () => irParaPagina("desafio", context),
                  child: const Text("Desafio"))
            ],
          )
        ]),
      ),
    );
  }

  void irParaPagina(String pagina, BuildContext context) {
    switch (pagina.toLowerCase()) {
      case "contador":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ContadorPage()));
        break;
      case "desafio":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const DesafioPage()));
        break;
      default:
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.redAccent,
            content: Text("Página não existe")));
        break;
    }
  }
}
