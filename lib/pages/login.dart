import 'package:flutter/material.dart';
import 'package:treinamento/pages/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.all(40),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Login Treinamento',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                )),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o email';
                  }
                }),
            TextFormField(
                decoration: const InputDecoration(labelText: 'Senha'),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira a senha';
                  }
                }),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () => handleSubmit(), child: const Text('Entrar'))
          ],
        ),
      ),
    ));
  }

  handleSubmit() {
    if (_formKey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }
}
