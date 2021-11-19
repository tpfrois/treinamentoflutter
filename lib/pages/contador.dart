import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({Key? key}) : super(key: key);

  @override
  _ContadorPageState createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  int _contador = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Contador'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Número de clicks:', style: TextStyle(fontSize: 20.0)),
              Text('$_contador', style: const TextStyle(fontSize: 40.0)),
              const SizedBox(height: 30),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _contador = 0;
                    });
                  },
                  child: const Text('Zerar', style: TextStyle(fontSize: 20.0))),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.remove),
              heroTag: "decrementar",
              onPressed: () {
                setState(() {
                  _contador--;
                });
              },
            ),
            const SizedBox(width: 20),
            FloatingActionButton(
              child: const Icon(Icons.add),
              heroTag: "incrementar",
              onPressed: () {
                setState(() {
                  _contador++;
                });
              },
            ),
          ],
        ));
  }
}
