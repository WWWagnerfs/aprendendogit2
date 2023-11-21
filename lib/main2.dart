import 'package:flutter/material.dart';
import 'package:mobile/repository/pessoaRepository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  static final listaPessoas = PessoaRepository.listaPessoas;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu,
            size: 30,
          ),
          title: Center(child: Text("Meu primeiro app")),
          actions: [
            Icon(
              Icons.account_circle,
              size: 40,
              color: Colors.white,
            ),
          ],
        ),
        body: ListView.separated(
          itemBuilder: (BuildContext context, int id) {
            return Card(
                child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(listaPessoas[id].foto),
              ),
              title: Text(listaPessoas[id].nome),
              trailing: Text(listaPessoas[id].idade.toString()),
            ));
          },
          separatorBuilder: (_, __) {
            return Divider(
              thickness: 1,
            );
          },
          itemCount: listaPessoas.length,
        ),
      ),
    );
  }
}
