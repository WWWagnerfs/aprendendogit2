import 'package:flutter/material.dart';
//import 'package:mobile/repository/pessoaRepository.dart';
// testando

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
  final fraseController = TextEditingController();

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
        title: Text("Meu contador"),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Digite algo",
            ),
            controller: fraseController,
          ),
          Text(
            counter.toString(),
            style: TextStyle(
              fontSize: 48,
            ),
          ),
          ElevatedButton(
            onPressed: incrementar,
            child: Icon(Icons.add),
          ),
          Text(
            fraseController.text,
            style: TextStyle(
              fontSize: 48,
            ),
          ),
          ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Alerta"),
                      content: Text(fraseController.text),
                    );
                  },
                );
              },
              child: Text("Ver texto"))
        ],
      ),
    );
  }
}
