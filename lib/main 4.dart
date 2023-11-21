import 'package:flutter/material.dart';
//import 'package:mobile/repository/pessoaRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyAppCounter(),
    );
  }
}

class MyAppCounter extends StatefulWidget {
  const MyAppCounter({super.key});

  @override
  State<MyAppCounter> createState() => _MyAppCounterState();
}

class _MyAppCounterState extends State<MyAppCounter> {
  int counter = 0;
  final logginController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String fraseField = ("");

  void incrementar() {
    setState(() {
      counter++;
    });
    print(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        title: Center(child: Text("Facebook")),
        actions: [
          Icon(
            Icons.account_circle,
            size: 40,
            color: Colors.white,
          ),
        ],
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextFormField(
                  controller: logginController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Login",
                  ),
                  validator: (value) {
                    if (value == null || value.length < 4 || value.isEmpty) {
                      return 'O campo precisa ter mais do que 4 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Password",
                  ),
                  validator: (value) {
                    if (value == null || value.length < 6 || value.isEmpty) {
                      return 'O campo precisa ter mais do que 6 caracteres';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text(logginController.text),
                            content: Text(passwordController.text),
                          );
                        },
                      );
                    }
                  },
                  child: Text("Entrar"),
                ),
              ],
            ),
          )),
    );
  }
}
